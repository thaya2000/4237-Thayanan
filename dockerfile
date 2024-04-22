FROM node:18.0 as build-stage

RUN apt-get update

WORKDIR /home/app/

COPY . .

RUN npm i

EXPOSE 8083

# # Install dumb-init for signal handling
# RUN apt-get install -y dumb-init

# # Use dumb-init to handle signals gracefully
# CMD ["dumb-init", "npm", "run", "dev"]

RUN npm run dev