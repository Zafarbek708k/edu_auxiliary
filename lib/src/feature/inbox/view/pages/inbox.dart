import 'package:edu_auxiliary/src/core/constants/all_library.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      appBar: AppBar(
        backgroundColor: context.appTheme.primary,
        centerTitle: true,
        title: CustomTextWidget("Chat", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold, fontSize: 16),
        iconTheme: IconThemeData(color: context.appTheme.secondary),
        bottom: PreferredSize(preferredSize: const Size(double.infinity, 2), child: Divider(color: context.appTheme.secondary)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.lightBlue,
        child: Icon(Icons.group_outlined, color: context.appTheme.secondary),
      ),
    );
  }
}
