import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:post_api_calling/Model/data_model.dart';
import 'data_calling/data_call.dart';


// https://reqres.in/ (fake post method link)
// https://javiercbk.github.io/json_to_dart/

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

 TextEditingController  nameController = TextEditingController();
 TextEditingController  jobController  = TextEditingController();

class _HomePageState extends State<HomePage> {

  List<DataModel> _dataModels = [];
  final DataCalling _dataCalling = DataCalling();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Post Api Calling Without provider"),
        titleTextStyle: TextStyle(color: Colors.white),
        centerTitle: true,
      ),
       backgroundColor: Colors.grey[300],
       body: Container(
         padding: EdgeInsets.all(20),
         child: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Container(
                 height: 50,
                 width: double.infinity,
                 decoration: BoxDecoration(
                   color: Colors.grey[300],
                  // borderRadius: BorderRadius.circular(20),
                   boxShadow: [
                     BoxShadow(
                       color: Colors.grey.shade500,
                       spreadRadius: 2,
                       blurRadius: 15,
                       offset: Offset(4,4)
                     ),

                     BoxShadow(
                         color: Colors.white,
                         spreadRadius: 2,
                         blurRadius: 15,
                         offset: Offset(-4,-4)
                     )
                   ]
                 ),
                 child: Padding(
                   padding: const EdgeInsets.only(left: 10),
                   child: TextFormField(
                     controller: nameController,
                     decoration: InputDecoration(
                       hintText: "Enter Name",
                       border: InputBorder.none
                     ),
                   ),
                 ),

               ),
               const SizedBox(height: 20),
               Container(
                 height: 50,
                 width: double.infinity,
                 decoration: BoxDecoration(
                     color: Colors.grey[300],
                     // borderRadius: BorderRadius.circular(20),
                     boxShadow: [
                       BoxShadow(
                           color: Colors.grey.shade500,
                           spreadRadius: 2,
                           blurRadius: 15,
                           offset: Offset(4,4)
                       ),

                       BoxShadow(
                           color: Colors.white,
                           spreadRadius: 2,
                           blurRadius: 15,
                           offset: Offset(-4,-4)
                       )
                     ]
                 ),
                 child: Padding(
                   padding: const EdgeInsets.only(left: 10),
                   child: TextFormField(
                      controller: jobController,
                     decoration: InputDecoration(
                         hintText: "Enter Job Title",
                         border: InputBorder.none
                     ),
                   ),
                 ),

               ),
               const SizedBox(height: 40,),
               Container(
                 height: 50,
                 width: double.infinity,
                 decoration: BoxDecoration(
                     color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(23),
                     boxShadow: [
                       BoxShadow(
                           color: Colors.grey.shade500,
                           spreadRadius: 2,
                           blurRadius: 15,
                           offset: Offset(4,4)
                       ),

                       BoxShadow(
                           color: Colors.white,
                           spreadRadius: 2,
                           blurRadius: 15,
                           offset: Offset(-4,-4)
                       )
                     ]
                 ),
                 child: ElevatedButton(
                   onPressed: () async{
                     String name = nameController.text.toString();
                     String job = jobController.text.toString();

                     List<DataModel> data = await _dataCalling.postData(name, job);
                     setState(() {
                       _dataModels = data ;
                     });
                   },
                   child: const Center(child: Text("Submitted",style: TextStyle(color: Colors.cyan),),),
                 )

               )
             ],
           ),
         ),
       ),
    );
  }
}
