import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildDefaultButton({
  double width = double.infinity,
  double height = 50.0,
  Color color = Colors.blue,
  double radius = 0.0,
  @required Function function,
  @required String text,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadiusDirectional.circular(radius),
      ),
      child: MaterialButton(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        onPressed: function,
      ),
    );

Widget buildDefaultFieldText({
  @required TextEditingController controller,
  Function onSubmit,
  Function onChanged,
  Function onTap,
  Function inputDecoration,
  @required Function validator,
  @required TextInputType keyboardType,
  @required IconData prefixIcon,
  IconData suffixIcon,
  Function suffixPressed,
  @required String label,
  bool obscureText = false,
  bool enable = true,
}) =>
    TextFormField(
      controller: controller,
      onFieldSubmitted: onSubmit,
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      enabled: enable,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon),
                onPressed: suffixPressed,
              )
            : null,
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );

Widget buildDefaultItemTask(Map model) => Container(
  padding:EdgeInsets.symmetric(vertical:10, ) ,
  child:   Row(
    children: [
      CircleAvatar(
        child: Text(
          '${model['time']}',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        radius: 40,
      ),
      SizedBox(
        width: 20,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${model['title']}',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '${model['date']}',
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ],
  ),
);
