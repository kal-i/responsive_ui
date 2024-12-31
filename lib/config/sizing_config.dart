import 'package:flutter/cupertino.dart';

class SizingConfig {
  static late double _screenWidth;
  static late double _screenHeight;
  static double _blockSizeHorizontal = 0; // left & right
  static double _blockSizeVertical = 0; // top & bottom

  static late double textMultiplier;
  static late double imageMultiplier;
  static late double heightMultiplier;
  static late double widthMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait){
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (_screenWidth < 500) {
        isMobilePortrait = true;
        print('mobile device');
      } else {
        print('more than a phone');
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    print(orientation);
    print(_screenWidth);
    print(_screenHeight);

    // this will divide the screen into blocks
    // if the screen size is 600, it will have 6 blocks
    _blockSizeHorizontal = _screenWidth / 100;
    _blockSizeVertical = _screenHeight / 100;

    // text should scale with the height of the screen (multiply with the height of the screen)
    textMultiplier = _blockSizeVertical;
    imageMultiplier = _blockSizeHorizontal;
    heightMultiplier = _blockSizeVertical; // for padding top & bottom
    widthMultiplier = _blockSizeHorizontal; // for padding left & right

    print('text: $textMultiplier');
    print('image: $imageMultiplier');
    print('height: $heightMultiplier');
    print('width: $widthMultiplier');
  }
}