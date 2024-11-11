import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/resource_model.dart';

   //create a class
   class ResponseService {

     //create a method of service

     Future<ResourceModel> setDataToResponseService() async {

    // url of api to fetch the data

    final response = await http.get(Uri.parse('https://reqres.in/api/unknown'),

      headers: <String, String> {

        "content-type": "application/json",
        "Accept": "application/json",

       },



      );

      // check the response code that is true or not

        if (response.statusCode == 200) {

        final data = jsonDecode(response.body);
        return ResourceModel.fromJson(data);

      }

      else
      {

      throw Exception('${response.statusCode} : ${response.reasonPhrase}');

      }

     }

   }

