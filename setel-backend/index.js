const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const mysql = require('mysql2');

const app = express();
const port = 3000;

app.use(cors());
app.use(bodyParser.json());

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'setel'
});

connection.connect((err) => {
  if (err) {
    console.error('Koneksi database gagal:', err);
  } else {
    console.log('Koneksi database berhasil');
  }
});

//Section Landing



//Section login
app.post('/api/login', async (req, res) => {
    const { username, password } = req.body;
  
    try {
        const [rows, fields] = await connection.promise().execute('SELECT * FROM admin WHERE usr = ? AND pwd = ?', [username, password]);
      
        if (rows && (rows.length > 0 || (fields && fields.affectedRows > 0))) {
          res.json({ success: true });
        } else {
          res.json({ success: false });
        }
      } catch (error) {
        console.error('Error executing query:', error);
        res.status(500).json({ success: false, error: 'Internal Server Error' });
      }
  });

  
//Section Dashboard



//Endpoint untuk Dashboard - Peminjaman



//Endpoint untuk Inventory



//Endpoint untuk Report



//Endpoint untuk Feedback



app.listen(port, () => {
  console.log(`Server berjalan di http://localhost:${port}`);
});
