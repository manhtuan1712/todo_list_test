import 'package:flutter/cupertino.dart';
import 'package:todo_list/my_app.dart';

import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}
