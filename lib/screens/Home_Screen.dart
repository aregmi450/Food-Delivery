import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodelivery/utils/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
  }

  void autoScroll() {
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                FontAwesomeIcons.bars,
                color: Colors.black,
                size: 40,
              ),
              title: Text('Delivery To'),
              subtitle: Text('Pune hinjewadi...'),
              trailing: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: FadeInImage.assetNetwork(
                    fit: BoxFit.contain,
                    placeholder: 'assets/images/logo.png',
                    placeholderCacheWidth: 40,
                    image:
                        'https://avatars3.githubusercontent.com/u/49974198?s=460&u=ff4edc506e05d4fd4dc787767a6fccce8c556786&v=4'),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Find Restaurant In \nYour City 😊',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          height: 1.3),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Search Food',
                          border: InputBorder.none,
                          suffixIcon: Container(
                            color: primaryColorDark,
                            child: Icon(
                              FontAwesomeIcons.filter,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: primaryColorDark,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  buildRow('Categories', 'See All'),
                  SizedBox(
                    height: height * 0.03,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: height * 0.15,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: width * 0.20,
                          child: Image.asset(
                            'assets/images/pizza.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          'Snacks',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    width: width * 0.25,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: width * 0.20,
                          child: Image.asset(
                            'assets/images/fries.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          'Potato',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    width: width * 0.25,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: width * 0.20,
                          child: Image.asset(
                            'assets/images/pizza.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          'Burger',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    width: width * 0.25,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: width * 0.20,
                          child: Image.asset(
                            'assets/images/pizza.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          'Diet',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    width: width * 0.25,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: buildRow('Near You', 'See All')),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: height * 0.23,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: width * 0.48,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://i.ndtvimg.com/i/2016-06/chinese-625_625x350_81466064119.jpg',
                            fit: BoxFit.contain,
                            height: height * 0.15,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Row(
                          children: [
                            Text(
                              'Pizza Hut',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              '🌟 4.7',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.mapMarkerAlt,
                              size: 10,
                              color: Colors.pink,
                            ),
                            Text('2 km'),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Icon(
                              FontAwesomeIcons.dollarSign,
                              size: 10,
                              color: Colors.pink,
                            ),
                            Text('Free Delivery'),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: width * 0.48,
                    child: Column(
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              'https://i.ndtvimg.com/i/2016-06/chinese-625_625x350_81466064119.jpg',
                              fit: BoxFit.contain,
                              height: height * 0.15,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Row(
                          children: [
                            Text(
                              'Mainland China',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              '🌟 4.5',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.mapMarkerAlt,
                              size: 10,
                              color: Colors.pink,
                            ),
                            Text('4 km'),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Icon(
                              FontAwesomeIcons.dollarSign,
                              size: 10,
                              color: Colors.pink,
                            ),
                            Text('Free Delivery'),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    buildRow('Most Popular', 'See All'),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Container(
                      height: height * 0.30,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (val) {
                          setState(() {
                            _currentPage = val;
                          });
                        },
                        children: [
                          mostPopular(height, 'KFC Drumsticks',
                              'https://online.kfc.co.in/Content/OnlineOrderingImages/Menu/Items/CAT86-2410.jpg'),
                          mostPopular(height, 'Dominos Pizza',
                              'https://b.zmtcdn.com/data/pictures/2/20172/a3f876979c7b1a123ff8d0548d774cb1.jpg'),
                          mostPopular(height, 'Mcdonalds Burgers',
                              'https://d1nqx6es26drid.cloudfront.net/app/uploads/2019/02/08192300/Corp-Site_mobile.jpg'),
                        ],
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: height * 0.04,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: buildRow('Recommended', 'See All'),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: height * 0.50,
                child: GridView(
                  // shrinkWrap: true,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  addRepaintBoundaries: true,
                  addAutomaticKeepAlives: true,
                  children: [
                    gridProducts(
                        'https://www.yummyfoodrecipes.in/resources/picture/org/Tasty-Chocolate-Ice-Cream.jpg'),
                    gridProducts(
                        'https://tripnxt.com/blog/wp-content/uploads/2020/02/TripNxt-Indian-Food-448x486.jpg'),
                    gridProducts(
                        'https://i1.wp.com/withtwospoons.com/wp-content/uploads/2017/08/POY-1.jpg'),
                    gridProducts(
                        'https://images.medindia.net/amp-images/health-images/images-of-tasty-food.jpg'),
                    gridProducts(
                        'https://image.winudf.com/v2/image/Y29tLmhhYmliaS5UYXN0eWFuZFl1bW15Rm9vZFJlY2lwZV9zY3JlZW5fMF8xNTE0MTkwNzU0XzA5Ng/screen-0.jpg?fakeurl=1&type=.jpg'),
                    gridProducts(
                        'https://www.foodbap.com/wp-content/uploads/2017/10/Pizza.jpg')
                  ],
                )),
            SizedBox(
              height: height * 0.03,
            ),
          ],
        ),
      )),
    );
  }

  InkWell gridProducts(String img) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(5),
        child: Card(
          elevation: 5.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: new Image.network(img, fit: BoxFit.cover, loadingBuilder:
                (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes
                      : null,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Stack mostPopular(double height, String text1, String img) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 1),
          width: double.infinity,
          height: height * 0.30,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Image.network(
              img,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            top: 10,
            right: 20,
            child: Icon(
              FontAwesomeIcons.shoppingBasket,
              color: primaryColorDark,
            )),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 320,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            color: Colors.black54,
            child: Text(
              text1,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 23, color: Colors.white),
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          ),
        )
      ],
    );
  }

  Row buildRow(String text1, String text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style:
              TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 1.5),
          textAlign: TextAlign.left,
        ),
        Text(
          text2,
          style:
              TextStyle(fontSize: 15, fontWeight: FontWeight.w400, height: 1.5),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
