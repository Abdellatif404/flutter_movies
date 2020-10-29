import 'package:http/http.dart' as http;
import 'dart:convert';



class Data {

  int id = 0;

  Future getData() async {
    id += 1;
    print(id);
    String url = 'http://api.tvmaze.com/shows/$id';
    http.Response response = await http.get(url);
    var jsonFormat = json.decode(response.body);
    if (jsonFormat['id'] == null) {
      id+=1;
      response = await http.get('http://api.tvmaze.com/shows/$id');
      jsonFormat = json.decode(response.body);
    }
    return jsonFormat;
  }
}