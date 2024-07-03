import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/user/user.dart';
import 'package:flutter_application_1/screens/sortie/sortie.dart';
import 'package:flutter_application_1/screens/Profil/profile_screen.dart';
import 'package:flutter_application_1/screens/bar%20chart/bar_charts.dart';
import 'package:flutter_application_1/screens/plussortie.dart';



class HomeWrapper extends StatefulWidget {
  const HomeWrapper({Key? key}) : super(key: key);

  @override
  _HomeWrapperState createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sort_sharp),
              label: 'Sortie',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'New',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'users',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_sharp),
              label: 'Profile',
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
          },
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (context) {
                  return const CupertinoPageScaffold(
                    child: BarCharts(),
                  );
                },
              );
            case 1:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                    child: SortiePage1(),
                  );
                },
              );
              case 2:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                    child: WillayaPage(),
                  );
                },
              );
              case 3:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                    child: userPage(),
                  );
                },
              );
               case 4:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                    child: ProfileScreen(),
                  );
                },
              );
           
            default:
              return Container();
          }
        },
      ),
    );
  }
}