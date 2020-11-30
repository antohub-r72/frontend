#### Stage 0, Build Angular
FROM node:12.20.0-alpine

LABEL version="1.0" \
      description="Angular frontend app" \
      creationDate="2020-11-30" \
      updatedDate="2020-11-30" \
      maintainer="antragha@in.ibm.com"

ENV BACKEND_API_URL=localhost:3000

WORKDIR /app

COPY package.json package.json

RUN npm install

COPY . .

RUN npm run build -- --prod
