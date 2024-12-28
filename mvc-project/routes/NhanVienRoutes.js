import express from 'express';
import sql from 'msnodesqlv8';
import { AddNhanVien, getALLNhanVien, updateNV, deleteNV } from '../controllers/NhanVienController.js';
import { Router } from 'express';

const router = Router();
// const connectionString = "Driver={SQL Server Native Client 11.0};Server=DESKTOP-DGKOQQQ\\SERVER1;Database=QLVT;UID=sa;PWD=Quang12*;";
// const query = "SELECT MANV,TEN,LUONG,MACN FROM NhanVien";

//them nhanvien
router.post('/fetch-InsertNV',AddNhanVien); 


//Lấy toàn bộ dữ liệu của nv
router.get("/get-NhanVien", getALLNhanVien);


//update dữ liệu của 1 NV
router.put("/update-NhanVien",updateNV);



//xóa dữ liệu của 1 NV
router.delete("/delete-NhanVien",deleteNV);


export default router;