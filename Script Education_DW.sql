-----4.1. CREATE DATABASE-----
CREATE DATABASE Education_DW;
GO
USE Education_DW;
GO

-----4.2. CẤU TRÚC BẢNG-----
-----1. Chiều Sinh viên-----
CREATE TABLE Dim_Student (
    StudentKey INT IDENTITY(1,1) PRIMARY KEY, -- Khóa thay thế
    Student_ID_Natural NVARCHAR(50),           -- ID gốc từ hệ thống
    Age INT,
    Gender INT,
    HS_Type INT,
    Scholarship INT,
    Work_Status INT,
    Activity INT,
    Partner INT,
    Salary INT,
    Transport INT,
    Living_Status INT
);

-----2. Chiều Gia đình-----
CREATE TABLE Dim_Parent (
    ParentKey INT IDENTITY(1,1) PRIMARY KEY,
    Mother_Edu INT,
    Father_Edu INT,
    Mother_Job INT,
    Father_Job INT,
    Siblings_Count INT,
    Kids_Status INT
);

-----3. Chiều Thói quen học tập-----
CREATE TABLE Dim_Habits (
    HabitKey INT IDENTITY(1,1) PRIMARY KEY,
    Study_Hrs INT,
    Read_Freq INT,
    Read_Freq_Sci INT,
    Attend_Dept INT,
    Impact_Status INT,
    Attendance_Level INT,
    Prep_Study INT,
    Prep_Exam INT,
    Notes_Taking INT,
    Listens_Level INT,
    Likes_Discuss INT,
    Classroom_Type INT
);

-----4. Chiều Môn học-----
CREATE TABLE Dim_Course (
    CourseKey INT IDENTITY(1,1) PRIMARY KEY,
    Course_ID_Natural NVARCHAR(50),
    Course_Code NVARCHAR(20),
    Course_Name NVARCHAR(100)
);

-----TẠO BẢNG FACT_PERFORMANCE-----
CREATE TABLE Fact_Performance (
	PerformanceKey INT IDENTITY(1,1) PRIMARY KEY,
-----Các khóa ngoại nối sang bảng Dim-----
	StudentKey INT,
	ParentKey INT,
	HabitKey INT,
	CourseKey INT,
-----Các độ đo (Measures)-----
	GRADE INT,          
	CUML_GPA DECIMAL(4,2),
	EXP_GPA DECIMAL(4,2),
    
-----Thiết lập ràng buộc khóa ngoại-----
CONSTRAINT FK_Fact_Student FOREIGN KEY (StudentKey) REFERENCES Dim_Student(StudentKey),
CONSTRAINT FK_Fact_Parent FOREIGN KEY (ParentKey) REFERENCES Dim_Parent(ParentKey),
CONSTRAINT FK_Fact_Habit FOREIGN KEY (HabitKey) REFERENCES Dim_Habits(HabitKey),
CONSTRAINT FK_Fact_Course FOREIGN KEY (CourseKey) REFERENCES Dim_Course(CourseKey)
);

-----4.3. LÀM SẠCH DỮ LIỆU-----
-----1. Xử lý giá trị Null-----
-----Thay thế giá trị NULL trong bảng Dim_Student-----
UPDATE Dim_Student
SET Scholarship = 0 
WHERE Scholarship IS NULL;

-----Thay thế NULL trong các cột thói quen học tập-----
UPDATE Dim_Habits
SET Study_Hrs = 1 
WHERE Study_Hrs IS NULL;

-----2. Kiểm tra và loại bỏ dữ liệu bất thường-----
-----Loại bỏ hoặc sửa các dòng có độ tuổi không hợp lệ-----
DELETE FROM Dim_Student 
WHERE Age > 100 OR Age < 15;

-----Kiểm tra điểm Grade-----
UPDATE Fact_Performance
SET GRADE = 7
WHERE GRADE > 7;

-----3. Chuẩn hóa định dạng-----
-----Loại bỏ khoảng trắng thừa trong mã môn học-----
UPDATE Dim_Course
SET Course_Code = TRIM(Course_Code);

-----Chuyển tên môn học về chữ hoa để thống nhất-----
UPDATE Dim_Course
SET Course_Name = UPPER(Course_Name);