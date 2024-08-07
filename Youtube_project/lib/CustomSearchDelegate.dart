import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
  
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    Future.delayed(Duration.zero,(){
    close(context, query);
  });
 
  return Center(child: CircularProgressIndicator(),);
}
  @override
  Widget buildSuggestions(BuildContext context) {
    
    return Container(); 
    
  }
}

