import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatelessWidget {
  final String title;
  NewsPage({Key key,this.title}):super(key:key);
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body:ListView(
        children: <Widget>[
          new ListTile(
            leading: RaisedButton(child: Text('RaisedButton'),color: Colors.red,onPressed: _raisePressed,),
            title: new Text('RaisedButton'),
          ),
          new ListTile(
            leading: FlatButton(child: Text('RaisedButton'),onPressed: _raisePressed,),
            title: new Text('FlatButton'),
          ),
          new ListTile(
            leading: Mybutton(title: title),
            title: new Text(title),
          )

        ],
      )
    );
  }
  _raisePressed() async{
    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
class Mybutton extends StatelessWidget{
  final String title;
  Mybutton({Key key,this.title}):super(key:key);
  @override
  Widget build(BuildContext context){
    return new GestureDetector(
      onTap: () {
        final snackBar = new SnackBar(content: new Text("Tap"));

        Scaffold.of(context).showSnackBar(snackBar);
      },
      // Our Custom Button!
      child: new Container(
        padding: new EdgeInsets.all(12.0),
        decoration: new BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: new BorderRadius.circular(8.0),
        ),
        child: new Text(title),
      ),
    );
  }
}