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

# Frontend-ийн файлуудыг хуулж авах (Хэрэв frontend байгаа бол)
COPY frontend/ /app/frontend/

# Render автоматаар PORT хувьсагчийг ашигладаг тул 10000 гэж хатуу тохируулах шаардлагагүй
EXPOSE 10000

# Backend серверийг эхлүүлэх
# Render-ийн PORT орчны хувьсагчийг ашиглаж ажиллана
CMD ["npm", "start"]
