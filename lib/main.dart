import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: NotificationListener<ScrollNotification>(
          onNotification: (notification){
            int index = 0;
            ScrollMetrics metrics = notification.metrics;
            print( "$index ______ ${metrics.pixels}");// 当前位置
            print("$index ______ ${metrics.atEdge}");//是否在顶部或底部
            print("$index ______ ${metrics.axis}");//垂直或水平滚动
            print("$index ______ ${metrics.axisDirection}");//
            // 滚动方向是down还是up
            print("$index ______ ${metrics.extentAfter}");
            //视口底部距离列表底部有多大
            print("$index ______ ${metrics.extentBefore}");
            //视口顶部距离列表顶部有多大
            print("$index ______ ${metrics.extentInside}");//视口范围内的列表长度
            print("$index ______ ${metrics.maxScrollExtent}");
            //最大滚动距离，列表长度-视口长度
            print("$index ______ ${metrics.minScrollExtent}");//最小滚动距离
            print("$index ______ ${metrics.viewportDimension}");//视口长度
            print("$index ______ ${metrics.outOfRange}");//是否越过边界
            print('------------------------');
            return true;
          },
          child: ListView.builder(
            itemCount: 50,
            itemBuilder: (ctx,index){
              return buildItem(index);
            },),
        ),
        ),
      floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Widget buildItem(int index){
    return  ListTile(title: Text("$index"),);
//    return NotificationListener<ScrollNotification>(
//      onNotification: (notification){
//        ScrollMetrics metrics = notification.metrics;
//        print( "$index ______ ${metrics.pixels}");// 当前位置
//        print("$index ______ ${metrics.atEdge}");//是否在顶部或底部
//        print("$index ______ ${metrics.axis}");//垂直或水平滚动
//        print("$index ______ ${metrics.axisDirection}");//
//        // 滚动方向是down还是up
//        print("$index ______ ${metrics.extentAfter}");
//        //视口底部距离列表底部有多大
//        print("$index ______ ${metrics.extentBefore}");
//        //视口顶部距离列表顶部有多大
//        print("$index ______ ${metrics.extentInside}");//视口范围内的列表长度
//        print("$index ______ ${metrics.maxScrollExtent}");
//        //最大滚动距离，列表长度-视口长度
//        print("$index ______ ${metrics.minScrollExtent}");//最小滚动距离
//        print("$index ______ ${metrics.viewportDimension}");//视口长度
//        print("$index ______ ${metrics.outOfRange}");//是否越过边界
//        print('------------------------');
//        return true;
//      },
//      child: ListTile(title: Text("$index"),),
//    );
  }

}
