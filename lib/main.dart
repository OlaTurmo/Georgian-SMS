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
          
          
              String gfg = "";
    String result = gfg;
    gfg = sms;

    print(gfg.toLowerCase());
    gfg = result;

    result = gfg.replaceAll("TS", "ც");
    gfg = result;

    result = gfg.replaceAll("ts", "ც");
    gfg = result;

    result = gfg.replaceAll("w", "ვ");
    gfg = result;

    result = gfg.replaceAll("a", "ა");
    gfg = result;
    result = gfg.replaceAll("b", "ბ");
    gfg = result;
    result = gfg.replaceAll("g", "გ");
    gfg = result;
    result = gfg.replaceAll("d", "დ");
    gfg = result;
    result = gfg.replaceAll("e", "ე");
    gfg = result;
    result = gfg.replaceAll("v", "ვ");
    gfg = result;
    result = gfg.replaceAll("z", "ზ");
    gfg = result;
    result = gfg.replaceAll("t", "თ");
    gfg = result;
    result = gfg.replaceAll("i", "ი");
    gfg = result;
    result = gfg.replaceAll("kʼ", "კ");
    gfg = result;
    result = gfg.replaceAll("l", "ლ");
    gfg = result;
    result = gfg.replaceAll("m", "მ");
    gfg = result;
    result = gfg.replaceAll("n", "ნ");
    gfg = result;
    result = gfg.replaceAll("o", "ო");
    gfg = result;
    result = gfg.replaceAll("pʼ", "პ");
    gfg = result;
    result = gfg.replaceAll("zh", "ჟ");
    gfg = result;
    result = gfg.replaceAll("r", "რ");
    gfg = result;
    result = gfg.replaceAll("s", "ს");
    gfg = result;
    result = gfg.replaceAll("tʼ", "ტ");
    gfg = result;
    result = gfg.replaceAll("u", "უ");
    gfg = result;
    result = gfg.replaceAll("p", "ფ");
    gfg = result;
    result = gfg.replaceAll("k", "ქ");
    gfg = result;
    result = gfg.replaceAll("gh", "ღ");
    gfg = result;
    result = gfg.replaceAll("qʼ", "ყ");
    gfg = result;
    result = gfg.replaceAll("sh", "შ");
    gfg = result;
    result = gfg.replaceAll("ch", "ჩ");
    gfg = result;

    result = gfg.replaceAll("dz", "ძ");
    gfg = result;
    result = gfg.replaceAll("tsʼ", "წ");
    gfg = result;
    result = gfg.replaceAll("chʼ", "ჭ");
    gfg = result;
    result = gfg.replaceAll("kh", "ხ");
    gfg = result;
    result = gfg.replaceAll("j", "ჯ");
    gfg = result;
    result = gfg.replaceAll("h", "ჰ");
    gfg = result;

    print(gfg);

    final translator = GoogleTranslator();
    final input = gfg;

    // Passing the translation to a variable
    Translation trans = await translator.translate(input, from: 'ka', to: 'en');
    setState(() {
      translation = trans;
          
          
          
          
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
          backgroundColor:  const Color(0xff343351),
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
                              color:  Color(0xff343351)),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          sms,
                          style:
                              const TextStyle(fontSize: 18, color:Colors.blue),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        const Text(
                          "Translated message:",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color:  Color(0xff343351)),
                        ),
                        const SizedBox(height: 18),
                        translation != null
                            ? Text(
                                translation!.text.toString(),
                                style: const TextStyle(
                                    fontSize: 18, color:Colors.blue),
                              )
                            : SizedBox.fromSize(),
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
