FROM python:3.11-slim

WORKDIR /app

RUN pip install --no-cache-dir flower

ENV PORT=5555

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["python -m flower --port=$PORT --broker=$RABBITMQ_URL --basic_auth=${FLOWER_USER}:${FLOWER_PASS}"]