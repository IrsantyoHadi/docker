FROM node:alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


# /app/build (ini directory si app buildnya yang penting bgt)

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html