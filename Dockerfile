ARG PYTHON_VERSION=3.13

FROM python:${PYTHON_VERSION}-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update  \
    && apt-get install -y --no-install-recommends \
            build-essential \
            g++ \
            gcc \
            libffi-dev \
            libssl-dev \
            pkg-config \
            curl \
    && rm -rf /var/lib/apt/lists/*

ARG POETRY_VERSION=2.1.3
ENV POETRY_VERSION=${POETRY_VERSION}
ENV POETRY_HOME=/opt/poetry
ENV POETRY_NO_INTERACTION=1
ENV POETRY_VIRTUALENVS_IN_PROJECT=1
ENV POETRY_VIRTUALENVS_CREATE=1
# Tell Poetry where to place its cache and virtual environment
ENV POETRY_CACHE_DIR=/opt/.cache

RUN curl -sSL https://install.python-poetry.org | python3 - \
    && ${POETRY_HOME}/bin/poetry --version

ENV PATH="${POETRY_HOME}/bin:${PATH}"