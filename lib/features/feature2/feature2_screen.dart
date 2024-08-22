import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:example/lib/provider.dart' show AppProvider;

class Feature2Screen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppProvider appProvider = ref.watch(appProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Feature 2 Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final data = await appProvider.getData('feature2_endpoint');
            // Process the data
          },
          child: const Text('Get Data'),
        ),
      ),
    );
  }
}