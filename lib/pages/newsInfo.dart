import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsInfo extends StatefulWidget {
  _NewsInfo createState() => _NewsInfo();
}

class _NewsInfo extends State<NewsInfo> {
  var dataList = new List();
  initState() {
    super.initState();
    _getHttp();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        body: new ListView.builder(
      itemCount: dataList.length,
      padding: EdgeInsets.all(20.0),
      itemBuilder: (BuildContext context, int index) {
        return _buildItem(dataList[index]);
      },
    ));
  }

  Widget _buildItem(item) {
    // return new Text(item['title']);
    return new Container(
      margin: EdgeInsets.only(top: 20.0),
      child: new Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              new Expanded(
                child: new Text(item['title']),
              )
            ],
          ),
          Row(children: <Widget>[
            RaisedButton(child: Text('详细信息'),color: Colors.blue,onPressed: ()=>_raisePressed(item),),
          ],),
          Row(children: <Widget>[ 
            new Expanded(
              child: new Image.network(
                item['thumbnail_pic_s'],
                fit: BoxFit.fitWidth,
              ),
            )
          ]),
        ],
      ),
    );
  }
  _raisePressed(item) async{
    if (await canLaunch(item['url'])) {
      await launch(item['url']);
    } else {
      throw 'Could not launch ';
    }
  }
  void _getHttp() async {
    try {
      Response response;
      response = await Dio().get(
          "http://v.juhe.cn/toutiao/index?type=&key=a3cf7d667fd8d73b334cec7f25fd0abe");
      setState(() => dataList = response.data['result']['data']);
    } catch (e) {
      return print(e);
    }
  }
}
