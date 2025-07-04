# Use Python 3.8 slim image
FROM python:3.8-slim

# Set working directory
WORKDIR /app

# Install system dependencies required to build some Python packages
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Install pip, setuptools, wheel and Cython before other requirements
RUN pip install --upgrade pip==24.0 setuptools==49.6.0 wheel \
    && pip install cython==0.29.36

# Install specific versions of dependencies that don't compile well from source
RUN pip install \
    murmurhash==0.28.0 \
    cymem==1.31.2 \
    preshed==1.0.1 \
    thinc==7.0.8 \
    spacy==2.1.9 \
    chatterbot==1.0.5 \
    chatterbot-corpus==1.2.0

# Install other dependencies
COPY requirements.txt .
RUN pip install --no-build-isolation -r requirements.txt

# Download spaCy English model for v2.1.9
RUN python -m spacy download en_core_web_sm

# Copy the rest of the project files
COPY . .

# Expose port for Flask
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]
