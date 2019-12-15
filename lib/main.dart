// Flutter code sample for RaisedButton

// This sample shows how to render a disabled RaisedButton, an enabled RaisedButton
// and lastly a RaisedButton with gradient background.
//
// ![Three raised buttons, one enabled, another disabled, and the last one
// styled with a blue gradient background](https://flutter.github.io/assets-for-api-docs/assets/material/raised_button.png)

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter/services.dart';
import 'dart:math';

void main() => runApp(Homepage());


class Homepage extends StatelessWidget {

  //static const String _title = 'First Page';

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      home: Scaffold(
        //Here you can set what ever background color you need.
        backgroundColor: Color(0xFFF3E5DE),

//        appBar: new AppBar(
//          //iconTheme: IconThemeData(color: Colors.white),
//          //title: const Text('First Page', style: TextStyle(color: Colors.white)),
//          backgroundColor: Color(0xFFF3E5DE),
//        ),
        body: MyStatelessWidget2(),

      ),

    );

  }
}

/// This Widget is the main application widget.
class Frontpage extends StatelessWidget {

  //static const String _title = 'First Page';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          //Here you can set what ever background color you need.
          backgroundColor: Color(0xFFF3E5DE),
        appBar: new AppBar(
          //iconTheme: IconThemeData(color: Colors.white),
          //title: const Text('First Page', style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xFFDF7F67),
        ),
        body: MyStatelessWidget(),
      ),
    );
  }
}

class Secondpage extends StatelessWidget {

  //static const String _title = 'First Page';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //Here you can set what ever background color you need.
        backgroundColor: Color(0xFFF3E5DE),
        appBar: new AppBar(
          //iconTheme: IconThemeData(color: Colors.white),
          //title: const Text('First Page', style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xFFDF7F67),
        ),
       body: MyStatelessWidget1(),

      ),

    );

  }
}

class Emotionpage extends StatelessWidget {
  //static const String _title = 'First Page';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFF3E5DE),
        //Here you can set what ever background color you need.
        body: MyStatelessWidget3(),

      ),

    );

  }
}

//Align(
//alignment: Alignment.center, // Align however you like (i.e .centerRight, centerLeft)
//child: Text("Loading..."),

//),
/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          //const SizedBox(height: 30, width: 100),
      SizedBox(
            width: 200,
            height: 90,
            child :RaisedButton(
              color: Color(0xFF958672),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Secondpage()),
                );
              },
              child: const Text('Speech', style: TextStyle(fontSize: 20, color: Color(0xFFF3E5DE)),),
            ),
          ),
          const SizedBox(height: 50, width: 100),
          SizedBox(
            width: 200,
            height: 90,
            child :RaisedButton(
              color: Color(0xFF958672),
              onPressed: () {},

              child: const Text('Facial', style: TextStyle(fontSize: 20, color: Color(0xFFF3E5DE)),),
            ),
          ),
        ],
      ),
    );
  }


}
class MyStatelessWidget1 extends StatelessWidget {
  MyStatelessWidget1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          //const SizedBox(height: 30, width: 100),
          SizedBox(),
          Image.asset('assets/images/loading.png'),
          const SizedBox(height: 30, width: 100),
          SizedBox(),
          SizedBox(
            width: 150,
            height: 70,
            child :FlatButton(
              color: Color(0xFFF3E5DE),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Emotionpage()),
                );
              },
            ),
          ),

        ],
      ),
    );

  }
}

  class MyStatelessWidget2 extends StatelessWidget {
    MyStatelessWidget2({Key key}) : super(key: key);


    @override
    Widget build(BuildContext context) {
      return Center(

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            //const SizedBox(height: 30, width: 100),
            SizedBox(),
            Image.asset('assets/images/Logo.png'),
            //const SizedBox(height: 30, width: 100),
            SizedBox(
              width: 150,
              height: 70,
              child :RaisedButton(
                color: Color(0xFFF3E5DE),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Frontpage()),
                  );
                },
                child: const Text('f e e l', style: TextStyle(fontSize: 30, color: Color(0xFF958672),),),
              ),
            ),
          ],
        ),
      );
    }
}

class MyStatelessWidget3 extends StatelessWidget {
  MyStatelessWidget3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          //const SizedBox(height: 30, width: 100),
          SizedBox(),
            Image.asset('assets/images/Happy.png'),
          const SizedBox(height: 30, width: 100),
          SizedBox(),
          const Text('Happy', style: TextStyle(fontSize: 30, color: Color(0xFF958672),),),

        ],
      ),
    );

  }
}



