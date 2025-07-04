# Use Python 3.8 as base image (compatible with spaCy 2.x)
FROM python:3.8-slim

# Set working directory
WORKDIR /app

# Install system dependencies for building wheels
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    build-essential \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip, install compatible setuptools and wheel
RUN pip install --upgrade pip==24.0 && \
    pip install setuptools==57.5.0 wheel==0.37.1

# Install Cython (required to compile legacy spaCy/thinc extensions)
RUN pip install cython==0.29.36

# Install known compatible low-level dependencies FIRST to avoid source-build conflicts
RUN pip install \
    murmurhash==1.0.2 \
    cymem==2.0.6 \
    preshed==3.0.6 \
    blis==0.2.4

# Install spaCy and its dependencies
RUN pip install \
    thinc==7.0.8 \
    spacy==2.1.9 \
    chatterbot==1.0.5 \
    chatterbot-corpus==1.2.0

# Download English model for spaCy 2.1
RUN python -m spacy download en_core_web_sm

# Copy your project files
COPY . .

# Expose port (if Flask app)
EXPOSE 5000

# Install other requirements
COPY requirements.txt .
RUN pip install --no-build-isolation -r requirements.txt

# Run your application
CMD ["python", "app.py"]
