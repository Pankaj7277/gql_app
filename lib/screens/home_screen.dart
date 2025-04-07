import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../data/countries_query.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Countries")),
      body: Query(
        options: QueryOptions(document: gql(getCountriesQuery)),
        builder: (result, {fetchMore, refetch}) {
          if (result.isLoading) return const Center(child: CircularProgressIndicator());
          if (result.hasException) return Center(child: Text(result.exception.toString()));

          final countries = result.data?['countries'] ?? [];

          return ListView.builder(
            itemCount: countries.length,
            itemBuilder: (context, index) {
              final country = countries[index];
              return ListTile(
                leading: Text(country['emoji']),
                title: Text(country['name']),
                subtitle: Text("Code: ${country['code']}"),
              );
            },
          );
        },
      ),
    );
  }
}
