import 'dart:io';

class Item {
  List<File> images;
  String title;
  String body;
  bool favorite;

  Item({
    required this.images,
    required this.title,
    required this.body,
    required this.favorite,
  });
}
