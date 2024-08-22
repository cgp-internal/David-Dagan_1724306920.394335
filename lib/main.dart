import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<AppProvider>(create: (_) => AppProvider(httpClientRepository: HttpClientRepository(getHttpClient()))),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appProvider = ref.watch(appProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await appProvider.getData('example-endpoint');
          },
          child: Text('Fetch Data'),
        ),
      ),
    );
  }
}