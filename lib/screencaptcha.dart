
import 'package:flutter/material.dart';
import 'package:notes/db/functions/db_functions.dart';
import 'package:notes/db/model/data_model.dart';
  String name = "";
  String data = "";
  final _namecontroller = TextEditingController();
  final _datacontroller = TextEditingController();

class ScreenCaptcha extends StatefulWidget {
  const ScreenCaptcha({Key? key}) : super(key: key);

  @override
  State<ScreenCaptcha> createState() => _ScreenCaptchaState();
}

class _ScreenCaptchaState extends State<ScreenCaptcha> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('MyNotes'),
        backgroundColor: Colors.deepPurple[200],
        actions: [
          
          Tooltip(
            message: 'New File',
            child:
                IconButton(onPressed: () {
                  showDialog(context: context, builder: (context) {
            return Dialog(
      child: Padding(
          padding: EdgeInsets.all(15),
              child: Column(
            children: [
              TextFormField(
                controller: _namecontroller,
                decoration: const InputDecoration(
                    hintText: 'Enter name of the file. ',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        borderSide: BorderSide())),
              ),
              const SizedBox(height: 35),
              TextField(
                controller: _datacontroller,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration:const InputDecoration(hintText: 'Enter data'),
              ),
              const SizedBox(height: 35),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                  name=_namecontroller.text;
                  data=_datacontroller.text;
                  final file=FileData(filename:name,filedata:data);
                  addFiles(file);
                  });
                  _datacontroller.clear();
                  _namecontroller.clear();
                  Navigator.pop(context);
                },
                child: const Text('OK'),
                style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
              )
            ],
          )));

          });
                }, 
                icon: Icon(Icons.file_copy_sharp)),
          ),
          Padding(padding: EdgeInsets.all(15))
        ],
      ),
      body: SafeArea(child:ValueListenableBuilder(
      valueListenable: filelistnotifier,
      builder:(BuildContext context, List<FileData>filelist, Widget? child) {
        return Column(
          children: [
            Expanded(child: 
            ListView.separated(itemBuilder: (BuildContext context,int index){
          return ListTile(
            title:Text(filelist[index].filename),
            leading:const Icon(Icons.file_present_outlined),
            subtitle: Text(filelist[index].filedata),
            trailing:IconButton(onPressed: (){
              setState(() {
                if(filelist[index].id!=null){
                deleteFiles(filelist[index].id!);
                }
              });
            }, icon: Icon(Icons.delete,color:Colors.deepPurple))
          );
        }, 
        separatorBuilder: (BuildContext context, int index) => const Divider(), 
        itemCount: filelist.length),),

          ],
        );
      },
      
        
      
      
      )
              
      ),  
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) {
            return Dialog(
      child: Padding(
          padding: EdgeInsets.all(15),
              child: Column(
            children: [
              TextFormField(
                controller: _namecontroller,
                decoration: const InputDecoration(
                    hintText: 'Enter name of the file. ',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        borderSide: BorderSide())),
              ),
              const SizedBox(height: 35),
              TextField(
                controller: _datacontroller,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration:const InputDecoration(hintText: 'Enter data'),
              ),
              const SizedBox(height: 35),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                  name=_namecontroller.text;
                  data=_datacontroller.text;
                  final file=FileData(filename:name,filedata:data);
                  addFiles(file);
                  });
                  _datacontroller.clear();  
                  _namecontroller.clear();
                  Navigator.pop(context);
                },
                child: const Text('OK'),
                style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
              )
            ],
          )));

          });
        },
        tooltip: 'New File',
        backgroundColor: Colors.deepPurple[200],
        child: Icon(Icons.add),
      ),
    
    
    );

  }
  
}
