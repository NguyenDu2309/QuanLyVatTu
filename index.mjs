import express from "express";
import mongoose from "mongoose";
import bodyParser from "body-parser";
import nhanVienRoutes from "./mvc-project/routes/NhanVienRoutes.js";
import VattuRoutes from './mvc-project/routes/VattuRoutes.js';

import configViewEngine from "./mvc-project/configs/viewEngine.js";

const app = express();
const port = 3002;

mongoose.connect('mongodb://localhost:27017/QLVT')

app.use(bodyParser.json());

app.use((err, req, res, next) => {
    if (err instanceof SyntaxError) { 
        return res.status(400).json({ 
            error: 'Dữ liệu JSON không hợp lệ', 
            details: err.message 
        });
    }
    next();
});
app.use('/api/NhanVien', nhanVienRoutes);


// Cấu hình view engine
configViewEngine(app);


// thêm 1 nhân viên vào
//POST: http://localhost:3002/api/NhanVien/fetch-InsertNV

//lấy tất cả dữ liệu NV
//GET:http://localhost:3002/api/NhanVien/get-NhanVien


//xóa dữ liệu NV
//DELETE:http://localhost:3002/api/NhanVien/delete-NhanVien

//update NV
//UPDATE:http://localhost:3002/api/NhanVien/update-NhanVien

app.use('/api', VattuRoutes);

//ADD VatTu
//http://localhost:3002/api/fetch-InsertVT


//lấy tất cả dữ liệu VT
//GET:http://localhost:3002/api/get-VT


//xóa dữ liệu VT
//DELETE:http://localhost:3002/api/delete-VT


//update VT
//UPDATE:http://localhost:3002/api/update-VT

//NhanVien
app.get("/", (req, res) => {
   return res.render('homepage.ejs');
});
//Vattu
app.get('/Vattu.ejs', (req, res) => {
    return res.render('Vattu.ejs');
});

app.listen(port, () => {
    console.log(`Server đang chạy tại http://localhost:${port}`);
});