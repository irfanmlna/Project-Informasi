import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:project_informasi/utils/ip.dart';

class PengawasanAgamaListScreen extends StatefulWidget {
  const PengawasanAgamaListScreen({Key? key});

  @override
  State<PengawasanAgamaListScreen> createState() =>
      _PengawasanAgamaListScreenState();
}

class _PengawasanAgamaListScreenState extends State<PengawasanAgamaListScreen> {
  late Future<List<Datum>?> _futurePengawasanAgama;

  @override
  void initState() {
    super.initState();
    _futurePengawasanAgama = getPengawasanAgama();
  }

  Future<List<Datum>?> getPengawasanAgama() async {
    try {
      http.Response res = await http.get(
          Uri.parse('$ip/getPengawasan.php'));
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
          'Pengawasan Agama',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: Color(0xFF40A578),
      ),
      body: FutureBuilder(
        future: _futurePengawasanAgama,
        builder: (BuildContext context, AsyncSnapshot<List<Datum>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(color: Color(0xFF40A578)));
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            List<Datum> _pengawasanAgamaList = snapshot.data!;
            return ListView.builder(
              itemCount: _pengawasanAgamaList.length,
              itemBuilder: (context, index) {
                Datum pengawasanAgama = _pengawasanAgamaList[index];
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PengawasanAgamaDetailScreen(
                              pengawasanAgama: pengawasanAgama,
                            ),
                          ),
                        );
                      },
                      title: Text(
                        pengawasanAgama.nama_pelapor,
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
                            'No. HP: ${pengawasanAgama.noHp}',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                          Text(
                            'No. KTP: ${pengawasanAgama.noKtp}',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                          Text(
                            'Laporan Pengaduan: ${pengawasanAgama.laporanPengaduan}',
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

class PengawasanAgamaDetailScreen extends StatelessWidget {
  final Datum pengawasanAgama;

  const PengawasanAgamaDetailScreen({Key? key, required this.pengawasanAgama})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Detail Pengawasan Agama',
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
              'Nama: ${pengawasanAgama.nama_pelapor}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('No. HP: ${pengawasanAgama.noHp}'),
            Text('No. KTP: ${pengawasanAgama.noKtp}'),
            Text('Laporan Pengaduan: ${pengawasanAgama.laporanPengaduan}'),
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
