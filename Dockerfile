# Node суулгана
FROM node:16

# Ажлын хавтас үүсгэнэ
WORKDIR /app

# backend хавтаснаас package.json-ийг хуулна
COPY backend/package*.json ./  

# Хэрэглэгчийн сангуудыг суулгана
RUN npm install

# backend хавтаснаас бүх файлыг хуулна
COPY backend/ .  

# Серверийг эхлүүлэх
CMD ["node", "server.js"]
