import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:section/profile/option.dart';
import 'package:provider/provider.dart';
import 'package:section/user/user_model.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(children: [
            SizedBox(height: 80),
            Consumer<UserModel>(builder: (context, UserModel, child) {
              return Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.grey.shade500,
                      child: UserModel.user?.image == null
                          ? Icon(
                              Icons.person,
                              size: 200,
                              color: Colors.grey.shade200,
                            )
                          : ClipOval(
                              child: Image.file(
                                  fit: BoxFit.cover,
                                  height: 200,
                                  width: 200,
                                  UserModel.user!.image!))),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.black,
                    child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                                  child: Column(children: [
                                    Text("profile pic"),
                                    Divider(),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          options(
                                            title: "Camera",
                                            icon: Icons.camera_alt,
                                            onpressed: () {
                                              UserModel.imageselector(
                                                  ImageSource.camera);
                                              Navigator.pop(context);
                                            },
                                          ),
                                          options(
                                              onpressed: () {
                                                UserModel.imageselector(
                                                    ImageSource.gallery);

                                                Navigator.pop(context);
                                              },
                                              title: "Gallery",
                                              icon: Icons.image),
                                          if (UserModel.user?.image != null)
                                            options(
                                                selectedimage:
                                                    UserModel.user?.image,
                                                onpressed: () {
                                                  UserModel.removeimage();
                                                  Navigator.pop(context);
                                                },
                                                title: "Remove",
                                                icon: Icons.delete),
                                        ]),
                                  ]),
                                ));
                      },
                      icon:
                          Icon(Icons.camera_alt, size: 35, color: Colors.grey),
                    ),
                  )
                ],
              );
            })
          ]),
        ));
  }
}
