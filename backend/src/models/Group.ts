import mongoose, { Document, Schema } from 'mongoose';

export interface IGroup extends Document {
  name: string;
  description: string;
  members: mongoose.Types.ObjectId[];
  createdBy: mongoose.Types.ObjectId;
  totalExpense: number;
  createdAt: Date;
  updatedAt: Date;
}

const groupSchema = new Schema<IGroup>(
  {
    name: {
      type: String,
      required: true,
      trim: true
    },
    description: {
      type: String,
      trim: true
    },
    members: [{
      type: Schema.Types.ObjectId,
      ref: 'User'
    }],
    createdBy: {
      type: Schema.Types.ObjectId,
      ref: 'User',
      required: true
    },
    totalExpense: {
      type: Number,
      default: 0
    }
  },
  {
    timestamps: true
  }
);

export const Group = mongoose.model<IGroup>('Group', groupSchema); 