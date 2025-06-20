FROM node:18-alpine AS build
WORKDIR /app
COPY package.json ./
RUN npm i
COPY . .

FROM gcr.io/distroless/nodejs18-debian11 AS production
WORKDIR /app
COPY --from=build /app /app
EXPOSE 8080
CMD ["index.js"]