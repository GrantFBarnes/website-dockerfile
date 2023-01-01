FROM almalinux:9

# Update and install packages
RUN dnf upgrade --refresh -y
RUN dnf module enable nodejs:18 -y
RUN dnf install nodejs npm -y
RUN dnf install git -y
RUN dnf install python3-pip -y
RUN python3 -m pip install mysql-connector-python
RUN python3 -m pip install pandas
RUN python3 -m pip install sklearn
RUN python3 -m pip install scikit-learn

RUN mkdir -p /app

WORKDIR /app

# Clone projects
RUN git clone https://github.com/grantfbarnes/home-page
RUN git clone https://github.com/grantfbarnes/crm
RUN git clone https://github.com/grantfbarnes/learn-vietnamese
RUN git clone https://github.com/grantfbarnes/tractor-pulling
RUN git clone https://github.com/grantfbarnes/vehicle-ownership-cost

# npm install and build on each project
WORKDIR /app/home-page
RUN npm install

WORKDIR /app/crm
RUN npm install
RUN npm run build --omit=dev

WORKDIR /app/learn-vietnamese
RUN npm install
RUN npm run build --omit=dev

WORKDIR /app/tractor-pulling
RUN npm install
RUN npm run build --omit=dev

WORKDIR /app/vehicle-ownership-cost
RUN npm install
RUN npm run build --omit=dev

# Start up node server
WORKDIR /app
EXPOSE 8080
CMD ["node", "home-page/backend/server.js"]
