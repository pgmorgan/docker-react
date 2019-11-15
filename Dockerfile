FROM    node:alpine AS  builder
WORKDIR ./home/node
COPY    ./package.json  ./
RUN     npm install
COPY    ./    ./
CMD     ["npm", "run", "build"]

#   Built main.js and index.html file 
#   will be in ./home/node/build
#   ---------------------------

FROM    nginx
#   The FROM statement terminates each
#   successive block
COPY    --from=builder ./home/node/build    /usr/share/nginx/html
#   NGINX will run by itself, no run command
