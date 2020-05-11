class HotelListData {
  HotelListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.dist = 1.8,
    this.reviews = 80,
    this.rating = 4.5,
    this.perNight = "",
  });

  String imagePath;
  String titleTxt;
  String subTxt;
  double dist;
  double rating;
  int reviews;
  String perNight;

  static List<HotelListData> hotelList = <HotelListData>[
    HotelListData(
      imagePath: 'assets/hotel/strudel.png',
      titleTxt: 'Strudel',
      subTxt: 'Malang, Jawa Timur',
      dist: 2.0,
      reviews: 80,
      rating: 4.4,
      perNight: '30.000',
    ),
    HotelListData(
      imagePath: 'assets/hotel/keripik_tempe.png',
      titleTxt: 'Keripik Tempe',
      subTxt: 'Malang, Jawa Timur',
      dist: 4.0,
      reviews: 74,
      rating: 4.5,
      perNight: '25.000',
    ),
    HotelListData(
      imagePath: 'assets/hotel/bakso_malang.png',
      titleTxt: 'Bakso Sapi Malang',
      subTxt: 'Malang, Jawa Timur',
      dist: 3.0,
      reviews: 62,
      rating: 4.0,
      perNight: '40.000',
    ),
    HotelListData(
      imagePath: 'assets/hotel/apel_malang.png',
      titleTxt: 'Apel Malang',
      subTxt: 'Malang, Jawa Timur',
      dist: 7.0,
      reviews: 90,
      rating: 4.4,
      perNight: '60.000',
    ),
    HotelListData(
      imagePath: 'assets/hotel/kaos_malang.png',
      titleTxt: 'Kaos Malang',
      subTxt: 'Malang, Indonesia',
      dist: 2.0,
      reviews: 240,
      rating: 4.5,
      perNight: '75.000',
    ),
  ];
}
