import 'package:bbc_concept/bbc_icon.dart';
import 'package:bbc_concept/menu_icon.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ContentPage extends StatefulWidget {
  final bool isMenuOpen;

  final double leftPosition;
  final double contentHeight;
  final double contentScale;

  final Function onTap;

  ContentPage(
      {this.isMenuOpen,
      this.leftPosition,
      this.contentHeight,
      this.contentScale,
      this.onTap});
  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  List<SliderClass> sliderData = new List<SliderClass>();
  List<BottomSlider> bottomSliderData = new List<BottomSlider>();

  @override
  void initState() {
    super.initState();
    sliderData
        .add(SliderClass('1 hour before lived', 'assets/images/gentlemen.jpg'));
    sliderData.add(SliderClass('Going to live', 'assets/images/sehrlock.jpg'));
    sliderData.add(SliderClass('Coming Soon', 'assets/images/darkmoney.png'));
    sliderData
        .add(SliderClass('1 hour before lived', 'assets/images/poldark.jpg'));

    bottomSliderData.add(BottomSlider(
        'assets/images/warren.jpg', 'Warren', 'BBC One', 'Series 1: 1'));
    bottomSliderData.add(BottomSlider(
        'assets/images/father_brown.jpg', 'Warren', 'BBC One', 'Series 6: 3'));
    bottomSliderData.add(BottomSlider(
        'assets/images/line_of_duty.jpg', 'Warren', 'BBC One', 'Series 2: 1'));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AnimatedPositioned(
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInOut,
      left: width * widget.leftPosition,
      bottom: 0,
      top: 0,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOutBack,
        transform:
            Matrix4.translationValues(0, height * widget.contentHeight, 0)
              ..scale(widget.contentScale),
        child: Container(
          alignment: Alignment.topLeft,
          width: width,
          height: height,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 24,
                color: Colors.black.withOpacity(0.6),
                offset: Offset(-10, 0),
              ),
            ],
            color: Color(0xff191919),
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 48.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: width,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: widget.onTap,
                            child: MenuIcon(),
                          ),
                        ),
                      ),
                      BbcIcon(
                        textColor: Color(0xff191919),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Image.asset(
                                'assets/images/search.png',
                                color: Color(0xffBB1100),
                                width: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 110),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: <Widget>[
                      CarouselSlider(
                        enlargeCenterPage: true,
                        height: 360,
                        initialPage: 1,
                        viewportFraction: 0.9,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayCurve: Curves.easeInOut,
                        items: sliderData.map((f) {
                          return Builder(
                            builder: (context) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: AssetImage(f.imagePath),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Container(
                                    height: 60,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(6),
                                        bottomRight: Radius.circular(6),
                                      ),
                                      color: f.title == 'Going to live'
                                          ? Color(0xffBB1100).withOpacity(0.85)
                                          : Colors.black54,
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            f.title,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              letterSpacing: 1.1,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 16.0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 24,
                          right: 24,
                          top: 24,
                          bottom: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Featured on BBC',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.6),
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 6.0,
                                  horizontal: 16.0,
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'More',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Image.asset(
                                      'assets/images/add.png',
                                      width: 14,
                                      color: Color(0xffBB1100),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24.0),
                        child: Container(
                          height: 180,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: bottomSliderData.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 12.0),
                                child: Container(
                                  width: 180,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        height: 120,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  bottomSliderData[index]
                                                      .imagePath),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 10,
                                          left: 10,
                                          right: 10,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(bottomSliderData[index].title,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  bottomSliderData[index].platform,
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  bottomSliderData[index].series,
                                                  style: TextStyle(
                                                      color: Color(0xffBB1100),
                                                      fontSize: 15),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 24,
                          right: 24,
                          top: 24,
                          bottom: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'My Programmes',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.6),
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 6.0,
                                  horizontal: 16.0,
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'More',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Image.asset(
                                      'assets/images/add.png',
                                      width: 14,
                                      color: Color(0xffBB1100),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24.0),
                        child: Container(
                          height: 180,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: bottomSliderData.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 12.0),
                                child: Container(
                                  width: 180,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        height: 120,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  bottomSliderData[index]
                                                      .imagePath),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 10,
                                          left: 10,
                                          right: 10,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(bottomSliderData[index].title,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  bottomSliderData[index].platform,
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  bottomSliderData[index].series,
                                                  style: TextStyle(
                                                      color: Color(0xffBB1100),
                                                      fontSize: 15),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SliderClass {
  String title;
  String imagePath;

  SliderClass(this.title, this.imagePath);
}

class BottomSlider {
  String imagePath;
  String title;
  String platform;
  String series;

  BottomSlider(this.imagePath, this.title, this.platform, this.series);
}
