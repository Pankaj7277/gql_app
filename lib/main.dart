import 'package:flutter/material.dart';
import 'package:gql_app/screens/home_screen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'core/graphql_client.dart';

void main() async {
  await initHiveForFlutter(); // required before using HiveStore
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQLService.initializeClient(),
      child: const MaterialApp(
        title: "GraphQl Demo",
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
