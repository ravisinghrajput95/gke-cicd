# Use the official lightweight Python image.
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy files
COPY requirements.txt .
RUN RUN pip install --no-cache-dir -r requirements.txt
COPY app/ ./app/

# Set environment variable
ENV PYTHONPATH "${PYTHONPATH}:/app"

# Run app
CMD ["python", "app/main.py"]
