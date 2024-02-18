import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar(
      {super.key,
      required this.selectedIndex,
      required this.onDestinationSelected});
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      // labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      destinations: <Widget>[
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.payment),
          label: 'Transaction',
        ),
        NavigationDestination(
          icon: Icon(Icons.bar_chart),
          label: 'Stats',
        ),
        NavigationDestination(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
    );
  }
}
