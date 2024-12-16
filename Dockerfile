
FROM node:16


WORKDIR /app


COPY backend/package*.json ./backend/


WORKDIR /app/backend
RUN npm install


COPY backend/ ./backend/

COPY frontend/ /app/frontend/

# Серверийг эхлүүлэх
WORKDIR /app/backend
CMD ["node", "backend/server.js"]
