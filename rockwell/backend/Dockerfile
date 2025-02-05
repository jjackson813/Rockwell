FROM python:3.12-slim

ENV PIP_REQUESTS_TIMEOUT=300 \
    POETRY_REQUESTS_TIMEOUT=300 \
    POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=1 \ 
    POETRY_VIRTUALENVS_CREATE=1 \
    POETRY_CACHE_DIR=/tmp/poetry_cache

WORKDIR /app/rockwell/backend

COPY pyproject.toml poetry.lock 
COPY rockwell/backend/src ./src 

RUN pip install poetry \
    && poetry install --only=main --no-root --no-directory \
    && rm -rf ${POETRY_CACHE_DIR}