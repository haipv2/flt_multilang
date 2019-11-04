import 'BaseModel.dart';

enum LanguagesCode {vi,en}

class LanguageModel extends BaseModel {

  LanguagesCode languagesCode = LanguagesCode.en;

  LanguageModel({this.languagesCode});


}