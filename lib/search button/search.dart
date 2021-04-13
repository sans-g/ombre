import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/sansk/AndroidStudioProjects/ombre/lib/search%20button/imagedetails.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String subname = "";

  @override
  Widget build(BuildContext context) {
    var devicesize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        color: Colors.black,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              FittedBox(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Container(
                        width: devicesize.width * 0.8,
                        height: devicesize.height * 0.06,
                        child: TextField(
                          onChanged: (val) {
                            setState(() {
                              subname = val;
                            });
                          },
                          showCursor: true,
                          cursorColor: Color(0xFFFF722843),
                          style: TextStyle(color: Colors.white),
                          decoration: new InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(50.0),
                                ),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              border: new OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(50.0),
                                ),
                              ),
                              filled: true,
                              disabledBorder: InputBorder.none,
                              hintStyle: new TextStyle(color: Colors.white),
                              hintText: "    Search",
                              fillColor: Color(0XFFFF263240)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 40, 8, 8),
                      child: GestureDetector(
                        onTap: () => FocusScope.of(context).unfocus(),
                        child: CircleAvatar(
                          backgroundColor: Color(0XFFFF263240),
                          radius: 22,
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: devicesize.height,
                width: devicesize.width,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("music")
                      .snapshots(),
                  builder: (context, snapshot) {
                    return (snapshot.connectionState == ConnectionState.waiting)
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot data = snapshot.data.docs[index];
                              String search = data['subname'];
                              return subname.isEmpty
                                  ? ImageDetails(
                                      image: data['image'],
                                      name: data['name'],
                                      subname: data['subname'],
                                    )
                                  : search.startsWith(subname[0].toUpperCase() +
                                          subname.substring(1))
                                      ? ImageDetails(
                                          image: data['image'],
                                          name: data['name'],
                                          subname: data['subname'],
                                        )
                                      : Container();
                            },
                          );
                  },
                ),
              ),
            ])),
      ),
    );
  }
}
