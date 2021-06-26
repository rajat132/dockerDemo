FROM node:latest as build
RUN mkdir -p /app/dist/new-docker-app
WORKDIR /app
COPY . /app
RUN npm install
RUN npm run build --prod 


FROM nginx:alpine
COPY --from=build /app/dist/new-docker-app /usr/share/nginx/html
EXPOSE 80
