import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
                backgroundImage: AssetImage('assets/images/Erick.jpeg'),
                radius: 130),
            Text(
              "\n Name: Erick Contreras",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Username: Erikbk",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Cel: 3053715327",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Email: Erick.work@outlook.es",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
