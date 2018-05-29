class HomeCardData {
  String title;
  String pic;

  HomeCardData({this.title, this.pic});
}

class DataListBuilder {
  List<HomeCardData> cardList = new List<HomeCardData>();
  List<HomeCardData> emptyList = new List<HomeCardData>();
  HomeCardData card1 = new HomeCardData(
    title: 'Salad',
    pic: 'assets/salad.jpeg',
  );
  HomeCardData card2 = new HomeCardData(
    title: 'Health',
    pic: 'assets/health.jpeg',
  );
  HomeCardData card3 = new HomeCardData(
    title: 'Work',
    pic: 'assets/work.jpeg',
  );
  HomeCardData card4 = new HomeCardData(
    title: 'Shopping',
    pic: 'assets/shopping.png',
  );
  HomeCardData card5 = new HomeCardData(
    title: 'Travel',
    pic: 'assets/travel.jpg',
  );
  HomeCardData card6 = new HomeCardData(
    title: 'Nothing Found',
    pic: '',
  );

  DataListBuilder() {
    cardList.add(card1);
    cardList.add(card2);
    cardList.add(card3);
    cardList.add(card4);
    cardList.add(card5);
    cardList.add(card1);
    cardList.add(card2);
    cardList.add(card3);
    cardList.add(card4);
    cardList.add(card5);
    emptyList.add(card6);
  }
}
