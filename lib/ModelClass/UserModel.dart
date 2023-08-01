import 'package:flutter/material.dart';
class UserModel{
  String _username;
  String _url;
  String _background;
  UserModel(this._username, this._url,this._background);

  String get url => _url;

  String get background => _background;

  set background(String value) {
    _background = value;
  }

  set url(String value) {
    _url = value;
  }

  String get username => _username;

  set username(String value) {
    _username = value;
  }
}