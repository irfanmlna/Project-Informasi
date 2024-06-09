// pengaduan_pegawai_model.dart

class PengaduanPegawaiModel {
  String namaPelapor;
  String noHp;
  String noKtp;
  String laporanPengaduan;
  String? fileName1;
  String? fileName2;

  PengaduanPegawaiModel({
    required this.namaPelapor,
    required this.noHp,
    required this.noKtp,
    required this.laporanPengaduan,
    this.fileName1,
    this.fileName2,
  });

  @override
  String toString() {
    return 'PengaduanPegawaiModel{nama: $namaPelapor, noHp: $noHp, noKtp: $noKtp, laporanPengaduan: $laporanPengaduan, fileName1: $fileName1, fileName2: $fileName2}';
  }
}
