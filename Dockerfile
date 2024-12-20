FROM node:lts as build

WORKDIR /app

COPY package*.json /app/
RUN npm install

COPY . /app
RUN npm run build

FROM nginx:stable-alpine

# Copia la build di React nei file statici di Nginx
COPY --from=build /app/build /usr/share/nginx/html

# Copia la configurazione personalizzata di Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
