import 'dart:async';
import 'dart:convert';
import 'package:flt_multilanguage/repos/shared_preference_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show  rootBundle;

import '../setup_injection.dart';

class LanguageService {


  LanguageService({Locale locale}) {
    this.locale = locale;
    _localizedValues = null;
  }

  Locale locale;
  static Map<dynamic, dynamic> _localizedValues;

  static LanguageService of(BuildContext context){
    return Localizations.of<LanguageService>(context, LanguageService);
  }

  String text(String key) {
    return _localizedValues[key] ?? '** $key not found';
  }

  static Future<LanguageService> load(Locale locale) async {
    LanguageService languageService = locator<LanguageService>();
    String jsonContent = await rootBundle.loadString("locale/i18n_${locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);
    return languageService;
  }

  get currentLanguage => locale.languageCode;

  StreamController<Locale> localeController = StreamController<Locale>();
  Future<bool> changeLocale(String langCode) {
    localeController.add(Locale(langCode));
  }

  Future<void> setLang(String language) async {
    locale = new Locale(language);
    load(locale);
    await preferencesUtil.setApplicationSavedInfo('lang', language);
  }
}

class TranslationsDelegate extends LocalizationsDelegate<LanguageService> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en','vi'].contains(locale.languageCode);

  @override
  Future<LanguageService> load(Locale locale) => LanguageService.load(locale);

  @override
  bool shouldReload(TranslationsDelegate old) => false;



}