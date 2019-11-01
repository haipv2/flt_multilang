import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'service/languages_service.dart';

void main() async {
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Text(Translations.of(context).text('hello')),
              RaisedButton(
                child: Text((Translations.of(context).text('change'))),
                onPressed: changeLang,
              )
            ],
          ),
        ),
      ),
    );
  }

  void changeLang() {
  }
}
