import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'common/app_const.dart';
import 'models/LanguageModel.dart';
import 'service/languages_service.dart';
import 'repos/shared_preference_app.dart';
import 'setup_injection.dart';

void main() async {
  setupLocator();
  preferencesUtil.setApplicationSavedInfo('lang', 'en');
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Locale>(
      builder: (context) {
//        return locator<LanguageService>().localeController;
        return locator<LanguageService>().localeController.stream;
      },
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
        builder: (_) => LanguageModel(),
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
    return languageModel.state != ViewState.ready
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            child: Column(
              children: <Widget>[
                Text(LanguageService.of(context).text('hello')),
                RaisedButton(
                  child: Text((LanguageService.of(context).text('change'))),
                  onPressed: changeLang,
                )
              ],
            ),
          );
  }

  void changeLang() {
//    languageModel.changeLanguage();
    languageModel.changeLanguage();
  }
}
