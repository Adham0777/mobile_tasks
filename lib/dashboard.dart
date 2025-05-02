import 'package:flutter/material.dart';
import 'package:section/items/additem.dart';
import 'package:section/items/item.dart';
import 'package:section/items/itemmodel.dart';
import 'package:section/profile/profile.dart';
import 'package:section/details/details.dart';
import 'package:section/user/user_model.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final image = Provider.of<UserModel>(context).user?.image;
    final items = Provider.of<Itemmodel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
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
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Second()));
                items.selectitem(Item(
                    images: items.items[index].images,
                    title: items.items[index].title,
                    favorite: items.items[index].favorite,
                    body: items.items[index].body));
              },
              child: SizedBox(
                child: Column(
                  children: [
                    Image.file(
                      items.items[index].images.first,
                      height: 125,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(items.items[index].title),
                        IconButton.filledTonal(
                            onPressed: () {}, icon: Icon(Icons.edit)),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return First();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
