// pengaduan_tindak_pidana_korupsi_model.dart

class PengaduanTindakPidanaKorupsiModel {
  String namaPelapor;
  String noHp;
  String noKtp;
  String uraianSingkatLaporan;
  String bentukMasalah;
  String? fileName1;
  String? fileName2;

  PengaduanTindakPidanaKorupsiModel({
    required this.namaPelapor,
    required this.noHp,
    required this.noKtp,
    required this.uraianSingkatLaporan,
    required this.bentukMasalah,
    this.fileName1,
    this.fileName2,
  });

  @override
  String toString() {
    return 'PengaduanTindakPidanaKorupsiModel{nama: $namaPelapor, noHp: $noHp, noKtp: $noKtp, uraianSingkatLaporan: $uraianSingkatLaporan, bentukMasalah: $bentukMasalah, fileName1: $fileName1, fileName2: $fileName2}';
  }
}
