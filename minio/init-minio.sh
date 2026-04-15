#!/bin/sh

mc alias set minio http://minio:9000 root tembatemba

mc mb minio/temba-attachments
mc mb minio/temba-sessions

mc anonymous set public minio/temba-attachments

echo "MinIO initialized 🚀"