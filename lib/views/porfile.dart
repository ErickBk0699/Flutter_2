import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final double coverHeight = 180;
    final double profileHeight = 144;

    return Scaffold(
      body: ListView(padding: EdgeInsets.zero, children: <Widget>[
        buildTop(coverHeight, profileHeight),
        buildName()
      ]),
    );
  }

  Widget buildName() => Center(
        child: Card(
            elevation: 2,
            child: SizedBox(
              width: 350,
              child: Column(children: const [
                Text('\n User Data',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                Text('\n Name:  Daniel',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 20)),
                Text('\n Last Name : Monsalve Jaraba',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 20)),
                Text('\n e-Mail : daniel@gmail.com',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 20)),
                Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text('\n Telephone : 3114587899',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 20)),
                ),
              ]),
            )),
      );

  Widget buildTop(coverHeight, profileHeight) {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            child: buildCoverImage(coverHeight),
            margin: EdgeInsets.only(bottom: bottom),
          ),
          Positioned(
            top: top,
            child: buildProfileImage(profileHeight),
          ),

          //const SizedBox(height:24),
          //buildName(user),
        ]);
  }

  Widget buildCoverImage(height) => Container(
      color: Colors.grey,
      child: Image.network(
          'https://www.aoe.com/fileadmin/AOE.com/Images/main_navigation/insights/Fotolia_58569245_Software_Development_930_590_70.jpg',
          width: double.infinity,
          height: height,
          fit: BoxFit.cover));

  Widget buildProfileImage(height) => CircleAvatar(
        backgroundColor: Colors.white,
        radius: height / 2,
        foregroundColor: Colors.grey,
        child: const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://mysuenos.com/wp-content/uploads/2019/10/joven.jpg'),
          radius: 65,
        ),
      );
}
