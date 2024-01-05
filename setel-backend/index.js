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

// Section Landing



// Section login
app.post('/api/login', async (req, res) => {
    const { username, password } = req.body;
  
    try {
        const [rows, fields] = await connection.promise().execute('SELECT * FROM Admin WHERE usr = ? AND pwd = ?', [username, password]);
      
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

  
// Section Dashboard
// Define API endpoint to fetch dataKendaraan
app.get("/api/dataKendaraan", (req, res) => {
  const query = "SELECT * FROM Informasi"; // Correct table name

  connection.query(query, (err, results) => {
    if (err) {
      console.error("Error querying database for dataKendaraan:", err);
      res.status(500).json({ error: "Internal Server Error" });
    } else {
      console.log("Successfully fetched dataKendaraan");
      res.json(results);
    }
  });
});

// Define API endpoint to fetch dataShelter
app.get("/api/dataShelter", (req, res) => {
  const query = "SELECT * FROM Shelter"; // Correct table name

  connection.query(query, (err, results) => {
    if (err) {
      console.error("Error querying database for dataShelter:", err);
      res.status(500).json({ error: "Internal Server Error" });
    } else {
      console.log("Successfully fetched dataShelter");
      res.json(results);
    }
  });
});


// Section Inventory
// API endpoint to fetch all vehicles from the database
app.get('/api/kendaraan', (req, res) => {
  const query = 'SELECT * FROM Kendaraan';  
  connection.query(query, (err, results) => {
    if (err) {
      console.error('Error executing query:', err);
      res.status(500).send('Internal Server Error');
    } else {
      res.status(200).json(results);
    }
  });
});

// API endpoint to add a new vehicle to the database
app.post('/api/kendaraan', (req, res) => {
  const { nomorUnit, jenisKendaraan, shelter, status } = req.body;

  // Lakukan pengecekan nomor unit di database
  const checkNomorUnitQuery = 'SELECT * FROM Kendaraan WHERE nomorUnit = ?';
  connection.query(checkNomorUnitQuery, [nomorUnit], (checkErr, checkResults) => {
    if (checkErr) {
      console.error('Error checking nomor unit:', checkErr);
      return res.status(500).json({ error: 'Internal Server Error' });
    }

    if (checkResults.length > 0) {
      // Nomor unit sudah terdaftar, kirim response 409
      return res.status(409).json({ error: 'Nomor unit sudah terdaftar!' });
    }

    // Nomor unit belum terdaftar, tambahkan item ke database
    const insertQuery = 'INSERT INTO Kendaraan (nomorUnit, jenisKendaraan, shelter, status) VALUES (?, ?, ?, ?)';
    const values = [nomorUnit, jenisKendaraan, shelter, status];

    connection.query(insertQuery, values, (insertErr, insertResults) => {
      if (insertErr) {
        console.error('Error adding vehicle:', insertErr);
        return res.status(500).json({ error: 'Internal Server Error' });
      }

      res.status(201).json({ message: 'Vehicle added successfully' });
    });
  });
});

// API endpoint to update a vehicle in the database
app.put('/api/kendaraan/:id', (req, res) => {
  const id = req.params.id;
  const { nomorUnit, jenisKendaraan, shelter, status } = req.body;
  const query = 'UPDATE Kendaraan SET nomorUnit=?, jenisKendaraan=?, shelter=?, status=? WHERE id=?';
  const values = [nomorUnit, jenisKendaraan, shelter, status, id];

  connection.query(query, values, (err, results) => {
    if (err) {
      console.error('Error executing query:', err);
      res.status(500).send('Internal Server Error');
    } else {
      res.status(200).send('Vehicle updated successfully');
    }
  });
});

// API endpoint to delete a vehicle from the database
app.delete('/api/kendaraan/:id', (req, res) => {
  const id = req.params.id;
  const query = 'DELETE FROM Kendaraan WHERE id=?';

  connection.query(query, [id], (err, results) => {
    if (err) {
      console.error('Error executing query:', err);
      res.status(500).send('Internal Server Error');
    } else {
      res.status(200).send('Vehicle deleted successfully');
    }
  });
});

// Section Report
// Mendapatkan semua data dari tabel 'report'
app.get('/api/report', (req, res) => {
    const query = 'SELECT * FROM Report';
    connection.query(query, (error, results) => {
      if (error) throw error;
      res.json(results);
    });
  });


// Section Feedback
app.get('/api/feedback', (req, res) => {
    const query = 'SELECT * FROM Feedback'; 
    connection.query(query, (err, results) => {
    if (err) {
      console.error('Error querying database:', err);
      res.status(500).json({ error: 'Internal Server Error' });
      return;
    }
  
    res.status(200).json(results);
  });
});



app.listen(port, () => {
  console.log(`Server berjalan di http://localhost:${port}`);
});
