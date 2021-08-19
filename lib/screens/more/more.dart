import 'package:expandable_group/expandable_group_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled7/main.dart';
import 'package:untitled7/screens/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class More extends StatelessWidget {
  const More({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "RecipeApp dev.",
          style: GoogleFonts.lobster(
              textStyle: TextStyle(color: Colors.green, fontSize: 20)),
        ),
      ),
      body: ListView(
        children: [
          ExpandableGroup(
            isExpanded: false,
            collapsedIcon: Icon(Icons.arrow_drop_down),
            header: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Условия пользования",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            items: [
              ListTile(
                title: Text("Принятие условий"),
                subtitle: Text(
                    "Разработано исключительно в ознакомительных условиях "),
              ),
              ListTile(
                  title: Text("Лицензия"),
                  subtitle: Text(
                      "Подписка на Spoonacular API предоставляет вам неисключительную, непередаваемую лицензию на использование Spoonacular API на ежемесячной основе в зависимости от вашей оплаты ежемесячной платы, связанной с вашей подпиской (и любых дополнительных сборов из-за превышения количества вызовов в день, покрываемый вашей подпиской) и о вашем согласии соблюдать эти условия. С вас будет взиматься плата каждый месяц, пока вы не отмените подписку в разделе My Console > Plan/Billing или на веб-сайте RapidAPI, в зависимости от того, где вы подписались.")),
            ],
          ),
          ExpandableGroup(
            isExpanded: false,
            collapsedIcon: Icon(Icons.arrow_drop_down),
            header: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Учетная запись",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            items: [
              ListTile(
                onTap: () async {
                  FirebaseAuth.instance.signOut();
                  SharedPreferences prefrences =
                      await SharedPreferences.getInstance();
                  prefrences.remove('isLogin');
                  Phoenix.rebirth(context);
                  main();
                },
                title: Text(
                  'Выход из аккаунта  >',
                ),
              ),
              ListTile(
                onTap: () async {
                  FirebaseAuth.instance.signOut();
                  SharedPreferences prefrences =
                      await SharedPreferences.getInstance();
                  prefrences.remove('isLogin');
                  Phoenix.rebirth(context);
                  main();
                },
                title: Text(
                  'Удалить аккаунт',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
          ExpandableGroup(
            isExpanded: false,
            collapsedIcon: Icon(Icons.arrow_drop_down),
            header: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Воможности",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            items: [
              ListTile(
                title: Text(
                  'Приложение включает более 5000 рецептов.',
                ),
              ),
              ListTile(
                title: Text(
                  'разбивка на порции',
                ),
              ),

              ListTile(
                title: Text(
                  'Функция автозаполнения поиска.',
                ),
              ),
              ListTile(
                title: Text(
                  'Сохраните рецепты на вашем аккаунте.',
                ),
              ),
              ListTile(
                title: Text(
                  'Получите рандомные рецепты.',
                ),
              ),
              ListTile(
                title: Text(
                  'План питания на каждый день.',
                ),
              ),
            ],
          ),
          ExpandableGroup(
            isExpanded: false,
            collapsedIcon: Icon(Icons.arrow_drop_down),
            header: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Информация о приложении",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            items: [
              ListTile(
                title: Text(
                  'Приложение создано с помощью библиотеки Flutter.',
                ),
              ),
              ListTile(
                onTap: () {
                  launch("https://spoonacular.com/food-api");
                },
                title: Text('с открытым исходным кодом Spoacular API',
                    style: TextStyle(color: Colors.blue)),
              ),
              ListTile(
                onTap: () {
                  launch("https://github.com/maleii241");
                },
                title: Text('Исходный код приложения',
                    style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
