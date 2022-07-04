class ApiUrl {
  static const String baseUrl =
      'http://192.168.143.238/reservasihotel-api/public';

  static const String registrasi = baseUrl + '/registrasi';
  static const String registrasitemp = baseUrl + '/registrasitemp';
  static const String login = baseUrl + '/login';
  static const String listProduk = baseUrl + '/produk';
  /*  static const String createProduk = baseUrl + '/produk';

  static String updateProduk(int id) {
    return baseUrl + '/produk/' + id.toString() + '/update';
  }

  static String showProduk(int id) {
    return baseUrl + '/produk/' + id.toString();
  }

  static String deleteProduk(int id) {
    return baseUrl + '/produk/' + id.toString();
  } */
}
