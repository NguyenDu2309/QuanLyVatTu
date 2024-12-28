import sql from 'msnodesqlv8';
import { MongoClient } from 'mongodb';
import fs from 'fs/promises';
import path from 'path';
import VatTus from '../models/modelVT.js';

// Chuỗi kết nối SQL Server
const connectionString = "Driver={SQL Server Native Client 11.0};Server=DESKTOP-DGKOQQQ\\SERVER1;Database=QLVT;UID=sa;PWD=Quang12*;";




//ADD đơn VatTu vào
const AddVatTu = async (req, res) => {
    const { MAVT, TENVT, DVT, SOLUONGTON ,LoaiVT,MotaVT} = req.body;

    const query = `INSERT INTO Vattu (MAVT, TENVT, DVT, SOLUONGTON)
                   VALUES ('${MAVT}', '${TENVT}', '${DVT}', '${SOLUONGTON}')`;

    try {
        await new Promise((resolve, reject) => {
            sql.query(connectionString, query, (err, result) => {
                if (err) {
                    console.error("Lỗi khi thêm dữ liệu vào SQL Server", err);
                    reject({ error: "Lỗi khi thêm dữ liệu vào SQL Server" });
                }
                resolve(result);
            });
        });

        const newVattu = new VatTus({
            MAVT,
            LoaiVT,
            MotaVT,
        });  
        await newVattu.save();

        res.status(200).json({ message: "thiết bị đã được thêm vào !" });
    } catch (err) {
        console.error("Lỗi khi thêm dữ liệu:", err);
        res.status(500).json(err);
    }
};



//Lấy toàn bộ Vật tư
const getALLVatTu = async (req, res) => {
    try {
        // Lấy dữ liệu từ MongoDB
        const VatTuALL = await VatTus.find();

        // Lấy dữ liệu từ SQL Server
        const sqlQuery = "SELECT MAVT,TENVT,DVT,SOLUONGTON FROM Vattu";
        const sqlData = await new Promise((resolve, reject) => {
            sql.query(connectionString, sqlQuery, (err, result) => {
                if (err) {
                    reject({ error: "Lỗi khi lấy dữ liệu từ SQL Server" });
                } else {
                    resolve(result);
                }
            });
        });

        const combinedData = sqlData.map((sqlItem) => {
            const mongoItem = VatTuALL.find(
                (mongo) => mongo.MAVT === sqlItem.MAVT
            );

            return {
                id:mongoItem?.id,
                MAVT: sqlItem.MAVT,
                TENVT: sqlItem.TENVT,
                DVT: sqlItem.DVT,
                SOLUONGTON: sqlItem.SOLUONGTON,
                LoaiVT: mongoItem?.LoaiVT || null,
                MotaVT: mongoItem?.MotaVT || null,
            };
        });

        res.status(200).json(combinedData);
    } catch (err) {
        res.status(500).json({ error: err.error || "Lỗi khi lấy dữ liệu từ MongoDB hoặc SQL Server" });
    }
};



//Update dữ liệu dựa vào Id của vật tư
const updateVT = async (req, res) => {
    const { MAVT, TENVT, DVT, SOLUONGTON, LoaiVT, MotaVT, image } = req.body;

    // Kiểm tra giá trị đầu vào, đảm bảo SOLUONGTON là số hoặc mặc định là 0
    const GtriSLT = SOLUONGTON !== undefined ? parseInt(SOLUONGTON, 10) || 0 : 0;

    // Cập nhật trong SQL Server
    const sqlQuery = `
        UPDATE Vattu
        SET TENVT = '${TENVT}' , DVT = '${DVT}', SOLUONGTON = '${GtriSLT}'
        WHERE MAVT = '${MAVT}'
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
        const updatedVT = await VatTus.findOneAndUpdate(
            { MAVT }, // Tìm theo MAVT
            { LoaiVT, MotaVT }, 
            { new: true } // Trả về bản ghi đã cập nhật
        );

        if (!updatedVT) {
            return res.status(404).json({ message: "Không tìm thấy Vật tư để cập nhật trong MongoDB" });
        }

        res.status(200).json({ message: "Thiết bị đã được cập nhật !" });
    } catch (err) {
        console.error(err);
        res.status(500).json(err);
    }
};


//xóa dữ liệu dưa vào MAVT
const deleteVT = async (req, res) => {
    const { MAVT } = req.body;

    try {

        // Xóa dữ liệu từ MongoDB
        const VATTTU = await VatTus.findOneAndDelete({MAVT});
        if (!VATTTU) {
            return res.status(404).json({ error: "Không tìm thấy Vật tư MongoDB" });
        }

        // Xóa dữ liệu từ SQL
        const sqlQuery = `DELETE FROM Vattu WHERE MAVT = '${MAVT}'`;
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
            return res.status(404).json({ error: "Không tìm thấy Vật tư trong SQL Server" });
        }
        // Trả về phản hồi thành công
        res.status(200).json({ message: "Xóa Thiết bị thành công" });

    } catch (err) {
        res.status(500).json({ error: err.error || "Lỗi khi xóa dữ liệu từ MongoDB hoặc SQL Server" });
    }
};

export { AddVatTu, getALLVatTu, updateVT, deleteVT };