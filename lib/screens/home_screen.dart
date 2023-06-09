import 'package:flutter/material.dart';
import 'package:imanph/screens/create_article.dart';
import 'package:imanph/screens/profile_screen.dart';
import 'package:imanph/screens/rxpad.dart';
import 'package:imanph/screens/signup_screen.dart';

import '../data/menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> data = [
    {
      'title': 'Vision',
      'content': 'A community of Muslim physicians who are competent, compassionate, socially responsive, imbued with Islamic teachings and values, united in the promotion of health and well-being, and highly dedicated to the service of fellow men.',
    },
    {
      'title': 'Mission',
      'content': 'To establish a network of Muslim physicians and form linkages with other groups and associations in both medical and non-medical professions; working towards a healthy and progressive Ummah through education, service, and empowerment for the greater glory of Allah (SWT).',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(height: 25),
            // SizedBox(
            //   height: 60,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: 10,
            //     itemBuilder: (context, index) {
            //       return _profile();
            //     },
            //   ),
            // ),
            // const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Services',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: Colors.black45,
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: getMenuItems().length,
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
             Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Articles',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Colors.black45,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    splashRadius: 25,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CreateArticleScreen()),
                        );
                      },
                      icon: const Icon(Icons.add_box_outlined, color: Colors.black45, size: 30,),),
                ],
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[index]['title']!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        data[index]['content']!,
                        style: const TextStyle(fontSize: 16, fontFamily: 'Poppins',),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                );
              },
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
    height: 150,
    width: 150,
    margin: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      boxShadow: const [
        BoxShadow(
          color: Colors.black,
          blurRadius: 0.3,
          offset: Offset(0, 0),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GestureDetector(
        onTap: () {
          switch (index) {
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (context) => RxPad()));
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (context) => RxPad()));
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (context) => RxPad()));
              break;
            case 3:
              Navigator.push(context, MaterialPageRoute(builder: (context) => RxPad()));
              break;
            case 4:
              Navigator.push(context, MaterialPageRoute(builder: (context) => RxPad()));
              break;
          // Add more cases for other indices/pages
          }
        },
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
    ),
  );
}


