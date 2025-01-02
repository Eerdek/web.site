# Node.js 16 багцтай ажиллах
FROM node:16

# Аппликэйшн ажиллах газар (working directory) тодорхойлох
WORKDIR /app

# Backend-ийн package.json болон package-lock.json файлуудыг хуулж авах
COPY backend/package*.json ./backend/

# Backend-ийн dependencies-ийг суулгах
WORKDIR /app/backend
RUN npm install

# Backend-ийн бүх файлуудыг хуулж авах
COPY backend/ ./backend/

# Frontend-ийн файлуудыг хуулж авах
COPY frontend/ /app/frontend/

# Порт тохиргоог Render-ийн автоматаар тохируулж ажиллах
EXPOSE 10000

# Render орчны PORT хувьсагчийг ашиглан сервер эхлүүлэх
CMD ["node", "./backend/server.js"]
