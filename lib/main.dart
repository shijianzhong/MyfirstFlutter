import 'package:flutter/material.dart';
import 'pages/carsInfo.dart';
import 'pages/spinkitmain.dart';
import 'pages/newsInfo.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return new MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
      ),
      home: new MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
 MyHomePage({Key key}) : super(key: key);

 @override
 _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 int _selectedIndex = 0;
 final _widgetOptions = [
   NewsInfo(),
   CarsInfo(),
   SpinkMain(),
 ];

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('大乱炖'),
     ),
     body: Center(
       child: _widgetOptions.elementAt(_selectedIndex),
     ),
     bottomNavigationBar: BottomNavigationBar(
       items: <BottomNavigationBarItem>[
         BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('News')),
         BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Cars')),
         BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('还没想好')),
       ],
       currentIndex: _selectedIndex,
       fixedColor: Colors.deepPurple,
       onTap: _onItemTapped,
     ),
   );
 }

 void _onItemTapped(int index) {
   setState(() {
     _selectedIndex = index;
   });
 }
}