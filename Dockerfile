# Build phase
FROM node:alpine as builder
WORKDIR '/app'

COPY ./package.json .
RUN npm install
COPY . .
RUN yarn build

# Run phase, with 'from' we declare a new block of code:
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

