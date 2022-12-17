import 'package:flutter/cupertino.dart';

class ProviderData extends ChangeNotifier {
  List<String> _imgUrls = [];
  Size _screenSize = Size.zero;
  bool _isDragging = false;
  Offset _position = Offset.zero;
  double _angle = 0;

  List<String> get imgUrls => _imgUrls;

  Offset get position => _position;

  bool get isDragging => _isDragging;

  Size get screenSize => _screenSize;

  double get angle => _angle;

  ProviderData() {
    resetPictures();
  }

  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;
    final x = _position.dx;
    _angle = 45 * x / _screenSize.width;
    notifyListeners();
  }

  void updateScreenSize(Size size) {
    _screenSize = size;
    notifyListeners();
  }

  void endPosition() {
    resetPosition();
  }

  void startPosition(DragStartDetails position) {
    _isDragging = true;
    notifyListeners();
  }

  void resetPosition() {
    _position = Offset.zero;
    _isDragging = false;
    _angle = 0;
    notifyListeners();
  }

  void resetPictures() {
    _imgUrls = [
      'images/a.jpg',
      'images/c.jpg',
      'images/e.jpg',
      'images/f.jpg',
      'images/h.jpg',
      'images/i.jpg',
      'images/j.jpg',
      'images/k.jpg',
      'images/l.jpg',
      'images/m.jpg',
      'images/o.jpg',
      'images/p.jpg',
      'images/q.jpg',
      'images/r.jpg',
    ].reversed.toList();
    notifyListeners();
  }
}
