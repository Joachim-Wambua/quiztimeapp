import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CategoriesPage extends StatelessWidget {
  final User user;
  CategoriesPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Logged In!'),
    );
  }
}
