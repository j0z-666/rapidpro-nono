FROM python:3.12-bullseye

ARG RAPIDPRO_TAG=main

ENV PYTHONUNBUFFERED=1
ENV POETRY_VIRTUALENVS_IN_PROJECT=true
ENV PATH="/root/.local/bin:$PATH"

# System deps
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    libgdal-dev \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Node.js (estable)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g yarn less

# Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

WORKDIR /rapidpro

# 🔥 TU FORK DIRECTO
RUN git clone --branch ${RAPIDPRO_TAG} https://github.com/j0z-666/rapidpro.git .

# Python deps
RUN poetry install --no-root --no-interaction --no-ansi

# Frontend deps
RUN yarn install

# Settings (modo dev)
RUN ln -sf /rapidpro/temba/settings.py.prod /rapidpro/temba/settings.py

# Entrypoint
COPY entrypoint.sh /rapidpro/
RUN chmod +x /rapidpro/entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["/rapidpro/entrypoint.sh"]