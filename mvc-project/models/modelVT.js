import mongoose from 'mongoose';
import { Int } from 'msnodesqlv8';

// Định nghĩa schema cho Vattu
  const vatTuSchema = new mongoose.Schema({
  MAVT: { type: String, required: true },
  // TENVT: { type: String},
  // DVT: { type: String },
  // SOLUONGTON: { type: Number},
  LoaiVT:{type: String, required: true},
  MotaVT:{type: String, required: true},
  });
  // { timestamps: true }

const Vattu = mongoose.model('VatTu',vatTuSchema);


export default Vattu;