const configViewEngine = (app) => {
    app.set("view engine", "ejs"); // Cấu hình view engine là EJS
    app.set("views", "./mvc-project/views"); // Cấu hình đường dẫn thư mục views
};

export default configViewEngine; // Xuất module theo ES Module