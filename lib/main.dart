import 'package:flutter/material.dart';
import 'views/auth/login_screen.dart';
import 'views/community/photo_list_screen.dart';
import 'views/company_profile/company_profile_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fotografer.net',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/photos': (context) => PhotoListScreen(),
        '/companyProfile': (context) => CompanyProfileScreen(),
      },
    );
  }
}
