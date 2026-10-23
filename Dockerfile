FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app
RUN groupadd --system app && useradd --system --gid app --no-create-home app
COPY --chown=app:app network_check.py /app/network_check.py
USER app

ENTRYPOINT ["python", "network_check.py"]
