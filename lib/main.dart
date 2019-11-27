import 'package:flutter/material.dart';
import 'package:flutter_fab_dialer/flutter_fab_dialer.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static String getNewCatUrl() {
    return 'http://thecatapi.com/api/images/get?format=src&type=jpg&size=small'
        '#${new DateTime.now().millisecondsSinceEpoch}';
  }

  int _counter = 1;
  String page = '1';

  void _incrementCounter() {
    setState(() {
      _counter++;
      page = _counter.toString();
      print(page);
    });
  }

  void _decrementCounter() {
    setState(() {
//      _counter--;
      _counter <= 1 ? _counter = 1 : _counter--;
      page = _counter.toString();
      print(page);
    });
  }

  void _logCounter() {
    setState(() {
      print(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    //The list of FabMiniMenuItems that we are going to use
    ImageProvider img = new NetworkImage(getNewCatUrl());

    var _fabMiniMenuItemList = [
      new FabMiniMenuItem.withTextWithImage(img, 4.0, "Button menu",
          _logCounter, "Click me", Colors.blue, Colors.white, true),
      new FabMiniMenuItem.withText(
          new Icon(Icons.arrow_drop_up),
          Colors.blue,
          4.0,
          "Button menu",
          _incrementCounter,
          "Click me",
          Colors.blue,
          Colors.white,
          false),
      new FabMiniMenuItem.withText(
          new Icon(Icons.arrow_drop_down),
          Colors.blue,
          4.0,
          "Button menu",
          _decrementCounter,
          "Click me",
          Colors.blue,
          Colors.white,
          false),
      new FabMiniMenuItem.noText(new Icon(Icons.add), Colors.blue, 4.0,
          "Button menu", _logCounter, false),
      new FabMiniMenuItem.noTextWithImage(
          img, 4.0, "Button menu", _incrementCounter, false)
    ];

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      //Using a Stack will assure that the Dialer will appear at the end of your layout
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Column(
              children: <Widget>[
                new Text('You have pushed the button this many times:'),
                new Text('${_counter > 0 ? _counter : 1}',
                    style: Theme.of(context).textTheme.display1),
              ],
            ),
          ),
          new FabDialer(_fabMiniMenuItemList, Colors.blue, new Icon(Icons.add)),
        ],
      ),
    );
  }
}
