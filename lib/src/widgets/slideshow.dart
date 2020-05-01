import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool pointerTop;
  final Color primaryColor;
  final Color secondaryColor;
  final double bulletPrimary;
  final double bulletSecondary;

  const Slideshow(
      {@required this.slides,
      this.pointerTop = false,
      this.primaryColor = Colors.blue,
      this.secondaryColor = Colors.grey,
      this.bulletPrimary = 12.0,
      this.bulletSecondary = 12.0});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SlideshowModel(),
      child: SafeArea(
        child: Center(child: Builder(
          builder: (BuildContext context) {
            Provider.of<_SlideshowModel>(context).primaryColor =
                this.primaryColor;
            Provider.of<_SlideshowModel>(context).secondaryColor =
                this.secondaryColor;
            Provider.of<_SlideshowModel>(context).bulletPrimary =
                this.bulletPrimary;
            Provider.of<_SlideshowModel>(context).bulletSecondary =
                this.bulletSecondary;
            return _CreateSlideshow(pointerTop: pointerTop, slides: slides);
          },
        )),
      ),
    );
  }
}

class _CreateSlideshow extends StatelessWidget {
  const _CreateSlideshow({
    Key key,
    @required this.pointerTop,
    @required this.slides,
  }) : super(key: key);

  final bool pointerTop;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (this.pointerTop) _Dots(this.slides.length),
        Expanded(child: _Slides(this.slides)),
        if (!this.pointerTop) _Dots(this.slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  const _Dots(this.totalSlides);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.totalSlides, (i) => _Dot(i)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlideshowModel>(context);
    double tamano = 0.0;
    Color color;
    if (ssModel.currentPage >= index - 0.5 &&
        ssModel.currentPage < index + 0.5) {
      tamano = ssModel.bulletPrimary;
      color = ssModel.primaryColor;
    } else {
      tamano = ssModel.bulletSecondary;
      color = ssModel.secondaryColor;
    }
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: tamano,
      height: tamano,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;
  double _bulletPrimary = 12.0;
  double _bulletSecondary = 12.0;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get primaryColor => this._primaryColor;

  set primaryColor(Color color) {
    this._primaryColor = color;
  }

  Color get secondaryColor => this._secondaryColor;

  set secondaryColor(Color color) {
    this._secondaryColor = color;
  }

  double get bulletPrimary => this._bulletPrimary;

  set bulletPrimary(double value) {
    this._bulletPrimary = value;
  }

  double get bulletSecondary => this._bulletSecondary;

  set bulletSecondary(double value) {
    this._bulletSecondary = value;
  }
}
