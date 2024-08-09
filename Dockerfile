FROM nginx:alpine

workdir /usr/share/nginx/html

COPY . .

expose 80

#CMD ["nginx", "-g", "daemon off;"]
