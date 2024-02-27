import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:reddit/features/ai/ai_screen.dart";
import "package:reddit/features/auth/controller/auth_controller.dart";
import "package:routemaster/routemaster.dart";

import "../../../theme/pallete.dart";

class ProfileDrawer extends ConsumerWidget {
  const ProfileDrawer({super.key});

  void logOut(WidgetRef ref) {
    ref.read(AuthControllerProvider.notifier).logout();
  }

  void navigateToUserProfile(BuildContext context, String uid) {
    Routemaster.of(context).push('/u/$uid');
  }

  void toggleTheme(WidgetRef ref) {
    ref.read(themeNotifierProvider.notifier).toggleTheme();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Drawer(
        child: SafeArea(
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(user!.profilePic),
            radius: 70,
          ),
          const SizedBox(height: 10),
          Text('user : ${user.name}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )),
          const SizedBox(height: 10),
          const Divider(),
          ListTile(
            title: const Text("My Profile"),
            leading: const Icon(Icons.person),
            onTap: () => navigateToUserProfile(context, user.uid),
          ),
          ListTile(
            title: const Text("AI"),
            leading: const Icon(Icons.assistant_navigation),
            onTap: () => AiScreen(),
          ),
          ListTile(
            title: const Text("Log Out"),
            leading: Icon(Icons.logout, color: Pallete.redColor),
            onTap: () => logOut(ref),
          ),
          Switch.adaptive(
            value: ref.watch(themeNotifierProvider.notifier).mode ==
                ThemeMode.dark,
            onChanged: (val) => toggleTheme(ref),
          ),
        ],
      ),
    ));
  }
}
