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


}