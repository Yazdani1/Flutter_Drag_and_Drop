import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  List<ItemModel>items;
  List<ItemModel>items2;

  initGame(){
    items=[
      ItemModel(icon: Icons.remove_red_eye, name: "Google", value: "google"),
      ItemModel(icon: Icons.face, name: "Facebook", value: "facebook"),
      ItemModel(icon: Icons.insert_chart, name: "Instagram", value: "instagram"),
      ItemModel(icon: Icons.library_books, name: "Linkdin", value: "linkdin"),
      ItemModel(icon: Icons.transfer_within_a_station, name: "Twitter", value: "twitter"),
    ];
    items2=List<ItemModel>.from(items);
    items.shuffle();
    items2.shuffle();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: AppBar(
        title: Text("Flutter Drag and Drop"),
        backgroundColor: Colors.green,
      ),



    );
  }
}

class ItemModel{

  final String name;
  final String value;
  final IconData icon;

  ItemModel({this.name,this.value,this.icon});

}
