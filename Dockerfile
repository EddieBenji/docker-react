# Build phase
FROM node:alpine as builder
WORKDIR '/app'

COPY package*.json ./
RUN yarn install
COPY . .
RUN yarn build

# Run phase, with 'from' we declare a new block of code:
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

