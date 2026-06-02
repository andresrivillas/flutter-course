import 'package:flutter/material.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit Counter"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.refresh_rounded)),
        ],
      ),
      body: Center(child: Text("Counter value: XXXX")),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            heroTag: "1",
            child: Text("+3"),
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () {},
            heroTag: "2",
            child: Text("+3"),
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () {},
            heroTag: "3",
            child: Text("+3"),
          ),
        ],
      ),
    );
  }
}
