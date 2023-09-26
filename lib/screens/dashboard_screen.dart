import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task1_muskan/providers/dashboard_provider.dart';
import 'package:flutter_task1_muskan/providers/shared_preference_provider.dart';
import 'package:flutter_task1_muskan/router/my_router.dart';
import 'package:flutter_task1_muskan/screens/components/custom_search_bar.dart';
import 'package:go_router/go_router.dart';

import '../providers/change_search_provider.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  void dispose() {
    super.dispose();
    ref.invalidate(dashboardStateProvider);
    ref.invalidate(changeSearchProvider);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(dashboardStateProvider.notifier).getUsersList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final response = ref.watch(dashboardStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () async {
              await ref.read(sharedUtilityProvider).logout().then((value) => {
                    // MyRouter(isLogin: true),
                    context.goNamed(MyRouter.loginScreen)
                  });
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: response.when(
        data: (data) {
          // print("Dashboard Success $data1");
          if(data != null){
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  CustomSearchBar(
                    hintText: "Search",
                    paddingValue: 14.0,
                    onChanged: (val) {
                      ref
                          .read(changeSearchProvider.notifier)
                          .update((state) => state = val);
                    },
                    leading: const Icon(Icons.search)
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Consumer(builder: (context, ref, child) {
                    ref.watch(changeSearchProvider);
                    final searchKey =
                        ref.read(changeSearchProvider.notifier).state;
                    final search = data
                        .where((element) =>
                            element.email!
                                .toLowerCase()
                                .startsWith(searchKey.toLowerCase()) ||
                            element.firstName!
                                .toLowerCase()
                                .startsWith(searchKey.toLowerCase()))
                        .toList();
                    return Expanded(
                      child: ListView.builder(
                        itemCount:
                            search.isNotEmpty ? search.length : data.length,
                        itemBuilder: (context, index) {
                          final finalData = search.isNotEmpty ? search : data;
                          final item = finalData[index];
                          return ListTile(
                            title: Text(item.firstName ?? ""),
                            subtitle: Text(item.email ?? ""),
                            leading: Image.network(item.avatar ??
                                "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif"),
                            onTap: () {},
                          );
                        },
                      ),
                    );
                  })
                ],
              ),
            );
          }
          return showLoader();
        },
        loading: () {
          return showLoader();
        },
        error: (error, s) {
          return Text('Error: $error');
        },
      ),
    );
  }
}

Widget showLoader() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

void showSnackbar(BuildContext context, String text) {
  final snackBar = SnackBar(
    content: Text(text),
    duration: const Duration(seconds: 5),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
