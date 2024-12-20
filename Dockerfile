# Usa l'immagine ufficiale di Node.js come base
FROM node:18-alpine

# Imposta la directory di lavoro all'interno del container
WORKDIR /app

# Copia i file di dipendenze
COPY /package.json /package-lock.json /app/

# Installa le dipendenze
RUN npm install

# Copia il resto del codice
COPY / /app/

# Costruisce il progetto React
RUN npm run build

EXPOSE 80

# this is not intended for production but to get you started fast
# you should use a proper web server in production like nginx
# https://docs.divio.com/how-to/production-server
CMD ["npm", "run", "start", "--", "--host", "0.0.0.0", "--port", "80"]