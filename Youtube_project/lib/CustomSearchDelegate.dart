import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // Actions for search bar (e.g., clear text)
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
    // Leading icon on the left of the search bar (e.g., back arrow)
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

