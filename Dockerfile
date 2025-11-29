FROM python:3.11-slim

WORKDIR /app

# Install build dependencies (for potential C extensions)
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc && \
    rm -rf /var/lib/apt/lists/*

# Install Gunicorn + Flask from PyPI
RUN pip install --no-cache-dir gunicorn flask

# Copy app
COPY dice_roll.py .

EXPOSE 5000

# Run with Gunicorn: 2 workers, 20 threads each = 40 concurrent requests per pod
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "2", "--threads", "20", "dice_roll:app"]
