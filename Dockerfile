# Node.js 16 багцтай ажиллах
FROM node:16

# Аппликэйшн ажиллах газар (working directory) тодорхойлох
WORKDIR /app

# Backend-ийн package.json файлуудыг хуулж авах
COPY backend/package*.json ./backend/

# Backend-ийн dependencies-ийг суулгах
WORKDIR /app/backend
RUN npm install

# Backend-ийн файлуудыг хуулж авах
COPY backend/ ./backend/

# Frontend-ийн файлуудыг хуулж авах
COPY frontend/ /app/frontend/

# Аппликэйшний портоо 10000 гэж тохируулах
EXPOSE 10000

# Backend серверийг эхлүүлэх
WORKDIR /app/backend
CMD ["node", "./backend/server.js"]
