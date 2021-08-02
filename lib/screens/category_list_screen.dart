import 'package:flutter/material.dart';
import 'package:jahitid/models/service_list.dart';
import 'package:jahitid/screens/tailor_profile_screen.dart';

class CategoryListScreen extends StatelessWidget {
  final String category;

  CategoryListScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios),
            ),
            Text(
              category,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontFamily: 'Roboto',
              ),
            ),
            Icon(Icons.search)
          ],
        ),
      ),
      body: Scrollbar(
        isAlwaysShown: true,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth <= 920) {
              return CategoryListMobile(category: category);
            } else {
              return CategoryListMobile(category: category);
            }
          },
        ),
      ),
    );
  }
}

class CategoryListMobile extends StatelessWidget {
  const CategoryListMobile({
    Key? key,
    required this.category,
  }) : super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width <= 700 ? 0 : 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                      color: Color(0xFFFE7F99),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.filter_list,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          'Filter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                      color: Color(0xFFFE7F99),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.swap_vert,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          'Termurah ke Termahal',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          MediaQuery.of(context).size.width <= 600
              ? ServiceListView(category: category)
              : ServiceGridView(category: category)
        ],
      ),
    );
  }
}

class ServiceListView extends StatelessWidget {
  const ServiceListView({
    Key? key,
    required this.category,
  }) : super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 150,
      child: ListView.builder(
          itemCount: serviceList.length,
          itemBuilder: (context, index) {
            final ServiceList services = serviceList[index];
            if (services.category == category) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TailorProfileScreen(
                        tailorId: services.id,
                        category: services.category,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          MediaQuery.of(context).size.width <= 700 ? 0 : 50),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                services.profileAsset,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        services.id,
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow[700],
                                            size: 20,
                                          ),
                                          Text(services.rating.toString())
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 1),
                                  Text(
                                    'Rp${services.price}',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 1),
                                  Text(
                                    'Total Order : ${services.totalTransaction}',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
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
                ),
              );
            }
            return SizedBox(height: 1);
          }),
    );
  }
}

class ServiceGridView extends StatelessWidget {
  const ServiceGridView({
    Key? key,
    required this.category,
  }) : super(key: key);

  final String category;
  @override
  Widget build(BuildContext context) {
    List<ServiceList> serviceGrid = [];
    for (int i = 0; i < serviceList.length; i++) {
      if (serviceList[i].category == category) {
        serviceGrid.add(serviceList[i]);
      }
    }
    return Container(
      height: MediaQuery.of(context).size.height - 150,
      child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 6/2,
              ),
          itemCount: serviceGrid.length,
          itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TailorProfileScreen(
                        tailorId: serviceGrid[index].id,
                        category: serviceGrid[index].category,
                      ),
                    ),
                  );
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              serviceGrid[index].profileAsset,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      serviceGrid[index].id,
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow[700],
                                          size: 20,
                                        ),
                                        Text(serviceGrid[index].rating.toString())
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 1),
                                Text(
                                  'Rp${serviceGrid[index].price}',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 1),
                                Text(
                                  'Total Order : ${serviceGrid[index].totalTransaction}',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
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
          }),
    );
  }
}
