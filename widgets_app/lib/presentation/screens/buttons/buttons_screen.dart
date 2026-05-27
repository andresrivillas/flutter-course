import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const name = "Buttons_Screen";
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Buttons Screen")),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: Icon(Icons.arrow_back_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Elevated")),
            ElevatedButton(onPressed: null, child: Text("Elevated Disabled")),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.access_alarm_rounded),
              label: Text("Elevated Icon"),
            ),
            FilledButton(onPressed: () {}, child: Text("Filled")),
            FilledButton.icon(
              onPressed: () {},
              icon: Icon(Icons.abc_outlined),
              label: Text("Filled Icon"),
            ),
            OutlinedButton(onPressed: () {}, child: Text("Outline")),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.abc_outlined),
              label: Text("Outline Icon"),
            ),
            TextButton(onPressed: () {}, child: Text("Text")),
            TextButton.icon(
              onPressed: () {},
              label: Text("Text Icon"),
              icon: Icon(Icons.abc_outlined),
            ),
            CustomButton(),
            IconButton(onPressed: () {}, icon: Icon(Icons.app_registration)),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text("Hello world", style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
