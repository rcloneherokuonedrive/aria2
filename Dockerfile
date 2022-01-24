FROM node:lts-alpine

WORKDIR /app
COPY package.json .
COPY initial.sh .
RUN bash initial.sh
COPY yarn.lock .
RUN yarn
COPY . .
ENV PORT=8080
EXPOSE 8080
CMD ["bash", "start.sh"]
