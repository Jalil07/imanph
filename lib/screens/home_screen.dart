import 'package:flutter/material.dart';

import '../data/menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return _profile();
                },
              ),
            ),
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Services',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Colors.black45),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: getMenuItems().length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return _menu(
                    context,
                    index,
                    getMenuItems()[index].title,
                    getMenuItems()[index].imagePath,
                    getMenuItems()[index].categoryNumber,
                  );
                },
              ),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  CircleAvatar _profile() {
    return CircleAvatar(
      radius: 40,
      backgroundColor: Colors.lightGreen,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: ClipOval(
          child: AspectRatio(
            aspectRatio: 1.0,
            child: Image.asset(
              'assets/images/user.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

Container _menu(BuildContext context, int index, String title, String imagePath, String categoryNumber) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black,
          blurRadius: 0.3,
          offset: Offset(0, 0),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 4,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}


AppBar _appBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: const Row(
      children: [
        Text(
          'Iman',
          style: TextStyle(
            color: Colors.lightGreen,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        Text(
          'Ph',
          style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins'),
        )
      ],
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.all(15.0),
        child: Icon(
          Icons.menu,
          color: Colors.black,
        ),
      ),
    ],
  );
}
