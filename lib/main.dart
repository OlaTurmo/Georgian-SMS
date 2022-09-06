import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:access_incoming_sms/platform_channel.dart';
import 'package:access_incoming_sms/src/google_translator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String sms = 'No sms';

  @override
  void initState() {
    super.initState();

    getPermission().then((value) {
      if (value) {
        PlatformChannel().smsStream().listen((event) {
          sms = event;
          data();
          setState(() {});
        });
      }
    });
    data();
  }

  Future<bool> getPermission() async {
    if (await Permission.sms.status == PermissionStatus.granted) {
      return true;
    } else {
      if (await Permission.sms.request() == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  Translation? translation;
  void data() async {
    String gfg = sms;

    final translator = GoogleTranslator();

    // Passing the translation to a variable
    Translation trans = await translator.translate(gfg, from: 'ka', to: 'en');
    setState(() {
      translation = trans;
    });
    // You can also call the extension method directly on the input
    // print('Translated: ${await input.translate(to: 'en')}');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('SMS Reader')),
          backgroundColor: const Color(0xff343351),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox.fromSize(),
              Column(
                children: [
                  const Text(
                    'Incoming message:',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff343351)),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    sms,
                    style: const TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const Text(
                    "Translated message:",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff343351)),
                  ),
                  const SizedBox(height: 18),
                  translation != null
                      ? Text(
                          translation!.text.toString(),
                          style:
                              const TextStyle(fontSize: 18, color: Colors.blue),
                        )
                      : Text(
                          sms,
                          style:
                              const TextStyle(fontSize: 18, color: Colors.blue),
                        ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Based on access_incoming_sms Copyright (c) 2022 Gülsen Keskin',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
