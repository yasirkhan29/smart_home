import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class nextPage extends StatefulWidget {
  const nextPage({super.key});

  @override
  State<nextPage> createState() => _nextPageState();
}

class _nextPageState extends State<nextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //Staggered Gridview
        body: MasonryGridView.count(
      itemCount: 8,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(8.0),
        child: ClipRRect(
          child: Image.asset('images/h${index + 1}.jpg'),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      crossAxisCount: 2,
    ));
  }
}
