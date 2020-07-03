# Specify a base image
FROM node:alpine as builder

WORKDIR '/app'

# Install some depenendencies
COPY package.json .
RUN npm install
COPY . .

# Default command
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html