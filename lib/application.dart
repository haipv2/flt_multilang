import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'blocs/base_bloc.dart';
import 'blocs/translations_bloc.dart';
import 'trans/global_translations.dart';
import 'package:rxdart/rxdart.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  TransBloc transBloc;

  @override
  void initState() {
    super.initState();
    // retrieve bloc
    transBloc = TransBloc();
  }

  @override
  void dispose() {
    transBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransBloc>(
      bloc: transBloc,
      child: StreamBuilder<Locale>(
          stream: transBloc.currentLocale,
          initialData: allTranslations.locale,
          builder: (BuildContext context, AsyncSnapshot<Locale> snapshot) {
            return MaterialApp(
              title: 'app title',

              // multi lang
              locale: snapshot.data ?? allTranslations.locale,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: allTranslations.supportedLocales(),
              home: HomePage(),
            );
          }),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // retrieve bloc
    final TransBloc transBloc = BlocProvider.of<TransBloc>(context);

    //get titile
    final String pageTitle = allTranslations.text('page.title');

    //caption of button
    final String buttonCap = allTranslations.text('page.changeLanguage');

    final String otherLanguage =
    allTranslations.currentLanguage == 'vi' ? 'en' : 'vi';

    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text(buttonCap),
            onPressed: () {
              //
              // Changes the working language to "fr"
              //
              transBloc.setNewLanguage(otherLanguage);
            },
          ),
        ),
      ),
    );
  }
}
