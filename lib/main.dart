import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/db/functions/db_functions.dart';
import 'package:notes/db/model/data_model.dart';
import 'screensplash.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(FileDataAdapter().typeId)){
    Hive.registerAdapter(FileDataAdapter());
  }
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getallFiles();
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blueAccent),
      home: ScreenSplash()
    );
  }
}
