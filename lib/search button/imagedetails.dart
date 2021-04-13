import 'package:flutter/material.dart';

class ImageDetails extends StatelessWidget {
  String name;
  String subname;
  String image;
  ImageDetails({this.subname, this.name, this.image});

  @override
  Widget build(BuildContext context) {
    var devicesize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: devicesize.width,
            height: devicesize.height * 0.08,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: devicesize.height * 0.08,
                  width: devicesize.width * 0.25,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.network(
                      image,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 8, 8, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          style: TextStyle(
                              color: Color(0xFFFF722843),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(subname,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
