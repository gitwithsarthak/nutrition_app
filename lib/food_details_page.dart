import 'package:flutter/material.dart';

class FoodDetailsPage extends StatefulWidget {
  final heroTag;
  final foodName;
  final foodPrice;

  const FoodDetailsPage({
    required this.heroTag,
    required this.foodName,
    required this.foodPrice,
  });

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  var selectedCard = 'Weight';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7A9BEE),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'Details',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 22.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
            color: Colors.black,
          )
        ],
      ),

      ///Body SECTION
      body: ListView(
        children: <Widget>[
          Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height - 80.0,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent),

              ///BACKGROUND LAYOUT
              Positioned(
                  top: 75.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0),
                      ),
                      color: Colors.white,
                    ),
                    height: 700.0,
                    width: MediaQuery.of(context).size.width,
                  )),

              ///LIST IMAGE
              Positioned(
                top: 30.0,
                left: (MediaQuery.of(context).size.width / 2) - 100.0,
                child: Hero(
                  tag: widget.heroTag,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.heroTag),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 200.0,
                    width: 200.0,
                  ),
                ),
              ),
              Positioned(
                top: 250.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.foodName,
                        style: const TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            widget.foodPrice,
                            style: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                color: Colors.grey),
                          ),
                          Container(
                            height: 25.0,
                            color: Colors.grey,
                            width: 2.0,
                          ),
                          Container(
                            width: 125.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17.0),
                              color: const Color(0xFF7A9BEE),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 25.0,
                                    width: 25.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        color: const Color(0xFF7A9BEE)),
                                    child: const Center(
                                      child: Icon(Icons.remove,
                                          color: Colors.white, size: 20.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Container(
                          height: 250.0,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              _buildInfoCard('WEIGHT', '300', 'G'),
                              const SizedBox(width: 10.0),
                              _buildInfoCard('CALORIES', '300', 'Cal'),
                              const SizedBox(width: 10.0),
                              _buildInfoCard('VITAMINS', 'A,B12', 'Vita'),
                              const SizedBox(width: 10.0),
                            ],
                          )),
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3.0),
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                                bottomLeft: Radius.circular(25.0),
                                bottomRight: Radius.circular(25.0),
                              ),
                              color: Colors.black),
                          height: 50.0,
                          child: const Center(
                            child: Text(
                              'Rs 52.00',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildInfoCard(String cardTitle, String info, String unit) {
    return InkWell(
        onTap: () {
          selectCard(cardTitle);
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color:
                  cardTitle == selectedCard ? Color(0xFF7A9BEE) : Colors.white,
              border: Border.all(
                  color: cardTitle == selectedCard
                      ? Colors.transparent
                      : Colors.grey.withOpacity(1.0),
                  style: BorderStyle.solid,
                  width: 1.0),
            ),
            height: 100.0,
            width: 110.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                    child: Text(cardTitle,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18.0,
                          color: cardTitle == selectedCard
                              ? Colors.white
                              : Colors.grey.withOpacity(0.7),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(info,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18.0,
                                color: cardTitle == selectedCard
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text(unit,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18.0,
                              color: cardTitle == selectedCard
                                  ? Colors.white
                                  : Colors.black,
                            ))
                      ],
                    ),
                  )
                ])));
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}
