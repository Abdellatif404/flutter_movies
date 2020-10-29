import 'package:fetch_data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Data data = Data();

    return Scaffold(
      backgroundColor: Color(0xFF222831),
      appBar: AppBar(
        backgroundColor: Color(0xFF2A3039),
        title: Text(
          'No Movies',
          style: TextStyle(
            color: Color(0xFF919497),
            fontFamily: 'SansitaSwashed',
          ),
        ),
        centerTitle: true,
      ),
      body: GridView.count(
        padding: EdgeInsets.symmetric(horizontal: 10),
        physics: BouncingScrollPhysics(),
        childAspectRatio: 0.5,
        crossAxisSpacing: 10,
        crossAxisCount: 3,
        children: List.generate(500, (index) {
          return FutureBuilder(
            future: data.getData(),
            builder: (context,snapshot) {
              if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage('${snapshot.data['image']['medium']}'),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${snapshot.data['name']}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            '${snapshot.data['premiered'].toString().substring(0,4)}',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              else if(!snapshot.hasData || snapshot.hasError) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                  color: Color(0xffc72c41),
                  child: Center(child: Text('ERROR')),
                );
              }
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                color: Color(0xffffbd69),
                child: Center(child: Text('NO DATA')),
              );
            },
          );
        }),
      ),
    );
  }
}

class Fakjh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
