class Tile {
  final String title;
  final String imagePath;
  final double price;

  Tile({this.title = '', this.imagePath = '', this.price = 0});

  static List<Tile> getAllTiles() {
    return <Tile>[
      Tile(
        title: 'Tile 1',
        imagePath: 'assets/images/tiles/tiles1.jpg',
        price: 540,
      ),
      Tile(
        title: 'Tile 2',
        imagePath: 'assets/images/tiles/tiles2.jpg',
        price: 290,
      ),
      Tile(
        title: 'Tile 3',
        imagePath: 'assets/images/tiles/tiles3.jpg',
        price: 680,
      ),
      Tile(
        title: 'Tile 4',
        imagePath: 'assets/images/tiles/tiles4.jpg',
        price: 450,
      ),
      Tile(
        title: 'Tile 5',
        imagePath: 'assets/images/tiles/tiles5.jpg',
        price: 320,
      ),
      Tile(
        title: 'Tile 6',
        imagePath: 'assets/images/tiles/tiles6.jpg',
        price: 225,
      ),
      Tile(
        title: 'Tile 7',
        imagePath: 'assets/images/tiles/tiles7.jpg',
        price: 300,
      ),
      Tile(
        title: 'Tile 8',
        imagePath: 'assets/images/tiles/tiles8.jpg',
        price: 700,
      ),
    ];
  }
}
