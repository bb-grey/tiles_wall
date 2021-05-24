import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiles_wall/constants.dart';
import 'package:tiles_wall/models/tile.dart';

class TestTileScreen extends StatefulWidget {
  static const String routeName = '/test_tiles';

  @override
  _TestTileScreenState createState() => _TestTileScreenState();
}

class _TestTileScreenState extends State<TestTileScreen> {
  File? _image;
  final picker = ImagePicker();
  String _imagePath = '';

  List<double> _tileTops = <double>[];
  List<double> _tileLefts = <double>[];
  List<String> _movableImagesPath = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          kAppTitle,
        ),
        actions: _getNavbarActions(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    child: _image != null
                        ? Center(
                            child: Image.file(
                              _image!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Center(
                            child: Text('Not Image Selected!'),
                          ),
                  ),
                  _movableImagesPath.length == 0
                      ? Text('')
                      : Container(
                          child: Stack(
                            children: List.generate(_movableImagesPath.length,
                                (index) {
                              return GestureDetector(
                                onVerticalDragUpdate: (dd) {
                                  setState(() {
                                    _tileTops[index] = dd.localPosition.dy;
                                    _tileLefts[index] = dd.localPosition.dx;
                                  });
                                },
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: _tileTops[index],
                                      left: _tileLefts[index],
                                      child: _imagePath.isEmpty
                                          ? Container()
                                          : Image.asset(
                                              _movableImagesPath[index],
                                              width: 90.0,
                                            ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                ],
              ),
            ),
            Container(
              height: 160.0,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.black12,
                    width: 3.0,
                  ),
                ),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Tile.getAllTiles().length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _imagePath = Tile.getAllTiles()[index].imagePath;
                        _movableImagesPath.add(_imagePath);
                        _tileTops.add(0.0);
                        _tileLefts.add(0.0);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(kDefaultPadding / 2.0),
                      child: Image.asset(Tile.getAllTiles()[index].imagePath),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _captureImage() async {
    final pickedImage = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        Fluttertoast.showToast(
            msg: "No Image Captured",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            fontSize: 16.0);
      }
    });
  }

  void _uploadImage() async {
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        Fluttertoast.showToast(
            msg: "No Image Captured",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            fontSize: 16.0);
      }
    });
  }

  List<Widget> _getNavbarActions() {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: kDefaultPadding),
        child: GestureDetector(
          onTap: _captureImage,
          child: Icon(Icons.camera),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: kDefaultPadding),
        child: GestureDetector(
          onTap: _uploadImage,
          child: Icon(Icons.upload_file),
        ),
      ),
    ];
  }
}

// GestureDetector(
//                           onVerticalDragUpdate: (dd) {
//                             setState(() {
//                               _tileTop = dd.localPosition.dy;
//                               _tileLeft = dd.localPosition.dx;
//                             });
//                           },
//                           child: Stack(
//                             children: [
//                               Positioned(
//                                 top: _tileTop,
//                                 left: _tileLeft,
//                                 child: _imagePath.isEmpty
//                                     ? Container()
//                                     : Image.asset(
//                                         _imagePath,
//                                         width: 90.0,
//                                       ),
//                               ),
//                             ],
//                           ),
//                         )
