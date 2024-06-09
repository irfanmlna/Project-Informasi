import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_informasi/screen_page/jaksa_masuk_sekolah.dart';
import 'package:project_informasi/screen_page/pengaduan_pegawai_screen.dart';
import 'package:project_informasi/screen_page/pengaduan_tindak_pidana_korupsi_screen.dart';

import 'package:project_informasi/screen_page/pengawasan_agama_screen.dart';
import 'package:project_informasi/screen_page/penyuluhan_hukum_screen.dart';
import 'package:project_informasi/screen_page/posko_pilkada_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController _pageController;
  int _currentPageIndex = 0;
  final List<String> _imagePaths = [
    'lib/assets/home1.jpg',
    'lib/assets/home2.jpg',
    'lib/assets/home3.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentPageIndex,
    );
    _startAutoPageView();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPageView() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currentPageIndex < _imagePaths.length - 1) {
        _currentPageIndex++;
      } else {
        _currentPageIndex = 0;
      }
      _pageController.animateToPage(
        _currentPageIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 35.0),
              Center(
                child: Image.asset(
                  'lib/assets/title.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 25.0),
              Container(
                height: 200.0,
                child: Card(
                  elevation: 4,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _imagePaths.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPageIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return _buildPageViewItem(_imagePaths[index]);
                    },
                  ),
                ),
              ),
              SizedBox(height: 35.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Layanan',
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
                        PengaduanPegawai()),
                    _buildServiceButton(
                        context,
                        Icons.error_outline,
                        'Pengaduan Tindak...',
                        Colors.red.shade100,
                        PengaduanTindakPidanaKorupsi()),
                    _buildServiceButton(
                        context,
                        Icons.school,
                        'Jaksa Masuk Sekolah',
                        Colors.green.shade100,
                        JaksaMasukSekolah()),
                    _buildServiceButton(
                        context,
                        Icons.balance,
                        'Penyuluhan Hukum',
                        Colors.green.shade100,
                        PenyuluhanHukum()),
                    _buildServiceButton(
                        context,
                        Icons.security,
                        'Pengawasan Aliran...',
                        Colors.yellow.shade100,
                        PengawasanAgama()),
                    _buildServiceButton(context, Icons.how_to_vote,
                        'Posko Pilkada', Colors.green.shade100, PoskoPilkada()),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageViewItem(String imagePath) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildServiceButton(BuildContext context, IconData icon, String label,
      Color color, Widget page) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: color,
        padding: EdgeInsets.all(12.0),
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
          Icon(icon, size: 30.0),
          SizedBox(height: 8.0),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
