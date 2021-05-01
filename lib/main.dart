import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'text_widget.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  showToast(String str) {
    Fluttertoast.showToast(
      msg: str + "～",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0xFFD9A58F),
      textColor: Colors.white,
      fontSize: 16.0
    );
  }

  paddingWidget(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
    );
  }

  headWidget() {
    String headImageUrl = "https://icedotaku-img.oss-cn-shenzhen.aliyuncs.com/ours/head.jpg";

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
                child: CachedNetworkImage(
                  imageUrl: headImageUrl,
                  progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                  errorWidget: (context, url, error) {
                    showToast("头像加载好像出了点问题");
                    return Image.asset("image/head_error.jpg", fit: BoxFit.fill,);
                  }
                ),
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
"""
我的梦里出现过一只猫
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
      fit: BoxFit.fitWidth,
      progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) {
        showToast("图片加载好像出了点问题");
        return Image.asset("image/error.jpg", fit: BoxFit.fitWidth);
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
  
  List<int> genRandomNumbers(int totalCount, int needCount) {
    List<int> list = [];
    int count = 0;
    while (count < needCount) {
      int index = Random().nextInt(totalCount) + 1;
      if (!list.contains(index)) {
        list.add(index);
        count++;
      }
    }
    return list;
  }

  String genImageUrl(int index) {
    return "https://icedotaku-img.oss-cn-shenzhen.aliyuncs.com/ours/images/" + index.toString() + ".jpg";
  }
  
  imageListWidget() {
    int needCount = 3;
    int totalCount = 10;
    List<int> list = genRandomNumbers(totalCount, needCount);

    return Container(
      margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 580.0),
      child: Column(
        children: [
          imageWidget(genImageUrl(list[0]), Alignment.centerLeft),
          paddingWidget(8.0),
          imageWidget(genImageUrl(list[1]), Alignment.centerRight),
          paddingWidget(8.0),
          imageWidget(genImageUrl(list[2]), Alignment.centerLeft),
        ],
      ),
    );
  }

  backgroundImageUrl() {
    int bgTotalCount = 10;
    int bgSerial = Random().nextInt(bgTotalCount) + 1;
    String url = "https://icedotaku-img.oss-cn-shenzhen.aliyuncs.com/ours/bg/" + bgSerial.toString() + ".jpg";

    return url;
  }

  scrollContentView() {
    return SingleChildScrollView(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CachedNetworkImage(
        imageUrl: backgroundImageUrl(),
        imageBuilder: (context, imageProvider) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
            child: scrollContentView(),
          );
        },
        errorWidget: (context, url, error) {
          showToast("背景图片加载好像出了点问题");
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("image/bg.jpg"),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: scrollContentView(),
          );
        }
      ),
    );
  }
}