import 'package:chat/core/services/notification/chat_notification_service.dart';
import 'package:chat/pages/auth_or_app_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatNotificationService(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.blue,
            secondary: Colors.red,
            tertiary: Colors.green,
            error: Colors.red,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blueAccent,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            actionsIconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: const AuthOrAppPage(),
      ),
    );
  }
}
