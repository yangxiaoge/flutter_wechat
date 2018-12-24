import 'package:flutter/material.dart';
import 'package:flutter_wechat/constants.dart' show Constants, AppColors;
import 'package:flutter_wechat/custwidget/custom_bottom_bar.dart'
    show MyBottomNavigationBar;

import 'contact_page.dart';
import 'conversation_page.dart';
import 'discover_page.dart';
import 'mine_page.dart';

enum PopMenuItems { GROUP_CHAT, ADD_FRIEND, QR_SCAN, PAYMENT, HELP }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 当前tab索引
  int _currentIndex = 0;

  // 底部导航item集合
  List<BottomNavigationBarItem> _navigationItemViews;

  // 4个页面
  List<Widget> _pages;

  // 页面控制器
  PageController _pageViewController;

  // 用给SnackBar等组件使用
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  _buildPopupMunuItem(int iconName, String title) {
    return Row(
      children: <Widget>[
        Icon(
            IconData(
              iconName,
              fontFamily: Constants.IconFontFamily,
            ),
            size: 22.0,
            color: const Color(AppColors.AppBarPopupMenuColor)),
        Container(width: 12.0),
        Text(title,
            style:
                TextStyle(color: const Color(AppColors.AppBarPopupMenuColor))),
      ],
    );
  }

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

    _pages = [
      Conversation(),
      Contact(),
      Discover(),
      Mine(),
    ];

    _pageViewController = PageController(
      initialPage: _currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final MyBottomNavigationBar bottomNavigationBar = MyBottomNavigationBar(
      items: _navigationItemViews,
      fixedColor: Color(AppColors.TabIconActive),
      //type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;

          // pageview跳转到对应页面
          _pageViewController.jumpToPage(
            _currentIndex,
          );
        });
      },
    );

    final statsBarPlusAppbarHeight =
        MediaQuery.of(context).padding.top + kToolbarHeight;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('微信'),
        elevation: 0, // 阴影效果
        actions: <Widget>[
          IconButton(
            icon: Icon(IconData(0xe65e, fontFamily: Constants.IconFontFamily),
                size: 20),
            onPressed: () {
              _scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text('点击了搜索'),
                duration: Duration(milliseconds: 500),
              ));
            },
          ),
          // 占位间隙
          SizedBox(
            width: 16,
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe69e, "发起群聊"),
                  value: PopMenuItems.GROUP_CHAT,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe638, "添加朋友"),
                  value: PopMenuItems.ADD_FRIEND,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe61b, "扫一扫"),
                  value: PopMenuItems.QR_SCAN,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe62a, "收付款"),
                  value: PopMenuItems.PAYMENT,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe63d, "帮助与反馈"),
                  value: PopMenuItems.HELP,
                ),
              ];
            },
            icon: Icon(IconData(0xe658, fontFamily: Constants.IconFontFamily),
                size: 20),
            onSelected: (action) {
              print('点击了$action');
              _scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text('点击了$action'),
                duration: Duration(milliseconds: 500),
              ));
            },
            offset: Offset(0, statsBarPlusAppbarHeight),
          ),
          // 占位间隙
          SizedBox(
            width: 16,
          ),
        ],
      ),
      body: PageView.builder(
        itemBuilder: (context, index) {
          return _pages[index];
        },
        itemCount: _pages.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        controller: _pageViewController,
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
