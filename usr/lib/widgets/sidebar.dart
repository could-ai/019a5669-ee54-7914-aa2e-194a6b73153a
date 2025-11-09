import 'package:couldai_user_app/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final theme = Theme.of(context);

    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        border: Border(
          right: BorderSide(color: theme.colorScheme.onBackground.withOpacity(0.5), width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Bum Browser',
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(height: 1, thickness: 1),
          _buildSidebarItem(
            context,
            title: 'Scrapz',
            icon: Icons.inventory_2_outlined,
            screen: AppScreen.scrapz,
            isSelected: appState.selectedScreen == AppScreen.scrapz,
          ),
          _buildSidebarItem(
            context,
            title: 'Sudonimz',
            icon: Icons.person_outline,
            screen: AppScreen.sudonimz,
            isSelected: appState.selectedScreen == AppScreen.sudonimz,
          ),
          _buildSidebarItem(
            context,
            title: 'My Mail',
            icon: Icons.mail_outline,
            screen: AppScreen.myMail,
            isSelected: appState.selectedScreen == AppScreen.myMail,
          ),
          const Spacer(),
          const Divider(height: 1, thickness: 1),
          _buildSidebarItem(
            context,
            title: 'Settings',
            icon: Icons.settings_outlined,
            screen: AppScreen.settings,
            isSelected: appState.selectedScreen == AppScreen.settings,
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(BuildContext context,
      {required String title,
      required IconData icon,
      required AppScreen screen,
      required bool isSelected}) {
    final theme = Theme.of(context);
    final appState = Provider.of<AppState>(context, listen: false);

    return Material(
      color: isSelected ? theme.colorScheme.onBackground.withOpacity(0.1) : Colors.transparent,
      child: InkWell(
        onTap: () => appState.setSelectedScreen(screen),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: isSelected ? theme.colorScheme.secondary : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          child: Row(
            children: [
              Icon(icon, size: 20),
              const SizedBox(width: 16),
              Text(title, style: theme.textTheme.titleMedium),
            ],
          ),
        ),
      ),
    );
  }
}
