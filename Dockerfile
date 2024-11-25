# Stage 1: Frontend Builder Stage
FROM node:16.13.0-alpine AS Builder1
WORKDIR /app/rockwell/frontend
COPY frontend/package*.json ./
RUN npm ci

# Stage 2: Backend Builder Stage
FROM python:3.12-slim as Builder2

ENV PIP_REQUESTS_TIMEOUT=300 \
    POETRY_REQUESTS_TIMEOUT=300 \
    POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=1 \ 
    POETRY_VIRTUALENVS_CREATE=1 \
    POETRY_CACHE_DIR=/tmp/poetry_cache

WORKDIR /app/rockwell/backend
COPY pyproject.toml poetry.lock ./

# Stage 3: Merging Final Components Runtime Stage
