const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const path = require('path');

const app = express();
const port = 3000;

// Serve static files (HTML, CSS) from the 'public' directory
app.use(express.static(path.join(__dirname, 'public')));

// Body parser middleware to parse incoming JSON data
app.use(bodyParser.json());

// MySQL Database Configuration
const db = mysql.createConnection({
  host: '162.243.25.123',
  user: 'vpladmin',
  password: 'j57Ie4T641@h3p4',
  database: 'virtual'
});

// Connect to the database
db.connect(err => {
  if (err) {
    console.error('Could not connect to the database:', err);
    process.exit();
  } else {
    console.log('Connected to the database!');
  }
});

// Helper function to map month name to month number
const getMonthNumber = (monthName) => {
  const months = {
    january: 1, february: 2, march: 3, april: 4, may: 5, june: 6,
    july: 7, august: 8, september: 9, october: 10, november: 11, december: 12
  };
  return months[monthName.toLowerCase()];
};

// API endpoint for handling chat messages
app.post('/message', (req, res) => {
  const userMessage = req.body.message.toLowerCase();

  // If the user asks "How many customers?"
  if (userMessage.includes("how many customers")) {
    const query = 'SELECT COUNT(*) AS customerCount FROM customer';

    db.query(query, (err, results) => {
      if (err) {
        console.error('Error querying the database:', err);
        return res.json({ reply: "Sorry, there was an issue with the database." });
      }

      const customerCount = results[0].customerCount;
      return res.json({ reply: `We currently have ${customerCount} customers.` });
    });
  }

  // If the user asks "How many orders?"
  else if (userMessage.includes("how many orders")) {
    const query = 'SELECT COUNT(*) AS orderCount FROM `orders`';

    db.query(query, (err, results) => {
      if (err) {
        console.error('Error querying the database:', err);
        return res.json({ reply: "Sorry, there was an issue with the database." });
      }

      const orderCount = results[0].orderCount;
      return res.json({ reply: `We currently have ${orderCount} orders.` });
    });
  }

  // If the user asks "Show orders by month"
  else if (userMessage.includes("show orders by month")) {
    const query = `
      SELECT MONTHNAME(OrderDate) AS month, COUNT(*) AS totalOrders
      FROM orders
      GROUP BY MONTH(OrderDate)
      ORDER BY MONTH(OrderDate)
    `;

    db.query(query, (err, results) => {
      if (err) {
        console.error('Error querying the database:', err);
        return res.json({ reply: "Sorry, there was an issue with the database." });
      }

      let reply = 'Orders by month:\n';
      results.forEach(row => {
        reply += `Month: ${row.month}, Total Orders: ${row.totalOrders}\n`;
      });
      return res.json({ reply: reply });
    });
  }

  // If the user asks "Show orders by month of January 2024"
  else if (userMessage.includes("show orders by month of")) {
    // Extract the month and year from the user input
    const matches = userMessage.match(/show orders by month of (\w+) (\d{4})/);

    if (matches) {
      const monthName = matches[1]; // e.g., "january"
      const year = matches[2]; // e.g., "2024"
      const month = getMonthNumber(monthName); // Convert month name to number

      // Query to get orders for a specific month and year
      const query = `
        SELECT COUNT(*) AS totalOrders
        FROM orders
        WHERE MONTH(OrderDate) = ? AND YEAR(OrderDate) = ?
      `;

      db.query(query, [month, year], (err, results) => {
        if (err) {
          console.error('Error querying the database:', err);
          return res.json({ reply: "Sorry, there was an issue with the database." });
        }

        const totalOrders = results[0].totalOrders;
        return res.json({ reply: `In ${monthName} ${year}, there were ${totalOrders} orders.` });
      });
    } else {
      return res.json({ reply: "Sorry, I couldn't understand the month and year. Please try again with the correct format." });
    }
  }

  // If the user asks "Show orders by year"
  else if (userMessage.includes("show orders by year")) {
    const query = `
      SELECT YEAR(OrderDate) AS year, COUNT(*) AS totalOrders
      FROM orders
      GROUP BY YEAR(OrderDate)
      ORDER BY YEAR(OrderDate)
    `;

    db.query(query, (err, results) => {
      if (err) {
        console.error('Error querying the database:', err);
        return res.json({ reply: "Sorry, there was an issue with the database." });
      }

      let reply = 'Orders by year:\n';
      results.forEach(row => {
        reply += `Year: ${row.year}, Total Orders: ${row.totalOrders}\n`;
      });
      return res.json({ reply: reply });
    });
  }

  // If the user asks something else
  else {
    return res.json({ reply: "Sorry, I didn't understand that. Can you please ask again?" });
  }
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
