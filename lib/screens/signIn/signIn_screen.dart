import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:untitled7/screens/nav/bottom_nav.dart';
import 'package:untitled7/theme/colors.dart';

import 'cubit/signup_cubit.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = "/signup";
  static Route route() {
    return PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, _, __) => BlocProvider<SignupCubit>(
              create: (context) => SignupCubit(),
              child: SignUpScreen(),
            ),
        settings: RouteSettings(name: routeName));
  }

  SignUpScreen({Key key}) : super(key: key);
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  final _formkey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false
        extendBodyBehindAppBar: true,
        extendBody: true,
        backgroundColor: Colors.black26,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white60.withOpacity(0.5)),
        ),
        key: _scaffoldkey,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://64.media.tumblr.com/f04b58c215f714cce2a0e20c32a598e0/tumblr_o5s4geDqIx1u9ooogo1_540.gif"))),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: BlocBuilder<SignupCubit, SignupState>(
                      builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formkey,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 8),
                                  child: Text(
                                    "RecipeApp",
                                    style: GoogleFonts.lobster(
                                        textStyle: TextStyle(
                                            color: Colors.blueAccent, fontSize: 45)),
                                  ),
                                ),
                              ),
                              state.status == SignupStatus.error
                                  ? Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Container(
                                        // color: Colors.red,
                                        decoration: ShapeDecoration(
                                            color: Colors.red,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(16)),
                                            )),
                                        child: Center(
                                            child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            state.error.message,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white.withOpacity(0.5),
                                            ),
                                          ),
                                        )),
                                      ),
                                    )
                                  : Container(),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Please enter your name.";
                                    }
                                    return null;
                                  },
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                      hintText: "Name",
                                      hintStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(0.7),
                                      ),
                                      contentPadding: EdgeInsets.all(16),
                                      fillColor: Colors.white,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16))),
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16))),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16))),
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Icon(Icons.person),
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: TextFormField(
                                  controller: email,
                                  validator: (value) {
                                    if (value.isEmpty || !value.contains('@')) {
                                      return "Email is not valid.";
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(.7),
                                      ),
                                      contentPadding: EdgeInsets.all(16),
                                      fillColor: Colors.white,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16))),
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16))),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16))),
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Icon(Icons.email_outlined),
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: TextFormField(
                                  controller: pass,
                                  obscureText: true,
                                  validator: (value) {
                                    if (value.isEmpty || value.length <= 6) {
                                      return "password must be at least 7 characters long.";
                                    }
                                    return null;
                                  },
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(.7),
                                      ),
                                      contentPadding: EdgeInsets.all(16),
                                      fillColor: Colors.white,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16))),
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16))),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16))),
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Icon(LineIcons.lock),
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                // ignore: deprecated_member_use
                                child: ButtonTheme(
                                  minWidth: MediaQuery.of(context).size.width,
                                  child: RaisedButton(
                                    padding:
                                        MediaQuery.of(context).size.width > 600
                                            ? EdgeInsets.all(25)
                                            : EdgeInsets.all(16),
                                    color: Colors.blueAccent.withOpacity(0.7),
                                    onPressed: state.status ==
                                            SignupStatus.loading
                                        ? null
                                        : () async {
                                            final isvalid = _formkey
                                                .currentState
                                                .validate();
                                            FocusScope.of(context).unfocus();
                                            if (isvalid) {
                                              _formkey.currentState.save();
                                              final isNotError =
                                                  await BlocProvider.of<
                                                          SignupCubit>(context)
                                                      .submit(email.text,
                                                          pass.text);
                                              if (isNotError) {
                                                Navigator.of(context)
                                                    .pushReplacementNamed(
                                                        NavScreen.routeName);
                                              }
                                            }
                                          },
                                    textColor: Colors.white,
                                    child: Text(
                                      "Sign Up >",
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(16.0)),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ));
  }
}
