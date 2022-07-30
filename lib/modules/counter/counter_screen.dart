import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/modules/counter/cubit/cubit.dart';
import 'package:udemy/modules/counter/cubit/states.dart';


class Conuter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state) {
        if (state is CounterInitialState) {
          print("this is Counter initial state");
        }
        else if (state is CounterMinusState) {
          print("this is Counter Minus State =${state.counter}");
        }
        else if (state is CounterPlusState)
          print("this is Counter plus State=${state.counter}");
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Counter'),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                    CounterCubit.get(context).plus();
                    },
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 50.0,

                      ),),
                  ),
                  Text(
                    '${CounterCubit.get(context).counter}',
                    style: TextStyle(
                      fontSize: 50.0,

                    ),),
                  TextButton(
                    onPressed: () {
                      CounterCubit.get(context).minus() ;
                    },
                    child: Text(
                      '-',
                      style: TextStyle(
                        fontSize: 50.0,

                      ),),
                  ),
                ],
              ),
            ),
          );
        },
      ),

    );
  }
}
