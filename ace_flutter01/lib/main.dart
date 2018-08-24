import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '轻签到',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: '极速登录'),
      routes: {
        'forgetPwdRoute': (BuildContext context) => new ForgetPwdPage(),
        'homeRoute': (BuildContext context) => new HomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _phoneState, _pwdState = false;
  String _checkStr;
  TextEditingController _phonecontroller = new TextEditingController();
  TextEditingController _pwdcontroller = new TextEditingController();

  void _checkPhone() {
    if (_phonecontroller.text.isNotEmpty &&
        _phonecontroller.text.trim().length == 11) {
      _phoneState = true;
    } else {
      _phoneState = false;
    }
  }

  void _checkPwd() {
    if (_pwdcontroller.text.isNotEmpty &&
        _pwdcontroller.text.trim().length >= 6 &&
        _pwdcontroller.text.trim().length <= 10) {
      _pwdState = true;
    } else {
      _pwdState = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '轻签到',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('极速登录'),
        ),
        body: new ListView(
          children: <Widget>[
            new Column(
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
                      scale: 1.2,
                    )),
                new Padding(
                  padding: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 15.0),
                  child: new Stack(
                    alignment: new Alignment(1.0, 1.0),
                    //statck
                    children: <Widget>[
                      new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new Padding(
                              padding:
                                  new EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                              child: new Image.asset(
                                'images/icon_username.png',
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                            new Expanded(
                              child: new TextField(
                                controller: _phonecontroller,
                                keyboardType: TextInputType.phone,
                                decoration: new InputDecoration(
                                  hintText: '请输入用户名',
                                ),
                              ),
                            ),
                          ]),
                      new IconButton(
                        icon: new Icon(Icons.clear, color: Colors.black45),
                        onPressed: () {
                          _phonecontroller.clear();
                        },
                      ),
                    ],
                  ),
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
                            controller: _pwdcontroller,
                            decoration: new InputDecoration(
                              hintText: '请输入密码',
                              suffixIcon: new IconButton(
                                icon: new Icon(Icons.clear,
                                    color: Colors.black45),
                                onPressed: () {
                                  _pwdcontroller.clear();
                                },
                              ),
                            ),
                            obscureText: true,
                          ),
                        ),
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
                          style: new TextStyle(
                              color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                      onPressed: () {
                        // 按 name 方式跳转页面
//                      Navigator.pushNamed(context, 'homeRoute');
                        // 按 name 方式跳转页面，并接收返回值
//                        Navigator.pushNamed(context, 'homeRoute')
//                            .then((Object result) {
//                          showDialog(
//                            context: context,
//                            builder: (BuildContext context) {
//                              String str = result.toString();
//                              return new AlertDialog(
//                                content: new Text("您返回的内容为:$str"),
//                              );
//                            },
//                          );
//                        });
                        // 按 name 方式跳转页面，并销毁当前页面
//                        Navigator.pushNamedAndRemoveUntil(
//                            context, "homeRoute", (route) => route == null);
                        // 直接 push 方式跳转页面
//                        Navigator.push<Object>(
//                          context,
//                          new MaterialPageRoute(
//                            builder: (BuildContext context) {
//                              return new HomePage();
//                            },
//                          ),
//                        );
                        // 直接 push 方式跳转页面，并接收返回内容
                        Navigator.push<Object>(context, new MaterialPageRoute(
                            builder: (BuildContext context) {
                          return new HomePage();
                        })).then((Object result) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              String str = result.toString();
                              return new AlertDialog(
                                content: new Text("您返回的内容为:$str"),
                              );
                            },
                          );
                        });
                        // 直接 push 方式跳转页面，并销毁当前页面
//                        Navigator.pushAndRemoveUntil(context,
//                            new MaterialPageRoute(
//                          builder: (BuildContext context) {
//                            return new HomePage();
//                          },
//                        ), (route) => route == null);
//                        _checkPhone();
//                        _checkPwd();
//                        if (_phoneState && _pwdState) {
//                          _checkStr = '页面跳转下期见咯！';
//                        } else {
//                          if (!_phoneState) {
//                            _checkStr = '请输入11位手机号！';
//                          } else if (!_pwdState) {
//                            _checkStr = '请输入6-10位密码！';
//                          }
//                        }
//                        print(_checkStr);
//                        showDialog<Null>(
//                          context: context,
//                          barrierDismissible: false,
//                          child: new AlertDialog(
//                            title: new Text(
//                              '温馨提示',
//                              style: new TextStyle(
//                                color: Colors.black54,
//                                fontSize: 18.0,
//                              ),
//                            ),
//                            content: new Text(_checkStr),
//                            actions: <Widget>[
//                              new FlatButton(
//                                  onPressed: () {
//                                    Navigator.pop(context);
//                                  },
//                                  child: new Text('确定')),
//                            ],
//                          ),
//                        );
                      },
                    ),
                  ),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(12.0, 22.0, 26.0, 0.0),
                      child: new GestureDetector(
                        onTap: () {
                          // 单纯跳转页面
                          Navigator.pushNamed(context, "forgetPwdRoute");
                          // 传递参数
                          Navigator.push<String>(
                            context,
                            new MaterialPageRoute(
                              builder: (BuildContext context) {
                                return new ForgetPwdPage(pwd: "123456");
                              },
                            ),
                          );
                        },
                        child: new Text(
                          '忘记密码?',
                          style: new TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ForgetPwdPage extends StatelessWidget {
  final String pwd;

  ForgetPwdPage({this.pwd});

  @override
  Widget build(BuildContext context) {
    print('传来密码为：' + this.pwd);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("忘记密码"),
      ),
      body: new Center(
        child: new Container(
          width: 340.0,
          child: new Card(
            color: Colors.blue,
            elevation: 16.0,
            child: new FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: new Text(
                  "这里是【忘记密码】页面，点击返回!",
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("HomePage"),
      ),
      body: new Center(
        child: new Container(
          width: 340.0,
          child: new Card(
            color: Colors.blue,
            elevation: 16.0,
            child: new FlatButton(
                onPressed: () {
                  // pop 一个参数，销毁当前页面
//                Navigator.pop(context);
                  // pop 两个参数，返回一个数组
//                Navigator.pop(context, ['a,b,c']);
                  // pop 两个参数，返回一个字符串
                  Navigator.pop(context, 'HomePage');
                  // popAndPushNamed 销毁当前页面并跳转新的页面
//                Navigator.popAndPushNamed(context, 'forgetPwdRoute');
                },
                child: new Text(
                  "这里是【HomePage】页面，点击返回!",
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
