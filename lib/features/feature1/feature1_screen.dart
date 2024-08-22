import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:lib/provider.dart';

class Feature1Screen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppProvider appProvider = ref.watch(appProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Feature 1 Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final data = await appProvider.getData('feature1-endpoint');
            // handle the data
          },
          child: Text('Get Data'),
        ),
      ),
    );
  }
}