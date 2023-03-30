import 'package:flutter/material.dart';

class FlagsProvider with ChangeNotifier
{

  bool _flagListPost = false;
  getflagListPost() => this._flagListPost;
  setflagListPost(){
    this._flagListPost = !_flagListPost;
    notifyListeners();
  }

  bool _flagListEvent = false;
  getflagListEvent() => this._flagListEvent;
  setflagListEvent(){
    this._flagListEvent = !_flagListEvent;
    notifyListeners();
  }
}

