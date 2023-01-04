import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:lingueye/styles/my_styles.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/language.dart';
import '../providers/data_provider.dart';

class LanguagesList extends StatefulWidget {
  const LanguagesList({super.key});

  @override
  State<LanguagesList> createState() => _LanguagesListState();
}

class _LanguagesListState extends State<LanguagesList> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final List<Language> languages = [
    Language(name: 'polski', code: 'pl', flag: 'pl'),
    Language(name: 'angielski', code: 'en', flag: 'gb'),
    Language(name: 'niemiecki', code: 'de', flag: 'de'),
    Language(name: 'hiszpański', code: 'es', flag: 'es'),
    Language(name: 'ukraiński', code: 'uk', flag: 'ua'),
  ];

  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider = Provider.of<DataProvider>(context);
    return Container(
      alignment: AlignmentDirectional.center,
      child: FutureBuilder(
        future: _prefs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            int languageIndex = snapshot.data?.getInt('languageIndex') ?? 0;

            return ListView.builder(
              shrinkWrap: true,
              itemCount: languages.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: InkWell(
                      onTap: () {
                        snapshot.data?.setInt('languageIndex', index);
                        snapshot.data?.setString('code', languages[index].code);
                        if (dataProvider.getImage.path.isNotEmpty) {
                          dataProvider.changeTranslatedText(
                              dataProvider.getEditText,
                              dataProvider.getLanguage);
                        }
                        setState(() {});
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.green,
                                    width: languageIndex == index ? 3 : 0),
                                borderRadius: BorderRadius.circular(100)),
                            child: CircleFlag(
                              languages[index].flag,
                              size: 32,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            languages[index].name,
                            style: MyStyles.smallLightText,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
