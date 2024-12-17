FROM node:16

WORKDIR /app

# Backend-ийн package.json файлуудыг хуулж авах
COPY backend/package*.json ./backend/

WORKDIR /app/backend
RUN npm install

# Backend-ийн файлуудыг хуулж авах
COPY backend/ ./backend/

# Frontend-ийн файлуудыг зөв замд хуулж авах
COPY frontend/ /app/frontend/

WORKDIR /app/backend

CMD ["node", "./backend/server.js"]
