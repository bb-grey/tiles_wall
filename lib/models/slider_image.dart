class SliderImage {
  final String? imagePath;
  final String? title;

  SliderImage({this.imagePath, this.title});

  static List<SliderImage> getSliderImages() {
    return <SliderImage>[
      SliderImage(
        imagePath: 'assets/images/slider/slider1.jpeg',
        title: 'Build Your Home',
      ),
      SliderImage(
        imagePath: 'assets/images/slider/slider2.jpeg',
        title: 'Design Your Rooms',
      ),
      SliderImage(
        imagePath: 'assets/images/slider/slider3.jpeg',
        title: 'Design Beautifully',
      ),
    ];
  }
}
