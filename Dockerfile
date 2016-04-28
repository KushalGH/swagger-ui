###
# swagger-ui - https://github.com/swagger-api/swagger-ui/
# Container for deploying the swagger-ui static site
#
# Build:
#   docker build -t swagger-ui dist/
# Run:
#   docker run -v `pwd`/swagger:/usr/shareginx/html/swagger -p 8081:80 swagger-ui
# where there's 'doc' file in the swagger folder which could be json or yml
###

FROM    mhart/alpine-node

RUN     npm install -g http-server

WORKDIR /build
#COPY    package.json /build/package.json
#COPY    gulpfile.js /build/gulpfile.js
#RUN     npm install
#RUN     npm run build

COPY     ./dist /build/dist

# The default port of the application
EXPOSE  8080

CMD ["http-server", "--cors", "-p8080", "/build/dist"]