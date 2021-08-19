import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:untitled7/models/search_autocomplete_model.dart';
import 'package:untitled7/screens/recipe_info/bloc/recipe_information_bloc.dart';
import 'package:untitled7/screens/recipe_info/recipe_info.dart';
import 'package:untitled7/screens/search_results/bloc/search_results_bloc.dart';
import 'package:untitled7/screens/search_results/search_result.dart';
import 'package:untitled7/screens/searchpage/cubit/search_page_cubit.dart';
import 'package:untitled7/screens/widgets/horizontal_list.dart';
import 'package:untitled7/theme/colors.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchPageCubit, SearchPageState>(
        builder: (context, state) {
      return Scaffold(
        backgroundColor: athens_gray,
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Поиск рецептов ...",
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          style: BorderStyle.solid,
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 5,
                          style: BorderStyle.solid,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(15))),
                onChanged: (value) {
                  BlocProvider.of<SearchPageCubit>(context).textChange(value);
                },
              ),
            ),
          ),
        ),
        body: SafeArea(
            child:
                (state.status == Status.success && state.searchList.isNotEmpty)
                    ? ListView(
                        physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        children: [
                          ...state.searchList.map((list) {
                            return SearchAutoCompleteTile(list: list);
                          }).toList()
                        ],
                      )
                    : state.status == Status.loading
                        ? Container(
                            child: Center(
                              child: SpinKitCircle(
                                color: Colors.green,
                                size: 50,
                              ),
                            ),
                          )
                        : Container(
                            child: ListView(
                              physics: BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0, vertical: 10),
                                  child: Container(
                                    child: Text(
                                      "Недавние поиски\nпользователями",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Wrap(
                                    alignment: WrapAlignment.start,
                                    children: [
                                      ChipWidget("Выпечка"),
                                      ChipWidget("Веган"),
                                      ChipWidget("Соусы"),
                                      ChipWidget("Мясо"),
                                      ChipWidget("Турция"),
                                      ChipWidget("Курица"),
                                      ChipWidget("Сосиски"),
                                      ChipWidget("Фарш"),
                                      ChipWidget("Бургеры"),
                                      ChipWidget("Макароны"),
                                      ChipWidget("Лапша"),
                                      ChipWidget("Пицца"),
                                      ChipWidget("Супы"),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0, vertical: 10),
                                  child: Container(
                                    child: Text(
                                      "Рецепты \nпо категориям",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                CategoryTile(
                                    text: "основное блюдо",
                                    image:
                                        "https://images.unsplash.com/photo-1559847844-5315695dadae?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=740&q=80"),
                                CategoryTile(
                                    text: "Гарнир",
                                    image:
                                        "https://images.unsplash.com/photo-1534938665420-4193effeacc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80"),
                                CategoryTile(
                                    text: "Десерт",
                                    image:
                                        "https://images.unsplash.com/photo-1587314168485-3236d6710814?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=670&q=80"),
                                CategoryTile(
                                    text: "закуска",
                                    image:
                                        "https://images.unsplash.com/photo-1541529086526-db283c563270?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80"),
                                CategoryTile(
                                  text: "салат",
                                  image:
                                      "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80",
                                ),
                                CategoryTile(
                                  text: "хлеб",
                                  image:
                                      "https://images.unsplash.com/photo-1509440159596-0249088772ff?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=752&q=80",
                                ),
                                CategoryTile(
                                  text: "завтрак",
                                  image:
                                      "https://images.unsplash.com/photo-1525351484163-7529414344d8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80",
                                ),
                                CategoryTile(
                                  text: "суп",
                                  image:
                                      "https://images.unsplash.com/photo-1547592166-23ac45744acd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80",
                                ),
                                CategoryTile(
                                  text: "напиток",
                                  image:
                                      "https://images.unsplash.com/photo-1595981267035-7b04ca84a82d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
                                ),
                                CategoryTile(
                                  text: "соус",
                                  image:
                                      "https://images.unsplash.com/photo-1472476443507-c7a5948772fc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
                                ),
                                CategoryTile(
                                  text: "маринад",
                                  image:
                                      "https://images.unsplash.com/photo-1598511757337-fe2cafc31ba0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
                                ),
                                CategoryTile(
                                  text: "пища которую едят руками",
                                  image:
                                      "https://images.unsplash.com/photo-1605333396915-47ed6b68a00e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
                                ),
                                CategoryTile(
                                  text: "перекус",
                                  image:
                                      "https://images.unsplash.com/photo-1599490659213-e2b9527bd087?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
                                ),
                                CategoryTile(
                                  text: "напиток",
                                  image:
                                      "https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
                                ),
                              ],
                            ),
                          )),
      );
    });
  }
}

