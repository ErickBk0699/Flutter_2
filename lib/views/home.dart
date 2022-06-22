import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    const double coverHeight = 180;
    const double profileHeight = 50;

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
                Text('\n Proyecto Final',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color.fromARGB(255, 87, 199, 255))),
                Text('\n Integrantes:',
                    style: TextStyle(
                        color: Color.fromARGB(255, 20, 44, 110), fontSize: 20)),
                Text('\n Erick Contreras Barrios',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 20)),
                Text('\n Danith Ester Babilonia',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 20)),
                Text('\n Luis Payares Joly',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 20)),
                Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text('\n Gracias!',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 20)),
                ),
              ]),
            )),
      );

  Widget buildTop(coverHeight, profileHeight) {
    final bottom = profileHeight / 2;
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: bottom),
            child: buildCoverImage(coverHeight),
          ),

          //const SizedBox(height:24),
          //buildName(user),
        ]);
  }

  Widget buildCoverImage(height) => Container(
      color: Colors.grey,
      child: Image.network(
          'https://openexpoeurope.com/wp-content/uploads/2019/12/flutter-logo-sharing.png',
          width: double.infinity,
          height: height,
          fit: BoxFit.cover));
}
