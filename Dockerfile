#Lets implement multi staging build
FROM golang:1.23 as build
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o server

#Its de smallest image
# The image above (tagged as build) will be used in
# the smaller (stratch) image.
FROM scratch
WORKDIR /app
COPY --from=build /app/server .
ENTRYPOINT ["./server"]

#Remember: Run $ docker build -t al3xant/gitops:latest .
# Test the container : docker run --rm -p 8080:8080 al3xant/gitops:latest