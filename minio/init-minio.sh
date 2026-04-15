#!/bin/sh
set -e

echo "⏳ Waiting for MinIO..."

# esperar a que MinIO responda
until mc alias set minio http://minio:9000 root tembatemba >/dev/null 2>&1; do
  sleep 2
done

echo "✅ MinIO ready"

# crear buckets (idempotente)
mc mb -p minio/temba-attachments || true
mc mb -p minio/temba-sessions || true

# permisos públicos solo donde aplica
mc anonymous set public minio/temba-attachments || true

echo "🚀 MinIO initialized"