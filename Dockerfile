# syntax=docker/dockerfile:1
FROM python:3.12-slim
LABEL org.opencontainers.image.source https://github.com/hadret/shorty

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
COPY ./shortener_app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
