# syntax=docker/dockerfile:1
FROM ghcr.io/astral-sh/uv:0.5.14-python3.12-bookworm-slim
LABEL org.opencontainers.image.source=https://github.com/hadret/shorty

ENV UV_PYTHON_DOWNLOADS=never \
    UV_PYTHON=python3.12

WORKDIR /code

COPY pyproject.toml uv.lock /code/
RUN uv sync --frozen
COPY ./shortener_app /code/app

CMD ["uv", "run", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