class CategoryTile extends StatelessWidget {
  final String text;
  final String image;
  const CategoryTile({Key key, this.text, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: ListTile(
            leading: Container(
                width: 100,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(image),
                        fit: BoxFit.cover))),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider(
                            create: (context) => SearchResultsBloc()
                              ..add(LoadSearchResults(searchtext: text)),
                            child: SearchResults(),
                          )));
            },
            title: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Icon(Icons.arrow_right_alt)),
      ),
    );
  }
}

class SearchAutoCompleteTile extends StatefulWidget {
  final SearchAutoComplete list;
  const SearchAutoCompleteTile({
    Key key,
    this.list,
  }) : super(key: key);

  @override
  _SearchAutoCompleteTileState createState() => _SearchAutoCompleteTileState();
}

class _SearchAutoCompleteTileState extends State<SearchAutoCompleteTile> {
  bool isSaved = false;
  final _base = FirebaseFirestore.instance
      .collection('Bookmarks')
      .doc(FirebaseAuth.instance.currentUser.uid)
      .collection('Marks');
  @override
  void initState() {
    super.initState();
    getInfo();
  }

  _saveBookMark() async {
    await FirebaseFirestore.instance
        .collection('Bookmarks')
        .doc("Diary-${FirebaseAuth.instance.currentUser.uid}")
        .get()
        .then((value) {
      if (!value.exists) {
        value.reference.set({"Saved": []});
      }
    });
    if (!isSaved) {
      _base.doc(widget.list.id).set({
        'id': widget.list.id,
        'name': widget.list.name,
        'image': widget.list.image,
      });
      FirebaseFirestore.instance
          .collection('Bookmarks')
          .doc("Diary-${FirebaseAuth.instance.currentUser.uid}")
          .update({
        "Saved": FieldValue.arrayUnion([widget.list.id]),
      });
      if (mounted) {
        setState(() {
          isSaved = true;
        });
      }
    } else {
      _base.doc(widget.list.id).delete();
      FirebaseFirestore.instance
          .collection('Bookmarks')
          .doc("Diary-${FirebaseAuth.instance.currentUser.uid}")
          .update({
        "Saved": FieldValue.arrayRemove([widget.list.id]),
      });
      if (mounted) {
        setState(() {
          isSaved = false;
        });
      }
    }
  }

  getInfo() async {
    final doc = await FirebaseFirestore.instance
        .collection('Bookmarks')
        .doc("Diary-${FirebaseAuth.instance.currentUser.uid}")
        .get();
    if (doc.data()['Saved'].contains(widget.list.id)) {
      if (mounted) {
        setState(() {
          isSaved = true;
        });
      }
    } else {
      if (mounted) {
        setState(() {
          isSaved = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BlocProvider<RecipeInformationBloc>(
                create: (context) => RecipeInformationBloc()
                  ..add(LoadInformationFood(id: widget.list.id)),
                child: RecipeInformationScreen(),
              ),
            ));
          },
          leading: Container(
            width: 100,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 0.0,
                      blurRadius: 3,
                      offset: Offset(
                        0, // Move to right 10  horizontally
                        2.0, // Move to bottom 10 Vertically
                      ),
                      color: Colors.grey.withOpacity(.6))
                ],
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(widget.list.image))),
          ),
          title: Text(
            widget.list.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: InkWell(
            onTap: _saveBookMark,
            child: Icon(
              !isSaved ? Icons.bookmark_add_outlined : Icons.bookmark,
              color: !isSaved ? Colors.black : Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
