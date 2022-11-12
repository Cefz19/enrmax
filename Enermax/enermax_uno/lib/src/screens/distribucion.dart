import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../main.dart';
import '../rows_tables/sopor_table_page/sopor_table_page.dart';
import '../rows_tables/widget2/tab_bar_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class Disribucion extends StatelessWidget {
  static const String title = 'Distribucion';

  const Disribucion({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: const MainPage(),
      );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) =>
      TabBarWidget(title: Disribucion.title, tabs: const [
        Tab(icon: Icon(Icons.sort_by_alpha), text: 'Sortable'),
        Tab(icon: Icon(Icons.select_all), text: 'Selectable'),
        Tab(icon: Icon(Icons.edit), text: 'Editable'),
      ], children: [
        const SoporTablePage(),
        Container(),
        Container(),
      ]);
}
