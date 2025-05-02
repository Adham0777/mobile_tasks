import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:section/user/user.dart';

class UserModel extends ChangeNotifier {
  ImagePicker imagePicker = ImagePicker();

  //File? selectedimage;
  User? _user;
  User? get user => _user;

  Future<void> imageselector(ImageSource source) async {
    XFile? image = await imagePicker.pickImage(source: source);
    if (image != null) {
      if (_user == null) {
        _user?.image = File(image!.path);
      } else {
        _user = User(name: "karim", bio: "bio", image: File(image!.path));
      }
      notifyListeners();
    }
  }

  void removeimage() {
    _user?.image = null;
    notifyListeners();
  }
}
