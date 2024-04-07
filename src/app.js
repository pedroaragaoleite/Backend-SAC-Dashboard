import express from 'express';
import cors from 'cors';
// import { testConnection } from './db/db.js';
// import authRoutes from './routes/auth.routes.js';
// import userRoutes from './routes/user.routes.js';
// import orderRoutes from './routes/order.routes.js';
// import customerRoutes from './routes/customer.routes.js';
// import campaignRoutes from './routes/campaign.routes.js';
// import todoRoutes from './routes/todo.routes.js';
// import authRoutes from './routes/auth.routes.js';
import cookieParser from 'cookie-parser';

const app = express();

const coorsOptions = {
    origin: 'http://localhost:4200',
    credentials: true
}

app.use(cookieParser());
app.use(express.json());
app.use(cors(coorsOptions));

// await testConnection();

// app.use('/api/', authRoutes);
// app.use('/api', userRoutes);
// app.use('/api', orderRoutes);
// app.use('/api', customerRoutes);
// app.use('/api', campaignRoutes);
// app.use('/api', todoRoutes);

app.use((req, res, next) => {
    res.status(404).json({
        message: "Endpoint not found"
    })
})

export default app;