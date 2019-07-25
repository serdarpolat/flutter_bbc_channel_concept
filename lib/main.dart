import 'package:after_layout/after_layout.dart';
import 'package:bbc_concept/bbc_icon.dart';
import 'package:bbc_concept/content_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'SourceSansPro',
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

bool cpIsOpen = false;
double cpLeftPosition = 0;
double cpContentHeight = 0;
double cpContentScale = 1.0;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MenuItemClass> menuItems = new List<MenuItemClass>();

  @override
  void initState() {
    super.initState();
    menuItems.add(MenuItemClass('Home', true));
    menuItems.add(MenuItemClass('Channels', false));
    menuItems.add(MenuItemClass('Categories', false));
    menuItems.add(MenuItemClass('TV Guide', false));
    menuItems.add(MenuItemClass('My Programmes', false));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  double menuLeftPosition = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffBB1100),
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xffBB1100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Transform.rotate(
                        angle: 10,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (cpIsOpen) {
                                cpLeftPosition = 0;
                                cpContentHeight = 0;
                                cpContentScale = 1.0;

                                menuLeftPosition = 1.0;

                                cpIsOpen = false;
                              } else {
                                cpLeftPosition = 0.7;
                                cpContentHeight = 1 / 6;
                                cpContentScale = 0.7;

                                menuLeftPosition = 0.0;

                                cpIsOpen = true;
                              }
                            });
                          },
                          child: Image.asset(
                            'assets/images/right-arrow.png',
                            width: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      BbcIcon(
                        textColor: Color(0xffBB1100),
                      ),
                      Container(
                        width: 62,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: ListView.builder(
                      itemCount: menuItems.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          splashColor: Colors.white.withOpacity(0.5),
                          onTap: () {
                            setState(() {
                              menuItems.forEach(
                                  (element) => element.isSelected = false);
                              menuItems[index].isSelected = true;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 350 * index),
                            curve: Interval(0.2 * index, 1.0, curve: Curves.easeInOut,),
                            transform: Matrix4.translationValues(
                                -200 * menuLeftPosition, 0, 0),
                            child: MenuItemWidget(
                              menuItem: menuItems[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 32.0,
                    right: 32.0,
                    bottom: 32,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.5),
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/settings.png',
                                width: 24,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Settings',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.white.withOpacity(0.5),
                              width: 1.5,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 4.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                'Customer Service',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ContentPage(
            onTap: () {
              setState(() {
                if (cpIsOpen) {
                  cpLeftPosition = 0;
                  cpContentHeight = 0;
                  cpContentScale = 1.0;

                  menuLeftPosition = 1.0;

                  cpIsOpen = false;
                } else {
                  cpLeftPosition = 0.7;
                  cpContentHeight = 1 / 6;
                  cpContentScale = 0.7;

                  menuLeftPosition = 0.0;

                  cpIsOpen = true;
                }
              });

              print('$cpLeftPosition');
            },
            isMenuOpen: cpIsOpen,
            leftPosition: cpLeftPosition,
            contentHeight: cpContentHeight,
            contentScale: cpContentScale,
          ),
        ],
      ),
    );
  }
}

class MenuItemClass {
  String title;
  bool isSelected;

  MenuItemClass(this.title, this.isSelected);
}

class MenuItemWidget extends StatelessWidget {
  final MenuItemClass menuItem;
  MenuItemWidget({this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: menuItem.isSelected ? Color(0xff191919) : Colors.transparent,
            width: 6,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 26,
          top: 24,
          bottom: 24,
        ),
        child: Text(
          menuItem.title,
          style: TextStyle(
            color: menuItem.isSelected
                ? Colors.white
                : Colors.white.withOpacity(0.7),
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
