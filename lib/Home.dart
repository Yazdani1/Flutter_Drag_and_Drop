import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: AppBar(
        title: Text("Flutter Drag and Drop"),
        backgroundColor: Colors.green,
      ),

      body: Container(
        color: Colors.deepOrange,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Container(
          height: 200.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[

              Container(
                height: 300.0,
                width: 300.0,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.amber,
                  borderRadius: BorderRadius.circular(20.0)
                ),

                child: Stack(
                  children: <Widget>[

                    Positioned(
                      top: 50.0,
                      left: 50.0,
                      bottom: 50.0,
                      child: Text("Working here",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),
                      ),
                    )

                  ],
                ),
              ),
              SizedBox(width: 6.0,),

              Container(
                height: 200.0,
                width: 250.0,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(15.0)
                ),

                child: Stack(
                  children: <Widget>[

                    Positioned(
                      top: 50.0,
                      left: 50.0,
                      bottom: 50.0,
                      child: Text("Second Options",
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white
                        ),
                      ),
                    )

                  ],
                ),
              ),
              SizedBox(width: 5.0,),

              Container(
                height: 200.0,
                width: 250.0,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(15.0)
                ),

                child: Stack(
                  children: <Widget>[

                    Positioned(
                      top: 50.0,
                      left: 50.0,
                      bottom: 50.0,
                      child: Text("Third Options",
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white
                        ),
                      ),
                    )

                  ],
                ),
              ),
              SizedBox(width: 5.0,),



            ],
          ),
        ),
      ),


    );
  }
}


