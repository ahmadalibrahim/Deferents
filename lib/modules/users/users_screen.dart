import 'package:flutter/material.dart';
import 'package:udemy/models/user.dart';


// ignore: must_be_immutable
class UserScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(
      id: 1,
      name: 'Ahmad Alibrahim ',
      phone: '0992863321',
    ),
    UserModel(
      id: 2,
      name: 'Adnan Kanakri ',
      phone: '0992863321',
    ),
    UserModel(
      id: 3,
      name: 'Ahmad asdasd ',
      phone: '0992863321',
    ),
    UserModel(
      id: 4,
      name: 'Ahmad asd ',
      phone: '0992863321',
    ),
    UserModel(
      id: 1,
      name: 'Ahmad Alibrahim ',
      phone: '0992863321',
    ),
    UserModel(
      id: 2,
      name: 'Adnan Kanakri ',
      phone: '0992863321',
    ),
    UserModel(
      id: 3,
      name: 'Ahmad asdasd ',
      phone: '0992863321',
    ),
    UserModel(
      id: 4,
      name: 'Ahmad asd ',
      phone: '0992863321',
    ),
    UserModel(
      id: 1,
      name: 'Ahmad Alibrahim ',
      phone: '0992863321',
    ),
    UserModel(
      id: 2,
      name: 'Adnan Kanakri ',
      phone: '0992863321',
    ),
    UserModel(
      id: 3,
      name: 'Ahmad asdasd ',
      phone: '0992863321',
    ),
    UserModel(
      id: 4,
      name: 'Ahmad asd ',
      phone: '0992863321',
    ),
    UserModel(
      id: 1,
      name: 'Ahmad Alibrahim ',
      phone: '0992863321',
    ),
    UserModel(
      id: 2,
      name: 'Adnan Kanakri ',
      phone: '0992863321',
    ),
    UserModel(
      id: 3,
      name: 'Ahmad asdasd ',
      phone: '0992863321',
    ),
    UserModel(
      id: 4,
      name: 'Ahmad asd ',
      phone: '0992863321',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        title: Text(
          'User',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => userCard(users[index]),
          separatorBuilder: (context, index) => SizedBox(
            height: 0,
          ),
          itemCount: users.length,
        ),
      ),
    );
  }

  Widget userCard(UserModel user) => Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30.0,
                child: Text(
                  '${user.id}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${user.name}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '${user.phone}',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
        ],
      );
}
