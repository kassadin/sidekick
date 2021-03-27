import 'package:sidekick/components/atoms/loading_indicator.dart';
import 'package:sidekick/components/atoms/screen.dart';
import 'package:sidekick/components/molecules/empty_data_set/empty_packages.dart';
import 'package:sidekick/components/molecules/package_item.dart';
import 'package:sidekick/providers/packages.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PackagesScreen extends HookWidget {
  const PackagesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final packages = useProvider(packagesProvider);

    return packages.when(
        data: (data) {
          if (data.isEmpty) {
            return const EmptyPackages();
          }
          return FvmScreen(
            title: 'Your Most Popular Packages',
            child: Scrollbar(
              child: ListView.builder(
                // separatorBuilder: (_, __) => const Divider(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final package = data[index];
                  final position = ++index;
                  return PackageItem(
                    package,
                    position: position,
                  );
                },
              ),
            ),
          );
        },
        loading: () => const LoadingIndicator(),
        error: (_, __) => Container());
  }
}
