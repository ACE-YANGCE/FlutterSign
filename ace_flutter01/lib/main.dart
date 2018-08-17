import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '轻签到',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('极速登录'),
        ),
        body: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[
            new Padding(
                padding: new EdgeInsets.all(30.0),
                child: new Image.asset(
                  'images/ic_launcher.png',
                  scale: 1.8,
                )),
            new Padding(
              padding: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 15.0),
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                      child: new Image.asset(
                        'images/icon_username.png',
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                    new Expanded(
                        child: new TextField(
                          decoration: new InputDecoration(
                            hintText: '请输入用户名',
                          ),
                        ))
                  ]),
            ),
            new Padding(
              padding: new EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 40.0),
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                      child: new Image.asset(
                        'images/icon_password.png',
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                    new Expanded(
                        child: new TextField(
                          decoration: new InputDecoration(
                            hintText: '请输入密码',
                          ),
                          obscureText: true,
                        ))
                  ]),
            ),
            new Container(
              width: 340.0,
              child: new Card(
                color: Colors.blue,
                elevation: 16.0,
                child: new FlatButton(
                    child: new Padding(
                      padding: new EdgeInsets.all(10.0),
                      child: new Text(
                        '极速登录',
                        style: new TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}