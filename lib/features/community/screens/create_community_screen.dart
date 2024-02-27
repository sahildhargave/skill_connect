import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:phlox_animations/phlox_animations.dart";
import "package:routemaster/routemaster.dart";

import "../../../core/common/loader.dart";
import "../controller/community_controller.dart";

class CreateCommunityScreen extends ConsumerStatefulWidget {
  const CreateCommunityScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateCommunityScreenState();
}

class _CreateCommunityScreenState extends ConsumerState<CreateCommunityScreen> {
  final communityNameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    communityNameController.dispose();
  }

  void createCommunity() {
    ref.read(communityControllerProvider.notifier).createCommunity(
          communityNameController.text.trim(),
          context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(communityControllerProvider);
    return Scaffold(
        body: PhloxAnimations(
            duration: const Duration(milliseconds: 200),
            fromX: -100,
            fromOpacity: 0,
            child: Scaffold(
              appBar: AppBar(
                title: const Text("Create a community"),
              ),
              body: isLoading
                  ? const Loader()
                  : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text("community name"),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: communityNameController,
                            decoration: const InputDecoration(
                              hintText: 'r/community_name',
                              filled: true,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(18),
                            ),
                            maxLength: 21,
                          ),
                          const SizedBox(height: 30),
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: PhloxAnimations(
                                  duration: const Duration(seconds: 1),
                                  fromX: -100,
                                  child: ElevatedButton(
                                      onPressed: createCommunity,
                                      style: ElevatedButton.styleFrom(
                                          minimumSize:
                                              const Size(double.infinity, 50),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                      child: const Text(
                                        "create community",
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ))))
                        ],
                      ),
                    ),
            )));
  }
}
