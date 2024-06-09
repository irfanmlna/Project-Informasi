import 'package:flutter/material.dart';
import 'package:project_informasi/screen_page/home_screen.dart';
import 'package:project_informasi/screen_page/navbar.dart';

class ButtonRegister extends StatelessWidget {
  const ButtonRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NavBar()),
        );
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 365,
        decoration: BoxDecoration(
          color: Colors.green.shade700,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: const Text(
          'Daftar',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}