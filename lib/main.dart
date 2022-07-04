import 'package:flutter/material.dart';
import 'package:reservasihotel/ui/registrasi_page.dart';
import 'package:reservasihotel/ui/login_page.dart';
import 'package:reservasihotel/ui/produk_page.dart';
import 'package:reservasihotel/ui/produk_form.dart';
import 'package:reservasihotel/ui/produk_detail.dart';
import 'package:reservasihotel/helpers/user_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget page = const CircularProgressIndicator();

  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    var token = await UserInfo().getToken();
    if (token != null) {
      setState(() {
        page = const ProdukPage();
      });
    } else {
      setState(() {
        page = const LoginPage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 86, 100, 100), // Button color
            onPrimary: Colors.white, // Text color
            
          ),
        ),
      ),
      title: 'Reservasi Hotel',
      debugShowCheckedModeBanner: false,
      home: page,
    );
  }
}
