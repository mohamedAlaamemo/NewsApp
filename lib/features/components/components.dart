import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../../core/cubit/cubit.dart';
import '../NewsApp/web_view.dart';

Widget defaultMaterialButton(
    {required var function,
    required String text,
    bool isUpper = true,
    double width = double.infinity,
    Color color = Colors.blue,
    Color textColor = Colors.white}) {
  return Container(
    width: width,
    color: color,
    child: MaterialButton(
      onPressed: function,
      child: Text((isUpper) ? text.toUpperCase() : text,
          style: TextStyle(
            color: textColor,
          )),
    ),
  );
}

Widget defaultTextFormField({
  required TextEditingController controller,
  TextInputType type = TextInputType.none,
  required var validate,
  required String lable,
  required IconData prefix,
  IconButton? sufix,
  var onTap,
  onSubmit,
  onChange,
  bool isPass = false,
}) {
  return TextFormField(
    obscureText: isPass,
    onFieldSubmitted: onSubmit,
    onChanged: onChange,
    onTap: onTap,
    validator: validate,
    controller: controller,
    keyboardType: type,
    decoration: InputDecoration(
     // border:  const OutlineInputBorder(),
      labelText: lable,
      prefixIcon: Icon(prefix),
      suffixIcon: ((sufix) != null) ? sufix : null,

    ),
  );
}


// ignore: non_constant_identifier_names

Widget myDivider() {
  return Padding(
    padding: const EdgeInsetsDirectional.only(start: 20.0),
    child: Container(
      color: Colors.grey,
      height: 2.0,
    ),
  );
}

Widget bulidArticalItem(article, context) {
  return InkWell(
    onTap: () {
      NavigatorTo(context,webView(article['url']));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: NetworkImage('${article['urlToImage']}'),
                    fit: BoxFit.cover)),
          ),
          SizedBox(width: 15.0),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

void NavigatorTo(context, Widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return Widget;
  }));
}

void NavigatorAndFinish(context, Widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) {
      return Widget;
    }),
    (route) => false,
  );
}
