FROM node:14 as builder

ADD app/ /simanno/web
WORKDIR /simanno/web
RUN npm install && npm install -g @angular/cli && ng build

EXPOSE 80

FROM nginx:1.16.1-alpine
COPY --from=builder /simanno/web/dist /usr/share/nginx/html
ADD dockerfiles/web/default.conf /etc/nginx/conf.d/default.conf
