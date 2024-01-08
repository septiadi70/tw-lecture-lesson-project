import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:trinity_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class CounterAppPage extends StatefulWidget {
  const CounterAppPage({super.key});

  @override
  State<CounterAppPage> createState() => _CounterAppPageState();
}

class _CounterAppPageState extends State<CounterAppPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App',),
      ),
      body: Center(
        child: Text('$_counter',),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() => _counter += 1);
            },
            heroTag: null,
            child: Text(
              '+',
              style: context.textTheme.displayMedium,
            ),
          ),
          UIHelper.verticalSpace(10,),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                if (_counter > 0) _counter -= 1;
              });
            },
            heroTag: null,
            child: Text(
              '-',
              style: context.textTheme.displayMedium,
            ),
          ),
        ],
      ),
    );
  }
}