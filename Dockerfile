FROM python:3.8-slim

# Install system packages
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    libmariadb-dev \
    libmariadb-dev-compat \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install Cython
RUN pip install --upgrade pip==24.0
RUN pip install Cython==0.29.36

# Install spaCy-compatible ecosystem
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

# Copy and install remaining requirements
COPY requirements.txt .
RUN pip install -r requirements.txt

# Set working directory
WORKDIR /app
COPY . .

CMD ["python", "app.py"]
