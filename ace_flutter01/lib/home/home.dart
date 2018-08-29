import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  String result;

  HomePage(this.result);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  var _pageController = new PageController(initialPage: 0);
  var _bottomText = ['签到', '我'];
  var _bottomIcons = [
    [
      new Icon(Icons.category, color: Colors.grey),
      new Icon(Icons.category, color: Colors.blue),
    ],
    [
      new Icon(Icons.account_circle, color: Colors.grey),
      new Icon(Icons.account_circle, color: Colors.blue),
    ]
  ];

  Icon changeIconStyle(int curIndex) {
    if (curIndex == _currentIndex) {
      return _bottomIcons[curIndex][1];
    }
    return _bottomIcons[curIndex][0];
  }

  Text changeTextStyle(int curIndex) {
    if (curIndex == _currentIndex) {
      return new Text(_bottomText[curIndex],
          style: new TextStyle(color: Colors.blue));
    } else {
      return new Text(_bottomText[curIndex],
          style: new TextStyle(color: Colors.grey));
    }
  }

  void _pageChange(int index) {
    setState(() {
      if (_currentIndex != index) {
        _currentIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("HomePage"),
      ),
      body: new PageView.builder(
        onPageChanged: _pageChange,
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          var str =
              (index == 0) ? "这里是【HomePage】->【签到】页面" : "这里是【HomePage】->【我】页面";
          return new Center(
            child: new Container(
              width: 340.0,
              child: new Card(
                color: Colors.blue,
                elevation: 16.0,
                child: new FlatButton(
                  child:
                      new Text(str, style: new TextStyle(color: Colors.white)),
                ),
              ),
            ),
          );
        },
        itemCount: _bottomText.length,
      ),
//      body: new Center(
//        child: new Container(
//          width: 340.0,
//          child: new Card(
//            color: Colors.blue,
//            elevation: 16.0,
//            child: new FlatButton(
//              onPressed: () {
//                // pop 一个参数，销毁当前页面
////                Navigator.pop(context);
//                // pop 两个参数，返回一个数组
////                Navigator.pop(context, ['a,b,c']);
//                // pop 两个参数，返回一个字符串
//                Navigator.pop(context, 'HomePage');
//                // popAndPushNamed 销毁当前页面并跳转新的页面
////                Navigator.popAndPushNamed(context, 'forgetPwdRoute');
//              },
//              child: new Text(
//                "这里是【HomePage】页面，内容为：" + this.result + "，点击返回!",
//                style: new TextStyle(
//                  color: Colors.white,
//                ),
//              ),
//            ),
//          ),
//            ),
//      ),
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          new BottomNavigationBarItem(
              icon: changeIconStyle(0), title: changeTextStyle(0)),
          new BottomNavigationBarItem(
              icon: changeIconStyle(1), title: changeTextStyle(1)),
        ],
        //设置当前的索引
        currentIndex: _currentIndex,
        //tabBottom的点击监听
        onTap: (int index) {
//          _pageController.jumpToPage(index); //没有动画的页面切换
          _pageController.animateToPage(index,
              duration: new Duration(seconds: 2),
              curve: new ElasticOutCurve(0.8));
          _pageChange(index);
          _currentIndex = index;
        },
      ),
    );
  }
}
