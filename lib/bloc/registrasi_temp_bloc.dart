import 'dart:convert';

import 'package:reservasihotel/helpers/api.dart';
import 'package:reservasihotel/helpers/api_url.dart';
import 'package:reservasihotel/model/registrasi.dart';

class RegistrasiTempBloc {
  static Future<Registrasi> registrasitemp(
      {String? id_kamar,
      String? tgl_reservasi_masuk,
      String? tgl_reservasi_keluar,
      String? id_pendaftar}) async {
    String apiUrl = ApiUrl.registrasitemp;

    var body = {
      "id_kamar": id_kamar,
      "tgl_reservasi_masuk": tgl_reservasi_masuk,
      "tgl_reservasi_keluar": tgl_reservasi_keluar,
      "id_pendaftar": id_pendaftar
    };

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return Registrasi.fromJson(jsonObj);
  }
}
