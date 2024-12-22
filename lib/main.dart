import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_app/core/app/env.variable.dart';
import 'package:store_app/store_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvVariable.instance.init(envType: EnvTypeEnum.dev);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (value) {
      runApp(
        const StoreApp(),
      );
    },
  );
}
