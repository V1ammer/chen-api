#!/bin/sh

set -x

export DB_USER="${DB_USER:="actix"}"

export DB_PASSWORD="${DB_PASSWORD:="actix"}"

export DB_HOST="${PG_HOST:="0.0.0.0"}"

export DB_PORT="${PG_PORT:="5432"}"

export DB_NAME="${DB_NAME:="actix"}"

export DATABASE_URL="${DATABASE_URL="postgres://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_NAME}?sslmode=disable"}"

migration up

exec chen-api
