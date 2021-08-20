import 'package:flutter/cupertino.dart';

class IosScreen extends StatefulWidget {
  static const routeName = '/ios';
  const IosScreen({
    Key? key,
  }) : super(key: key);

  @override
  _IosScreenState createState() => _IosScreenState();
}

class _IosScreenState extends State<IosScreen> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // Uncomment to change the background color
      // backgroundColor: CupertinoColors.systemPink,
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Sample Code'),
      ),
      child: ListView(
        children: <Widget>[
          CupertinoButton(
            onPressed: () => setState(() => _count++),
            child: const Icon(CupertinoIcons.add),
          ),
          Center(
            child: Text('You have pressed the button $_count times.'),
          ),
        ],
      ),
    );
  }
}
