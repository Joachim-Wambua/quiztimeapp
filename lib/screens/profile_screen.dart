import 'package:flutter/material.dart';

bool isObscurePassword = true;

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff022140),
        title: Text(
          'Flutter Edit Profile UI',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/appbackground.png'), fit: BoxFit.cover),
        ),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(width: 4, color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1)),
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/profile.jpg'),
                            )),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 4, color: Colors.white),
                              color: Colors.blue,
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              buildTextField("Full Name", "Joachim", false),
              buildTextField("Email", "joachimmwengi@gmail.com", false),
              buildTextField("Password", "***********", true),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 72.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    OutlinedButton(
                      style: ButtonStyle(

                      ),
                      onPressed: () {},
                      child: Text(
                        "CANCEL",
                        style: TextStyle(
                            fontSize: 15, letterSpacing: 2, color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "SAVE",
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.black
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildTextField(
    String labelText, String placeholder, bool isPasswordTextField) {
  return Padding(
    padding: EdgeInsets.all(30),
    child: TextField(
      obscureText: isPasswordTextField ? isObscurePassword : false,
      decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  color: Colors.grey,
                  onPressed: () {})
              : null,
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.only(left: 10, bottom: 5),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          )),
    ),
  );
}
