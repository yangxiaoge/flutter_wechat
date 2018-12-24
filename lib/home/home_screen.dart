import 'package:flutter/material.dart';
import 'package:flutter_wechat/constants.dart' show AppColors;

class NavigationIconView {
  final BottomNavigationBarItem item;

  NavigationIconView(
      {Key key, String title, IconData icon, IconData activeIcon})
      : item = BottomNavigationBarItem(
          icon: Icon(icon),
          activeIcon: Icon(activeIcon),
          title: Text(title),
          backgroundColor: Colors.white,
        );
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 当前tab索引
  int _currentIndex = 0;

  // 底部导航item集合
  List<BottomNavigationBarItem> _navigationItemViews;

  @override
  void initState() {
    super.initState();
    // 底部导航item初始化
    _navigationItemViews = [
      BottomNavigationBarItem(
          icon: Icon(Icons.access_alarm),
          activeIcon: Icon(Icons.access_alarm),
          title: Text('微信'),
          backgroundColor: Colors.white),
      BottomNavigationBarItem(
          icon: Icon(Icons.cloud_queue),
          activeIcon: Icon(Icons.cloud),
          title: Text('通讯录'),
          backgroundColor: Colors.white),
      BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          activeIcon: Icon(Icons.favorite),
          title: Text('发现'),
          backgroundColor: Colors.white),
      BottomNavigationBarItem(
          icon: Icon(Icons.event_available),
          activeIcon: Icon(Icons.event_available),
          title: Text('我的'),
          backgroundColor: Colors.white),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
      items: _navigationItemViews,
      fixedColor: Color(AppColors.TabIconActive),
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        elevation: 0, // 阴影效果
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('点击了搜索按钮');
            },
          ),
          // 占位间隙
          SizedBox(
            width: 16,
          ),
          Icon(Icons.add),
          // 占位间隙
          SizedBox(
            width: 16,
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
