import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';


 var dataList = new List();
class CarsInfo extends StatefulWidget{
  __CarsInfoState createState()=>new __CarsInfoState();
}
class __CarsInfoState extends State<CarsInfo>{
  initState(){
    super.initState();  
    getHttp();
  }
  String getItemInfo(item){
    if(item['jsonData']['msg']){
      return item['jsonData']['msg'];
    }else{
      return item['jsonData']['author'];
    }
  }
  Widget buildGrid(){
    List<Widget> tiles =[];
    Widget content;
    for(var item in dataList){
      tiles.add(new Row(children: <Widget>[
        new Text(getItemInfo(item))
      ]));
    }
    content = new Column(
      children: tiles,
    );
    return content;
  }
  @override
  Widget build(BuildContext context){
    
    if(dataList.length==0){
      return Scaffold(
        body: Center(
          child: SpinKitDualRing(color: Colors.blueGrey),
        ),
      );
    }else{
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.all(30),
        itemCount: dataList.length,
        itemExtent: 100.0,
        itemBuilder: (BuildContext context,int index){
          return new ListTile(
            title: new Text(dataList[index]['jsonData']['msg'].toString()),
            leading: new Icon(Icons.phone),
            onTap: ()=>_getCall(dataList[index]['jsonData']['tel']),
          );
          
        },
      )
    );}
  }
  _getCall(String tel) async{
    String url = 'tel:$tel';
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  void getHttp() async{
   try {
        Response response;
        response = await Dio().get("https://api.it120.cc/360mall/json/list");
        setState(()=>dataList = response.data['data']
        );
        print(dataList.length);
      }catch(e){
        return print(e);
      }
}
}

void getNews() async{
  try {
    Response response = await Dio().get("http://v.juhe.cn/toutiao/index?type=&key=a3cf7d667fd8d73b334cec7f25fd0abe");
    print(response);
  } catch (e) {
  }
}