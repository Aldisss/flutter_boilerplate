import 'dart:convert';

import 'package:flutter_boilerplate/Models/models.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  // T,K is generic type from the caller example:
  // await httpService.get<List<Post>,Post>(url)
  // So the return will be a List of Post

  // if the wanted response not to be Iterable then
  // await httpService.get<Post,Null>(url)
  // this way the return will be a class of Post

  // get request
  Future<T> get<T, K>(String url, {bool isAuthenticated = false}) async {
    http.Response res = await http.get("$baseUrl$url");

    if (res.statusCode == 200) {
      return fromJson<T, K>(json.decode(res.body));
    } else {
      throw Exception("Get Failed");
    }
  }

  // post request
  Future<T> post<T, K>(String url, {data}) async {
    http.Response res = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: data,
    );
    if (res.statusCode == 201) {
      return fromJson<T, K>(json.decode(res.body));
    } else {
      throw Exception("Post Failed");
    }
  }

  // patch request
  Future<T> update<T, K>(String url, {data}) async {
    http.Response res = await http.patch(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: data,
    );

    if (res.statusCode == 201) {
      return fromJson<T, K>(json.decode(res.body));
    } else {
      throw Exception("Updata Failed");
    }
  }

  // delete request
  Future<T> delete<T, K>(String url) async {
    http.Response res = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (res.statusCode == 201) {
      return fromJson<T, K>(json.decode(res.body));
    } else {
      throw Exception("Updata Failed");
    }
  }

  // to convert json to class
  static T fromJson<T, K>(dynamic json) {
    if (json is Iterable) {
      // to convert if the json is a list
      return _fromJsonList<K>(json) as T;
    }
    // add all your class to convert non-iterable json to class
    else if (T == Post) {
      return Post.fromJson(json) as T;
    } else {
      throw Exception("Unknown class");
    }
  }

  // converting list of json to list of class
  static List<K> _fromJsonList<K>(List jsonList) {
    if (jsonList == null) {
      return null;
    }

    List<K> output = List();

    for (Map<String, dynamic> json in jsonList) {
      output.add(fromJson(json));
    }

    return output;
  }
}
