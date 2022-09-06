import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();
  late String title;

  @override
  void initState() {
    title = "Home";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
          appBar: SliderAppBar(
              appBarColor: Colors.indigoAccent,
              title: Text(title,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w700))),
          key: _key,
          sliderOpenSize: 179,
          //sliderCloseSize: 50,
          slider: _SliderView(
            onItemClick: (title) {
              _key.currentState!.closeSlider();
              setState(() {
                this.title = title;
              });
            },
          ),
          child: _AuthorList()),
    );
  }
}

class _SliderView extends StatelessWidget {
  final Function(String)? onItemClick;

  const _SliderView({Key? key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          const CircleAvatar(
            radius: 65,
            backgroundColor: Colors.blueGrey,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/person.png'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Nick',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'BalsamiqSans'),
          ),
          const SizedBox(
            height: 20,
          ),
          _SliderMenuItem(
              title: 'Home', iconData: Icons.home, onTap: onItemClick),
          _SliderMenuItem(
              title: 'Add Post',
              iconData: Icons.add_circle,
              onTap: onItemClick),
          _SliderMenuItem(
              title: 'Notification',
              iconData: Icons.notifications_active,
              onTap: onItemClick),
          _SliderMenuItem(
              title: 'Likes', iconData: Icons.favorite, onTap: onItemClick),
          _SliderMenuItem(
              title: 'Setting', iconData: Icons.settings, onTap: onItemClick),
          _SliderMenuItem(
              title: 'LogOut',
              iconData: Icons.arrow_back_ios,
              onTap: onItemClick),
        ],
      ),
    );
  }
}

class _SliderMenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function(String)? onTap;

  const _SliderMenuItem(
      {Key? key,
      required this.title,
      required this.iconData,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'BalsamiqSans_Regular',
            )),
        leading: Icon(iconData, color: Colors.black),
        onTap: () => onTap?.call(title));
  }
}

class _AuthorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: Text('Home'),
      ),
    );
  }
}
