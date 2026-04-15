#!/bin/sh

echo "⏳ Esperando MinIO..."

until curl -s http://minio:9000/minio/health/live >/dev/null; do
  sleep 2
done

echo "✅ MinIO listo, configurando buckets..."

mc alias set minio http://minio:9000 root tembatemba

# Crear buckets (idempotente)
mc mb -p minio/temba-attachments
mc mb -p minio/temba-sessions

# Permisos públicos (opcional pero recomendado)
mc anonymous set download minio/temba-attachments

echo "🎉 MinIO configurado"