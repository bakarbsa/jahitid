import 'package:flutter/material.dart';
import 'package:jahitid/models/tailor_list.dart';
import 'package:jahitid/models/service_list.dart';
import 'package:jahitid/screens/category_list_screen.dart';
import 'package:jahitid/screens/tailor_profile_screen.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width <= 920 ? 0 : 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.sort),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo_pink.png',
                    scale: 1.7,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'JAHIT.ID',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              Icon(Icons.notifications)
            ],
          ),
        ),
      ),
      body: Scrollbar(
        isAlwaysShown: true,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth <= 920) {
              return HomeScreenMobile();
            } else {
              return HomeScreenWeb();
            }
          },
        ),
      ),
    );
  }
}

class HomeScreenWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 60, right: 60, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Selamat Datang, Adam',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 5),
            Text(
              'Silahkan order kebutuhan anda',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFAEAEAE)),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconCategory(
                  iconAsset: 'assets/images/pria.png',
                  iconLabel: 'Pria',
                ),
                SizedBox(width: 30),
                IconCategory(
                  iconAsset: 'assets/images/wanita.png',
                  iconLabel: 'Wanita',
                ),
                SizedBox(width: 30),
                IconCategory(
                  iconAsset: 'assets/images/anak.png',
                  iconLabel: 'Anak',
                ),
                SizedBox(width: 30),
                IconCategory(
                  iconAsset: 'assets/images/jas.png',
                  iconLabel: 'Jas',
                ),
                SizedBox(width: 30),
                IconCategory(
                  iconAsset: 'assets/images/gaun.png',
                  iconLabel: 'Gaun',
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Rekomendasi Untuk Anda',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 10),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      RecomendationForYou(),
                      RecomendationForYou(),
                      RecomendationForYou(),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                TailorListMobile(tailorListTitle: 'Penjahit Top Rating'),
                TailorListMobile(tailorListTitle: 'Penjahit Terdekat'),
                TailorListMobile(tailorListTitle: 'Transaksi Terbanyak'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Selamat Datang, Adam',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 5),
            Text(
              'Silahkan order kebutuhan anda',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFAEAEAE)),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconCategory(
                  iconAsset: 'assets/images/pria.png',
                  iconLabel: 'Pria',
                ),
                SizedBox(width: 30),
                IconCategory(
                  iconAsset: 'assets/images/wanita.png',
                  iconLabel: 'Wanita',
                ),
                SizedBox(width: 30),
                IconCategory(
                  iconAsset: 'assets/images/anak.png',
                  iconLabel: 'Anak',
                ),
                SizedBox(width: 30),
                IconCategory(
                  iconAsset: 'assets/images/jas.png',
                  iconLabel: 'Jas',
                ),
                SizedBox(width: 30),
                IconCategory(
                  iconAsset: 'assets/images/gaun.png',
                  iconLabel: 'Gaun',
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Rekomendasi Untuk Anda',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 10),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      RecomendationForYou(),
                      RecomendationForYou(),
                      RecomendationForYou(),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                TailorListMobile(tailorListTitle: 'Penjahit Top Rating'),
                TailorListMobile(tailorListTitle: 'Penjahit Terdekat'),
                TailorListMobile(tailorListTitle: 'Transaksi Terbanyak'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TailorListMobile extends StatelessWidget {
  final String tailorListTitle;

  TailorListMobile({required this.tailorListTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tailorListTitle,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
            ),
            Text(
              'Lainnya',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w900,
                color: Colors.red,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          height: MediaQuery.of(context).size.width <= 920 ? 164 : 214,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tailorList.length,
            itemBuilder: (context, index) {
              final TailorList tailors = tailorList[index];
              var defaultCategory;
              return InkWell(
                onTap: () {
                  for (int i = 0; i < serviceList.length; i++) {
                    if (tailors.name == serviceList[i].id) {
                      defaultCategory = serviceList[i].category;
                      break;
                    }
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TailorProfileScreen(
                              tailorId: tailors.name,
                              category: defaultCategory)));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            tailors.profileAsset,
                            width: MediaQuery.of(context).size.width <= 920
                                ? 120
                                : 170,
                          ),
                        ),
                      ),
                      Text(
                        tailors.name,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width <= 920
                            ? 120
                            : 170,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rp${tailors.price}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.red,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow[700],
                                  size: 20,
                                ),
                                Text(tailors.rating.toString())
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
        SizedBox(height: 20)
      ],
    );
  }
}

class RecomendationForYou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image(
          image: AssetImage('assets/images/backgroundTailor.jpg'),
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width <= 920 ? 300 : 500,
        ),
      ),
    );
  }
}

class IconCategory extends StatelessWidget {
  final String iconAsset;
  final String iconLabel;

  IconCategory({
    required this.iconAsset,
    required this.iconLabel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CategoryListScreen(
            category: iconLabel,
          );
        }));
      },
      child: Column(
        children: [
          Image.asset(iconAsset,
              scale: MediaQuery.of(context).size.width <= 600 ? 0.9 : 0.8),
          SizedBox(height: 4),
          Text(
            iconLabel,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
          )
        ],
      ),
    );
  }
}
