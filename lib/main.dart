import 'package:flutter/material.dart';
import 'package:test_app/screens/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class WhatsAppHomePage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn);
              },
              child: Icon(Icons.arrow_downward_sharp),
            ),
            FloatingActionButton(
              onPressed: () {
                _scrollController.animateTo(
                    _scrollController.position.minScrollExtent,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn);
              },
              child: Icon(Icons.arrow_upward_sharp),
            )
          ],
        ),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 7, // Assuming there are 50 chat items
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Chat $index'),
          );
        },
      ),
    );
  } // Add the missing closing curly brace here
}
