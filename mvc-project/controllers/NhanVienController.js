import sql from 'msnodesqlv8';
import { MongoClient, ObjectId } from 'mongodb';
import fs from 'fs/promises';
import path from 'path';
import NhanVien from '../models/modelNV.js';

// Chuỗi kết nối SQL Server theo chi nhánh
const getConnectionString = (branch) => {
    switch (branch) {
        case '1': 
            return "Driver={SQL Server Native Client 11.0};Server=DESKTOP-DGKOQQQ\\SERVER1;Database=QLVT;UID=sa;PWD=Quang12*;";
        case '2': 
            return "Driver={SQL Server Native Client 11.0};Server=DESKTOP-DGKOQQQ\\SERVER2;Database=QLVT;UID=sa;PWD=Quang12*;";
        case 'all':
        default:
            return "Driver={SQL Server Native Client 11.0};Server=DESKTOP-DGKOQQQ\\SERVERCHA;Database=QLVT;UID=sa;PWD=Quang12*;";
    }
};

// Thêm nhân viên vào MongoDB và SQL Server
    const AddNhanVien = async (req, res) => {
        const { MANV, DIACHI, NGAYSINH, MACN, branch, LUONG, image, HO, TEN } = req.body;
        const connectionString = getConnectionString(branch);

        // Dùng câu lệnh chuẩn bị để tránh SQL Injection
        const query = `INSERT INTO NhanVien (MANV, DIACHI, NGAYSINH, MACN) VALUES (?, ?, ?, ?)`;
        
        try {
            // Dùng Promise để thực hiện query với SQL Server
            await new Promise((resolve, reject) => {
                sql.query(connectionString, query, [MANV, DIACHI, NGAYSINH, MACN], (err, result) => {
                    if (err) {
                        console.error("Error while inserting into SQL Server: ", err);
                        reject({ error: "Lỗi khi thêm dữ liệu vào SQL Server" });
                    }
                    resolve(result);
                });
            });

            // Lưu vào MongoDB
            const newNhanVien = new NhanVien({
                MANV,
                HO,
                TEN,
                LUONG,
                image,
            });
            await newNhanVien.save();

            // Trả về thông báo thành công
            res.status(200).json({ message: "Nhân viên đã được thêm vào!" });
        } catch (err) {
            console.error("Error: ", err);
            res.status(500).json(err);
        }
    };

// Lấy toàn bộ nhân viên từ cả MongoDB và SQL Server
const getALLNhanVien = async (req, res) => {
    try {
        const { branch } = req.query;
        const connectionString = getConnectionString(branch);

        // Lấy dữ liệu từ MongoDB
        const NhanVienALLMongo = await NhanVien.find();

        // Lấy dữ liệu từ SQL Server
        const sqlQuery = "SELECT MANV, DIACHI, NGAYSINH, MACN FROM NhanVien";
        const sqlData = await new Promise((resolve, reject) => {
            sql.query(connectionString, sqlQuery, (err, result) => {
                if (err) {
                    reject({ error: "Lỗi khi lấy dữ liệu từ SQL Server" });
                } else {
                    resolve(result);
                }
            });
        });

        // Kết hợp dữ liệu từ SQL Server và MongoDB
        const combinedData = sqlData.map((sqlItem) => {
            const mongoItem = NhanVienALLMongo.find(
                (mongo) => mongo.MANV === sqlItem.MANV
            );

            return {
                id: mongoItem?.id,
                MANV: sqlItem.MANV,
                DIACHI: sqlItem.DIACHI,
                NGAYSINH: sqlItem.NGAYSINH,
                HO: mongoItem?.HO || null,
                TEN: mongoItem?.TEN || null,
                LUONG: mongoItem?.LUONG || null,
                image: mongoItem?.image || null,
                MACN: sqlItem.MACN,
            };
        });

        res.status(200).json(combinedData);
    } catch (err) {
        res.status(500).json({ error: err.error || "Lỗi khi lấy dữ liệu từ MongoDB hoặc SQL Server" });
    }
};


//update nhanvien
const updateNV = async (req, res) => {
    const { MANV, DIACHI, NGAYSINH, HO, TEN, LUONG, image, branch } = req.body;
    const connectionString = getConnectionString(branch);
        const sqlQuery = `
            UPDATE NhanVien
            SET DIACHI = '${DIACHI}', NGAYSINH = '${NGAYSINH}'
            WHERE MANV = '${MANV}'
        `;
        try {
        // Cập nhật dữ liệu trong SQL Server
            await new Promise((resolve, reject) => {
                sql.query(connectionString, sqlQuery, (err, result) => {
                    if (err) {
                        console.error("Lỗi khi thực thi câu lệnh SQL:", err);
                        reject({ error: "Lỗi khi cập nhật dữ liệu vào SQL Server" });
                    }
                    resolve(result);
                });
        });

        // Cập nhật trong MongoDB
        const updatedNhanVien = await NhanVien.findOneAndUpdate(
            { MANV }, // Tìm theo MANV
            { HO, TEN, LUONG, image }, // Cập nhật các trường cần thiết
            { new: true } // Trả về bản ghi đã cập nhật
        );
        if (!updatedNhanVien) {
            return res.status(404).json({ message: "Không tìm thấy nhân viên để cập nhật trong MongoDB" });
        }
        // Trả về phản hồi thành công
        res.status(200).json({ message: "Thông tin Nhân viên đã được cập nhật" });
    } catch (err) {
        console.error(err);
        res.status(500).json(err);
    }
};

// Xóa nhân viên theo mã nhân viên (MANV)
const deleteNV = async (req, res) => {
    const { MANV, branch } = req.body; // Lấy MANV từ request body
    const connectionString = getConnectionString(branch);

    try {

        // // Xóa dữ liệu từ MongoDB
        const NhanViens = await NhanVien.findOneAndDelete({ MANV });
        if (!NhanViens) {
            return res.status(404).json({ error: "Không tìm thấy nhân viên trong MongoDB" });
        }

        // Xóa dữ liệu từ SQL Server
        const sqlQuery = `DELETE FROM NhanVien WHERE MANV = '${MANV}'`;
        const sqlData = await new Promise((resolve, reject) => {
            sql.query(connectionString, sqlQuery, (err, result) => {
                if (err) {
                    console.error("SQL Error:", err);
                    reject({ error: "Lỗi khi xóa dữ liệu từ SQL Server" });
                } else {
                    resolve(result);
                }
            });
        });

        // Kiểm tra nếu không có bản ghi nào bị xóa trong SQL Server
        if (sqlData.affectedRows === 0) {
            return res.status(404).json({ error: "Không tìm thấy nhân viên trong SQL Server" });
        }

        // Trả về phản hồi thành công
        res.status(200).json({ message: "Xóa nhân viên thành công" });
    } catch (err) {
        res.status(500).json({ error: err.message || "Lỗi khi xóa dữ liệu từ SQL Server" });
    }
};

export { AddNhanVien, getALLNhanVien, updateNV, deleteNV };
