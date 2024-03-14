# Menggunakan image node versi 14.21-alpine sebagai base image
FROM node:14.21-alpine

# Menetapkan working directory di dalam container menjadi /app
WORKDIR /app

# Menyalin file package*.json dari direktori host ke dalam working directory di dalam container
COPY package*.json ./

# Melakukan instalasi dependencies yang diperlukan dengan npm
RUN npm install

# Menyalin seluruh file dari direktori host ke dalam working directory di dalam container
COPY . .

# Mendefinisikan port yang akan diexpose oleh container
EXPOSE 3001

# Menjalankan aplikasi dengan perintah npm run start ketika container dijalankan
CMD ["npm", "run", "start"]