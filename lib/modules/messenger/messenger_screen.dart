import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_960_720.jpg"),
              radius: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Chat",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        titleSpacing: 20.0,
        actions: [
          IconButton(
              icon: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 16,
                ),
              ),
              onPressed: () {
                print('icon camera pressed');
              }),
          IconButton(
              icon: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 16,
                ),
              ),
              onPressed: () {
                print('icon edit pressed');
              }),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //search
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[300],
                ),
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                      ),
                      Text(
                        'search',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              //stroies
             Container(
               height: 110,
               child: ListView.separated(
                 shrinkWrap: true,
                 scrollDirection: Axis.horizontal,
                 itemBuilder:(context ,index)=>buildStory(),
                 separatorBuilder: (context,index)=>SizedBox(width: 20.0),
                 itemCount: 10,
               ),
             ),
              SizedBox(height: 10.0),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder:(context ,index)=>buildChatRow(),
                  separatorBuilder: (context,index)=>SizedBox(height: 20.0),
                  itemCount: 15)
            ],
          ),
        ),
      ),
    );
  }
  Widget buildStory()=> Container(
    width: 60,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_960_720.jpg"),
                  radius: 30,
                ),
              ],
            ),
            //status
            Padding(
              padding: EdgeInsetsDirectional.only(
                bottom: 3,
                end: 3,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 7.0,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Ahmad Alibrahim Alibrahim Alibrahim',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
  Widget buildChatRow()=>Row(
    children: [
      Container(
        width: 60,
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_960_720.jpg"),
              radius: 30,
            ),
            //status
            Padding(
              padding: EdgeInsetsDirectional.only(
                bottom: 3,
                end: 3,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 7.0,
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ahmad Al-Ibrahimhmad ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,

                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'jhdk jsdfksdnfkjsbfkkml kmmlml kmlm jknknk kn kj k jk jk jb jj',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                ],
              ),
            ),
            Text(
              '02:33 PM',

            ),
          ],
        ),
      ),
      SizedBox(
        height: 20,
      ),
    ],
  );
}

