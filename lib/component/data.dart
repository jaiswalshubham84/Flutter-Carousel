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
    pic: 'assets/1.jpeg',
  );
  HomeCardData card2 = new HomeCardData(
    title: 'Health',
    pic: 'assets/2.jpeg',
  );
  HomeCardData card3 = new HomeCardData(
    title: 'Work',
    pic: 'assets/3.jpeg',
  );
  HomeCardData card4 = new HomeCardData(
    title: 'Shopping',
    pic: 'assets/4.jpeg',
  );
  HomeCardData card5 = new HomeCardData(
    title: 'Travel',
    pic: 'assets/5.jpeg',
  );
  HomeCardData card6 = new HomeCardData(
    title: 'Travel',
    pic: 'assets/6.jpeg',
  );
  HomeCardData card7 = new HomeCardData(
    title: 'Travel',
    pic: 'assets/7.jpeg',
  );
  HomeCardData card8 = new HomeCardData(
    title: 'Travel',
    pic: 'assets/8.jpeg',
  );
  HomeCardData card9 = new HomeCardData(
    title: 'Travel',
    pic: 'assets/9.jpeg',
  );
  HomeCardData card10 = new HomeCardData(
    title: 'Travel',
    pic: 'assets/10.jpeg',
  );

  DataListBuilder() {
    cardList.add(card1);
    cardList.add(card2);
    cardList.add(card3);
    cardList.add(card4);
    cardList.add(card5);
    cardList.add(card6);
    cardList.add(card7);
    cardList.add(card8);
    cardList.add(card9);
    cardList.add(card10);
  }
}
