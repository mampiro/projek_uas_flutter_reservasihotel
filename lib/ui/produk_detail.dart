import 'package:flutter/material.dart';
import 'package:reservasihotel/bloc/registrasi_temp_bloc.dart';
import 'package:reservasihotel/widget/success_dialog.dart';
import 'package:reservasihotel/widget/warning_dialog.dart';

import 'package:reservasihotel/model/produk.dart';

class ProdukDetail extends StatefulWidget {
  Produk? produk;

  ProdukDetail({Key? key, this.produk}) : super(key: key);

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final idTextboxController = TextEditingController(text: '1');
  final idpendaftarTextboxController = TextEditingController(text: '4');
  final tglcheckinTextboxController = TextEditingController();
  final tglcheckoutTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrasi Pemesanan"),
        backgroundColor: Color.fromARGB(255, 107, 53, 36),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Id KAMAR : ${widget.produk!.id}",
                  style: const TextStyle(fontSize: 20.0),
                ),
                Text(
                  "Kode : ${widget.produk!.kodeProduk}",
                  style: const TextStyle(fontSize: 20.0),
                ),
                Text(
                  "Fasilitas : ${widget.produk!.fasilitasProduk}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                Text(
                  "Harga : Rp. ${widget.produk!.hargaProduk.toString()}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20), //apply padding horizontal or vertical only
                  child: Text(
                    "Form Pemesanan",
                    style: const TextStyle(fontSize: 30.0),
                  ),
                ),
                _idTextField(),
                _idpendaftarTextField(),
                _tglcheckin_TextField(),
                _tglcheckout_TextField(),
                _buttonRegistrasi()
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Membuat Textbox Id Kamar
  Widget _idTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Id Kamar"),
      keyboardType: TextInputType.number,
      controller: idTextboxController,
      //controller: TextEditingController(text: '${widget.produk!.id}'),
    );
  }

  //Membuat Textbox Id Pendaftar
  Widget _idpendaftarTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "ID Pendaftar"),
      keyboardType: TextInputType.number,
      controller: idpendaftarTextboxController,
      //controller: TextEditingController(text: '1'),
    );
  }

//Membuat Textbox Tgl Check In
  Widget _tglcheckin_TextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Tanggal Checkin"),
      keyboardType: TextInputType.text,
      controller: tglcheckinTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Tanggal Checkin Tidak Boleh Kosong";
        }
        return null;
      },
    );
  }

//Membuat Textbox Tgl Check Out
  Widget _tglcheckout_TextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Tanggal Checkout"),
      keyboardType: TextInputType.text,
      controller: tglcheckoutTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Tanggal Checkout Tidak Boleh Kosong";
        }
        return null;
      },
    );
  }

  //Membuat Tombol Registrasi
  Widget _buttonRegistrasi() {
    return ElevatedButton(
        child: const Text("Booking Sekarang"),
        onPressed: () {
          var validate = _formKey.currentState!.validate();
          if (validate) {
            if (!_isLoading) _submit();
          }
        });
  }

  void _submit() {
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    RegistrasiTempBloc.registrasitemp(
      id_kamar: idTextboxController.text,
      tgl_reservasi_masuk: tglcheckinTextboxController.text,
      tgl_reservasi_keluar: tglcheckoutTextboxController.text,
      id_pendaftar: idpendaftarTextboxController.text,
    ).then((value) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => SuccessDialog(
                description: "Pemesanan berhasil, silahkan cek Keranjang",
                okClick: () {
                  Navigator.pop(context);
                },
              ));
    }, onError: (error) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => const WarningDialog(
                description: "Pemesanan gagal, silahkan coba lagi",
              ));
    });
    setState(() {
      _isLoading = false;
    });
  }
}
