class Datum {
  String id;
  String nama;
  String noHp;
  String noKtp;
  String fileKtp;
  String bentukPermasalahan;
  String fileLaporan;
  String status;

  Datum({
    required this.id,
    required this.nama,
    required this.noHp,
    required this.noKtp,
    required this.fileKtp,
    required this.bentukPermasalahan,
    required this.fileLaporan,
    required this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nama: json["nama"],
        noHp: json["no_hp"],
        noKtp: json["no_ktp"],
        fileKtp: json["file_ktp"],
        bentukPermasalahan: json["bentuk_permasalahan"],
        fileLaporan: json["file_laporan"],
        status: json["status"],
      );
}