FROM node:15.8.0-alpine3.10

ARG DATABASE_HOST
ARG DATABASE_PORT
ARG DATABASE_USERNAME
ARG DATABASE_PASSWORD
ARG DATABASE_NAME
ARG DATABASE_SYNCHRONIZE
ARG NEIS_API_KEY

ENV DATABASE_HOST ${DATABASE_HOST}
ENV DATABASE_PORT ${DATABASE_PORT}
ENV DATABASE_USERNAME ${DATABASE_USERNAME}
ENV DATABASE_PASSWORD ${DATABASE_PASSWORD}
ENV DATABASE_NAME ${DATABASE_NAME}
ENV DATABASE_SYNCHRONIZE ${DATABASE_SYNCHRONIZE}
ENV NEIS_API_KEY ${NEIS_API_KEY}

WORKDIR /home/node/app

COPY . .

RUN npm install
RUN npm run build

CMD ["npm", "run", "start:prod"]