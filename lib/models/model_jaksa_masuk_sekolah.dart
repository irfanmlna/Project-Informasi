// jaksa_masuk_sekolah_model.dart

class JaksaMasukSekolahModel {
  String sekolahTujuan;
  String namaPemohon;

  JaksaMasukSekolahModel({
    required this.sekolahTujuan,
    required this.namaPemohon,
  });

  @override
  String toString() {
    return 'JaksaMasukSekolahModel{sekolahTujuan: $sekolahTujuan, namaPemohon: $namaPemohon}';
  }
}
