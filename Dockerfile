FROM node:alpine as builderx

WORKDIR /app
COPY ./package.json ./
RUN npm install
COPY ./ ./
# RUN npm run build

FROM nginx
COPY --from=builderx /app/dist /usr/share/nginx/html