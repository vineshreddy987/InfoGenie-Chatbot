# Use official Python 3.8 base image
FROM python:3.8-slim

# Set working directory in the container
WORKDIR /app

# Prevents Python from writing .pyc files to disk
ENV PYTHONDONTWRITEBYTECODE=1

# Prevents Python from buffering stdout and stderr
ENV PYTHONUNBUFFERED=1

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    build-essential \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Cython first to support packages that require it at build time
RUN pip install --upgrade pip==24.0 setuptools==49.6.0 wheel
RUN pip install cython==0.29.36

# Copy dependency file
COPY requirements.txt .

# Install Python dependencies (no-build-isolation only after Cython is available)
RUN pip install --no-build-isolation -r requirements.txt

# Download spaCy English model manually for spaCy 2.1.9
RUN python -m spacy download en_core_web_sm

# Copy the rest of the application code
COPY . .

# Expose port (if using Flask)
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]
