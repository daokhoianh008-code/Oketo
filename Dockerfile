FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    ffmpeg \
    fonts-noto-core \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 10000

CMD ["sh", "-c", "streamlit run app.py --server.port=${PORT:-10000} --server.address=0.0.0.0 --server.headless=true"]
