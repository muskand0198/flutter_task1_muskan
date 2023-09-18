import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task1_muskan/models/response.dart';
import 'package:flutter_task1_muskan/models/user_data.dart';
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
  Widget build(BuildContext context) {
    MyResponse response = ref.watch(dashboardProvider);
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
                    .then((value) => {context.goNamed(MyRouter.loginScreen)});
              },
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: response.when(
          initial: () {
            print("Dashboard Initial");
            return showLoader(); // Widget for initial state
          },
          success: (data1) {
            print("Dashboard Success $data1");
            final data = data1 as List<UserData>;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return ListTile(
                  title: Text(item.first_name ?? ""),
                  subtitle: Text(item.email ?? ""),
                  leading: Image.network(item.avatar ??
                      "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif"),
                  onTap: () {},
                );
              },
            );
          },
          loading: () {
            print("Dashboard loading");
            return showLoader(); // Widget for loading state
          },
          error: (error) {
            print("Dashboard Error $error");
            return Text(
                'Error: $error'); // Widget for error state, passing error message
          },
        ));
  }
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text("Dashboard"),
//       backgroundColor: Colors.blue,
//     ),
//     body: ProviderListenable<MyResponse>(
//       future: _getData(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator(); // Show a loading indicator
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else {
//           // Use the result to decide what to display
//           final result = snapshot.data;
//           return _buildWidgetBasedOnResult(result!);
//         }
//       },
//     ),
//   );
// }

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

Widget _buildWidgetBasedOnResult(MyResponse result) {
  return result.when(
    initial: () {
      return showLoader(); // Widget for initial state
    },
    success: (data1) {
      final data = data1 as List<UserData>;
      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          return ListTile(
            title: Text(item.first_name ?? ""),
            subtitle: Text(item.email ?? ""),
            leading: Image.network(item.avatar ??
                "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif"),
            onTap: () {},
          );
        },
      );
    },
    loading: () {
      return showLoader(); // Widget for loading state
    },
    error: (error) {
      return Text(
          'Error: $error'); // Widget for error state, passing error message
    },
  );
}
