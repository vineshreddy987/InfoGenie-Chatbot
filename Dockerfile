FROM python:3.8

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip==24.0 setuptools==49.6.0 wheel

# Install requirements (include Cython first, no build isolation)
RUN pip install --no-build-isolation -r requirements.txt

# Download spaCy English model
RUN python -m spacy download en_core_web_sm

COPY . .

CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:8000"]
