#!/usr/bin/env bash

# Check env vars are set
if [[ -z "${ADMIN_USER}" ]]; then echo "ADMIN_USER is not set" && exit 1; fi;
if [[ -z "${ADMIN_PASSWORD}" ]]; then echo "ADMIN_PASSWORD is not set" && exit 1; fi;
if [[ -z "${PUSHBULLET_API_KEY}" ]]; then echo "PUSHBULLET_API_KEY is not set" && exit 1; fi;
if [[ -z "${ALERTMANAGER_SMTP_HOST}" ]]; then echo "ALERTMANAGER_SMTP_HOST is not set" && exit 1; fi;
if [[ -z "${ALERTMANAGER_SMTP_USERNAME}" ]]; then echo "ALERTMANAGER_SMTP_USERNAME is not set" && exit 1; fi;
if [[ -z "${ALERTMANAGER_SMTP_PASSWORD}" ]]; then echo "ALERTMANAGER_SMTP_PASSWORD is not set" && exit 1; fi;

# Update alertmanager YAML with environment values
envsubst < ./alertmanager/config-template.yml > ./alertmanager/config.yml

# Docker compose
docker compose up -d --force-recreate