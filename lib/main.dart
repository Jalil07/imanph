import 'package:flutter/material.dart';
import 'package:imanph/screens/clinics_page.dart';
import 'package:imanph/screens/member_page.dart';
import 'package:imanph/screens/rxpad_page.dart';
import 'package:imanph/screens/settings_page.dart';
import 'package:imanph/screens/signup_screen.dart';
import '../screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Iman PH',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    ClinicsPage(),
    MemberPage(),
    RxpadPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        fixedColor: Colors.black45,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black45,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.black45,),
            label: 'Clinics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.black45,),
            label: 'Members',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.paste, size: 22, color: Colors.black45,),
            label: 'Rxpad',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black45,),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'IMAN',
            style: TextStyle(
              color: Colors.lightGreen,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              letterSpacing: 2.5,
            ),
          ),
          Text(
            'PHIL',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              letterSpacing: 2.5,),
          )
        ],
      ),
      actions: [
        IconButton(
          splashRadius: 25,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpScreen()),
            );
          },
          icon: const Icon(
            Icons.login,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
