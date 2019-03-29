FROM node:latest AS node-env
COPY src /webui-aria2
WORKDIR /webui-aria2/
RUN npm install && npm run build

FROM golang:alpine AS build-env
WORKDIR /src
COPY main.go /src/
RUN go get -d ./...
RUN go build main.go

FROM alpine
# less priviledge user, the id should map the user the downloaded files belongs to
RUN apk --no-cache add shadow && \
        groupadd -r dummy && \
        useradd -r -g dummy dummy -u 1000

COPY --from=node-env /webui-aria2/docs /webui-aria2/
COPY src/favicon.ico  /webui-aria2/favicon.ico
COPY --from=build-env /src/main /main
EXPOSE 8080/tcp

CMD ["./main"]
