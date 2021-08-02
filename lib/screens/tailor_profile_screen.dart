import 'package:flutter/material.dart';
import 'package:jahitid/models/service_list.dart';
import 'package:jahitid/models/tailor_list.dart';

class TailorProfileScreen extends StatefulWidget {
  final String tailorId;
  final String category;
  TailorProfileScreen({required this.tailorId, required this.category});

  @override
  _TailorProfileScreenState createState() =>
      _TailorProfileScreenState(tailorId: tailorId, category: category);
}

class _TailorProfileScreenState extends State<TailorProfileScreen> {
  final String tailorId;
  final String category;

  _TailorProfileScreenState({required this.tailorId, required this.category});

  String profileAsset = '';
  String backgroundAsset = '';
  bool check = true;
  List<ServiceList> services = [];
  String _selectedIcon = '';
  String _descriptionService = '';
  double _rating = 4.5;
  int _totalTransaction = 55;
  List<String> _portofolioAsset = [];
  List<String> _reviews = [];

  @override
  Widget build(BuildContext context) {
    if (check) {
      for (int i = 0; i < tailorList.length; i++) {
        if (tailorId == tailorList[i].name) {
          profileAsset = tailorList[i].profileAsset;
          backgroundAsset = tailorList[i].backgroundAsset;
          break;
        }
      }
      for (int i = 0; i < serviceList.length; i++) {
        if (tailorId == serviceList[i].id) {
          services.add(serviceList[i]);
        }
      }
      for (int i = 0; i < services.length; i++) {
        if (services[i].category == category) {
          _selectedIcon = services[i].category;
          _descriptionService = services[i].serviceDescription;
          _rating = services[i].rating;
          _totalTransaction = services[i].totalTransaction;
          for (var j = 0; j < services[i].portofolioAsset.length; j++)
            _portofolioAsset.add(services[i].portofolioAsset[j]);
          for (var j = 0; j < services[i].reviews.length; j++)
            _reviews.add(services[i].reviews[j]);
        }
      }
    }
    check = false;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 270,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 230,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(backgroundAsset),
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.4), BlendMode.srcOver),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 35,
                              )),
                          Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: 35,
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage(profileAsset),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                tailorId,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < services.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIcon = services[i].category;
                          _descriptionService = services[i].serviceDescription;
                          _rating = services[i].rating;
                          _totalTransaction = services[i].totalTransaction;
                          _portofolioAsset.removeRange(
                              0, _portofolioAsset.length);
                          _reviews.removeRange(0, _reviews.length);
                          for (int j = 0;
                              j < services[i].portofolioAsset.length;
                              j++) {
                            _portofolioAsset
                                .add(services[i].portofolioAsset[j]);
                          }
                          for (int j = 0; j < services[i].reviews.length; j++)
                            _reviews.add(services[i].reviews[j]);
                        });
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/${services[i].category.toLowerCase()}.png',
                            scale: 0.8,
                            color: _selectedIcon == services[i].category
                                ? Color(0xFFFE7F99)
                                : Colors.black,
                          ),
                          SizedBox(height: 5),
                          Text(
                            services[i].category,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 
              MediaQuery.of(context).size.width <= 700 ? 20 : 150),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow[700],
                            size: 25,
                          ),
                          Text(
                            _rating.toString(),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      Text(
                        'Total Transaction: ' + _totalTransaction.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Deskripsi Jasa',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    _descriptionService,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Portofolio',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    height: 164,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _portofolioAsset.length,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            _portofolioAsset[index],
                            width: 120,
                          ),
                        );
                      },
                    ),
                  ),
                  Text(
                    'Review',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 15),
                  for (int i = 0; i < _reviews.length; i++)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage('assets/images/reviewer.jpg'),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ' Adam Fitrah',
                                  style: TextStyle(fontSize: 15),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow[700],
                                      size: 25,
                                    ),
                                    Text(
                                      _rating.toString(),
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          _reviews[i],
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 20)
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
