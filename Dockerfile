FROM nginx:latest
WORKDIR /usr/share/nginx/html
RUN echo  '<html><body><h1>Hello World!</h1></body></html>' > ./index.html
ADD https://github.com/erhon007/hello/blob/master/Index.html /usr/share/nginx/html/index.html
EXPOSE 80
