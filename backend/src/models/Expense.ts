import mongoose, { Document, Schema } from 'mongoose';

export interface IExpense extends Document {
  amount: number;
  description: string;
  category: string;
  date: Date;
  userId: mongoose.Types.ObjectId;
  groupId?: mongoose.Types.ObjectId;
  type: 'wallet' | 'group';
  createdAt: Date;
  updatedAt: Date;
}

const expenseSchema = new Schema<IExpense>(
  {
    amount: {
      type: Number,
      required: true,
      min: 0
    },
    description: {
      type: String,
      required: true,
      trim: true
    },
    category: {
      type: String,
      required: true,
      trim: true
    },
    date: {
      type: Date,
      required: true,
      default: Date.now
    },
    userId: {
      type: Schema.Types.ObjectId,
      ref: 'User',
      required: true
    },
    groupId: {
      type: Schema.Types.ObjectId,
      ref: 'Group'
    },
    type: {
      type: String,
      enum: ['wallet', 'group'],
      required: true
    }
  },
  {
    timestamps: true
  }
);

export const Expense = mongoose.model<IExpense>('Expense', expenseSchema); 