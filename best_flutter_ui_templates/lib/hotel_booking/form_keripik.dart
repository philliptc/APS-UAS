import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'course_app_theme.dart';

class FormKeripik extends StatefulWidget {
  @override
  _CourseInfoScreenState createState() => _CourseInfoScreenState();
}

class _CourseInfoScreenState extends State<FormKeripik> {
  TextEditingController _namaPembeli;
  TextEditingController _alamatPembeli;

  _onAlertButtonsPressed(context) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "ORDER BERHASIL",
      desc: "Silahkan check keranjang belanja anda",
      buttons: [
        DialogButton(
          child: Text(
            "OYI",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color.fromRGBO(0, 179, 134, 1.0),
        )
      ],
    ).show();
  }

  @override
  void initState() {
    super.initState();
    _namaPembeli = new TextEditingController();
    _alamatPembeli = new TextEditingController();
  }

  _postToApi() async {
    try{
      var url = 'https://personate-delegates.000webhostapp.com/api/add_order'; 
      var postDataNow = await http.post(
        url,
        body: {
          'item_name' : 'Keripik Tempe',
          'price' : 'Rp. 25.000',
          'name' : _namaPembeli.text,
          'address' : _alamatPembeli.text
        }
      );
      print(postDataNow.statusCode);
      _onAlertButtonsPressed(context);
    } catch(e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Keripik Tempe'),
        backgroundColor: DesignCourseAppTheme.dark_grey,
      ),
      body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Form(
          child: new ListView(
            children: <Widget>[
              new TextFormField(
                controller: _namaPembeli,
                keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                decoration: new InputDecoration(
                  labelText: 'Nama'
                )
              ),
              new TextFormField(
                controller: _alamatPembeli,
                keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                decoration: new InputDecoration(
                  labelText: 'Alamat'
                )
              ),
              new Container(
                width: screenSize.width,
                height: 50,
                child: new RaisedButton(
                  child: new Text(
                    'Beli sekarang',
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () => _postToApi(),
                  color: DesignCourseAppTheme.dark_grey,
                ),
                margin: new EdgeInsets.only(
                  top: 30.0
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
