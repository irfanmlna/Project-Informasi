import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:project_informasi/screen_page/navbar.dart';
import 'package:project_informasi/utils/ip.dart';

class PoskoPilkada extends StatefulWidget {
  @override
  _PoskoPilkadaState createState() => _PoskoPilkadaState();
}

class _PoskoPilkadaState extends State<PoskoPilkada> {
  TextEditingController _namaPelaporController = TextEditingController();
  TextEditingController _noHpController = TextEditingController();
  TextEditingController _noKtpController = TextEditingController();
  TextEditingController _laporanPengaduanController = TextEditingController();
  String? _filePath1;
  String? _filePath2;

  Future<void> _pickPdf1() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _filePath1 = result.files.single.path;
      });
    }
  }

  Future<void> _pickPdf2() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _filePath2 = result.files.single.path;
      });
    }
  }

  Future<void> _submitForm() async {
    final uri = Uri.parse('$ip/postPosko.php');
    final request = http.MultipartRequest('POST', uri);

    request.fields['nama_pelapor'] = _namaPelaporController.text;
    request.fields['no_hp'] = _noHpController.text;
    request.fields['no_ktp'] = _noKtpController.text;
    request.fields['laporan_pengaduan'] = _laporanPengaduanController.text;

    if (_filePath1 != null) {
      request.files
          .add(await http.MultipartFile.fromPath('file_ktp', _filePath1!));
    }

    if (_filePath2 != null) {
      request.files
          .add(await http.MultipartFile.fromPath('file_laporan', _filePath2!));
    }

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
                'Nama Pelapor',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _namaPelaporController,
                decoration: InputDecoration(
                  hintText: 'Masukkan Nama Pelapor',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'No HP',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _noHpController,
                decoration: InputDecoration(
                  hintText: 'Masukkan No HP',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'No KTP',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _noKtpController,
                decoration: InputDecoration(
                  hintText: 'Masukkan No KTP',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _pickPdf1,
                child: Text(
                  'Upload PDF',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF9DDE8B),
                ),
              ),
              if (_filePath1 != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Selected File: ${_filePath1!.split('/').last}',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              SizedBox(height: 20.0),
              Text(
                'Laporan Pengaduan',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _laporanPengaduanController,
                decoration: InputDecoration(
                  hintText: 'Masukkan Laporan Pengaduan',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _pickPdf2,
                child: Text(
                  'Upload PDF',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF9DDE8B),
                ),
              ),
              if (_filePath2 != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Selected File: ${_filePath2!.split('/').last}',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
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
