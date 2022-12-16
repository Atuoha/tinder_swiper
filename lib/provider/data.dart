import 'package:flutter/cupertino.dart';

class ProviderData extends ChangeNotifier {
  Offset _position = Offset.zero;

  Offset get position => _position;

  void updateUpdatePosition(DragUpdateDetails details) {
    _position += details.delta;
    notifyListeners();
  }

  void updateEndPosition(DragEndDetails details) {
    // _position += details.;
    notifyListeners();
  }

  void updateStartPosition(DragStartDetails position) {
    // _position += position.;
    notifyListeners();
  }
}
