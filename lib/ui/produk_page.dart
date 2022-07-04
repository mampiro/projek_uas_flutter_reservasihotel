import 'package:flutter/material.dart';
import 'package:reservasihotel/bloc/logout_bloc.dart';
import 'package:reservasihotel/bloc/produk_bloc.dart';
import 'package:reservasihotel/model/produk.dart';
import 'package:reservasihotel/ui/login_page.dart';
import 'package:reservasihotel/ui/produk_detail.dart';
//import 'package:reservasihotel/ui/produk_form.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({Key? key}) : super(key: key);

  @override
  _ProdukPageState createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Kamar'),
        backgroundColor: Color.fromARGB(255, 107, 53, 36),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),

            /*
              child: GestureDetector(
                child: const Icon(Icons.add, size: 26.0),
                onTap: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProdukForm()));
                },
              )
              */
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Logout'),
              trailing: const Icon(Icons.logout),
              onTap: () async {
                await LogoutBloc.logout().then((value) => {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()))
                    });
              },
            )
          ],
        ),
      ),
      body: FutureBuilder<List>(
        future: ProdukBloc.getProduks(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListProduk(
                  list: snapshot.data,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ListProduk extends StatelessWidget {
  final List? list;

  const ListProduk({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list!.length,
        itemBuilder: (context, i) {
          return ItemProduk(
            produk: list![i],
          );
        });
  }
}

class ItemProduk extends StatelessWidget {
  final Produk produk;
  const ItemProduk({Key? key, required this.produk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProdukDetail(
                      produk: produk,
                    )));
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: Card(
          child: Container(
            margin: EdgeInsets.all(17),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Gambar"),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Nomor Kamar : "),
                              Text(produk.kodeProduk!),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Harga : Rp."),
                              Text(produk.hargaProduk.toString()),
                              //Text(produk.fasilitasProduk!),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
              //title: Text(produk.kodeProduk!),

              //subtitle: Text(produk.hargaProduk.toString()),

              //subtitle: Text(produk.fasilitasProduk!),
            ),
          ),
        ),
      ),
    );
  }
}
