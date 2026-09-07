# Education Data Warehouse & ETL Pipeline

[![SQL Server](https://img.shields.io/badge/Database-MS_SQL_Server-red.svg)]()
[![ETL](https://img.shields.io/badge/ETL-SSIS-orange.svg)]()
[![Excel](https://img.shields.io/badge/Source-Excel-green.svg)]()

> **Mô tả dự án:** Xây dựng hệ thống Kho dữ liệu (Data Warehouse) và quy trình ETL tự động hóa bằng SSIS để tích hợp dữ liệu giáo dục từ nhiều nguồn, phục vụ bài toán phân tích và dự báo kết quả học tập của sinh viên.

---

## Kiến trúc Hệ thống & Luồng Dữ liệu (ETL Architecture)

1. **Data Sources (Nguồn dữ liệu):** Dữ liệu thô từ file Excel (`student_prediction.xlsx`) và các cơ sở dữ liệu giao dịch.
2. **ETL Process (SSIS):** 
   * Trích xuất (Extract), làm sạch và chuẩn hóa kiểu dữ liệu.
   * Biến đổi (Transform) dữ liệu theo quy chuẩn kinh doanh.
   * Nạp (Load) dữ liệu vào các bảng Fact & Dimension trong Kho dữ liệu.
3. **Data Warehouse (SQL Server):** Lưu trữ dữ liệu chuẩn hóa dạng **Star Schema** tối ưu cho truy vấn báo cáo.

---

## Công cụ & Công nghệ sử dụng
* **Database Management System:** Microsoft SQL Server.
* **ETL Tool:** SQL Server Integration Services (SSIS) / Visual Studio.
* **Data Sources:** Excel (`student_prediction.xlsx`), SQL Scripts.

---

## Cấu trúc Repository

```text
├── Education Project/
│   ├── Education ETL.sln              # Visual Studio Solution cho SSIS
│   └── Education Project/             # Thư mục gói SSIS Package (.dtsx)
│       └── Package.dtsx               # Luồng xử lý ETL chính
├── Education_DW_ETL.bak               # File Backup Database SQL Server
├── Script Education_DW.sql            # Script SQL khởi tạo bảng & cấu trúc DW
├── student_prediction.xlsx            # File dữ liệu nguồn
├── .gitignore                         # File bỏ qua các thư mục rác bin/obj
└── README.md                          # Tài liệu giới thiệu dự án
