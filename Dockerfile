FROM python:3.11-slim
RUN pip install --no-cache-dir flower           # celery gets pulled in

WORKDIR /app
ENV PORT=5555

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["celery -A \"$CELERY_APP\" flower \
      --broker=\"$RABBITMQ_URL\" \
      --address=0.0.0.0 \
      --port=\"$PORT\" \
      --basic_auth=\"${FLOWER_USER}:${FLOWER_PASS}\""]