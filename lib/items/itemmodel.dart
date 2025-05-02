import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:section/items/item.dart';

class Itemmodel extends ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;

  void additem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  ImagePicker imagePicker = ImagePicker();

  List<File>? selectedimage = [];

  Future<void> imageselector() async {
    List<XFile>? images = await imagePicker.pickMultiImage();
    selectedimage!
        .addAll(images.map((toElement) => File(toElement!.path)).toList());
      notifyListeners();
  }

  void removeimage(index) {
    selectedimage!.removeAt(index);

    notifyListeners();
  }

  Item? _selecteditem;
  Item? get selecteditem => _selecteditem;

  selectitem(Item item) {
    _selecteditem = item;
    notifyListeners();
  }
}
