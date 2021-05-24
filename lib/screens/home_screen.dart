// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tiles_wall/constants.dart';
import 'package:tiles_wall/models/slider_image.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tiles Wall'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: ImagesSlider(),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  Container(
                    color: Colors.blue,
                  ),
                  Container(color: Colors.red),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImagesSlider extends StatefulWidget {
  @override
  _ImagesSliderState createState() => _ImagesSliderState();
}

class _ImagesSliderState extends State<ImagesSlider> {
  final List<Widget> imageSliders = SliderImage.getSliderImages()
      .map(
        (item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.asset(item.imagePath!,
                      fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        item.title!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
      .toList();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: imageSliders,
          ),
        ],
      ),
    );
  }
}
