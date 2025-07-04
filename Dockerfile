FROM python:3.8

# Set environment variables to prevent Python from buffering output
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip==24.0 setuptools==49.6.0 wheel && \
    pip install --no-build-isolation -r requirements.txt

# Install SpaCy model after spaCy is installed
RUN python -m spacy download en_core_web_sm

# Copy the rest of the application
COPY . .

# Run the app (example)
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:8000"]
