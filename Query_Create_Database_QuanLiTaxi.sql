--drop database QuanLiTaxi
--Tạo database
create database QuanLiTaxi
go
--Sử dụng database
use QuanLiTaxi
go
--Tạo table XE1
create table XE1(
MODEL nvarchar(30) not null,
HANG_SAN_XUAT nvarchar(50),
MUC_TIEU_THU_XANG nvarchar(50),
SO_CHO_NGOI int 
);
--drop table XE1
go
--Tạo table XE2
create table XE2(
BIENSO nvarchar(20) not null,
MA_TX nvarchar(10),
MA_KV nvarchar(10),
SO_CHO_NGOI int
);
--drop table XE2
go
--Tạo table XE
create table XE(
BIENSO nvarchar(20) not null,
MODEL nvarchar(30) not null,
MA_TX nvarchar(10),
MA_KV nvarchar(10),
HANG_SAN_XUAT nvarchar(50),
MUC_TIEU_THU_XANG nvarchar(50),
SO_CHO_NGOI int
);
--drop table XE
go
--Tạo mảng KHU_VUC
create table KHU_VUC(
MAKV nvarchar(10) not null,
TEN_GOI nvarchar(30),
DD_DAU_TAXI nvarchar(30),
DD_DO_XANG nvarchar(30)
);
--drop table KHU_VUC
go
--Tạo bảng TAI_XE
create table TAI_XE(
MA_TX nvarchar(10) not null,
HO_TEN nvarchar(30),
DIA_CHI nvarchar(50)
);
--drop table TAI_XE
go
--Tạo bảng LO_TRINH
create table LO_TRINH(
KV_DI nvarchar(50) not null,
KV_DEN nvarchar(50) not null,
NGAY_GIO datetime not null,
BIEN_SO nvarchar(20)
);
--drop table LO_TRINH
go
--Tạo bảng PHIEU_DIEU_XE
create table PHIEU_DIEU_XE(
KV_DI nvarchar(30) not null,
KV_DEN nvarchar(30) not null,
NGAY_GIO datetime not null,
BIEN_SO nvarchar(20),
MA_NV char(10)
);
--drop table PHIEU_DIEU_XE
go
--Tạo bảng KHACH_HANG
create table KHACH_HANG(
SDT int not null,
MAKV nvarchar(10) not null,
THOI_GIAN datetime not null,
BIEN_SO nvarchar(20),
LOAI_XE nvarchar(30),
SO_LUONG int,
MA_NV char(10)
);
--drop table KHACH_HANG
go
--Tạo bảng PHIEU_TIEP_NHIEN_LIEU
create table PHIEU_TIEP_NHIEN_LIEU(
NGAY_GIO datetime not null,
BIEN_SO nvarchar(20) not null,
SL_XANG real,
SL_NHOT real,
MA_TX nvarchar(10)
);
--drop table PHIEU_TIEP_NHIEN_LIEU
go
--Tạo bảng SO_LO_TRINH
create table SO_LO_TRINH(
KV_DI nvarchar(50) not null,
KV_DEN nvarchar(50)  not null,
NGAY_GIO datetime  not null,
SO_KM real,
TIEN_THU real,
MA_TX nvarchar(10)
);
--drop table SO_LO_TRINH
go
--Tạo bảng NV_TRUC_BAN
create table NV_TRUC_BAN(
MA_NV char(10) not null,
HO_TEN nvarchar(30),
CA_TRUC varchar(30)
);
--drop table NV_TRUC_BAN
go
--Set khóa chính XE1
alter table XE1
add constraint pk_MODEL primary key (MODEL);
go
--Set khóa chính XE2
alter table XE2
add constraint pk_BIENSO primary key (BIENSO);
go
--Set khóa chính XE
alter table XE
add constraint pk_BIENSO_MODEL primary key (BIENSO,MODEL);
go
--Set khóa chính KHU_VUC
alter table KHU_VUC
add constraint pk_MA_KV primary key (MAKV);
go
--Set khóa chính XE
alter table TAI_XE
add constraint pk_MA_TX primary key (MA_TX);
go
--Set khóa chính LO_TRINH 
alter table LO_TRINH 
add constraint pk_KV_DI_DEN_NGIO_LOTRINH primary key (KV_DI,KV_DEN,NGAY_GIO);
go
--Set khóa chính PHIEU_DIEU_XE
alter table PHIEU_DIEU_XE
add constraint pk_KV_DI_DEN_NGIO_PHIEUDIEUXE primary key (KV_DI,KV_DEN,NGAY_GIO);
go
--Set khóa chính KHACH_HANG
alter table KHACH_HANG
add constraint pk_SDT_MAKV_THOIGIAN primary key (SDT,MAKV,THOI_GIAN);
go
--Set khóa chính cho PHIEU_TIEP_NHIEN_LIEU
alter table PHIEU_TIEP_NHIEN_LIEU
add constraint pk_NGAY_GIO_ primary key(NGAY_GIO,BIEN_SO);
go
--Set khóa chính cho SO_LO_TRINH
alter table SO_LO_TRINH
add constraint pk_KV_DI_KV_DEN_NGIO primary key(KV_Di,KV_DEN,NGAY_GIO);
go
--Set khóa chính cho NV_TRUC_BAN
alter table NV_TRUC_BAN
add constraint pk_MA_NV primary key(MA_NV);
go
--Set khóa ngoại
--Set table XE với XE1
alter table XE
add constraint fk_XE_XE1_MODEL foreign key (MODEL) references XE1(MODEL);
go
--Set table XE với XE2
alter table XE
add constraint fk_XE_XE2_BIEN_SO foreign key (BIENSO) references XE2(BIENSO);
go
--Set table XE2 với TAI_XE
alter table XE2 
add constraint fk_XE2_TAI_XE_MA_TX foreign key (MA_TX) references TAI_XE(MA_TX);
go
--Set table XE2 với PHIEU_DIEU_XE
alter table PHIEU_DIEU_XE
add constraint fk_PHIEU_DIEU_XE_XE2_BIEN_SO foreign key (BIEN_SO) references XE2(BIENSO);
go
--Set table PHIEU_DIEU_XE vơi NV_TRUC_BAN
alter table PHIEU_DIEU_XE
add constraint fk_PHIEU_DIEU_XE_NV_TRUC_BAN_BIEN_SO foreign key (MA_NV) references NV_TRUC_BAN(MA_NV);
go
--Set table XE2 với LO_TRINH
alter table LO_TRINH
add constraint fk_LO_TRINH_XE2_BIEN_SO foreign key (BIEN_SO) references XE2(BIENSO);
go
--Set table XE2 với KHACH_HANG
alter table KHACH_HANG
add constraint fk_KHACH_HANG_XE2_BIEN_SO foreign key (BIEN_SO) references XE2(BIENSO);
go
--Set table SO_LO_TRINH với TAI_XE
alter table SO_LO_TRINH
add constraint fk_SO_LO_TRINH_TAI_XE_MA_TX foreign key (MA_TX) references TAI_XE(MA_TX);
go
--Set table PHIEU_TIEP_NHIEN_LIEU với TAI_XE
alter table PHIEU_TIEP_NHIEN_LIEU
add constraint fk_PHIEU_TIEP_NHIEN_LIEU_TAI_XE_MA_TX foreign key (MA_TX) references TAI_XE(MA_TX);
go
--Set table XE2 với KHU_VUC
alter table XE2 
add constraint fk_XE2_MA_KV_MA_KV foreign key (MA_KV) references KHU_VUC(MAKV);
go
--Set table KHACH_HANG với NV_TRUC_BAN
alter table KHACH_HANG
add constraint fk_KHACH_HANG_NV_TRUC_BAN_MA_NV foreign key (MA_NV) references NV_TRUC_BAN(MA_NV);
go




