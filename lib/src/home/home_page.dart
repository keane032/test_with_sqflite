import 'package:flutter/material.dart';
import 'package:myvocation/src/provider/quest_provider.dart';
import 'package:myvocation/src/questWidget/HomeQuestWidget.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    HomeQuestWidget(),
    Count(),
    Text(
      'Potho',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Counter>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Center(child: Text('Vocation Quest', style: TextStyle(color:Colors.white),)),
        actions: <Widget>[
          GestureDetector(
            onTap: () { Navigator.pushNamed(context, '/create'); },
            child: Container(
              padding: EdgeInsets.only(right:12),
              child: Icon(Icons.add, color: Colors.white,))
          ,)
        ],
      ),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [
          const Color(0xFFFF0000),
          const Color(0xFFFFFF00),
        ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
          stops: [0.0, 1.0],
        )),
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { provider.increment(); },
        child: Icon(Icons.add),),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFFFF00),
        selectedIconTheme: IconThemeData(color: Colors.black),
        selectedLabelStyle: TextStyle(color: Colors.black),
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.beach_access),
            title: Text("Quest", style: TextStyle(color: Colors.black),)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done_all),
            title: Text("Success", style: TextStyle(color: Colors.black),)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_album),
            title: Text("Photos", style: TextStyle(color: Colors.black),)
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Counter>(context);
    return Text(
        '${provider.count}',
        style: Theme.of(context).textTheme.headline4);
  }
}
