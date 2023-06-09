import 'package:flutter/material.dart';
import 'package:studecom/screens/PostDetail.dart';

class Post extends StatelessWidget {
  Post(this.imageUrl, this.title, this.price, this.email, this.postdocid,
      {super.key});
  String imageUrl = "", title = "", price = "", email = "", postdocid = '';

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 30),
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey[800],
                    ),
                  ),
                  Container(height: 10),
                  Text(
                    "\$ $price",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      const Spacer(),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.transparent,
                        ),
                        child: Text(
                          "EXPLORE",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return PostDetail(postdocid, false);
                          }));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
