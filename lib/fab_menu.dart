import 'package:fab_menu/fab_menu.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<MenuData> menuDataList;

  @override
  void initState() {
    super.initState();
    menuDataList = [
      new MenuData(Icons.home, (context, menuData) {
        Scaffold.of(context).showSnackBar(new SnackBar(
            content: new Text('you have pressed ${menuData.labelText}')));
      }, labelText: '1'),
      new MenuData(Icons.ac_unit, (context, menuData) {
        Scaffold.of(context).showSnackBar(new SnackBar(
            content: new Text('you have pressed ${menuData.labelText}')));
      }, labelText: '2'),
      new MenuData(Icons.label, (context, menuData) {
        Scaffold.of(context).showSnackBar(new SnackBar(
            content: new Text('you have pressed ${menuData.labelText}')));
      }, labelText: '3'),
      new MenuData(Icons.person, (context, menuData) {
        Scaffold.of(context).showSnackBar(new SnackBar(
            content: new Text('you have pressed ${menuData.labelText}')));
      }, labelText: '4'),
      new MenuData(Icons.map, (context, menuData) {
        Scaffold.of(context).showSnackBar(new SnackBar(
            content: new Text('you have pressed ${menuData.labelText}')));
      }, labelText: '5'),

      /*new MenuData(Icons.sync_disabled, (context, menuData) {
        setState(() {
          menuData.enable = !menuData.enable;
          menuData.icon = menuData.enable ? Icons.sync : Icons.sync_disabled;
        });
      }, labelText: 'enable')*/
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
          child: new Text(
              'Remember to set floatingActionButtonLocation to fabMenuLocation')),
      floatingActionButton: new FabMenu(
        menus: menuDataList,
        maskColor: Colors.black,
      ),
      floatingActionButtonLocation: fabMenuLocation,
    );
  }
}
