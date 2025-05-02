import 'dart:io';

import 'package:flutter/material.dart';
import 'package:section/dashboard.dart';
import 'package:section/items/item.dart';
import 'package:section/items/itemmodel.dart';
import 'package:section/items/itemmodel.dart';
import 'package:section/items/itemmodel.dart';
import 'package:section/profile/profile.dart';
import 'package:section/main.dart';
import 'package:section/details/details.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'itemmodel.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  TextEditingController title = TextEditingController();

  TextEditingController body = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/download.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<Itemmodel>(
                builder: (context, Itemmodel, child) => ListView(
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    Itemmodel.selectedimage!.isEmpty
                        ? Container(
                            color: Colors.white38,
                            height: 150,
                            width: MediaQuery.sizeOf(context).width - 20,
                            child: IconButton(
                              onPressed: () {
                                Itemmodel.imageselector();
                              },
                              icon: Icon(Icons.camera_alt),
                            ),
                          )
                        : Row(
                            children: [
                              Container(
                                color: Colors.white38,
                                height: 100,
                                width: 100,
                                child: IconButton(
                                  onPressed: () {
                                    Itemmodel.imageselector();
                                  },
                                  icon: Icon(Icons.camera_alt),
                                ),
                              ),
                              SizedBox(
                                height: 100,
                                width: MediaQuery.sizeOf(context).width - 120,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: Itemmodel.selectedimage!
                                      .map((toElement) => Stack(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                child: Image.file(
                                                  toElement,
                                                  height: 100,
                                                  width: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    Itemmodel.removeimage(
                                                        Itemmodel.selectedimage!
                                                            .indexOf(
                                                                toElement));
                                                  },
                                                  icon: Icon(Icons.cancel))
                                            ],
                                          ))
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: title,
                      decoration: InputDecoration(
                          hintText: "Title",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: body,
                      maxLines: 5,
                      decoration: InputDecoration(
                          hintText: "Body",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    FloatingActionButton(onPressed: () {
                      final item = Provider.of(context, listen: false);
                      item.additem(Item(
                          title: title.text,
                          body: body.text,
                          images: List.from(item.selectedimage!),
                          favorite: false));
                      item.selectedimage!.clear();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Dashboard()));
                    })
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
