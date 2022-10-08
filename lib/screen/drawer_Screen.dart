// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      width: MediaQuery.of(context).size.width * 0.7,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Center(
                  child: Column(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage("assets/images/image.jpg"),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle),
                  ),
                  SizedBox(height: 5),
                  Text("Shubham Sharma"),
                  SizedBox(height: 5),
                  Text("shubhamsharma706568@gmail.com"),
                ],
              )),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.black),
              title: const Text(
                "Profile",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.black),
              title: const Text(
                "Settings",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.logout_rounded,
                color: Colors.black,
              ),
              title: Text("Sign Out",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
              onTap: () {},
            ),
            AboutListTile(
              icon: Icon(Icons.info_rounded, color: Colors.black),
              applicationIcon: Icon(Icons.local_play, color: Colors.black),
              applicationName: "My Wallet",
              applicationVersion: '1.0.25',
              applicationLegalese: '© 2022 Company',
              child: Text("About App"),
            ),
          ],
        ),
      ),
    );
  }
}
