import 'package:flutter/material.dart';

import 'package:ultron_screenshot_shield/ultron_screenshot_shield.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    await UltronScreenshotShield.disableScreenshot();
                  },
                  child: const Text('Disable Screenshot')),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await UltronScreenshotShield.enableScreenshot();
                  },
                  child: const Text('Enable Screenshot')),
            ],
          ),
        ),
      ),
    );
  }
}
