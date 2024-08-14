import 'package:flutter/material.dart';
import 'package:quran/pages/login_page.dart';
import 'pages/surat_list_page.dart';
import 'pages/surat_detail_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'quran',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/list-surat': (context) => const SuratListPage(),
        '/detail': (context) {
          final int nomor = ModalRoute.of(context)!.settings.arguments as int;
          return SuratDetailPage(nomor: nomor);
        },
      },
    );
  }
}
