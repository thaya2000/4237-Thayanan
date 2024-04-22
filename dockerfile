FROM node:18.0 as build-stage

RUN apt-get update

WORKDIR /home/app/

COPY . .

RUN npm config set proxy http://10.50.225.222:3128

RUN npm config set https-proxy http://10.50.225.222:3128

RUN npm config set https-proxy http://10.50.225.222:3128

RUN npm i

EXPOSE 3000

# Install dumb-init for signal handling
RUN apt-get install -y dumb-init

# Use dumb-init to handle signals gracefully
CMD ["dumb-init", "npm", "run", "dev"]

# RUN npm run dev