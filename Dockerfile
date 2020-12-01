#### Stage 0, Build Angular
FROM node:12.20.0-alpine as ag-build

LABEL name="frontend-angular"\
      version="1.0" \
      release="1.0" \
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

FROM registry.access.redhat.com/ubi8:8.0

LABEL name="frontend-ngnix" \
      vendor="IBM" \
      version="1.0" \
      release="1.0" \
      description="Nginx container to host frontend angular"\
      creationDate="2020-11-30" \
      updatedDate="2020-11-30" \
      maintainer="antragha@in.ibm.com"

RUN yum install -y --disableplugin=subscription-manager --nodocs \
    nginx nginx-mod-http-perl \
    && yum clean all
COPY nginx.conf /etc/nginx/

RUN touch /run/nginx.pid \
 && chgrp -R 0 /var/log/nginx /run/nginx.pid \
 && chmod -R g+rwx /var/log/nginx /run/nginx.pid

COPY --from=ag-build /app/dist/frontend /usr/share/nginx/html
COPY COPY nginx.conf /etc/nginx/

EXPOSE 8080

USER 1001

CMD nginx -g "daemon off;"
