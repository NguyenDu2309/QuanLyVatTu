1. Đảm bảo đã tải nodejs để khởi chạy Javascript:
Ấn vào link để tải nếu chưa có: https://nodejs.org/en

2. Clone project bằng cách mở terminal:
git clone https://github.com/NguyenDu2309/QuanLyVatTu.git

3. Tải template engine EJS cho project bằng cách mở terminal và gõ npm install ejs

4. Gõ npm install để thiết lập file node_modules cần thiết để chạy dự án

5. Thay đổi đường dẫn tương ứng với file dulieuQLVT.sql ở hàm getConnectionString ở file NhanVienController.js và vatTuControllers.js 
    Thay đổi các thuộc tính cloud_name, api_key, api_secret ở file cloudinaryconfigs.js  (đăng nhập vào cloudinary -> Dashboard (cloud_name) -> Go to API Keys (api_key, api_secret))

6. Gõ node index.mjs để khởi chạy hệ thống
    Gõ node cloudinaryconfigs.js để thực hiện lưu ảnh ở cloudinary

