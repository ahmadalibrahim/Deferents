import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy/modules/archive_tasks/archive_tasks_screen.dart';
import 'package:udemy/modules/done_tasks/done_tasks_screen.dart';
import 'package:udemy/modules/new_tasks_screen/tasks_screen.dart';
import 'package:udemy/shared/components/components.dart';
import 'package:udemy/shared/components/constants.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  Database database;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchiveTasksScreen(),
  ];
  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archive Tasks',
  ];

  TextEditingController titleTaskController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  bool bottomSheetIsShwon = true;
  IconData icon = Icons.add;
  String databaseName = "ali.db";
  String tableName = "todotable";


  @override
  void initState() {
    super.initState();
    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(titles[currentIndex]),
      ),
      body: tasksList.length==0 ? Center(child: CircularProgressIndicator()):screens[currentIndex],
      floatingActionButton: FloatingActionButton(
          child: Icon(icon),
          onPressed: () {
            if (bottomSheetIsShwon) {
              bottomSheetIsShwon = false;
              setState(() {
                icon = Icons.edit;
              });
              scaffoldKey.currentState
                  .showBottomSheet(
                    (context) => Container(
                      padding: EdgeInsets.all(20.0),
                      color: Colors.grey[50],
                      width: double.infinity,
                      height: 313.0,
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            buildDefaultFieldText(
                              controller: titleTaskController,
                              prefixIcon: Icons.title,
                              keyboardType: TextInputType.text,
                              label: 'Title Task',
                              validator: (value) {
                                if (value.isEmpty)
                                  return 'title task must not be empty ';
                                else
                                  return null;
                              },
                              onChanged: (value) {
                                print(value);
                              },
                              onSubmit: (value) {
                                print(value);
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            buildDefaultFieldText(
                              controller: timeController,
                              prefixIcon: Icons.watch_later_outlined,
                              keyboardType: TextInputType.datetime,
                              label: 'Time Task',
                              onTap: () {
                                showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now())
                                    .then((value) {
                                  timeController.text =
                                      value.format(context).toString();
                                  print(value.format(context));
                                });
                              },
                              validator: (value) {
                                if (value.isEmpty)
                                  return 'time must not be empty ';
                                else
                                  return null;
                              },
                              onChanged: (value) {
                                print(value);
                              },
                              onSubmit: (value) {
                                print(value);
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            buildDefaultFieldText(
                              controller: dateController,
                              prefixIcon: Icons.calendar_today,
                              keyboardType: TextInputType.datetime,
                              label: 'Date Task',
                              onTap: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2022-12-10'))
                                    .then((value) {
                                  dateController.text =
                                      DateFormat.yMMMd().format(value);
                                  print(dateController.text.toString());
                                });
                              },
                              validator: (value) {
                                if (value.isEmpty)
                                  return 'date must not be empty ';
                                else
                                  return null;
                              },
                            ),
                            buildDefaultButton(
                                text: "Add",
                                function: () {
                                  if (formKey.currentState.validate()) {
                                    insertDatabase(
                                            title: titleTaskController.text,
                                            date: dateController.text,
                                            time: timeController.text,
                                            status: "status")                                       ;


                                  }
                                }),
                          ],
                        ),
                      ),
                    ),
                    elevation: 20,
                  )
                  .closed
                  .then((value) {
                setState(() {
                 icon = Icons.add;
                });
                bottomSheetIsShwon = true;
              });
            } else {
              if (formKey.currentState.validate()) {
                insertDatabase(
                        title: titleTaskController.text,
                        date: dateController.text,
                        time: timeController.text,
                        status: "up")
                    .then((value) {
                  setState(() {
                    icon = Icons.add;

                  });
                  bottomSheetIsShwon = true;
                  Navigator.pop(context);
                });
              }
              // bottomSheetIsShwon = true;
            }
          }),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline), label: 'Done'),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined), label: 'Archive'),
        ],
      ),
    );
  }

  Future<String> getName() async => 'Ahmad Al-Ibrahim';

  void createDatabase() async {
    database = await openDatabase(
      databaseName,
      version: 4,
      onCreate: (database, version) {
        database
            .execute(
                'CREATE TABLE $tableName (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
            .then((value) {
          print('database is created');
        }).catchError((error) {
          print('database is not created !!!!!');
        });
      },
      onOpen: (database) {
        print('database is opened');
        getDatabase(database).then((value) {
          print("===========================================================");
          tasksList = value;
          print(value);
        }).catchError((error) {
          print(
              '\n\n!!!! Error in get data from database ${error.toString()}\n\n');
        });
      },
    );
  }

  Future insertDatabase(
      {@required String title,
      @required String date,
      @required String time,
      @required String status}) async {
    return await database.transaction((txn) {
      txn
          .rawInsert(
              'INSERT INTO $tableName(title, date, time, status) VALUES("$title", "$date", "$time", "$status")')
          .then((value) {
        print('$value insert success');
      }).catchError((error) {
        print('\n\n!!!! Error when inserting task to table $error\n\n');
      });
      return null;
    });
  }

  Future<List<Map>> getDatabase(Database database) async {
    List<Map>   tasks= await database.rawQuery('SELECT * FROM $tableName');
    print(tasks);
    return tasks;
  }
}
