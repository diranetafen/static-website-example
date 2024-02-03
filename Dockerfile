FROM nginx:1.21.1
LABEL maintainer="Nejib yaakoubi"

# Install required packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl git && \
    rm -rf /var/lib/apt/lists/*

# Remove default NGINX website content
RUN rm -rf /usr/share/nginx/html/*

# Clone your static website repository
RUN git clone https://github.com/YaakoubiNejib/static-website-example.git /usr/share/nginx/html

# Copy custom nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# CMD to replace $PORT with the actual port and start NGINX
CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
