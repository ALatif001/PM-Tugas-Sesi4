import 'package:flutter/material.dart';
import 'main.dart';

void main() => runApp(SecondPage());
class SecondPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'About',
      home: Scaffold(
        appBar: AppBar(
          title: Text('About'),
        ),
        body: bio(),
      ),
    );
  }
}

class bio extends StatefulWidget {
  @override
  _bioState createState() => _bioState();
}

class _bioState extends State<bio> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 15.0, left: 15.0),
        child: Column(children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset('assets/latif.jpg', height: 350, width: 250,),
          ),
          Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 15.0),
              child: Text(
                'Nama : Abdul Latif', style: TextStyle(fontSize: 20.0),)
          ),
          Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 15.0),
              child: Text(
                'NIM : 20190801036', style: TextStyle(fontSize: 20.0),)
          ), Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 15.0),
              child: Text(
                'Alamat : Cisoka Kab. Tangerang', style: TextStyle(fontSize: 20.0),)
          ),Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 15.0),
              child: Text(
                'Kampus : Universitas Esa Unggul', style: TextStyle(fontSize: 20.0),)
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            child: RaisedButton(
              child: Text("Kembali"),
                onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp())
                );
                }),
          )
        ])
    );
  }
}