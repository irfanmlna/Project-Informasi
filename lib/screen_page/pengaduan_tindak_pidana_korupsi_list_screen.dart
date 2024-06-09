import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:project_informasi/utils/ip.dart';

class PengaduanTindakPidanaKorupsiListScreen extends StatefulWidget {
  const PengaduanTindakPidanaKorupsiListScreen({Key? key});

  @override
  State<PengaduanTindakPidanaKorupsiListScreen> createState() =>
      _PengaduanTindakPidanaKorupsiListScreenState();
}

class _PengaduanTindakPidanaKorupsiListScreenState
    extends State<PengaduanTindakPidanaKorupsiListScreen> {
  late Future<List<Datum>?> _futurePengaduan;

  @override
  void initState() {
    super.initState();
    _futurePengaduan = getPengaduan();
  }

  Future<List<Datum>?> getPengaduan() async {
    try {
      http.Response res = await http.get(
          Uri.parse('$ip/getKorupsi.php'));
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
          'Pengaduan Tindak Pidana Korupsi',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: Color(0xFF40A578), // Updated color here
      ),
      body: FutureBuilder(
        future: _futurePengaduan,
        builder: (BuildContext context, AsyncSnapshot<List<Datum>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(color: Color(0xFF40A578)));
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            List<Datum> _pengaduanList = snapshot.data!;
            return ListView.builder(
              itemCount: _pengaduanList.length,
              itemBuilder: (context, index) {
                Datum pengaduan = _pengaduanList[index];
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PengaduanTindakPidanaKorupsiDetailScreen(
                              pengaduan: pengaduan,
                            ),
                          ),
                        );
                      },
                      title: Text(
                        pengaduan.namaPelapor,
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
                            'No. HP: ${pengaduan.noHp}',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                          Text(
                            'No. KTP: ${pengaduan.noKtp}',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                          Text(
                            'Uraian Singkat: ${pengaduan.uraianSingkat}',
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

class PengaduanTindakPidanaKorupsiDetailScreen extends StatelessWidget {
  final Datum pengaduan;

  const PengaduanTindakPidanaKorupsiDetailScreen(
      {Key? key, required this.pengaduan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Detail Pengaduan Tindak Pidana Korupsi',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: Color(0xFF40A578), // Updated color here
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Pelapor: ${pengaduan.namaPelapor}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('No. HP: ${pengaduan.noHp}'),
            Text('No. KTP: ${pengaduan.noKtp}'),
            Text('Uraian Singkat: ${pengaduan.uraianSingkat}'),
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
  String namaPelapor;
  String noHp;
  String noKtp;
  String uraianSingkat;

  Datum({
    required this.id,
    required this.namaPelapor,
    required this.noHp,
    required this.noKtp,
    required this.uraianSingkat,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        namaPelapor: json["nama_pelapor"],
        noHp: json["no_hp"],
        noKtp: json["no_ktp"],
        uraianSingkat: json["uraian_singkat"],
      );
}
