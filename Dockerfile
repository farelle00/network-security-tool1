FROM python:3.12-alpine

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app
RUN addgroup -S app && adduser -S -G app app
COPY --chown=app:app network_check.py /app/network_check.py
USER app

ENTRYPOINT ["python", "network_check.py"]
