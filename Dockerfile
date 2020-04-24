FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#for EXPOSE: used only for Elasticbeanstalk on AWS.
EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html