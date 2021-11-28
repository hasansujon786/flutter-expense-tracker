import 'package:flutter/material.dart';

class SliverScreen extends StatefulWidget {
  const SliverScreen({Key? key}) : super(key: key);

  @override
  _SliverScreenState createState() => _SliverScreenState();
}

class _SliverScreenState extends State<SliverScreen> {
  NestedScrollView nested() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text(
                "Collapsing AppBar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              background: Container(
                color: Colors.blue,
              ),
              /* background: Image.asset( */
              /*   "images/parrot.jpg", */
              /*   fit: BoxFit.cover, */
              /* ), */
            ),
          )
        ];
      },
      body: const Center(
        child: Text("The Parrot"),
      ),
    );
  }

  CustomScrollView custom() {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          title: MyAppBar(),
          expandedHeight: 200.0,
          floating: false,
          pinned: true,
          stretch: true,
          flexibleSpace: FlexibleSpaceBar(
            background: MyFlexiableAppBar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Text('fooo $index'),
            childCount: 50,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: custom(),
      /* body: nested(), */
    );
  }
}

class MyFlexiableAppBar extends StatelessWidget {
  final double appBarHeight = 66.0;

  const MyFlexiableAppBar();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      /* height: statusBarHeight + appBarHeight, */
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text("Balance",
                      style:
                          const TextStyle(color: Colors.white, fontSize: 28.0)),
                ),
                Container(
                  child: Text("\u002420,914.33",
                      style:
                          const TextStyle(color: Colors.white, fontSize: 36.0)),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text("\u002B24.93\u0025",
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 20.0)),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Icon(
                      Icons.arrow_upward,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
                    child: Text("Currency",
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 16.0)),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
                    child: Container(
                        child: Row(
                      children: <Widget>[
                        Container(
                          child: Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text(
                            'Janaury 2019',
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 16.0),
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
      decoration: BoxDecoration(
        color: Color(0xff013db7),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {

  final double barHeight = 66.0;

  const MyAppBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.menu, color: Colors.white,),
          ),),

          Container(child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'My Digital',
              style: TextStyle(
                color: Colors.white,
                  fontSize: 20.0
              ),
            ),

          ),),

          Container(child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.person, color: Colors.white,),
          ),),

        ],
      ),
    );
  }
}
