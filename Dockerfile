FROM node as builder

WORKDIR  /tmp

COPY package*.json ./

RUN npm i

COPY . .

RUN npm run build

FROM node:current-alpine

WORKDIR /app

COPY --from=builder /tmp/dist/ ./

ENTRYPOINT ["node", "index.js"]