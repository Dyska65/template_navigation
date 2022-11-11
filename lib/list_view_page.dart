import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:template_navigation/counter_page.dart';
import 'package:template_navigation/search.dart';
import 'package:template_navigation/utils.dart';

// https://medium.com/flutter-community/flutter-state-restoration-restore-scrollviews-and-textfields-d1d35cbd878c

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> with RestorationMixin {
  @override
  // TODO: implement restorationId
  String get restorationId => 'scroll_view';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_scrollIndex, 'scroll_index');
  }

  final RestorableInt _scrollIndex = RestorableInt(0);
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  void initState() {
    _scrollToIndex();
    super.initState();
  }

  void _scrollToIndex() async {
    await Future.delayed(const Duration(milliseconds: 500));
    itemScrollController.scrollTo(
      index: _scrollIndex.value,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
    itemPositionsListener.itemPositions.addListener(() {
      _scrollIndex.value =
          itemPositionsListener.itemPositions.value.first.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.restorablePushReplacement(
                context, Routes.myRouteBuilderMainPage);
          },
        ),
      ),
      body: ScrollablePositionedList.builder(
        itemCount: emails.length,
        itemBuilder: (context, index) {
          var user = emails[index];
          String initials = '';
          if (user.title!.contains(' ')) {
            initials =
                user.title!.split(' ')[0][0] + user.title!.split(' ')[1][0];
          } else {
            initials = user.title![0];
          }
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: Text(
                    initials.toUpperCase(),
                  ),
                ),
                title: Text(user.title!),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.restorablePushReplacement(
                            context, Routes.myRouteBuilderMainPage);
                      },
                      child: Text(
                        user.subject!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      user.description!,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                trailing: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2)),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.restorablePushReplacement(
                          context, Routes.myRouteBuilderSearchPage);
                    },
                    child: Text(
                      user.day!,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const Divider(),
            ],
          );
        },
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
      ),
    );
  }
}
