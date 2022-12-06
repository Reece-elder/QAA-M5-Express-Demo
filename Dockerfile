FROM node

COPY . .

RUN npm install 

EXPOSE 5000

ENTRYPOINT node index.js