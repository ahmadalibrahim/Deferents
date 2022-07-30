import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy/shared/components/components.dart';
import 'package:udemy/shared/components/constants.dart';

// ignore: must_be_immutable
class NewTasksScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.separated(
          itemBuilder: (context, index) =>
              buildDefaultItemTask(tasksList[index]),
          separatorBuilder: (context, index) => Container(
                height: 1.0,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadiusDirectional.circular(15),
                ),
              ),
          itemCount: tasksList.length),
    );
  }
}
