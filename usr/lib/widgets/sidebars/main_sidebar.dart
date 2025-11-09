import 'package:bum_browser_prototype/widgets/sidebars/my_mail_view.dart';
import 'package:bum_browser_prototype/widgets/sidebars/scrapz_view.dart';
import 'package:bum_browser_prototype/widgets/sidebars/sudonimz_view.dart';
import 'package:flutter/material.dart';

class MainSidebar extends StatefulWidget {
  const MainSidebar({super.key});

  @override
  State<MainSidebar> createState() => _MainSidebarState();
}

class _MainSidebarState extends State<MainSidebar> {
  int _selectedIndex = 0;

  Widget _getSelectedView() {
    switch (_selectedIndex) {
      case 0:
        return const SudonimzView();
      case 1:
        return const ScrapzView();
      case 2:
        return const MyMailView();
      default:
        return const SudonimzView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          labelType: NavigationRailLabelType.all,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          indicatorColor: Colors.black.withOpacity(0.1),
          destinations: const <NavigationRailDestination>[
            NavigationRailDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: Text('Sudonimz'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.inventory_2_outlined),
              selectedIcon: Icon(Icons.inventory_2),
              label: Text('Scrapz'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.mail_outline),
              selectedIcon: Icon(Icons.mail),
              label: Text('My Mail'),
            ),
          ],
        ),
        const VerticalDivider(thickness: 1, width: 1),
        SizedBox(
          width: 350,
          child: _getSelectedView(),
        ),
      ],
    );
  }
}
