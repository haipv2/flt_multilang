import 'dart:async';
import 'dart:ui';

import 'package:flt_multilanguage/common/app_const.dart';

import 'BaseModel.dart';
import '../repos/shared_preference_app.dart';

enum LanguagesCode {vi,en}

class LanguageModel extends BaseModel {

  LanguagesCode languagesCode = LanguagesCode.en;

  LanguageModel({this.languagesCode});

  void changeLanguage() async {
    String lang = await preferencesUtil.getAppSavedInfo('lang');
    if (lang == "vi") {
      lang = 'en';
      await preferencesUtil.setApplicationSavedInfo('lang', 'en');
    }
    setState(ViewState.ready);
  }

  StreamController<Locale> localController = StreamController<Locale>();
  Future<bool> changeLocale(String langCode) {
    setState(ViewState.loading);
    localController.add(Locale(langCode));
    setState(ViewState.ready);
  }


}