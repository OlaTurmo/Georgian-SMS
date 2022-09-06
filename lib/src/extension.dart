import 'package:access_incoming_sms/translator.dart';

extension StringExtension on String {
  Future<Translation> translate(
          {String from = 'auto', String to = 'en'}) async =>
      await GoogleTranslator().translate(this, from: from, to: to);
}
