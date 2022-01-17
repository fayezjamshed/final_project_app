import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    mycontroller.clear();
    super.initState();
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        messagelist!.isNotEmpty
            ? Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: ListView.builder(
                      // physics: NeverScrollableScrollPhysics(),
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
              )
            : Container(),
        Row(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
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
                  mymessageslist(mycontroller.text);
                  setState(() {});
                },
                icon: Icon(Icons.send_outlined))
          ],
        ).px(5)
      ],
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
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            alignment: Alignment.bottomRight,
            child: Text(
              mymessage,
              style: TextStyle(fontSize: 15),
            ).p(15),
          )
        : Container();
  }
}
