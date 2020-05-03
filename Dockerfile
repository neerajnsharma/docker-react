FROM node:alpine
WORKDIR /app
COPY package.json /app/
RUN npm install
COPY ./ /app/
RUN npm run build

FROM nginx:latest
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
EXPOSE 80
