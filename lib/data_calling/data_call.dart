import 'dart:convert';
import '../Model/data_model.dart';
import 'package:http/http.dart' as http;



class DataCalling{

  Future<List<DataModel>> postData(String name, String job) async{ // post means "create user"

    try{
      var response = await http.post(
          Uri.https("reqres.in","api/users"),
          body : {
            "name" : name,
             "job" : job
          }
      );

      var data = response.body;
      print(data); // print the code in console

      if(response.statusCode == 201){

        String dataString = response.body;
        Map<String, dynamic> responseData = jsonDecode(dataString);
        return [DataModel.fromJson(responseData)];

      } else {
        return [];
      }


    }catch(e){
      throw Exception('The Data load is error');
    }

  }

}




