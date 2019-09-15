From node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80 #elastic beanstalk will look at this and map it automatically. 
COPY --from=builder /app/build /usr/share/nginx/html
