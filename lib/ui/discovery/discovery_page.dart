import 'package:bb_cocktail/utils/animation_slide_fade_in.dart';
import 'package:flutter/material.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({Key key}) : super(key: key);

  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> with SingleTickerProviderStateMixin {
  String imageUrl = "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg";

  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    WidgetsBinding.instance.addPostFrameCallback((_) => _controller.forward());
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromARGB(255, 14, 14, 14)),
      child: Stack(
        children: [_buildBackgroundImage(), _buildInfo(context)],
      ),
    );
  }

  Positioned _buildInfo(BuildContext context) {
    return Positioned.fill(
        child: Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 64, left: 32.0, right: 32.0, bottom: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _animateDisplay(
              child: Text(
                "Discover Recipes",
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
              direction: SlideFadeInDirection.fromRight),
          _animateDisplay(
              child: Text(
                "Margarita",
                style: TextStyle(fontSize: 64.0, color: Colors.white, fontFamily: "DMSerifDisplay"),
              ),
              direction: SlideFadeInDirection.fromRight),
          _animateDisplay(
              child: Text(
                "Ordinary Drink",
                style: TextStyle(fontSize: 12.0, color: Colors.white),
              ),
              direction: SlideFadeInDirection.fromRight),
          Spacer(),
          _buildDiscoverButton(),
        ],
      ),
    ));
  }

  Widget _buildDiscoverButton() {
    return _animateDisplay(
        child: Align(
          alignment: Alignment.bottomRight,
          child: RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
            color: Colors.white,
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Text("Discover"), Icon(Icons.keyboard_arrow_right)],
            ),
          ),
        ),
        );
  }

  Widget _animateDisplay({Widget child, SlideFadeInDirection direction}) {
    return SlideFadeInTransition(
      controller: _controller,
      direction: direction,
      child: child,
    );
  }

  Widget _buildBackgroundImage() {
    return Positioned.fill(
        child: Image.network(
      imageUrl,
      fit: BoxFit.cover,
    ));
  }
}
