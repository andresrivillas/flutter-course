import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = "progress_screen";
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Progress Indicators")),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 30),
          Text("Circular progress indicator"),
          SizedBox(height: 10),
          CircularProgressIndicator(
            strokeAlign: 2,
            backgroundColor: Colors.black45,
          ),
          SizedBox(height: 20),
          Text("Circular y linear indicator controlado"),
          _ControllerProgresIndicator(),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _ControllerProgresIndicator extends StatelessWidget {
  const _ControllerProgresIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 100), (value) {
        return (value * 2) / 100;
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        final progressValue = snapshot.data ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(value: progressValue, strokeWidth: 2),
              SizedBox(width: 20),
              Expanded(child: LinearProgressIndicator(value: progressValue)),
            ],
          ),
        );
      },
    );
  }
}
