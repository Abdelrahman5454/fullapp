const express = require('express');
const { MongoClient } = require('mongodb');

const app = express();
const PORT = 3000;

// MongoDB connection
const mongoUrl = 'mongodb://root:password@mongo:27017';
const mongoClient = new MongoClient(mongoUrl);

app.get('/', async (req, res) => {
    try {
        // Connect to MongoDB
        await mongoClient.connect();
        const db = mongoClient.db('testdb');
        const collection = db.collection('messages');

        // Insert a sample document
        await collection.insertOne({ message: 'Hello from MongoDB' });

        // Retrieve one document
        const doc = await collection.findOne({});
        const message = doc.message;

        res.send(`From MongoDB: ${message}`);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error connecting to MongoDB');
    }
});

app.listen(PORT, () => console.log(`Node app running on port ${PORT}`));

