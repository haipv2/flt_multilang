import 'dart:async';
import 'dart:ui';

import 'package:flt_multilanguage/common/app_const.dart';
import 'package:flt_multilanguage/service/languages_service.dart';

import '../setup_injection.dart';
import 'BaseModel.dart';
import '../repos/shared_preference_app.dart';

enum LanguagesCode {vi,en}

class LanguageModel extends BaseModel {

  LanguagesCode languagesCode = LanguagesCode.en;

  LanguageModel({this.languagesCode});

  void changeLanguage() async {
    LanguageService languageService = locator<LanguageService>();
    setState(ViewState.loading);
    String lang = await preferencesUtil.getAppSavedInfo('lang');
    if (lang == "vi") {
      lang = 'en';
      languageService.setLang('en');
    } else {
      languageService.setLang('vi');
    }
//    Future.delayed(Duration(milliseconds: 3000));
    setState(ViewState.ready);
  }


}