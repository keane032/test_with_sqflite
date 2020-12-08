import 'package:flutter/material.dart';
import 'package:myvocation/src/model/questModel.dart';
import 'package:myvocation/src/service/todoService.dart';

class HomeQuestWidget extends StatefulWidget {
  @override
  _HomeQuestWidgetState createState() => _HomeQuestWidgetState();
}

class _HomeQuestWidgetState extends State<HomeQuestWidget> {
  final service = TodoService();

  List<Quest> quests = [];

  var todo =
      Quest(id: 0, name: 'Quest test', descripition: 'descripition', status: 0);

  _takeAll() async {
    await service.openConection();
    // await service.insertTodo(todo);
    quests = await service.getTodos();
    return quests;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _takeAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                // RaisedButton(
                // onPressed: () { showMyDialog(); },
                // child: Text("Adicionar"),),
                Padding(
                  padding: const EdgeInsets.only(right:12.0, left: 12.0),
                  child: Container(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        labelText: "Buscar..."
                      ),
                    ),
                  ),
                ),
                 Container(
                    height: MediaQuery.of(context).size.height - 400,
                    child: quests.length > 0
                        ? ListView.builder(
                            itemBuilder: _itemBuilder,
                            itemCount: quests.length,
                          )
                        : Center(
                            child: Text("Listas de quests vazias"),
                          ),
                  ),
              ],),
            );
          
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _itemBuilder(context, index) {
    return Card(
      color: Colors.transparent,
      child: ListTile(
        leading: FlutterLogo(),
        title: Text(quests[index].name),
        // trailing: Icon(Icons.star,color: Colors.white,),
      ),
    );
        // Icon(Icons.star,color: Colors.white,)
  }

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
