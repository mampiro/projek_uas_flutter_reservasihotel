class Produk {
  int? id;
  String? kodeProduk;
  String? fasilitasProduk;
  int? hargaProduk;

  Produk({this.id, this.kodeProduk, this.fasilitasProduk, this.hargaProduk});

  factory Produk.fromJson(Map<String, dynamic> obj) {
    return Produk(
        id: int.tryParse(obj['id_kamar']),
        kodeProduk: obj['no_kamar'],
        fasilitasProduk: obj['fasilitas_kamar'],
        hargaProduk: int.tryParse(obj['harga_kamar']));
  }
}
