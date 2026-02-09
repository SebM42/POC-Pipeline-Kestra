FROM python:3.12-slim

COPY requirements.txt /app/requirements.txt

RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    liblz4-dev \
    libsnappy-dev \
    libbrotli-dev \
    python3-dev \
    build-essential \
 && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r /app/requirements.txt

CMD ["python3"]