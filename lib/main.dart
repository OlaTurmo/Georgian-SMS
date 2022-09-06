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
  String result = "";
  void data() async {
    String gfg = sms;
    setState(() {
      result = gfg.replaceAll("TS", "ც");

      result = gfg.replaceAll("ts", "ც");

      result = gfg.replaceAll("w", "ვ");

      result = gfg.replaceAll("a", "ა");

      result = gfg.replaceAll("b", "ბ");

      result = gfg.replaceAll("g", "გ");

      result = gfg.replaceAll("d", "დ");

      result = gfg.replaceAll("e", "ე");

      result = gfg.replaceAll("v", "ვ");

      result = gfg.replaceAll("z", "ზ");

      result = gfg.replaceAll("t", "თ");

      result = gfg.replaceAll("i", "ი");

      result = gfg.replaceAll("kʼ", "კ");

      result = gfg.replaceAll("l", "ლ");

      result = gfg.replaceAll("m", "მ");

      result = gfg.replaceAll("n", "ნ");

      result = gfg.replaceAll("o", "ო");

      result = gfg.replaceAll("pʼ", "პ");

      result = gfg.replaceAll("zh", "ჟ");

      result = gfg.replaceAll("r", "რ");

      result = gfg.replaceAll("s", "ს");

      result = gfg.replaceAll("tʼ", "ტ");

      result = gfg.replaceAll("u", "უ");

      result = gfg.replaceAll("p", "ფ");

      result = gfg.replaceAll("k", "ქ");

      result = gfg.replaceAll("gh", "ღ");

      result = gfg.replaceAll("qʼ", "ყ");

      result = gfg.replaceAll("sh", "შ");

      result = gfg.replaceAll("ch", "ჩ");

      result = gfg.replaceAll("dz", "ძ");

      result = gfg.replaceAll("tsʼ", "წ");

      result = gfg.replaceAll("chʼ", "ჭ");

      result = gfg.replaceAll("kh", "ხ");

      result = gfg.replaceAll("j", "ჯ");

      result = gfg.replaceAll("h", "ჰ");
    });

    final translator = GoogleTranslator();

    // Passing the translation to a variable
    Translation trans =
        await translator.translate(result, from: 'ka', to: 'en');
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
          child: translation == null
              ? const CircularProgressIndicator()
              : Column(
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
                          style:
                              const TextStyle(fontSize: 18, color: Colors.blue),
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
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.blue),
                              )
                            : SizedBox.fromSize()
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
