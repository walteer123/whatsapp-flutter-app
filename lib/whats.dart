import 'package:flutter/material.dart';
import 'chatItemModel.dart';
import 'chatHelper.dart';

class Whats extends StatefulWidget {
  @override
  _WhatsState createState() => _WhatsState();
}

class _WhatsState extends State<Whats> with TickerProviderStateMixin {

  TabController _tabController;
  IconData _icon;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("WhatsApp"),
            backgroundColor: Color(0xFF00695C),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.search), onPressed: () {
                print("Salve");
              }),
              IconButton(icon: Icon(Icons.more_vert), onPressed: () {
                print("Salve");
              })
            ],
            bottom: TabBar(
                isScrollable: true,
                tabs: [
                  Tab(icon: Icon(Icons.camera_alt,)),
                  Tab(text: "CONVERSAS"),
                  Tab(text: "STATUS",),
                  Tab(text: "CHAMADAS",),
                ], indicatorColor: Colors.white,
              controller: _tabController
            ),
          ),
          body: TabBarView(
            controller: _tabController,
              children: [
                Icon(Icons.camera_alt,),
                ListView.builder(
                    itemBuilder: (BuildContext context, int index){
                      ChatItemModel chatItem = ChatHelper().getChatItem();
                      return _getListCell(chatItem);
                    }),
                Text("STATUS"),
                Text("CHAMADAS"),
              ]
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){},
            child: Icon(_icon),
            backgroundColor: Color(0xFF00C853),

          ),
        )
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this)
    ..addListener((){
      setState(() {
        switch(_tabController.index){
          case 0:
            break;
          case 1:
            _icon = Icons.message;
            break;
          case 2:
            _icon = Icons.camera_enhance;
            break;
          case 3:
            _icon = Icons.call;
            break;
        }

      });
    });
  }

  Widget _getListCell(ChatItemModel chatItem){
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.account_circle,
                size: 64.0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            chatItem.name,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20.0),
                          ),
                          Text(
                            chatItem.messageDate,
                            style: TextStyle(color: Colors.black45),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text(
                          chatItem.mostRecentMessage,
                          style: TextStyle(
                              color: Colors.black45, fontSize: 16.0),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
//  _getCamera() async {
//    var camera = await getFirstCamera();
//
//    Navigator.push(context,
//      MaterialPageRoute(builder: (context) => TakePictureScreen(camera: camera,)),);
//  }

}








