import 'dart:io';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:section/items/itemmodel.dart';
import 'package:section/profile/profile.dart';
import 'package:section/user/user_model.dart';

class Second extends StatefulWidget {
  // final String? title;
  // final String? body;
  // final List<File>? image;

  const Second(
      {
      // this.image, this.title, this.body,

      super.key});

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  Color _favoriteIconColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    final image = Provider.of<UserModel>(context).user?.image;
    final items = Provider.of<Itemmodel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("${items.selecteditem?.title ?? "tree"}"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: image == null
                ? Icon(Icons.person)
                : CircleAvatar(
                    child: ClipOval(
                      child: Image.file(image,
                          height: 50, width: 50, fit: BoxFit.cover),
                    ),
                  ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Profile();
              }));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: [
                // widget.image == null || widget.image!.isEmpty
                //     ? Image.asset(
                //         "assets/OIP.jpeg",
                //         fit: BoxFit.cover,
                //         width: double.infinity,
                //       )
                Image.file(
                  items.selecteditem!.images.first,
                  fit: BoxFit.cover,
                  height: 300,
                  width: double.infinity,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 310,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _favoriteIconColor = _favoriteIconColor == Colors.grey
                              ? Colors.red
                              : Colors.grey;
                        });
                      },
                      child: Icon(
                        Icons.favorite,
                        color: _favoriteIconColor,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(Icons.share),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${items.selecteditem?.body ?? "body"}"),
                ),
                // widget.image == null || widget.image!.isEmpty
                //     ? Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         children: [])
                SizedBox(
                  height: 500,
                  child: GridView.builder(
                      itemCount: items.selecteditem?.images!.length,
                      itemBuilder: (context, index) => Image.file(
                            items.selecteditem!.images[index],
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
