import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'models/LanguageModel.dart';
import 'service/languages_service.dart';
import 'repos/shared_preference_app.dart';

void main() async {
  preferencesUtil.setApplicationSavedInfo('lang', 'en');
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider <Locale>(
      builder: (context) {
        return StreamController<Locale>();
      } ,
      child: MaterialApp(
        title: 'new app',
        theme: ThemeData(primarySwatch: Colors.red),
        localizationsDelegates: [
          const TranslationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: [
          const Locale('en', ''),
          const Locale('vi', ''),
        ],
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    var abc = Provider.of<Locale>(context);
    return Scaffold(
      body: ChangeNotifierProvider<LanguageModel>(
        builder: (_) => abc,
        child: Center(
          child: FirstPage(),
        ),
      ),
    );
  }

}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  LanguageModel languageModel;
  @override
  Widget build(BuildContext context) {
    languageModel = Provider.of<LanguageModel>(context);
    return Container(
      child: Column(
        children: <Widget>[
          Text(Translations.of(context).text('hello')),
          RaisedButton(
            child: Text((Translations.of(context).text('change'))),
            onPressed: changeLang,
          )
        ],
      ),
    );
  }


  void changeLang() {
    languageModel.changeLanguage();
  }
}
