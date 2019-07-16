import 'package:flutter/material.dart';

import 'application.dart';
import 'trans/global_translations.dart';

void main() async {

  // init translation base on preferred
  await allTranslations.init();

  runApp(Application());
}


