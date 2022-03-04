import 'package:flutter/material.dart';

//导入cupertino  widget 库
import 'package:flutter/cupertino.dart';

import 'AnimatedListRoute.dart';
import 'AnimatedWidgetsTest.dart';
import 'BuildTwoListView.dart';
import 'ClipTestRoute.dart';
import 'ContainerCard.dart';
import 'CustomPaintRoute.dart';
import 'FlexLayoutTestRoute.dart';
import 'InfiniteGridView.dart';
import 'InfiniteListView.dart';
import 'ListView3.dart';
import 'NestedTabBarView1.dart';
import 'PersistentHeaderRoute.dart';
import 'ResponsiveColumn.dart';
import 'ScaffoldRoute.dart';
import 'ScrollControllerTestRoute.dart';
import 'ScrollNotificationTestRoute.dart';
import 'SingleChildScrollViewTestRoute.dart';
import 'TabViewRoute1.dart';
import 'TabViewRoute2.dart';
import 'ThemeTestRoute.dart';
import 'WContainer.dart';
import 'WillPopScopeTestRoute.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: const Text("标题"),
            ),
            body: const Center(
              child: CustomPaintRoute(),
            )));
  }
}

//demo
// TapboxA 管理自身状态.

//------------------------- TapboxA ----------------------------------

class TapboxA extends StatefulWidget {
  const TapboxA({Key? key}) : super(key: key);

  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

// ParentWidget 为 TapboxB 管理状态.

//------------------------ ParentWidget --------------------------------

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//------------------------- TapboxB ----------------------------------

class TapboxB extends StatelessWidget {
  const TapboxB({Key? key, this.active = false, required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

//---------------------------- ParentWidget ----------------------------

class ParentWidgetC extends StatefulWidget {
  @override
  _ParentWidgetCState createState() => _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//----------------------------- TapboxC ------------------------------

class TapboxC extends StatefulWidget {
  const TapboxC({Key? key, this.active: false, required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapboxCState createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // 在按下时添加绿色边框，当抬起时，取消高亮
    return GestureDetector(
      onTapDown: _handleTapDown,
      // 处理按下事件
      onTapUp: _handleTapUp,
      // 处理抬起事件
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(
            widget.active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? Border.all(
                  color: Colors.teal,
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }
}

//demo
class CupertinoTestRoute extends StatelessWidget {
  const CupertinoTestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Cupertino Demo"),
      ),
      child: Center(
        child: CupertinoButton(
            color: CupertinoColors.activeBlue,
            child: const Text("Press"),
            onPressed: () {}),
      ),
    );
  }
}

//demo
class GetStateObjectRoute extends StatefulWidget {
  const GetStateObjectRoute({Key? key}) : super(key: key);

  @override
  State<GetStateObjectRoute> createState() => _GetStateObjectRouteState();
}

class _GetStateObjectRouteState extends State<GetStateObjectRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("子树中获取State对象"),
      ),
      body: Center(
        child: Column(
          children: [
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  // 查找父级最近的Scaffold对应的ScaffoldState对象
                  // ScaffoldState _state = Scaffold.of(context); // 打开抽屉菜单
                  // _state.openDrawer();
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("I am")));
                },
                child: const Text('打开抽屉菜单1'),
              );
            }),
          ],
        ),
      ),
      drawer: const Drawer(),
    );
  }
}

//demo
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.send),
              label: const Text("发送"),
              onPressed: _onPressed,
            ),
            OutlinedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text("添加"),
              onPressed: _onPressed,
            ),
            TextButton.icon(
              icon: const Icon(Icons.info),
              label: const Text("详情"),
              onPressed: _onPressed,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(" hello world "),
                Text(" I am Jack "),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(" hello world "),
                Text(" I am Jack "),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              textDirection: TextDirection.rtl,
              children: const <Widget>[
                Text(" hello world "),
                Text(" I am Jack "),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              verticalDirection: VerticalDirection.up,
              children: const <Widget>[
                Text(
                  " hello world ",
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(" I am Jack "),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _onPressed() {}
}
