import 'package:flutter/material.dart';

class Mydrawer extends StatefulWidget {
  const Mydrawer({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;

  @override
  State<Mydrawer> createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final size = Size(screenSize.width * 0.7, screenSize.height);
    return SizedBox.fromSize(
      size: size,
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        backgroundColor: widget.color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: FractionallySizedBox(
                widthFactor: 1.0,
                child: Builder(builder: (context) {
                  return ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: widget.color != null
                          ? MaterialStateColor.resolveWith(
                              (_) => widget.color!,
                            )
                          : null,
                    ),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 30.0,
                            ),
                            child: Icon(
                              Icons.account_circle,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                          Text(
                            'Perfil',
                            textScaleFactor: 1.0,
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>),
                      );*/
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
