FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install Flower only (minimal dependencies)
RUN pip install --no-cache-dir flower

# Set default port for Flower
ENV PORT=5555

# Use ENTRYPOINT with shell to allow env var expansion
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["flower --port=$PORT --broker=$RABBITMQ_URL --basic_auth=${FLOWER_USER}:${FLOWER_PASS}"]