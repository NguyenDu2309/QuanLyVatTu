import mongoose from 'mongoose';

// Định nghĩa schema cho NhanVien
const nhanVienSchema = new mongoose.Schema({
  MANV: { type: Number, required: true, unique: true }, 
  // DIACHI: { type: String},
  // NGAYSINH: { type: Date},
  HO: { type: String, required: true },
  TEN: { type: String, required: true },
  LUONG: { type: Number, required: true },
  image:{
    type:String
  },
  // MACN:{
  //   type:String
  // }
},);
// { timestamps: true }
  const NhanVien = mongoose.model('NhanVien', nhanVienSchema);

  export default NhanVien;