import 'package:flutter/material.dart';

class ListTeam extends StatelessWidget {
  final String title;
  final String image;
  final MaterialColor borderColor;
  
  ListTeam(this.borderColor, this.title, {this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        height: 100,
        child: Row(
          children: [
            Container(
              width: 10,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(5)),
                  color: borderColor),
            ),
            SizedBox(
              width: 8,
            ),
            Image.network(
              image,
              height: 40,
              width: 40,
            ),
            SizedBox(width: 10,),
            Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
            
          ],
        ),
      ),
    );
  }
}
