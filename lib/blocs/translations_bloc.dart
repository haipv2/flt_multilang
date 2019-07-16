import 'dart:async';

import 'package:flutter/material.dart';
import '../util/preferences.dart';
import 'base_bloc.dart';
import '../trans/global_translations.dart';

class TransBloc implements BlocBase{
  StreamController<String> _langController = StreamController<String>();
  Stream<String> get currentLanguage => _langController.stream;

  StreamController<Locale> _localeController = StreamController<Locale>();
  Stream<Locale> get currentLocale => _localeController.stream;
  @override
  void dispose() {
    _langController?.close();
    _localeController?.close();
  }

  void setNewLanguage(String newLanguage) async {
    //save the selected language as new preference
    await preferences.setPreferredLanguage(newLanguage);

    //Notification the translation module about new language
    await allTranslations.setNewLanguage(newLanguage);

    _langController.sink.add(newLanguage);
    _localeController.sink.add(allTranslations.locale);

  }

}
