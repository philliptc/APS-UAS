import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'course_app_theme.dart';

class HistoryPembelian extends StatefulWidget {
  @override
  _HistoryList createState() => new _HistoryList();
}

class _InvoiceAll{
  final String item_name;
  final String price;
  final String name;
  final String address;
  final String payment;

  _InvoiceAll(this.item_name, this.price, this.name, this.address, this.payment);
}

class _HistoryList extends State<HistoryPembelian> {

  Future<List<_InvoiceAll>> _getInvoiceALl() async {
    var data = await http.get("https://personate-delegates.000webhostapp.com/api/view_order");

    var dataToJSON = json.decode(data.body);

    List<_InvoiceAll> invoiceAll2 = [];

    for (var u in dataToJSON){
      _InvoiceAll invoice = _InvoiceAll(
        u["item_name"], 
        u["price"], 
        u["name"], 
        u["address"], 
        u["payment"]
      );
      invoiceAll2.add(invoice);
    } 
    print(invoiceAll2.length);
    return invoiceAll2;
  } 

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          title: const Text('History Pembelian'),
          backgroundColor: DesignCourseAppTheme.dark_grey,
      ),
      body: Container(
        child: FutureBuilder(
          future: _getInvoiceALl(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data == null){
              return Container(
                child: Center(
                  child: Text("Loading..."),
                )
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    // title: Text(
                    //   "Pembeli"+snapshot. data[index].name
                    // ),
                    title: Text(
                      "\n" +
                      "Nama \t\t\t\t\t\t\t\t\t\t\t\t\t:\t " + snapshot. data[index].name + "\n" +
                      "Produk \t\t\t\t\t\t\t\t\t\t\t:\t " + snapshot. data[index].item_name + "\n" + 
                      "Harga \t\t\t\t\t\t\t\t\t\t\t\t\t:\t " + snapshot. data[index].price + "\n" + 
                      "Alamat \t\t\t\t\t\t\t\t\t\t\t:\t " + snapshot. data[index].address + "\n" + 
                      "Pembayaran \t:\t " + snapshot. data[index].payment
                    ),
                  );
                },
              );
            }
          },
        ),
      )
    );
  }
}