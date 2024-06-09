import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AboutUsWidget(),
    );
  }
}

class AboutUsWidget extends StatefulWidget {
  @override
  _AboutUsWidgetState createState() => _AboutUsWidgetState();
}

class _AboutUsWidgetState extends State<AboutUsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'About Us',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: Color(0xFF40A578), // Updated color here
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
              20.0), // Padding untuk memberikan ruang di sekitar konten
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Mulai dari kiri atas halaman
            children: <Widget>[
              Text(
                'Sejarah Kejaksaan',
                style: TextStyle(
                  fontSize: 24, // Ukuran judul
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Kejaksaan R.I. adalah lembaga negara yang melaksanakan kekuasaan negara, khususnya di bidang penuntutan. Sebagai badan yang berwenang dalam penegakan hukum dan keadilan, Kejaksaan dipimpin oleh Jaksa Agung yang dipilih oleh dan bertanggung jawab kepada Presiden. Kejaksaan Agung, Kejaksaan Tinggi, dan Kejaksaan Negeri merupakan kekuasaan negara khususnya dibidang penuntutan, dimana semuanya merupakan satu kesatuan yang utuh yang tidak dapat dipisahkan. Mengacu pada Undang-Undang No. 16 Tahun 2004 yang menggantikan UU No. 5 Tahun 1991 tentang Kejaksaan R.I., Kejaksaan sebagai salah satu lembaga penegak hukum dituntut untuk lebih berperan dalam menegakkan supremasi hukum, perlindungan kepentingan umum, penegakan hak asasi manusia, serta pemberantasan Korupsi, Kolusi, dan Nepotisme (KKN). Di dalam UU Kejaksaan yang baru ini, Kejaksaan RI sebagai lembaga negara yang melaksanakan kekuasaan negara di bidang penuntutan harus melaksanakan fungsi, tugas, dan wewenangnya secara merdeka, terlepas dari pengaruh kekuasaan pemerintah dan pengaruh kekuasaan lainnya (Pasal 2 ayat 2 Undang-Undang Nomor 16 Tahun 2004). Dalam menjalankan tugas dan wewenangnya, Kejaksaan dipimpin oleh Jaksa Agung yang membawahi 6 (enam) Jaksa Agung Muda, 1 (satu) Kepala Badan Diklat Kejaksaan RI serta 32 Kepala Kejaksaan Tinggi pada tiap provinsi. UU No. 16 Tahun 2004 tentang Kejaksaan Republik Indonesia juga mengisyaratkan bahwa lembaga Kejaksaan berada pada posisi sentral dengan peran strategis dalam pemantapan ketahanan bangsa. Karena Kejaksaan berada di poros dan menjadi filter antara proses penyidikan dan proses pemeriksaan di persidangan serta juga sebagai pelaksana penetapan dan keputusan pengadilan. Sehingga, Lembaga Kejaksaan sebagai pengendali proses perkara (Dominus Litis), karena hanya institusi Kejaksaan yang dapat menentukan apakah suatu kasus dapat diajukan ke Pengadilan atau tidak berdasarkan alat bukti yang sah menurut Hukum Acara Pidana. Perlu ditambahkan, Kejaksaan juga merupakan satu-satunya instansi pelaksana putusan pidana (executive ambtenaar). Selain berperan dalam perkara pidana, Kejaksaan juga memiliki peran lain dalam Hukum Perdata dan Tata Usaha Negara, yaitu dapat mewakili Pemerintah dalam Perkara Perdata dan Tata Usaha Negara sebagai Jaksa Pengacara Negara. Jaksa sebagai pelaksana kewenangan tersebut diberi wewenang sebagai Penuntut Umum serta melaksanakan putusan pengadilan, dan wewenang lain berdasarkan Undang-Undang.',
                style: TextStyle(
                  fontSize: 16, // Ukuran subjudul
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 500), // Spacer
            ],
          ),
        ),
      ),
    );
  }
}
