import 'package:flutter/material.dart';
import 'package:flutter_scrolling_parallax_effect/widgets/city_parallax.dart';
import 'package:flutter_scrolling_parallax_effect/widgets/destination_parallax.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parallax Effect'),
      ),
      body: ListView(
        children: [
          DestinationParallax(),
          Builder(builder: (context) {
            return CityParallax(
              listViewHomePageContext: context,
            );
          }),
        ],
      ),
    );
  }
}
