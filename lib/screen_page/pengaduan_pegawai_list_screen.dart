import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:project_informasi/utils/ip.dart';

class PengaduanPegawaiListScreen extends StatefulWidget {
  const PengaduanPegawaiListScreen({Key? key});

  @override
  State<PengaduanPegawaiListScreen> createState() =>
      _PengaduanPegawaiListScreenState();
}

class _PengaduanPegawaiListScreenState
    extends State<PengaduanPegawaiListScreen> {
  late Future<List<Datum>?> _futurePengaduanPegawai;

  @override
  void initState() {
    super.initState();
    _futurePengaduanPegawai = getPengaduanPegawai();
  }

  Future<List<Datum>?> getPengaduanPegawai() async {
    try {
      http.Response res = await http.get(Uri.parse(
          '$ip/getPegawai.php'));
      final welcome = welcomeFromJson(res.body);
      return welcome.data;
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Pengaduan Pegawai',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: Color(0xFF40A578),
      ),
      body: FutureBuilder(
        future: _futurePengaduanPegawai,
        builder: (BuildContext context, AsyncSnapshot<List<Datum>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(color: Color(0xFF40A578)));
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            List<Datum> _pengaduanPegawaiList = snapshot.data!;
            return ListView.builder(
              itemCount: _pengaduanPegawaiList.length,
              itemBuilder: (context, index) {
                Datum pengaduanPegawai = _pengaduanPegawaiList[index];
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PengaduanPegawaiDetailScreen(
                              pengaduanPegawai: pengaduanPegawai,
                            ),
                          ),
                        );
                      },
                      title: Text(
                        pengaduanPegawai.nama_pelapor,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF40A578),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'No. HP: ${pengaduanPegawai.noHp}',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                          Text(
                            'No. KTP: ${pengaduanPegawai.noKtp}',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                          Text(
                            'Laporan Pengaduan: ${pengaduanPegawai.laporanPengaduan}',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('Tidak ada data'));
          }
        },
      ),
    );
  }
}

class PengaduanPegawaiDetailScreen extends StatelessWidget {
  final Datum pengaduanPegawai;

  const PengaduanPegawaiDetailScreen({Key? key, required this.pengaduanPegawai})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Detail Pengaduan Pegawai',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: Color(0xFF40A578),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama: ${pengaduanPegawai.nama_pelapor}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('No. HP: ${pengaduanPegawai.noHp}'),
            Text('No. KTP: ${pengaduanPegawai.noKtp}'),
            Text('Laporan Pengaduan: ${pengaduanPegawai.laporanPengaduan}'),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}

// JSON parsing functions
Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

class Welcome {
  bool isSuccess;
  String message;
  List<Datum> data;

  Welcome({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  String id;
  String nama_pelapor;
  String noHp;
  String noKtp;
  String laporanPengaduan;

  Datum({
    required this.id,
    required this.nama_pelapor,
    required this.noHp,
    required this.noKtp,
    required this.laporanPengaduan,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] ?? "",
        nama_pelapor: json["nama_pelapor"] ?? "",
        noHp: json["no_hp"] ?? "",
        noKtp: json["no_ktp"] ?? "",
        laporanPengaduan: json["laporan_pengaduan"] ?? "",
      );
}
