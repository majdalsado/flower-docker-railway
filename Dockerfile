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
CMD ["celery --broker=${RABBITMQ_URL} flower \
    --address=0.0.0.0 \
    --port=${PORT} \
    --basic_auth=${FLOWER_USER}:${FLOWER_PASS}"]