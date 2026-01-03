FROM python:3.9.23-slim

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    ffmpeg \
    && curl -LO https://github.com/fastfetch-cli/fastfetch/releases/download/2.56.1/fastfetch-linux-amd64.deb \
    && dpkg -i fastfetch-linux-amd64.deb \
    && rm fastfetch-linux-amd64.deb \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/TeamUltroid/Ultroid /app

WORKDIR /app

RUN pip install --no-cache-dir -r requirements.txt

CMD ["bash", "startup"]
