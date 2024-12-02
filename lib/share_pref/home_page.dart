import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_share_pref/provider/provide_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late List<String> itemList = [];
  // bool _isgetData = false;
  // TextEditingController NameController = TextEditingController();
  // TextEditingController AboutController = TextEditingController();


  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }
  // void getData() async{
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     _isgetData = true;
  //     itemList = preferences.getStringList('item')??[];
  //   });
  // }
 // void insertData(String item) async{
 //    SharedPreferences  pref =  await SharedPreferences.getInstance();
 //    itemList.add(item);
 //    pref.setStringList('item', itemList);
 //    setState(() {});
 // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text('Share Pref')),backgroundColor: Colors.greenAccent,),
        body: Consumer<ProviderPages>(
          builder: (BuildContext context, provider, Widget? child) {
            return  Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.itemList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.blue,
                        child: ListTile(
                          title: Text(provider.itemList[index]),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  updateData(index);

                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  provider.deleteUser(index);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          showAlertDialog_insert();
        },child: Icon(Icons.add),),
      ),
    );
  }


  void showAlertDialog_insert(){
    showDialog(
      barrierDismissible: false,
      context: context, builder: (BuildContext context) =>
        AlertDialog(
            title: Consumer<ProviderPages>(
              builder: (BuildContext context, ProviderPages value, Widget? child) {
                return Column(
                  children: [
                    TextField(controller:value.insertDataController,decoration: InputDecoration(border: OutlineInputBorder(),hintText:'Enter Name',),),
                    SizedBox(height: 20,),
                    // TextField(controller: AboutController,decoration: InputDecoration(border: OutlineInputBorder(),hintText:'Enter Name',),),
                    SizedBox(height: 20,),
                    OutlinedButton(onPressed: () {
                      if (value.insertDataController.text.isNotEmpty) {
                       value.insertData(value.insertDataController.text);
                        value.insertDataController.clear();
                      }
                      Navigator.pop(context);
                    }, child: Text('Insert'))
                  ],
                );
              },

            ),
          // TextField(controller: AboutController,decoration: InputDecoration(border: OutlineInputBorder(),hintText:'Enter About',),),

        ),);
  }
  Future updateData(int index){

    // TextEditingController updateName= TextEditingController(text:itemList[index]);
    return showDialog(
      barrierDismissible: false,
      context:context,
      builder: (context) {
        return AlertDialog(
          title: Consumer<ProviderPages>(
            builder: (BuildContext context, providers, Widget? child) {
              providers.updateName.text = providers.itemList[index];
              return  Column(
                children: [
                  Text('Update'),
                  TextField(controller: providers.updateName,decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Edit Name'),),
                  SizedBox(height: 20,),
                  OutlinedButton(onPressed: () {
                    if(providers.updateName.text.isNotEmpty){
                    providers.updateUser(index, providers.updateName.text);
                      Navigator.pop(context);
                    }

                  }, child: Text('Update')),
                ],
              );
            },
          ),
        );
      },
    );

  }

 }









