/// CSC422 course project
/// ICIW
/// Version: 1.5
/// Author: Dpha Tariq - 2015/13243
/// Date: Aug-Sep, 2020

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'screens/add_diary.dart';
import 'screens/biopage.dart';
import 'screens/homepage.dart';
import 'screens/quotd.dart';
import 'screens/meds.dart';
import 'screens/settings.dart';
import 'screens/chat.dart';
import 'screens/contact_dr.dart';
import 'screens/mood.dart';
import 'screens/mylogs.dart';
import 'screens/login.dart';
import 'providers/diarylist.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ICIW_14());
}

// ignore: camel_case_types
class ICIW_14 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DiaryList>(
        create: (context) => DiaryList(),
        child: MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (ctx) => MYHomepage(),
            MyBio.routeName: (ctx) => MyBio(),
            MyDiary.routeName: (ctx) => MyDiary(),
            MyChat.routeName: (ctx) => MyChat(),
            Mymoods.routeName: (ctx) => Mymoods(),
            MyQuotes.routeName: (ctx) => MyQuotes(),
            ContactDr.routeName: (ctx) => ContactDr(),
            MyMeds.routeName: (ctx) => MyMeds(),
            SettingS.routeName: (ctx) => SettingS(),
            Mylogs.routeName: (ctx) => Mylogs(),
            LoginPage.routeName: (ctx) => LoginPage(),
          },
          debugShowCheckedModeBanner: false,
        ));
  }
}
