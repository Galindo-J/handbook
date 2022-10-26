FROM node:latest@sha256:c19647fcafe27628f06daa9feaaec2b7acfb9ae996d9aeaaa84ac90f62b6513c

ENV NODE_OPTIONS=--openssl-legacy-provider

COPY . /app

RUN chown -R node:node /app
WORKDIR /app
USER node
