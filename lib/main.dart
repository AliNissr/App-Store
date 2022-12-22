import 'package:flutter/material.dart';
import 'package:storeapp/pages/homepages.dart';
import 'package:storeapp/pages/product_the_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {HomePage.id : (context) => HomePage() , ProductThePages.id : (context) => ProductThePages()},
      initialRoute: HomePage.id,
     );
  }
}
