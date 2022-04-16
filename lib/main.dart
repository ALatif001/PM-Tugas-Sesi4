import 'package:flutter/material.dart';
import 'about.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Lingkaran',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Konversi Lingkaran'),
        ),
        body: konversi_lingkaran(),
      ),
    );
  }
}

class konversi_lingkaran extends StatefulWidget {
  @override
  _konversi_lingkaranState createState() => _konversi_lingkaranState();
}

class _konversi_lingkaranState extends State<konversi_lingkaran> {

  List<String> shapes =  ['Luas', 'Keliling'];
  String currentShape = '';
  String result='0';
  double r = 0;

  final TextEditingController rController =TextEditingController();

  @override
  void initState() {

    super.initState();
    result = '0';
    currentShape = 'Luas';
    rController.addListener(updateWidth);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        margin:EdgeInsets.only(top:15.0),
        child: Column(children: <Widget>[
          //dropdown
          DropdownButton<String>(
              value:currentShape,
              items:shapes.map((String value) {
                return new DropdownMenuItem<String>(
                  value:value,
                  child: Text(value,
                    style: TextStyle(fontSize: 24.0),),
                );
              }).toList(),
              onChanged:(shape){
                setState(() {
                  currentShape = shape??'Luas';
                });
              }),
          //width

          AreaTextField(rController, 'Jari Jari'),
          Container(
          child: Text('Rumus', style: TextStyle(fontSize: 20.0),)
          ),
          Container(
            child: Text('Luas = phi * r * r', style: TextStyle(fontSize: 20.0),)
          ),
          Container(
              child: Text('Keliling = 2 * phi * r', style: TextStyle(fontSize: 20.0),)
          ),
          //height
          Container(
            margin: EdgeInsets.all(15.0),
            child:ElevatedButton(
              child:Text('Hitung',
                style: TextStyle(fontSize: 18.0),),
              onPressed: menghitung,
            )
            ,
          ),
          Text(result,
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.redAccent,
            ),),
        Container(
          margin: EdgeInsets.all(15.0),
          child: RaisedButton(
          child: Text("About"),
            onPressed: () {
              Navigator.push(
                context,
                  MaterialPageRoute(builder: (context) => SecondPage())
              );
          },
          )
        )
        ],)
    );
  }


  void menghitung() {
    double hasil;

    if (currentShape == 'Luas') {
      hasil = r * r * 3.14;
    }
    else if (currentShape == 'Keliling') {
      hasil = r * 2 * 3.14;
    }
    else {
      hasil = 0;
    }
    setState(() {
      result = 'Hasilnya : ' + hasil.toString();
    });
  }

  void updateWidth() {
    setState(() {
      if (rController.text != '') {
        r = double.parse(rController.text);
      }
      else {
        r = 0;
      }
    });
  }
}

class AreaTextField extends StatelessWidget {
  AreaTextField(this.controller, this.hint);

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15.0),
        child:TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 24.0
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.border_all),
            filled: true,
            fillColor: Colors.grey[300],
            hintText: hint,
          ),
        )
    );
  }
}
