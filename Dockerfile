FROM python:3.8-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    libmariadb-dev \
    libmariadb-dev-compat \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# Upgrade pip and install older setuptools + wheel
RUN pip install --upgrade pip==24.0
RUN pip install "setuptools<60" "wheel<1.0.0" Cython==0.29.36

# Install compatible NLP packages
RUN pip install \
    murmurhash==1.0.2 \
    cymem==1.31.2 \
    preshed==1.0.1 \
    blis==0.2.4 \
    srsly==0.0.5 \
    thinc==7.0.8 \
    spacy==2.1.9 \
    chatterbot==1.0.5 \
    chatterbot-corpus==1.2.0

# Set working directory
WORKDIR /app
COPY . .

CMD ["python", "app.py"]
