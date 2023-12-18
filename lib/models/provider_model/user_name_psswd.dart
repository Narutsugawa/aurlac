import 'package:flutter/material.dart';

class UserNameAndPsswd with ChangeNotifier {
  String userName;
  String secretword;

  UserNameAndPsswd({this.userName = '', this.secretword = ''});
}
