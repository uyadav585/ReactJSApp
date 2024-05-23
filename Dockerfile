# Stage 1: Build the React application
FROM node:alpine3.18 as build

# Declare build time environment variables
ARG REACT_APP_NODE_ENV
ARG REACT_APP_BACKEND_URL

# Set default values for environment variables
ENV REACT_APP_NODE_ENV=$REACT_APP_NODE_ENV
ENV REACT_APP_BACKEND_URL=$REACT_APP_BACKEND_URL

# Set working directory and copy necessary files
WORKDIR /app
COPY package.json ./
RUN npm install dotenv
RUN npm install path-browserify

RUN npm install
COPY . .

# Build the application
RUN npm run build

# Stage 2: Serve the application with Nginx
FROM nginx:alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf *
COPY --from=build /app/build .
EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]