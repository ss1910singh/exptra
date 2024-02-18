import 'package:exptra/widgets/navbar.dart';
import 'package:exptra/screen/home_screen.dart';
import 'package:exptra/screen/login_screen.dart';
import 'package:exptra/screen/profile_screen.dart';
import 'package:exptra/screen/stats_screen.dart';
import 'package:exptra/screen/transaction_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  var isLogoutLoading = false;
  int currentIndex = 0;
  var pageViewList = [
    const HomeScreen(),
    const TransactionScreen(),
    const StatsScreen(),
    const ProfileScreen()
  ];

  logout() async {
    setState(() {
      isLogoutLoading = true;
    });
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginView()));

    setState(() {
      isLogoutLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('TODO: Implement');
        },
        child: Icon(Icons.add),
        shape: CircleBorder(),
        elevation: 0.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      appBar: AppBar(
        title: const Text('Hello'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              showMenu(
                context: context,
                position: const RelativeRect.fromLTRB(100, 100, 0, 0),
                items: [
                  PopupMenuItem(
                    child: ListTile(
                      title: const Text('Home'),
                      leading: const Icon(Icons.home),
                      onTap: () {
                        setState(() {
                          currentIndex = 0;
                        });
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      title: const Text('Transaction'),
                      leading: const Icon(Icons.attach_money),
                      onTap: () {
                        setState(() {
                          currentIndex = 1;
                        });
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      title: const Text('Stats'),
                      leading: const Icon(Icons.bar_chart),
                      onTap: () {
                        setState(() {
                          currentIndex = 2;
                        });
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      title: const Text('Profile'),
                      leading: const Icon(Icons.person),
                      onTap: () {
                        setState(() {
                          currentIndex = 3;
                        });
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      title: const Text('Logout'),
                      leading: const Icon(Icons.exit_to_app),
                      onTap: () {
                        setState(() {
                          isLogoutLoading = true;
                        });
                        logout();
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: pageViewList[currentIndex],
    );
  }
}
