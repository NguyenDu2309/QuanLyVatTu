import express from 'express';
import sql from 'msnodesqlv8';
import { AddVatTu, getALLVatTu, updateVT, deleteVT } from '../controllers/vatTuControllers.js';
import { Router } from 'express';

const router = Router();

// const connectionString = "Driver={SQL Server Native Client 11.0};Server=DESKTOP-DGKOQQQ\\SERVER1;Database=QLVT;UID=sa;PWD=Quang12*;";
// const query = "SELECT MaVT,TENVT,DVT,SOLUONGTON FROM Vattu";

//them vattu
router.post('/fetch-InsertVT',AddVatTu); 

//Lấy toàn bộ dữ liệu của VT
router.get("/get-VT", getALLVatTu)


//update dữ liệu của 1 VT
router.put("/update-VT",updateVT)

//xóa dữ liệu của 1 VT
router.delete("/delete-VT",deleteVT)

export default router;