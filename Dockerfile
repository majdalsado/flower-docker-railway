# ---------- base image ----------
FROM python:3.11-slim

# ---------- install only what we need ----------
RUN pip install --no-cache-dir flower   # pulls in celery as a dependency

# ---------- runtime settings ----------
WORKDIR /app
ENV PORT=5555

# ---------- entrypoint ----------
# Use celery → flower, picking up the RabbitMQ URL & credentials from Railway vars
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["celery", \
    "-A", "${CELERY_APP}", \
    "flower", \
    "--broker=${RABBITMQ_URL}", \
    "--address=0.0.0.0", \
    "--port=${PORT}", \
    "--basic_auth=${FLOWER_USER}:${FLOWER_PASS}"]