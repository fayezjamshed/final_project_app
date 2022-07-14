import 'package:final_project_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController _scroll = ScrollController();
  @override
  void initState() {
    _scroll = ScrollController();

    mycontroller.clear();
    super.initState();
  }

  void scrolltomessage() async {
    // double _position = _scroll.position.maxScrollExtent;
    if (_scroll.positions.length > 0) {
      await Future.delayed(Duration(milliseconds: 10), () {
        _scroll.animateTo(_scroll.position.maxScrollExtent,
            duration: Duration(milliseconds: 200), curve: Curves.linear);
      });
    }
  }

  final mycontroller = TextEditingController();
  List<String>? messagelist = [];

  mymessageslist(String message) {
    messagelist!.add(message);
    // messagelist = messagelist;
  }

  void cleartext() {
    mycontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black26,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        // mainAxisSize: MainAxisSize.min,
        children: [
          messagelist!.isNotEmpty
              ? Expanded(
                  child: Container(
                    // color: Colors.greenAccent,
                    // height: MediaQuery.of(context).size.height * 0.734,
                    child: SingleChildScrollView(
                      controller: _scroll,
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: messagelist!.length,
                          itemBuilder: (contex, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                MessageBlock(mymessage: messagelist![index]),
                              ],
                            ).px(15).py(5);
                          }),
                    ),
                  ),
                )
              : Container(),
          Container(
              height: 50,
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          mymessageslist("help Me");
                          setState(() {});
                          scrolltomessage();
                        },
                        child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(50)),
                                child: "Help Me".text.xl.white.make().p(5))
                            .p(5),
                      ),
                      InkWell(
                        onTap: () {
                          mymessageslist("There Is a Criminal Behind me");
                          setState(() {});
                          scrolltomessage();
                        },
                        child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(50)),
                                child: "There Is a Criminal Behind me"
                                    .text
                                    .xl
                                    .white
                                    .make()
                                    .p(5))
                            .p(5),
                      ),
                    ],
                  )

                  // Expanded(
                  //     child: ListView.builder(
                  //         // physics: NeverScrollableScrollPhysics(),
                  //         shrinkWrap: true,
                  //         scrollDirection: Axis.horizontal,
                  //         itemCount: 3,
                  //         itemBuilder: (contex, index) {
                  //           return InkWell(
                  //             onTap: () {
                  //               mymessageslist(quicklist[index]);
                  //               setState(() {});
                  //               scrolltomessage();
                  //             },
                  //             child: Container(
                  //                     decoration: BoxDecoration(
                  //                         color: Colors.redAccent,
                  //                         borderRadius:
                  //                             BorderRadius.circular(50)),
                  //                     child: quicklist[index]
                  //                         .text
                  //                         .xl
                  //                         .white
                  //                         .make()
                  //                         .p(10))
                  //                 .p(5),
                  //           );
                  //         })),
                ],
              )),
          Row(
            children: [
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: mycontroller,
                    keyboardType: TextInputType.multiline,
                    maxLines: 2,
                    decoration: InputDecoration(
                        hintText: "Enter Messages", border: InputBorder.none),
                  ),
                ),
              ).py(5)),
              IconButton(
                  onPressed: () {
                    if (mycontroller.text.isNotEmpty) {
                      mymessageslist(mycontroller.text);
                      cleartext();

                      setState(() {
                        scrolltomessage();
                      });
                    }
                  },
                  icon: Icon(Icons.send_outlined))
            ],
          ).px(5)
        ],
      ),
    );
  }

  @override
  void dispose() {
    mycontroller.dispose();

    super.dispose();
  }
}

class MessageBlock extends StatelessWidget {
  final String mymessage;
  const MessageBlock({Key? key, required this.mymessage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return mymessage.isNotEmpty
        ? Container(
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            alignment: Alignment.bottomRight,
            child: Text(
              mymessage,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ).p(15),
          )
        : Container();
  }
}

// class QuickReplies extends StatefulWidget {
//   const QuickReplies({Key? key}) : super(key: key);

//   @override
//   State<QuickReplies> createState() => _QuickRepliesState();
// }

// class _QuickRepliesState extends State<QuickReplies> {
//   ChatScreen? chatscreen = new ChatScreen();
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         // physics: NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         scrollDirection: Axis.horizontal,
//         itemCount: 3,
//         itemBuilder: (contex, index) {
//           return InkWell(
//             onTap: () {
             
//               setState(() {});
//             },
//             child: Container(
//                     decoration: BoxDecoration(
//                         color: Colors.redAccent,
//                         borderRadius: BorderRadius.circular(50)),
//                     child: quicklist[index].text.xl.white.make().p(10))
//                 .p(5),
//           );
//         });
//   }
// }
