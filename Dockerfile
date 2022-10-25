FROM node:16-alpine as builder

COPY package.json .

RUN npm install

COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /build /usr/share/nginx/html
