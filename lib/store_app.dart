import 'package:flutter/material.dart';
import 'package:store_app/core/app/connectivity_controller.dart';
import 'package:store_app/core/common/screens/no_network_screen.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) {
        if (value) {
          return MaterialApp(
            title: 'Store ',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
            ),
            builder: (context, widget) {
              return Scaffold(
                body: Builder(
                  builder: (context) {
                    ConnectivityController.instance.init();
                    return widget!;
                  },
                ),
              );
            },
            home: Scaffold(
              appBar: AppBar(
                title: const Text('Store'),
              ),
            ),
          );
        } else {
          return MaterialApp(
            title: 'No Network Screen',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
            ),
            home: const NoNetworkScreen(),
          );
        }
      },
    );
  }
}
