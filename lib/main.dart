import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'text_widget.dart';

import 'package:cached_network_image/cached_network_image.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ours',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  GlobalKey<TextWidgetState> textKey = GlobalKey();

  paddingWidget(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
    );
  }

  headWidget() {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      alignment: Alignment.center,
      child: ClipOval(
          child: Container(
            padding: EdgeInsets.all(8.0),
            color: Color(0xAAFEDEE1),
            child: ClipOval(
              child: SizedBox(
                width: 150,
                height: 150,
                child: Image.asset("image/0.jpg"),
              ),
            ),
          )
      ),
    );
  }

  dateWidget() {
    return Opacity(
      opacity: 0.9,
      child: Container(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        margin: EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 0.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("一起走过的时光", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'oursFont',), textAlign: TextAlign.center,),
                Icon(Icons.timer, size: 24, color: Color(0xFFFB8BA4),),
              ],
            ),
            TextWidget(textKey)
          ],
        ),
      ),
    );
  }

  endWidget() {
    return Opacity(
      opacity: 0.9,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        margin: EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 18.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Text("可爱女人 我爱你\n2020 5 2 0", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'oursFont', height: 1.6), textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }

  mottoWidget() {
    return Opacity(
      opacity: 0.8,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(18.0),
        padding: EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(5, 5),
              color: Colors.white,
              blurRadius: 6.0,
              spreadRadius: -6.0,
            ),
          ],
        ),
        child: Text(
          """我的梦里出现过一只猫
是连续五天的梦
我和那只猫从不熟到熟
我把它放在书包里
带它上学
带它去公园
我们一起玩耍
像个孩子一样
最后一天它从书包里跳出来
钻进人群里化身成了男子
他的身上有微光
我看不清他的样子
从此我再也没梦见过那只猫
直到现在还是很想念它
……""",
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 16, fontFamily: 'oursFont', height: 1.6,),
        ),
      ),
    );
  }

  webImageWidget(String url) {
    return CachedNetworkImage(
        imageUrl: url,
        progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) {
          print("fail");
          return Image.asset("image/error.jpg");
        }
    );
  }

  imageWidget(String url, AlignmentGeometry alignmentGeometry) {
    return Opacity(
      opacity: 0.96,
      child: Container(
        margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        padding: EdgeInsets.all(5.0),
        alignment: alignmentGeometry,
        decoration: BoxDecoration(
          color: Color(0xAAFEDEE1),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(5, 5),
              color: Colors.white,
              blurRadius: 6.0,
              spreadRadius: -6.0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: AspectRatio(
            aspectRatio: 16/9,
            child: webImageWidget(url),
          ),
        ),
      ),
    );
  }

  imageListWidget() {
    return Container(
      margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 580.0),
      child: Column(
        children: [
          imageWidget("https://icedotaku-img.oss-cn-shenzhen.aliyuncs.com/ours/1.jpg", Alignment.centerLeft),
          paddingWidget(8.0),
          imageWidget("https://icedotaku-img.oss-cn-shenzhen.aliyuncs.com/ours/2.jpg", Alignment.centerRight),
          paddingWidget(8.0),
          imageWidget("https://icedotaku-img.oss-cn-shenzhen.aliyuncs.com/ours/3.jpg", Alignment.centerLeft),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    // textKey.currentState.timeChange();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("image/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              paddingWidget(8.0),
              headWidget(),
              paddingWidget(8.0),
              dateWidget(),
              paddingWidget(8.0),
              mottoWidget(),
              paddingWidget(8.0),
              imageListWidget(),
              endWidget(),
            ],
          ),
        )
      ),
    );
  }
}