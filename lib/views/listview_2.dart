import 'package:flutter/material.dart';

class ListView2 extends StatelessWidget {
  const ListView2({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _games = const [
    {
      "image":
          'https://www.lavanguardia.com/files/og_thumbnail/uploads/2021/09/02/6130d99519f60.png',
      "name": 'Roblox',
    },
    {
      "image":
          'https://articles-images.sftcdn.net/wp-content/uploads/sites/2/2015/10/silent1.jpg',
      "name": 'Silent Hills',
    },
    {
      "image":
          'https://media.vandal.net/i/1200x630/11-2021/2021111012201145_1.jpg',
      "name": 'Forza Horizon 5',
    },
    {
      "image":
          'https://compass-ssl.xbox.com/assets/9c/94/9c944d9c-7ef1-4b46-9f68-9b02966d3993.jpg?n=Halo-Infinite_GLP-Page-Hero-0_1083x609.jpg',
      "name": 'Halo Infinite',
    },
    {
      "image":
          'https://compass-ssl.xbox.com/assets/9c/94/9c944d9c-7ef1-4b46-9f68-9b02966d3993.jpg?n=Halo-Infinite_GLP-Page-Hero-0_1083x609.jpg',
      "name": 'Halo Infinite',
    },
    {
      "image":
          'https://articles-images.sftcdn.net/wp-content/uploads/sites/2/2015/10/silent1.jpg',
      "name": 'Silent Hills',
    },
    {
      "image":
          'https://media.vandal.net/i/1200x630/11-2021/2021111012201145_1.jpg',
      "name": 'Forza Horizon 5',
    },
    {
      "image":
          'https://cloudfront-us-east-1.images.arcpublishing.com/infobae/CNTWUAMXZRF3BPIYPCNPFHOMJQ.jpg',
      "name": 'League of Legends',
    },
    {
      "image":
          'https://compass-ssl.xbox.com/assets/9c/94/9c944d9c-7ef1-4b46-9f68-9b02966d3993.jpg?n=Halo-Infinite_GLP-Page-Hero-0_1083x609.jpg',
      "name": 'Halo Infinite',
    },
  ];

  void openAlertDialog(BuildContext context, String info) {
    AlertDialog alert =
        AlertDialog(title: Text(info), content: Text(info), actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('OK'),
      )
    ]);
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _createList(),
      ),
    );
  }

  Widget _createList() {
    return ListView.builder(
      itemCount: _games.length,
      itemBuilder: (BuildContext context, int index) {
        return CardElement(
            name: (_games[index]["name"]!), image: (_games[index]["image"]!));
      },
    );
  }
}

class CardElement extends StatelessWidget {
  final String name;
  final String image;
  const CardElement({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
            elevation: 4,
            //color: Theme.of(context).colorScheme.surfaceVariant,
            color: const Color.fromARGB(255, 234, 240, 240),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: [
                  CircleAvatar(
                    backgroundImage: Image.network(image).image,
                    maxRadius: 30,
                  ),
                ]),
                Column(children: [
                  const SizedBox(
                    width: 80,
                    child: Text("Name: ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 5, 5, 5),
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ),
                  SizedBox(child: Text(name, textAlign: TextAlign.center)),
                ]),
                Column(children: const [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: Icon(
                      Icons.arrow_right_alt,
                      color: Color.fromARGB(255, 177, 190, 197),
                      size: 40,
                    ),
                  )
                ]),
              ],
            )));
  }
}
