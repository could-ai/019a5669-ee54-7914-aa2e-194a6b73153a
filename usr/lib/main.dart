import 'package:couldai_user_app/app.dart';
import 'package:couldai_user_app/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const BumBrowserApp(),
    ),
  );
}
