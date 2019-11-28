import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  List<ItemModel>items;
  List<ItemModel>items2;
  int score;
  bool gameOver;

  @override
  void initState() {
    super.initState();
    initGame();
  }

  initGame() {
    score=0;
    gameOver=false;
    items = [
      ItemModel(icon: Icons.remove_red_eye, name: "Google", value: "google"),
      ItemModel(icon: Icons.face, name: "Facebook", value: "facebook"),
      ItemModel(
          icon: Icons.insert_chart, name: "Instagram", value: "instagram"),
      ItemModel(icon: Icons.library_books, name: "Linkdin", value: "linkdin"),
      ItemModel(icon: Icons.transfer_within_a_station,
          name: "Twitter",
          value: "twitter"),
    ];
    items2 = List < ItemModel
    >
        .
    from
    (
    items
    );
    items
        .
    shuffle
    (
    );
    items2
    .
    shuffle
    (
    );
  }


  @override
  Widget build(BuildContext context) {

    if(items.length==0){
      gameOver=true;
    }

    return new Scaffold(

      appBar: AppBar(
        title: Text("Flutter Drag and Drop"),
        backgroundColor: Colors.green,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            
            Text.rich(TextSpan(
              children: [
                TextSpan(text: "Total Score:"),
                TextSpan(text: "$score",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold
                )
                )
              ]
            )),

            if(!gameOver)
            Row(
              children: <Widget>[

                Column(
                    children: items.map((item) {
                      return Container(
                          margin: EdgeInsets.all(10.0),
                          child: Draggable<ItemModel>(
                            data: item,
                            childWhenDragging: Icon(item.icon,color: Colors.grey,size: 50.0,),
                            feedback: Icon(item.icon,size: 70.0,color: Colors.deepOrange,),
                              child:Icon(item.icon, size: 50.0, color: Colors.amber,)
                          )
                      );
                    }).toList()
                ),
                Spacer(),


                Column(
                    children: items2.map((item) {
                      return DragTarget<ItemModel>(
                        onAccept: (receivedItem){
                          if(item.value==receivedItem.value){
                            setState(() {
                              items.remove(receivedItem);
                              items2.remove(item);
                              score+=10;
                              item.acceptItem=false;
                            });
                          }else{
                            setState(() {
                              score-=5;
                              item.acceptItem=false;
                            });
                          }
                        },
                          onLeave: (receivedItem){
                          setState(() {
                            item.acceptItem=false;
                          });
                          },
                        onWillAccept: (receivedItem){
                          setState(() {
                            item.acceptItem=true;
                          });
                          return true;
                        },
                        builder:(context,acceptedItems, rejectedItems) => Container(
                            margin: EdgeInsets.all(10.0),
                            alignment: Alignment.center,
                            width: 150.0,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: item.acceptItem ? Colors.green : Colors.deepOrange,
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Text(item.name,
                              style: TextStyle(fontSize: 20.0, color: Colors.white),)
                        ),
                      );
                    }).toList()
                ),


              ],
            ),

            if(gameOver)
              Text("Game over"),
            if(gameOver)
            RaisedButton(
              onPressed: (){
                initGame();
                setState(() {

                });
              },
              child: Text("New Game"),
              color: Colors.deepOrange,
            )

          ],
        ),
      ),

    );
  }
}

class ItemModel {

  final String name;
  final String value;
  final IconData icon;
   bool acceptItem;

  ItemModel({this.name, this.value, this.icon, this.acceptItem=false});

}
