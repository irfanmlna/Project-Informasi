import 'package:flutter/material.dart';
import 'package:project_informasi/screen_page/jaksa_masuk_sekolah.dart';
import 'package:project_informasi/screen_page/jaksa_masuk_sekolah_list.dart';
import 'package:project_informasi/screen_page/pengaduan_pegawai_list_screen.dart';
import 'package:project_informasi/screen_page/pengaduan_pegawai_screen.dart';
import 'package:project_informasi/screen_page/pengaduan_tindak_pidana_korupsi_list_screen.dart';
import 'package:project_informasi/screen_page/pengaduan_tindak_pidana_korupsi_screen.dart';
import 'package:project_informasi/screen_page/pengawasan_agama_list_screen.dart';

import 'package:project_informasi/screen_page/pengawasan_agama_screen.dart';

import 'package:project_informasi/screen_page/penyuluhan_hukum_screen.dart';
import 'package:project_informasi/screen_page/penyuluhan_list_screen.dart';
import 'package:project_informasi/screen_page/posko_pilkada_list_screen.dart';
import 'package:project_informasi/screen_page/posko_pilkada_screen.dart';

class AdminHomeScreen extends StatefulWidget {
  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Beranda',
          style: TextStyle(color: Colors.white), // Set the text color to white
        ),
        backgroundColor: Color(0xFF40A578), // Set the AppBar color
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 35.0),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Laporan Masuk',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    _buildServiceButton(
                        context,
                        Icons.error_outline,
                        'Pengaduan Pegawai',
                        Colors.red.shade100,
                        PengaduanPegawaiListScreen()),
                    _buildServiceButton(
                        context,
                        Icons.error_outline,
                        'Pengaduan Tindak...',
                        Colors.red.shade100,
                        PengaduanTindakPidanaKorupsiListScreen()),
                    _buildServiceButton(
                        context,
                        Icons.school,
                        'Jaksa Masuk Sekolah',
                        Colors.green.shade100,
                        JaksaMasukSekolahListScreen()),
                    _buildServiceButton(
                        context,
                        Icons.balance,
                        'Penyuluhan Hukum',
                        Colors.green.shade100,
                        PenyuluhanHukumListScreen()),
                    _buildServiceButton(
                        context,
                        Icons.security,
                        'Pengawasan Aliran...',
                        Colors.yellow.shade100,
                        PengawasanAgamaListScreen()),
                    _buildServiceButton(
                        context,
                        Icons.how_to_vote,
                        'Posko Pilkada',
                        Colors.green.shade100,
                        PoskoPilkadaListScreen()),
                  ],
                ),
              ),
              SizedBox(
                  height: 16.0), // Tambahkan ini untuk menghindari overflow
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceButton(BuildContext context, IconData icon, String label,
      Color color, Widget page) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: color,
        padding: EdgeInsets.all(12.0), // Mengecilkan padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30.0), // Mengecilkan ukuran ikon
          SizedBox(height: 8.0),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.0), // Mengecilkan ukuran teks
          ),
        ],
      ),
    );
  }
}
