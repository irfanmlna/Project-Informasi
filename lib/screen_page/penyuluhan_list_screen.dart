import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:project_informasi/utils/ip.dart';

class PenyuluhanHukumListScreen extends StatefulWidget {
  const PenyuluhanHukumListScreen({Key? key});

  @override
  State<PenyuluhanHukumListScreen> createState() =>
      _PenyuluhanHukumListScreenState();
}

class _PenyuluhanHukumListScreenState extends State<PenyuluhanHukumListScreen> {
  late Future<List<Datum>?> _futurePenyuluhanHukum;

  @override
  void initState() {
    super.initState();
    _futurePenyuluhanHukum = getPenyuluhanHukum();
  }

  Future<List<Datum>?> getPenyuluhanHukum() async {
    try {
      http.Response res = await http.get(
          Uri.parse('$ip/getPenyuluhan.php'));
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
          'Penyuluhan Hukum',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: Color(0xFF40A578), // Updated color here
      ),
      body: FutureBuilder(
        future: _futurePenyuluhanHukum,
        builder: (BuildContext context, AsyncSnapshot<List<Datum>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(color: Color(0xFF40A578)));
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            List<Datum> _penyuluhanHukumList = snapshot.data!;
            return ListView.builder(
              itemCount: _penyuluhanHukumList.length,
              itemBuilder: (context, index) {
                Datum penyuluhanHukum = _penyuluhanHukumList[index];
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PenyuluhanHukumDetailScreen(
                              penyuluhanHukum: penyuluhanHukum,
                            ),
                          ),
                        );
                      },
                      title: Text(
                        penyuluhanHukum.nama,
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
                            'No. HP: ${penyuluhanHukum.noHp}',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                          Text(
                            'No. KTP: ${penyuluhanHukum.noKtp}',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                          Text(
                            'Bentuk Permasalahan: ${penyuluhanHukum.bentukPermasalahan}',
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

class PenyuluhanHukumDetailScreen extends StatelessWidget {
  final Datum penyuluhanHukum;

  const PenyuluhanHukumDetailScreen({Key? key, required this.penyuluhanHukum})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Detail Penyuluhan Hukum',
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
              'Nama: ${penyuluhanHukum.nama}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('No. HP: ${penyuluhanHukum.noHp}'),
            Text('No. KTP: ${penyuluhanHukum.noKtp}'),
            Text('Bentuk Permasalahan: ${penyuluhanHukum.bentukPermasalahan}'),
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
  String nama;
  String noHp;
  String noKtp;
  String bentukPermasalahan;

  Datum({
    required this.id,
    required this.nama,
    required this.noHp,
    required this.noKtp,
    required this.bentukPermasalahan,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nama: json["nama"],
        noHp: json["no_hp"],
        noKtp: json["no_ktp"],
        bentukPermasalahan: json["bentuk_permasalahan"],
      );
}
