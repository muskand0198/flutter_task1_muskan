import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task1_muskan/providers/dashboard_provider.dart';
import 'package:flutter_task1_muskan/providers/shared_preference_provider.dart';
import 'package:flutter_task1_muskan/router/my_router.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {

  @override
  void dispose() {
    super.dispose();
    ref.invalidate(sharedUtilityProvider);
    ref.invalidate(dashboardStateProvider);
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
               await ref
                    .read(sharedUtilityProvider)
                    .logout()
                    .then((value) => {
                      // MyRouter(isLogin: true),
                      context.goNamed(MyRouter.loginScreen)
                    });
              },
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: response.when(
          data: (data1) {
            // print("Dashboard Success $data1");
            final data = data1;
            if(data != null) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return ListTile(
                    title: Text(item.firstName ?? ""),
                    subtitle: Text(item.email ?? ""),
                    leading: Image.network(item.avatar ??
                        "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif"),
                    onTap: () {},
                  );
                },
              );
            }else{
              return showLoader();
            }
          },
          loading: () {
            // print("Dashboard loading");
            return showLoader();
          },
          error: (error, s) {
            // print("Dashboard Error $error");
            return Text(
                'Error: $error');
          },
        ));
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