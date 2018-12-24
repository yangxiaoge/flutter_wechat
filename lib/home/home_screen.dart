import 'package:flutter/material.dart';
import 'package:flutter_wechat/constants.dart' show Constants, AppColors;

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
          icon: Icon(IconData(0xe608, fontFamily: Constants.IconFontFamily)),
          activeIcon:
              Icon(IconData(0xe603, fontFamily: Constants.IconFontFamily)),
          title: Text('微信'),
          backgroundColor: Colors.white),
      BottomNavigationBarItem(
          icon: Icon(IconData(0xe601, fontFamily: Constants.IconFontFamily)),
          activeIcon:
              Icon(IconData(0xe656, fontFamily: Constants.IconFontFamily)),
          title: Text('通讯录'),
          backgroundColor: Colors.white),
      BottomNavigationBarItem(
          icon: Icon(IconData(0xe600, fontFamily: Constants.IconFontFamily)),
          activeIcon:
              Icon(IconData(0xe671, fontFamily: Constants.IconFontFamily)),
          title: Text('发现'),
          backgroundColor: Colors.white),
      BottomNavigationBarItem(
          icon: Icon(IconData(0xe6c0, fontFamily: Constants.IconFontFamily)),
          activeIcon:
              Icon(IconData(0xe626, fontFamily: Constants.IconFontFamily)),
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
            icon: Icon(IconData(0xe6c8, fontFamily: Constants.IconFontFamily)),
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
