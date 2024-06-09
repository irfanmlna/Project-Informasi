import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:project_informasi/utils/ip.dart';

class JaksaMasukSekolahListScreen extends StatefulWidget {
  const JaksaMasukSekolahListScreen({Key? key});

  @override
  State<JaksaMasukSekolahListScreen> createState() =>
      _JaksaMasukSekolahListScreenState();
}

class _JaksaMasukSekolahListScreenState
    extends State<JaksaMasukSekolahListScreen> {
  late Future<List<Datum>?> _futureJaksaMasukSekolah;

  @override
  void initState() {
    super.initState();
    _futureJaksaMasukSekolah = getJaksaMasukSekolah();
  }

  Future<List<Datum>?> getJaksaMasukSekolah() async {
    try {
      http.Response res = await http
          .get(Uri.parse('$ip/getJms.php'));
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
          'Jaksa Masuk Sekolah',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: Color(0xFF40A578),
      ),
      body: FutureBuilder(
        future: _futureJaksaMasukSekolah,
        builder: (BuildContext context, AsyncSnapshot<List<Datum>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(color: Color(0xFF40A578)));
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            List<Datum> _jaksaMasukSekolahList = snapshot.data!;
            return ListView.builder(
              itemCount: _jaksaMasukSekolahList.length,
              itemBuilder: (context, index) {
                Datum jaksaMasukSekolah = _jaksaMasukSekolahList[index];
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        // Implement onTap action here if needed
                      },
                      title: Text(
                        jaksaMasukSekolah.nama_pemohon,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF40A578),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Sekolah Tujuan: ${jaksaMasukSekolah.sekolah_tujuan}',
                        style:
                            TextStyle(color: Colors.black54, fontSize: 12),
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
  String nama_pemohon;
  String sekolah_tujuan;

  Datum({
    required this.id,
    required this.nama_pemohon,
    required this.sekolah_tujuan,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] ?? "",
        nama_pemohon: json["nama_pemohon"] ?? "",
        sekolah_tujuan: json["sekolah_tujuan"] ?? "",
      );
}
