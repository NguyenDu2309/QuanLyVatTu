class NhanVienss {
    constructor(MANV, HO, TEN,DIACHI, NGAYSINH,Luong) {
        this.MANV = MANV; 
        this.HO = HO; 
        this.TEN = TEN; 
        this.DIACHI = DIACHI; 
        this.NGAYSINH = NGAYSINH; 
        this.Luong = Luong; 
    }

    get MANV() {
        return this.MANV;
    }
    set MANV(value) {
        if (!value) throw new Error('Mã nhân viên không được để trống.');
        this.MANV = value;
    }

    get luong() {
        return this.Luong;
    }
    set luong(value) {
        if (value <= 0) throw new Error('Lương không được nhỏ hơn hoặc bằng 0.');
        this.Luong = value;
    }

    displayInfo() {
        return `
            Mã Nhân Viên: ${this.MANV}
            Họ : ${this.HO}
            Tên: ${this.TEN}
            Địa chỉ: ${this.DIACHI}
            Ngày Sinh: ${this.NGAYSINH.toISOString().split('T')[0]}
            Lương: ${this.Luong}
        `;
    }
}

