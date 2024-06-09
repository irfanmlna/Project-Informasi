import 'package:flutter/material.dart';
import 'package:project_informasi/screen_page/home_screen.dart';


import 'package:project_informasi/screen_page/navbar.dart';


class ButtonLogin extends StatelessWidget {
  const ButtonLogin({Key? key}) : super(key: key);

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
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: const Text(
          'Masuk',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
