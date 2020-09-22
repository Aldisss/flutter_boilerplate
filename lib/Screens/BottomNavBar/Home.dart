import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/Models/models.dart';
import 'package:flutter_boilerplate/Services/services.dart';
import 'package:flutter_boilerplate/Themes/themes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HttpService _httpService = HttpService();
    Future<List<Post>> _getPosts() {
      return _httpService.get<List<Post>, Post>('/posts');
    }

    return FutureBuilder<List<Post>>(
      initialData: [],
      future: _getPosts(),
      builder: (context, AsyncSnapshot<List<Post>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError)
              return Center(child: Text('error'));
            else {
              if (snapshot.data.length == 0) {
                return Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 3 / 4,
                    child: Center(
                      child: Text("Oops Data is empty"),
                    ),
                  ),
                );
              } else {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data[index].title,
                              style: FontThemes.title,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              snapshot.data[index].body,
                              style: FontThemes.body,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }
        }
      },
    );
  }
}
