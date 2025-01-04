const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const path = require('path');

const app = express();

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Fake user data for authentication
const USERS = [{ username: 'admin', password: '123' }];

// Мессеж хадгалах массив
const MESSAGES = [];

// Login API
app.post('/api/login', (req, res) => {
    const { username, password } = req.body;
    const user = USERS.find(u => u.username === username && u.password === password);

    if (user) {
        res.status(200).json({ message: 'Нэвтрэлт амжилттай боллоо!' });
    } else {
        res.status(401).json({ message: 'Хэрэглэгчийн нэр эсвэл нууц үг буруу байна!' });
    }
});

// Send message API
app.post('/send-message', (req, res) => {
  const { message } = req.body;

  if (message && message.trim() !== '') {
      MESSAGES.push(message);  // Мессежийг массивд нэмэх
      console.log('Мессеж хүлээн авлаа:', message);  // Лог нэмэх
      return res.status(200).json({ success: true, message: 'Мессеж амжилттай хүлээн авлаа!' });
  } else {
      return res.status(400).json({ success: false, message: 'Мессеж хоосон байна!' });
  }
});

// Get Messages API
app.get('/get-messages', (req, res) => {
    res.json({ messages: MESSAGES });
});

// Статик файлуудыг (frontend файлууд) үйлчилгээ үзүүлэх
app.use(express.static(path.join(__dirname, 'frontend')));

// Default route to serve the index.html file
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'frontend', 'index.html'));
});

// Start the server
const port = process.env.PORT || 10000;
app.listen(port, () => {
  console.log(`Сервер ажиллаж байна: http://localhost:${port}`);
});
