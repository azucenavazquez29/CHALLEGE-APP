import 'package:flutter/material.dart';
import 'package:flutter_application_challege/coffee.dart' as c;

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
var n_coffees = 12;
//En esta seccion se muestra una lista de la vista en pantalla de las imagenes 
Widget list() => ListView.builder(
  itemCount: 13,
  itemBuilder:
  (_,i)=> Image.asset("assets/images/${i+1}.png"));

  final _pageController = PageController(
    viewportFraction: 0.35
  );
  double _currentPage = 0.0;
void _scrollListener(){
setState(() {
  _currentPage = _pageController.page!;
});
}
@override
  void initState() {
    // TODO: implement initState para en el contenedor 
    super.initState();
    _pageController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    // TODO se implememnta en el disponse en el controlador en la lista 
    _pageController.addListener(_scrollListener);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
        body: Stack(
          children: <Widget>[
           
            Positioned(
               left:0,
            top:0,
            right: 0,
            height: 100,
              child: Container(color:const Color.fromARGB(255, 139, 107, 131))),

              PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: c.coffees.length,
                controller: _pageController,
                itemBuilder: (_,i){

                  if(i==0)
                   return SizedBox.shrink();

                  var coffees = c.coffees[i-1];
                  var result = _currentPage - i +1;
                  var value = -0.4 * result + 1; 
                  print(value);
                  var opacity = value.clamp(0.0, 1.0);
                return  Transform(
                  alignment: Alignment.bottomCenter,
                  transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..translate(
                    0.0,
                  MediaQuery.of(context).size.height/2.6 * (1-value).abs())
                  ..scale(value),
                child: Opacity( 
                  opacity:opacity,
                  child:Image.asset(coffees.image)),
                );
               
             
              } 
              )
          ],
        )

        );
  
  }
}