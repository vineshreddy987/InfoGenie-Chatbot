# Use older Python compatible with spaCy 2.1.9 and ChatterBot
FROM python:3.8-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /app

# Install required system packages
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and pin compatible setuptools and wheel
RUN pip install --upgrade pip==24.0 && \
    pip install setuptools==57.5.0 wheel==0.37.1

# Install Cython (needed for building some packages)
RUN pip install cython==0.29.36

# Pre-install low-level binary dependencies to avoid build-from-source
RUN pip install \
    murmurhash==1.0.2 \
    cymem==2.0.6 \
    preshed==3.0.6 \
    blis==0.2.4 \
    srsly==1.0.5 \
    thinc==7.0.8

# Install spaCy + ChatterBot + corpus
RUN pip install \
    spacy==2.1.9 \
    chatterbot==1.0.5 \
    chatterbot-corpus==1.2.0

# Download spaCy English model
RUN python -m spacy download en_core_web_sm

# Copy app files
COPY . .

# Install any remaining requirements
COPY requirements.txt .
RUN pip install --no-build-isolation -r requirements.txt

# Expose port if using Flask
EXPOSE 5000

# Run your app
CMD ["python", "app.py"]
