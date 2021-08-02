class TailorList {
  final String name;
  final double rating;
  final int price;
  final String profileAsset;
  final String backgroundAsset;

  TailorList({
    required this.name,
    required this.rating,
    required this.price,
    required this.profileAsset,
    required this.backgroundAsset,
  });
}

var tailorList = [
  TailorList(
    name: 'Sarah Market',
    rating: 4.5,
    price: 150000,
    profileAsset: 'assets/images/penjahit1.jpg',
    backgroundAsset: 'assets/images/backgroundTailor.jpg',
  ),
  TailorList(
    name: 'Omah Jahit',
    price: 100000,
    rating: 4.6,
    profileAsset: 'assets/images/penjahit2.jpg',
    backgroundAsset: 'assets/images/backgroundTailor.jpg',
  ),
  TailorList(
    name: 'Miftah Store',
    price: 200000,
    rating: 4.6,
    profileAsset: 'assets/images/penjahit3.jpg',
    backgroundAsset: 'assets/images/backgroundTailor.jpg',
  ),
  TailorList(
    name: 'Alfan Boutique',
    price: 500000,
    rating: 4.1,
    profileAsset: 'assets/images/penjahit4.jpg',
    backgroundAsset: 'assets/images/backgroundTailor.jpg',
  ),
  TailorList(
    name: 'Tailor Moon',
    price: 500000,
    rating: 4.3,
    profileAsset: 'assets/images/penjahit5.jpg',
    backgroundAsset: 'assets/images/backgroundTailor.jpg',
  ),
  TailorList(
    name: 'Baju Bila',
    price: 500000,
    rating: 4.3,
    profileAsset: 'assets/images/penjahit6.jpg',
    backgroundAsset: 'assets/images/backgroundTailor.jpg',
  ),
  TailorList(
    name: 'Opah Jahit',
    price: 500000,
    rating: 4.3,
    profileAsset: 'assets/images/penjahit7.jpg',
    backgroundAsset: 'assets/images/backgroundTailor.jpg',
  ),
];
