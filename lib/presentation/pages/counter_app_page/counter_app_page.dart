import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trinity_lecture_app/presentation/pages/counter_app_page/counter_app_cubit.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class CounterAppPage extends StatelessWidget {
  const CounterAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (_) => CounterAppCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Counter App',),
              leading: IconButton(
                onPressed: () {
                  AutoRouter.of(context).pop();
                }, 
                icon: const Icon(Icons.arrow_back_ios_new_rounded)
              ),
            ),
            body: Center(
              child: BlocBuilder<CounterAppCubit, int>(
                builder: (context, state) {
                  return Text('$state',);
                },
              ),
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () => context.read<CounterAppCubit>().increment(),
                  heroTag: null,
                  child: const Icon(Icons.add),
                ),
                UIHelper.verticalSpace(10,),
                FloatingActionButton(
                  onPressed: () => context.read<CounterAppCubit>().decrement(),
                  heroTag: null,
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}