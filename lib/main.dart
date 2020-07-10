import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter test',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;
  static const List<Widget> _widgetOption = <Widget>[
    Icon(Icons.star, size: 200.0,),
    Icon(Icons.mood_bad, size: 200.0,),
    Icon(Icons.wb_sunny, size: 200.0,),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),

      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('test'),
              accountEmail: Text('test@gmail.com'),
              currentAccountPicture: Image.asset('assets/giphy.gif'),
              decoration: BoxDecoration(color: Colors.deepOrange),
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Item1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.headset),
              title: Text('Item2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Item3'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: Container(
        transform: Matrix4.rotationZ(0.1),
        color: Colors.tealAccent,
        padding: EdgeInsets.all(50.0),
        child: Container(
          transform: Matrix4.rotationZ(-0.2),
          constraints: BoxConstraints.expand(),
          color: Colors.deepOrange,
          padding: EdgeInsets.all(50),
          child: _getWidget()
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text('Star')),
          BottomNavigationBarItem(
              icon: Icon(Icons.mood_bad), title: Text('Sad')),
          BottomNavigationBarItem(
              icon: Icon(Icons.wb_sunny), title: Text('Sunny')),
         ],
        onTap: _onItemTap,
        currentIndex: _selectedIndex,),

      floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );
  }

  void _incrementCounter() {
    setState(() => _counter ++);
  }

  void _onItemTap(int index) {
    setState(() => _selectedIndex = index);
  }

  Widget _getWidget() {
    switch(_selectedIndex) {
      case 0 :
        return Image.asset('assets/giphy.gif');
      default :
        return _widgetOption.elementAt(_selectedIndex);
    }
  }
}
