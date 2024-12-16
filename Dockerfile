# Node суулгана
FROM node:16

# Ажлын хавтас үүсгэнэ
WORKDIR /app

# backend хавтаснаас package.json-ийг хуулна
COPY backend/package*.json ./backend/

# Хэрэглэгчийн сангуудыг суулгана
WORKDIR /app/backend
RUN npm install

# backend хавтаснаас бүх файлыг хуулна
COPY backend/ ./backend/

# frontend хавтасны бүх файлуудыг хуулна
COPY frontend/ ./frontend/

# Серверийг эхлүүлэх
CMD ["node", "server.js"]
