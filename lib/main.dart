import 'package:flutter/material.dart';
import './food_details_page.dart';

void main() {
  runApp(const MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 10.0),

            ///Top Row Icons
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                ),
                SizedBox(
                  width: 130,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.filter_list_rounded),
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.menu),
                          color: Colors.white,
                        ),
                      ]),
                )
              ],
            ),
          ),

          ///Main Title
          const SizedBox(height: 25.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Row(children: const [
              Text(
                'Healthy',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10),
              Text(
                'Food',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                ),
              ),
            ]),
          ),
          const SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(75.0),
              ),
            ),
            child: ListView(
              primary: true,
              padding: const EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300.0,
                    child: ListView(children: [
                      _buildFoodItem(context, 'assets/images/plate1.png',
                          'Slazmon bowl', '₹ 150:00'),
                      _buildFoodItem(context, 'assets/images/plate2.png',
                          'Spring bowl', '₹ 120:00'),
                      _buildFoodItem(context, 'assets/images/plate3.png',
                          'Chikz bowl', '₹ 100:00'),
                      _buildFoodItem(context, 'assets/images/plate4.png',
                          'Berry Bowl', '₹ 199:00'),
                      _buildFoodItem(context, 'assets/images/plate5.png',
                          'Greezy bowl', '₹ 170:00'),
                    ]),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 40),
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF21BFBD),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: const Center(
                        child: Icon(Icons.search, color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Container(
                      margin: EdgeInsets.only(bottom: 40),
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF21BFBD),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: const Center(
                        child: Icon(Icons.shopping_basket, color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Container(
                      margin: EdgeInsets.only(bottom: 40),
                      height: 60.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFF21BFBD),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: const Center(
                        child: Text(
                          'Checkout',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text('DSDS'),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///FOOD Widgets
Widget _buildFoodItem(
    BuildContext context, String imgPath, String foodName, String price) {
  return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              (MaterialPageRoute(
                builder: (context) => Builder(builder: (context) {
                  return FoodDetailsPage(
                    heroTag: imgPath,
                    foodName: foodName,
                    foodPrice: price,
                  );
                }),
              )),
            );
          },
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(
                    children: [
                      Hero(
                        tag: imgPath,
                        child: Image(
                          image: AssetImage(imgPath),
                          fit: BoxFit.cover,
                          height: 75.0,
                          width: 75.0,
                        ),
                      ),
                      const SizedBox(width: 30.0),
                      Column(
                        children: [
                          Text(
                            foodName,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            price,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              //fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  color: Colors.black,
                ),
              ])));
}
