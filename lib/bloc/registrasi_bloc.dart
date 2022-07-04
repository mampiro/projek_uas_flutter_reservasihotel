import 'dart:convert';

import 'package:reservasihotel/helpers/api.dart';
import 'package:reservasihotel/helpers/api_url.dart';
import 'package:reservasihotel/model/registrasi.dart';

class RegistrasiBloc {
  static Future<Registrasi> registrasi(
      {String? nama,
      String? email,
      String? password,
      String? no_hp,
      String? ktp,
      String? alamat}) async {
    String apiUrl = ApiUrl.registrasi;

    var body = {
      "nama": nama,
      "email": email,
      "password": password,
      "no_hp": no_hp,
      "ktp": ktp,
      "alamat": alamat
    };

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return Registrasi.fromJson(jsonObj);
  }
}
