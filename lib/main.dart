import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Home()
  ));
}

class Home extends  StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> tags = ["flutter", "dart"]; //initial tags
  var prints;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Tag Input in TextField"),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children:[
                TextFieldTags(
                  textSeparators: const [
                    " ", //seperate with space
                    ',' //sepearate with comma as well
                  ],
                  initialTags: tags,
                  onTag: (tag){
                    print(tag);
                    //this will give tag when entered new single tag
                    tags.add(tag);
                  },
                  onDelete: (tag){
                    print(tag);
                    //this will give single tag on delete
                    tags.remove(tag);
                  },
                  validator: (tag){
                    //add validation for tags
                    if(tag.length < 2){
                      return "Enter tag up to 2 characters.";
                    }
                    return null;
                  },
                  tagsStyler: TagsStyler( //styling tag style
                      tagTextStyle: TextStyle(fontWeight: FontWeight.normal),
                      tagDecoration: BoxDecoration(color: Colors.blue[100], borderRadius: BorderRadius.circular(0.0), ),
                      tagCancelIcon: Icon(Icons.cancel, size: 18.0, color: Colors.blue[900]),
                      tagPadding: EdgeInsets.all(6.0)
                  ),
                  textFieldStyler: TextFieldStyler( //styling tag text field
                      textFieldBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2)
                      )
                  ),
                ),

                const SizedBox(height:30),

                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        prints = tags;
                      });
                      print(tags);
                      //pint list of tags int the TextField
                    },
                    child: const Text("Submit")
                ),
                const SizedBox(height:30),

                prints == null ?
                    const Text("First you Submit") :
                Text("$prints"),
              ]
          ),
        )
    );
  }
}