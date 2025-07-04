# Use Python 3.8 base image
FROM python:3.8-slim

# Set working directory inside the container
WORKDIR /app

# Install system dependencies needed to build some Python packages
RUN apt-get update && apt-get install -y gcc build-essential

# Copy all files from your project to the container
COPY . .

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN python -m spacy download en_core_web_sm

# Expose port 8000 (used by Gunicorn)
EXPOSE 8000

# Start the app with gunicorn
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:8000"]
