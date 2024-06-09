import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:project_informasi/screen_page/navbar.dart';
import 'package:project_informasi/utils/ip.dart';

class JaksaMasukSekolah extends StatefulWidget {
  @override
  _JaksaMasukSekolahState createState() => _JaksaMasukSekolahState();
}

class _JaksaMasukSekolahState extends State<JaksaMasukSekolah> {
  TextEditingController _sekolahTujuanController = TextEditingController();
  TextEditingController _namaPemohonController = TextEditingController();

  Future<void> _submitForm() async {
    final uri = Uri.parse('$ip/postJms.php');
    final request = http.MultipartRequest('POST', uri);

    request.fields['sekolah_tujuan'] = _sekolahTujuanController.text;
    request.fields['nama_pemohon'] = _namaPemohonController.text;

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseData);
        if (jsonResponse['isSuccess']) {
          print('Form submitted successfully');
          // Navigate to NavBar class
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NavBar()),
          );
        } else {
          print('Error: ${jsonResponse['message']}');
        }
      } else {
        print('Server error: ${response.statusCode}');
      }
    } catch (e) {
      print('Submission error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Posko Pilkada',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF40A578),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Silahkan Masukkan Data',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Sekolah Tujuan',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _sekolahTujuanController,
                decoration: InputDecoration(
                  hintText: 'Masukkan Sekolah Tujuan',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Nama Pemohon',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _namaPemohonController,
                decoration: InputDecoration(
                  hintText: 'Masukkan Nama Pemohon',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit', style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF40A578),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
