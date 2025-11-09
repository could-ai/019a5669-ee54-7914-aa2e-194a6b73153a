import 'package:couldai_user_app/screens/my_mail_page.dart';
import 'package:couldai_user_app/screens/scrapz_page.dart';
import 'package:couldai_user_app/screens/settings_page.dart';
import 'package:couldai_user_app/screens/sudonimz_page.dart';
import 'package:couldai_user_app/state/app_state.dart';
import 'package:couldai_user_app/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Sidebar(),
          const VerticalDivider(width: 1, thickness: 1),
          Expanded(
            child: Column(
              children: [
                _buildAddressBar(context),
                Expanded(
                  child: _buildMainContent(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressBar(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        border: Border(
          bottom: BorderSide(color: theme.colorScheme.onBackground.withOpacity(0.5), width: 1),
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Enter a URL or search...',
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(color: theme.colorScheme.onBackground),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(color: theme.colorScheme.secondary, width: 2),
          ),
        ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    switch (appState.selectedScreen) {
      case AppScreen.scrapz:
        return const ScrapzPage();
      case AppScreen.sudonimz:
        return const SudonimzPage();
      case AppScreen.myMail:
        return const MyMailPage();
      case AppScreen.settings:
        return const SettingsPage();
      default:
        return const ScrapzPage();
    }
  }
}
