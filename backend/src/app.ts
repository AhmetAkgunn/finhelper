import express, { Request, Response } from 'express';
import cors from 'cors';
import authRoutes from './routes/authRoutes';
import expenseRoutes from './routes/expenseRoutes';
import groupRoutes from './routes/groupRoutes';
import path from 'path';

const app = express();

// Middleware
app.use(cors());
app.use(express.json());

app.get('/', (req: Request, res: Response) => {
  res.sendFile(path.resolve(__dirname, '../public/ahmetim.png'));
});

// Routes
app.use('/api/auth', authRoutes);
app.use('/api/expenses', expenseRoutes);
app.use('/api/groups', groupRoutes);

// Error handling
app.use((err: Error, req: express.Request, res: express.Response, next: express.NextFunction) => {
  console.error(err.stack);
  res.status(500).json({ message: 'Something went wrong!' });
});

export default app;
