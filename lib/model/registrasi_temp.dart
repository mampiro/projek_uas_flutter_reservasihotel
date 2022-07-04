class RegistrasiTemp {
  int? code;
  bool? status;
  String? data;

  RegistrasiTemp({this.code, this.status, this.data});

  factory RegistrasiTemp.fromJson(Map<String, dynamic> obj) {
    return RegistrasiTemp(
        code: obj['code'], status: obj['status'], data: obj['data']);
  }
}
