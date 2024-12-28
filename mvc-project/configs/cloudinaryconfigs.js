import { v2 as cloudinary } from 'cloudinary';
import path from 'path';

(async function () {
    try {
        // Configuration
        cloudinary.config({
            cloud_name: 'dffvry5gg',
            api_key: '772266424196873',
            api_secret: 'JSRikDYdniQbCMb6kUZBIU7Xriw',
        });

        // Đảm bảo đường dẫn tệp là tuyệt đối
        const filePath = path.resolve('C:/CSDL_PhanTan/sql_t7/mvc-project/image/NV-Nu.jpg');
        console.log('Đường dẫn đầy đủ của tệp:', filePath);

        // Upload hình ảnh
        const uploadResult = await cloudinary.uploader.upload(filePath, {
            public_id: 'shoes',
        });

        console.log('Kết quả upload:', uploadResult);

        // Tạo URL tối ưu hóa
        const optimizeUrl = cloudinary.url('shoes', {
            fetch_format: 'auto',
            quality: 'auto',
        });

        console.log('URL tối ưu hóa:', optimizeUrl);

        // Transform the image: auto-crop to square aspect_ratio
        const autoCropUrl = cloudinary.url('shoes', {
            crop: 'auto',
            gravity: 'auto',
            width: 500,
            height: 500,
        });

        console.log('URL auto-crop:', autoCropUrl);
    } catch (error) {
        console.error('Lỗi xảy ra:', error.message || error);
    }
})();
