import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

enum ScreenType {
  text,
  RowAColum,
  ContainerW,
  SizeBoxW,
  image,
  Button,
  Scaffold,
  Card,
  GestureDetector,
  Inkwell,
  Textfield,
  TextEditingController,
  Form,
  showDialog,
  BottomSheet,
  //FirstScreen,
  ChangeText,
  ListView,
  CardW,
  ListTile,
  MyListViewWithRefresh,
  SingleChildScrollView,
  GridView,
  Stack,
  Expanded,
  Flexible,
  PageView,
  TabBar,
  TabBarWithCustomController,
  BottomNavigationBar,
  FutureAndStreamBuilder,
  LiveCounterScreen,
  HomeScreenW,
  ChatReverseRefresh,
}

extension ScreenExtension on ScreenType {
  Widget get screenWidget {
    switch (this) {
      case ScreenType.text:
        return const TextWidget();
      case ScreenType.RowAColum:
        return const RowAColum();
      case ScreenType.ContainerW:
        return const ContainerW();
      case ScreenType.SizeBoxW:
        return const SizeBoxWidget();
      case ScreenType.image:
        return const ImageWidget();
      case ScreenType.Button:
        return const IconAndIconButton();
      case ScreenType.Scaffold:
        return const ScaffoldWid();
      case ScreenType.Card:
        return const CardWg();
      case ScreenType.GestureDetector:
        return const GestureDetectorW();
      case ScreenType.Inkwell:
        return const InkWellW();
      case ScreenType.Textfield:
        return const TextFieldW();
      case ScreenType.TextEditingController:
        return TextEditingControllerW();
      case ScreenType.Form:
        return FormW();
      case ScreenType.showDialog:
        return showDiaLogW();
      case ScreenType.BottomSheet:
        return BottomSheetW();

      case ScreenType.ChangeText:
        return ChangeText();
      case ScreenType.ListView:
        return ListViewW();
      case ScreenType.CardW:
        return CardW();
      case ScreenType.ListTile:
        return ListTileW();
      case ScreenType.MyListViewWithRefresh:
        return MyListViewWithRefresh();
      case ScreenType.SingleChildScrollView:
        return SingleChildScrollViewW();
      case ScreenType.GridView:
        return GridViewW();
      case ScreenType.Stack:
        return StackW();
      case ScreenType.Expanded:
        return ExpandedW();
      case ScreenType.Flexible:
        return FlexibleW();
      case ScreenType.PageView:
        return PageViewW();
      case ScreenType.TabBar:
        return TabBarW();
      case ScreenType.TabBarWithCustomController:
        return TabBarWithCustomController();
      case ScreenType.BottomNavigationBar:
        return BottomNavigationBarW();
      case ScreenType.FutureAndStreamBuilder:
        return DataLoadingScreen();
      case ScreenType.LiveCounterScreen:
        return LiveCounterScreen();
      case ScreenType.HomeScreenW:
        return HomeScreenW();
      case ScreenType.ChatReverseRefresh:
        return ChatReverseRefresh();
    }
  }
}

/*

 textThem: GoogleFonts.lobsterTextTheme(Theme.of(context).textTheme);
 muon thay doi chu cua toan he thong
*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enum Navigation Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/second': (context) => NavigatorW2(),
      },
    );
  }
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   // Ví dụ biến trạng thái
//   bool is1st = true;
//
//   // Hàm setter
//   void set1Sc(bool value) {
//     setState(() {
//       is1st = value;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Navigator(
//         pages: [
//           MaterialPage(child: HomeScreen(set1Sc)),
//           if(is1st == false) MaterialPage(child:NavigatorW2())
//
//
//         ],
//
//
//       ),
//
//     );
//   }
//
//
// }

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //  final Function setFirst;
  // //
  //  const HomeScreen(this.setFirst);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      floatingActionButton: FloatingActionButton(
          child: Text("Open Screen"),
          onPressed: () {
            Navigator.pushNamed(context, '/second',
                arguments: {"Hong Anh": 123});
          }),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 2),
        itemCount: ScreenType.values.length,
        itemBuilder: (context, index) {
          final screen = ScreenType.values[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Scaffold(
                      appBar: AppBar(title: Text(screen.name)),
                      body: screen.screenWidget,
                    ),
                  ),
                );
              },
              child: Text(screen.name),
            ),
          );
        },
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SelectionArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selectable text',
            ),
            SelectionContainer.disabled(
              child: Text(
                'Non-selectable text',
                textAlign: TextAlign.left, //can le
                maxLines: 3, //cho text toi da 3 dong
              ),
            ),
            Text('Selectable text'),
            Container(
              width: 100,
              decoration: BoxDecoration(border: Border.all()),
              child: Text(
                overflow: TextOverflow.fade,
                'Hello , how are you?',
                textAlign: TextAlign.center,
                maxLines: 1,
                textDirection: TextDirection.ltr,
              ),
            ),
            Text(
                overflow: TextOverflow.visible,
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    shadows: [
                      Shadow(
                          color: Colors.black38,
                          blurRadius: 10.0,
                          offset: Offset(10.0, 3.2)),
                    ],
                    foreground: Paint()
                      ..shader = LinearGradient(
                              colors: [Colors.red, Colors.blue, Colors.amber])
                          .createShader(Rect.fromLTWH(10, 2, 5, 7))),
                textAlign: TextAlign.right,
                softWrap: false,
                'Hello  how are you?'),
            SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                text: "Already have Account?",
                style: TextStyle(color: Colors.greenAccent),
                children: [
                  WidgetSpan(
                    child: Icon(
                      Icons.remove_red_eye_sharp,
                      color: Colors.greenAccent,
                    ),
                  ),
                  TextSpan(
                    text: "SIGN IN",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.blueGrey,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                text: 'By tapping "Sign up" you accept our ',
                style: TextStyle(
                    fontStyle: FontStyle.italic, color: Colors.orangeAccent),
                children: [
                  TextSpan(
                    text: "terms ",
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.blue),
                  ),
                  TextSpan(
                    text: "and ",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  TextSpan(
                    text: "condition",
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RowAColum extends StatelessWidget {
  const RowAColum({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.deepPurpleAccent,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.deepPurpleAccent,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.deepPurpleAccent,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "data1",
                style: GoogleFonts.aboreto(color: Colors.pink, fontSize: 60),
              ),
              Text(
                " data2",
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 40,
                    fontStyle: FontStyle.italic),
              ),
              Text(
                " data3",
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ContainerW extends StatelessWidget {
  const ContainerW({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.pinkAccent,
          border: Border.all(
            width: 1,
            color: Colors.orange,
          )),
      margin: EdgeInsets.all(30),
      padding: EdgeInsets.all(30),
      child: Text(
        "Content of Container",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      width: 200,
      height: 100,
    );
  }
}

class SizeBoxWidget extends StatelessWidget {
  const SizeBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox();
    return SizedBox(
      width: 200,
      height: 300,
      child: Text("Learn about SizeBox"),
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String imagenJson =
      "iVBORw0KGgoAAAANSUhEUgAAAQAAAAEACAIAAADTED8xAAADMElEQVR4nOzVwQnAIBQFQYXff81RUkQCOyDj1YOPnbXWPmeTRef+/3O/OyBjzh3CD95BfqICMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMO0TAAD//2Anhf4QtqobAAAAAElFTkSuQmCC";

  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Uint8List _image = base64Decode(imagenJson);
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.all(0),
            child: Text(
              "Hinh anh tu local",
              style: TextStyle(fontSize: 30, color: Colors.pink),
              textAlign: TextAlign.start,
            )),
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(128), // dieu chinh do bong mo
              spreadRadius: 5, // bk lan toa
              blurRadius: 7, //do mo
              offset: Offset(0, 3), // do lech
            )
          ], borderRadius: BorderRadius.circular(15)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "assets/image.jpg",
              width: 200,
              height: 100,
              fit: BoxFit.contain,
              opacity: AlwaysStoppedAnimation(0.9),
              colorBlendMode: BlendMode.colorDodge,
              isAntiAlias: true, // lam min vien
            ),
          ),
        ),
        /*
        Image.network(
            "https://img.tripi.vn/cdn-cgi/image/width=700,height=700/https://gcs.tripi.vn/public-tripi/tripi-feed/img/482901pIR/anh-mo-ta.png"),
        Image.network(
          'https://example.com/image.jpg',
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(child: CircularProgressIndicator());
          },
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.broken_image, size: 50, color: Colors.red);
          },
        ),

        */

        Container(
          width: 200,
          height: 200,
          child: Image.memory(_image),
        )
      ],
    );
  }
}

class IconAndIconButton extends StatelessWidget {
  const IconAndIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.heart_broken,
              color: Colors.purple,
              size: 50,
            ),
            IconButton(
              onPressed: () {
                print("Da an vao nut nay");
              },
              icon: Icon(Icons.cake_sharp),
              tooltip: "Cake",
              color: Colors.red,
              iconSize: 90,
            ),
          ],
        ),
        Row(
          children: [
            //ElevatedButton
            ElevatedButton(
              onPressed: () {
                print("  ElevatedButton");
              },
              child: Text(
                "  ElevatedButton",
                style: TextStyle(color: Colors.orange),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.black38,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            //TexttButton
            TextButton(
              onPressed: () {
                print("TextButton");
              },
              child: Text("TextButton"),
            ),

            //OutlineButton
            OutlinedButton(
                onPressed: () {
                  print("OutLineButton");
                },
                style: OutlinedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text(
                  "OutlineButton",
                  style: TextStyle(fontSize: 9),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //FloatingActionButton
            FloatingActionButton(
              onPressed: () {
                print("FloatingActionButton");
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}

class ScaffoldWid extends StatelessWidget {
  const ScaffoldWid({super.key});

  Widget view() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tieu de"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.save),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Text("Dong dau tien"),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          TextButton(onPressed: () {}, child: Text("Nut bam")),
        ],
      ),

      //Hien menube trai
      drawer: Drawer(
        child: Column(
          children: [
            Text("Menu"),
            Text("data"),
            Text("data"),

            IconButton(
              onPressed: () {},
              icon: Icon(Icons.save),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
            //TexttButton
            TextButton(
              onPressed: () {
                print("TextButton");
              },
              child: Text("TextButton"),
            ),

            //OutlineButton
            OutlinedButton(
                onPressed: () {
                  print("OutLineButton");
                },
                child: Text(
                  "OutlineButton",
                  style: TextStyle(fontSize: 9),
                ))
          ],
        ),
      ),
    );
  }
}

class CardWg extends StatelessWidget {
  const CardWg({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.pinkAccent,
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: Text(
          "Toi qua met moi roi!!!!!!",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}

class GestureDetectorW extends StatelessWidget {
  const GestureDetectorW({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 1000,
        ),
        //GestureDetector
        GestureDetector(
          /*
          onTap: () {
            print("Noi dung nay duoc nhan 1 lan");
          },
          //nhan 1 lan
          onDoubleTap: () {
            print("Noi dung duoc nhan 2 lan");
          },
          // nhan 2 lan
          onPanUpdate: (on) {
            print("Noi dung dang bi keo + ${on.delta}");
          },
          //  keo
          onTapUp: (tap) {
            print("OnTapUp");
          },
          onTapDown: (tap) {
            print("OnTapDown");
          },
          //goi khi ngon tay cham vao
          onTapCancel: () {
            print("OnTapCancel");
          },
          onLongPress: (){print("OnLongPress");},
          onLongPressStart: (tap){print("OnLongPressStart!");},
           */
          onLongPressStart: (tap) {
            print("OnLongPressStart!");
          },

          //goi khi tap bi huy kieu nhu la k tap ma keo sang
          child: Container(
            width: 200,
            height: 100,
            color: Colors.blue,
            child: Center(child: Text("Toi buon ngu qua!!!")),
          ),
        )
      ],
    );
  }
}

class InkWellW extends StatelessWidget {
  const InkWellW({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
          onTap: () {
            print("OnTap");
          },
          onDoubleTap: () {
            print("DoubleTap");
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 1)),
            child: Text("Minh ten la Hong Anh!!!!"),
          )),
    );
  }
}

class NavigatorW2 extends StatelessWidget {
  const NavigatorW2({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final int value = args['Hong Anh'];
    return Scaffold(
      appBar: AppBar(
        title: Text("2nd screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "back 1st screen \n $value",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class TextFieldW extends StatelessWidget {
  const TextFieldW({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(fontSize: 12),
            decoration: InputDecoration(
              labelText: "In4",
              hintText: "Nhap vao thong tin cua ban",
              prefixIcon: Icon(Icons.account_circle),
              prefixIconColor: Colors.purple,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: "Email",
                hintText: "Nhap vao email cua ban",
                helperText: "Nhap email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                prefixIcon: Icon(Icons.email),
                suffixIcon: Icon(Icons.clear),
                filled: true,
                fillColor: Colors.grey),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: "Phone",
              hintText: "Nhap vao SDT cua ban",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              prefixIcon: Icon(Icons.call),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            obscureText: true,
            // obscuringCharacter: "^_^",
            decoration: InputDecoration(
              labelText: "Pw",
              hintText: "Nhap vao mk cua ban",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextEditingControllerW extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<TextEditingControllerW> {
  final _textController = TextEditingController();
  String _inputtext = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(fontSize: 12),
            decoration: InputDecoration(
              labelText: "In4",
              hintText: "Nhap vao thong tin cua ban",
              prefixIcon: Icon(Icons.account_circle),
              prefixIconColor: Colors.purple,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: _textController,
            decoration: InputDecoration(
                labelText: "Email",
                hintText: "Nhap vao email cua ban",
                helperText: "Nhap email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                prefixIcon: Icon(Icons.email),
                suffixIcon: IconButton(
                  onPressed: () {
                    _textController.clear();
                  },
                  icon: Icon(Icons.clear),
                ),
                filled: true,
                fillColor: Colors.grey),
            onChanged: (value) {
              setState(() {
                _inputtext = value;
              });
            },
          ),
          SizedBox(
            height: 5,
          ),
          Text("Email cua ban la : $_inputtext"),
          SizedBox(
            height: 20,
          ),
          TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: "Phone",
              hintText: "Nhap vao SDT cua ban",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              prefixIcon: Icon(Icons.call),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            obscureText: true,
            // obscuringCharacter: "^_^",
            decoration: InputDecoration(
              labelText: "Pw",
              hintText: "Nhap vao mk cua ban",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FormW extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormBasicState();
}

class _FormBasicState extends State<FormW> {
  final _formKey = GlobalKey<FormState>();
  String? _name;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Ho va ten",
              hintText: "Nhap ho va ten cua ban",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onSaved: (value) {
              _name = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Vui long nhap ho va ten';
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/image.jpg",
                        width: 200,
                        height: 100,
                        fit: BoxFit.contain,
                        opacity: AlwaysStoppedAnimation(0.9),
                        colorBlendMode: BlendMode.colorDodge,
                        isAntiAlias: true, // lam min vien
                      ),
                    )));
                  }
                },
                child: Text("Submit"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Reset"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class showDiaLogW extends StatelessWidget {
  // showDialogW({super.key});

  @override
  Widget build(BuildContext context) {
    // return AlertDialog(
    //   title: Text("Xac nhan xoa"),
    //   content: Text("Ban chac chan muon xoa chu?"),
    //   actions: [TextButton(
    //     onPressed: () => Navigator.pop(context),
    //     child: Text('Hủy'),
    //   ),
    //     TextButton(
    //       onPressed: () {
    //         // Xử lý xóa
    //         Navigator.pop(context);
    //       },
    //       child: Text('Xóa'),
    //     ),],
    // );
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 150,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tiêu đề",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.cancel),
                ],
              ),
            ),
            Text("........................."),
            Text(".............................."),
            Text("......................."),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Huy"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BottomSheetW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(title: Text('Chia sẻ')),
                    ListTile(title: Text('Sửa')),
                    ListTile(title: Text('Xoá')),
                  ],
                ),
              ),
            );
          },
          child: Text('Mở Bottom Sheet'),
        ),
      ),
    );
  }
}

// class FirstScreen extends StatefulWidget {
//   final String? redirectTo;
//
//   const FirstScreen({super.key, this.redirectTo});
//
//   @override
//   _FirstScreenState createState() => _FirstScreenState();
// }
//
// class _FirstScreenState extends State<FirstScreen> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (widget.redirectTo == 'screen5' && mounted) {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => const Screen5()));
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         // child: ElevatedButton(
//         //   onPressed: () async {
//         //     final result = await Navigator.push(
//         //         context,
//         //         MaterialPageRoute(
//         //             builder: (context) =>
//         //                 SecondScreen(dataFromFirst: "Du lieu man 2"))
//         //         //MaterialPageRoute(builder: (context) => SecondScreen(dataFromFirst: "Du lieu man 2")),
//         //         );
//         //
//         //     if (result != null) {
//         //       ScaffoldMessenger.of(context).showSnackBar(
//         //         SnackBar(
//         //           content: Text('Received result: $result'),
//         //         ),
//         //       );
//         //     }
//         //   },
//         //   child: Text('Go to Second Screen'),
//         // ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                               SecondScreen(dataFromFirst: "Trang chu")));
//                 },
//                 child: Text("Trang chu")),
//             ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Screen5()));
//                 },
//                 child: Text("Ket ban")),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class SecondScreen extends StatefulWidget {
//   final String dataFromFirst;
//
//   SecondScreen({required this.dataFromFirst});
//
//   @override
//   _SecondScreenState createState() => _SecondScreenState();
// }
//
// class _SecondScreenState extends State<SecondScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Second Screen'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Data from 1st Screen: ${widget.dataFromFirst}'),
//             ElevatedButton(
//               onPressed: () async {
//                 final result = await Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) =>
//                           ThirdScreen(dataFromFirst: ' Du lieu man 3')),
//                 );
//                 if (result != null) {
//                   Navigator.pop(context, result);
//                 }
//               },
//               child: Text('go to 3th Screen'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ThirdScreen extends StatefulWidget {
//   final String dataFromFirst;
//
//   ThirdScreen({required this.dataFromFirst});
//
//   @override
//   _ThirdScreenState createState() => _ThirdScreenState();
// }
//
// class _ThirdScreenState extends State<ThirdScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('3th Screen'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Data from 2nd Screen: ${widget.dataFromFirst}'),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => FirstScreen();
//               },
//               child: Text('Send Data to First Screen'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ChangeText extends StatefulWidget {
  @override
  _changeText createState() => _changeText();
}

class _changeText extends State<ChangeText> {
  String Textchange = "data";

  void change(String newText) {
    setState(() {
      Textchange = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Text(
                Textchange,
                style: TextStyle(fontSize: 24, color: Colors.purple),
              ),
              SizedBox(
                height: 20,
              ),
              changeButton(
                changeText: (newText) {
                  change(newText);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class changeButton extends StatelessWidget {
  final Function(String) changeText;

  //, required this.change
  const changeButton({Key? key, required this.changeText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _text = "Buon ngu qua";
    return ElevatedButton(
      onPressed: () => changeText(_text),
      child: Text("changeText"),
    );
  }
}

class ListViewW extends StatelessWidget {
  const ListViewW({super.key});

  //Nếu itemExtent không null, nó buộc các widget con có kích thước cố định theo hướng cuộn.
  // Nếu prototypeItem không null, nó buộc các widget con có cùng kích thước với widget mẫu được cung cấp theo hướng cuộn.

  //ListView.custom cho phép bạn toàn quyền kiểm soát cách con được hiển thị qua SliverChildDelegate.

  @override
  Widget build(BuildContext context) {
    // final outerListChildren = <ListView>[
    //   ListView(
    //     shrinkWrap: true,
    //     physics: const NeverScrollableScrollPhysics(),
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: [
    //           Text("data"),
    //           Text("data"),
    //         ],
    //       )
    //     ],
    //   ),
    //   ListView(
    //     shrinkWrap: true,
    //     physics: const NeverScrollableScrollPhysics(),
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: [
    //           Text("data"),
    //           Text("data"),
    //         ],
    //       )
    //     ],
    //   ),
    //   ListView(
    //     shrinkWrap: true,
    //     physics: const NeverScrollableScrollPhysics(),
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: [
    //           Text("data"),
    //           Text("data"),
    //         ],
    //       )
    //     ],
    //   ),
    //   ListView(
    //     shrinkWrap: true,
    //     physics: const NeverScrollableScrollPhysics(),
    //     //scrollDirection: Axis.horizontal,
    //     children: [
    //       Container(
    //         height: 50,
    //         color: Colors.pinkAccent,
    //         child: Center(
    //           child: Text("Exp 1"),
    //         ),
    //       ),
    //       Container(
    //         height: 50,
    //         color: Colors.blue,
    //         child: Center(
    //           child: Text("Exp 2"),
    //         ),
    //       ),
    //       Container(
    //         height: 50,
    //         color: Colors.pinkAccent,
    //         child: Center(
    //           child: Text("Exp 3"),
    //         ),
    //       ),
    //     ],
    //   ),
    // ];
    // return ListView.builder(
    //   itemCount: outerListChildren.length,
    //   itemBuilder: (context, index) {
    //     return outerListChildren[index];
    //   },
    // );

    // xư lý những trường hợp gây giật lag
    //  final outerListChildren = <ListView>[
    //    ListView(
    //      shrinkWrap: true,
    //      physics: const NeverScrollableScrollPhysics(),
    //      children: [
    //        Row(
    //          mainAxisAlignment: MainAxisAlignment.spaceAround,
    //          children: [
    //            Text("data"),
    //            Text("data"),
    //          ],
    //        )
    //      ],
    //    ),
    //    ListView(
    //      shrinkWrap: true,
    //      physics: const NeverScrollableScrollPhysics(),
    //      children: [
    //        Row(
    //          mainAxisAlignment: MainAxisAlignment.spaceAround,
    //          children: [
    //            Text("data"),
    //            Text("data"),
    //          ],
    //        )
    //      ],
    //    ),
    //    ListView(
    //      shrinkWrap: true,
    //      physics: const NeverScrollableScrollPhysics(),
    //      children: [
    //        Row(
    //          mainAxisAlignment: MainAxisAlignment.spaceAround,
    //          children: [
    //            Text("data"),
    //            Text("data"),
    //          ],
    //        )
    //      ],
    //    ),
    //    ListView(
    //      shrinkWrap: true,
    //      physics: const NeverScrollableScrollPhysics(),
    //      //scrollDirection: Axis.horizontal,
    //      children: [
    //        Container(
    //          height: 50,
    //          color: Colors.pinkAccent,
    //          child: Center(
    //            child: Text("Exp 1"),
    //          ),
    //        ),
    //        Container(
    //          height: 50,
    //          color: Colors.blue,
    //          child: Center(
    //            child: Text("Exp 2"),
    //          ),
    //        ),
    //        Container(
    //          height: 50,
    //          color: Colors.pinkAccent,
    //          child: Center(
    //            child: Text("Exp 3"),
    //          ),
    //        ),
    //      ],
    //    ),
    //  ];
    // return CustomScrollView(
    //
    // );
    //   ListView.builder(
    //   itemCount: 100,
    //   prototypeItem: ListTile(title: Text("Prototype")),
    //   itemBuilder: (context, index) => ListTile(title: Text("Item $index")),
    // );

    //   ListView.separated(
    //   itemCount: 20,
    //   itemBuilder: (context, index) {
    //     return ListTile(
    //       title: Text('Item $index'),
    //     );
    //   },
    //   separatorBuilder: (context, index) {
    //     return Divider(); // được gọi giữa các phần tử
    //   },
    // );
    //Có separatorBuilder riêng, dễ quản lý.Còn đâu cũng giống như builder

    //   ListView.builder(
    //   itemCount: 20,
    //   itemBuilder: (context, index) {
    //     return Column(
    //       children: [
    //         ListTile(
    //           title: Text('Item $index'),
    //         ),
    //         Divider(), // dòng kẻ phân cách
    //       ],
    //     );
    //   },
    // );

    //   ListView.builder(itemBuilder: (context, index) {
    //   return ListTile(title: Text("data"),);
    // },);
    //ListBuilder thieu itemcount thi se la danh sach dai vo han do ta khong biet bao gio no dung.
    // return ListView.builder(
    //   itemCount: 10000,
    //   itemBuilder: (context, i) {
    //     print('Builder: build $i');
    //     return ListTile(title: Text('Item $i'));
    //   },
    // );

    return ListView(
      scrollDirection: Axis.vertical,
      //physics: BouncingScrollPhysics(), // Cuộn vượt giới hạn rồi nảy lại
      //physics: ClampingScrollPhysics(), Cuộn vượt giới hạn ko nảy lại
      //physics: NeverScrollableScrollPhysics(), ko cho phep cuon
      physics: PageScrollPhysics(), // cuon tung trang

      padding: EdgeInsets.all(16),
      children: List.generate(18, (index) {
        return Container(
          margin: EdgeInsets.only(bottom: 8),
          padding: EdgeInsets.all(12),
          color: Colors.grey[300],
          child: Text("Item $index"),
        );
      }),
    );

    // return ListView.builder(
    //   itemCount: 1000,
    //   itemBuilder: (context, index) {
    //     return ListTile(title: Text('Item $index'));
    //   },
    // );

    // return ListView(
    //   children: [
    //     Text('Item 1'),
    //     Text('Item 2'),
    //     Text('Item 3'),
    //   ],
    // );

    //ListView(
    // mặc định sẽ là listView theo chiều doc còn nếu muốn đổi chiều thì ta sẽ dùng scrollDirection
    // scrollDirection: Axis.horizontal,
    // children: [
    //   Container(
    //     height: 50,
    //     color: Colors.pinkAccent,
    //     child: Center(
    //       child: Text("Exp 1"),
    //     ),
    //   ),
    //
    //   Container(
    //     height: 50,
    //     color: Colors.blue,
    //     child: Center(
    //       child: Text("Exp 2"),
    //     ),
    //   ),
    //
    //   Container(
    //     height: 50,
    //     color: Colors.pinkAccent,
    //     child: Center(
    //       child: Text("Exp 3"),
    //     ),
    //   ),
    //
    // ],
    //);
  }
}

class CardW extends StatelessWidget {
  const CardW({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            title: Text('Thẻ nâng cao'),
            subtitle: Text('Có bóng đổ và nền sáng'),
          ),
          color: Colors.purple,
          elevation: 20,
          shadowColor: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        // Thẻ đầy (Filled Card)
        Card.filled(
          child: ListTile(
            title: Text('Thẻ đầy'),
            subtitle: Text('Nền đầy màu'),
          ),
          elevation: 20,
          color: Colors.purple,
          shadowColor: Colors.blue,
        ),
        // Thẻ viền (Outlined Card)
        Card.outlined(
          child: ListTile(
            title: Text('Thẻ viền'),
            subtitle: Text('Có viền bao quanh, không bóng đổ'),
          ),
        ),
      ],
    );
    // Card(
    //   child: Column(
    //     children: [
    //       ListTile(
    //         leading: Icon(Icons.music_note),
    //         title: Text('Tên vở nhạc kịch'),
    //         subtitle: Text('Mô tả ngắn về vở nhạc kịch'),
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.end,
    //         children: [
    //           TextButton(
    //             child: Text('MUA VÉ'),
    //             onPressed: () {/* Xử lý mua vé */},
    //           ),
    //           TextButton(
    //             child: Text('NGHE'),
    //             onPressed: () {/* Xử lý nghe */},
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}

class MyListViewWithRefresh extends StatefulWidget {
  @override
  _MyListViewWithRefreshState createState() => _MyListViewWithRefreshState();
}

class _MyListViewWithRefreshState extends State<MyListViewWithRefresh> {
  List<int> items = List.generate(10, (index) => index);

  Future<void> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      items.insertAll(0, List.generate(10, (i) => items.length + i));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Kéo từ trên xuống để làm mới")),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: EdgeInsets.all(16),
              color: Colors.grey[300],
              child: Text("Item ${items[index]}"),
            );
          },
        ),
      ),
    );
  }
}

class ListTileW extends StatelessWidget {
  const ListTileW({super.key});

  @override
  Widget build(BuildContext context) {
    // return Material(
    //   child: ListTile(
    //     title: Text('Mục danh sách'),
    //     tileColor: Colors.green[200], // Nền bình thường
    //   //  selectedTileColor: Colors.blue[100], // Nền khi được chọn
    //    // selected: true,
    //   ),
    // );
    return ListTile(
      title: Text("hihihihihihihihi"),
      subtitle: Text("data"),
      leading: Icon(Icons.add),
      trailing: Icon(Icons.accessibility_new_outlined),
      tileColor: Colors.green[200],
      selectedTileColor: Colors.orange,
      selected: true,
      onTap: () {
        print("hic");
      },
    );
    // return const Material(
    //   child: ListTile(
    //     title: Text("kkkkkkkkkkkkkkkkkkkkkkkkkkkk"),
    //     textColor: Colors.orange,
    //   ),
    // );
  }
}

// class SingleChildScrollViewW extends StatelessWidget {
//   const SingleChildScrollViewW({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: EdgeInsets.all(16.0), // Khoảng đệm xung quanh
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//      return ConstrainedBox(
//       constraints: BoxConstraints(minHeight: constraints.maxHeight),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Container(
//             color: Colors.blue[100],
//             padding: EdgeInsets.all(8.0),
//             child: Text('Mục 1', style: TextStyle(fontSize: 20)),
//           ),
//           Container(
//             color: Colors.green[100],
//             padding: EdgeInsets.all(8.0),
//             child: Text('Mục 2', style: TextStyle(fontSize: 20)),
//           ),
//           Container(
//             color: Colors.red[100],
//             padding: EdgeInsets.all(8.0),
//             child: Text('Mục 3', style: TextStyle(fontSize: 20)),
//           ),
//           Container(
//             color: Colors.yellow[100],
//             padding: EdgeInsets.all(8.0),
//             child: Text('Mục 4', style: TextStyle(fontSize: 20)),
//           ),
//           Container(
//             color: Colors.purple[100],
//             padding: EdgeInsets.all(8.0),
//             child: Text('Mục 5', style: TextStyle(fontSize: 20)),
//           ),
//         ],
//       ),
//     );
//   },
//   ),
//     );
//   }
// }
class SingleChildScrollViewW extends StatelessWidget {
  const SingleChildScrollViewW({super.key});

  @override
  Widget build(BuildContext context) {
    //   return SingleChildScrollView(
    //     padding: EdgeInsets.all(16.0),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         Container(
    //           color: Colors.blue[300], // Đậm hơn để dễ thấy
    //           padding: EdgeInsets.all(8.0),
    //           child: Text('Mục 1', style: TextStyle(fontSize: 20)),
    //         ),
    //         Container(
    //           color: Colors.green[300],
    //           padding: EdgeInsets.all(8.0),
    //           child: Text('Mục 2', style: TextStyle(fontSize: 20)),
    //         ),
    //         Container(
    //           color: Colors.red[300],
    //           padding: EdgeInsets.all(8.0),
    //           child: Text('Mục 3', style: TextStyle(fontSize: 20)),
    //         ),
    //         Container(
    //           color: Colors.yellow[300],
    //           padding: EdgeInsets.all(8.0),
    //           child: Text('Mục 4', style: TextStyle(fontSize: 20)),
    //         ),
    //         Container(
    //           color: Colors.purple[300],
    //           padding: EdgeInsets.all(8.0),
    //           child: Text('Mục 5', style: TextStyle(fontSize: 20)),
    //         ),
    //       ],
    //     ),
    //   );

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //MyContainer(color: Colors.red, text: 'Mục 1'),
            //MyContainer(color: Colors.green, text: 'Mục 2'),
            MyContainer(color: Colors.blue, text: 'Mục 3'),
            MyContainer(color: Colors.orange, text: 'Mục 4'),
            MyContainer(color: Colors.purple, text: 'Mục 5'),
            MyContainer(color: Colors.brown, text: 'Mục 6'),
            MyContainer(color: Colors.cyan, text: 'Mục 7'),
            MyContainer(color: Colors.cyan, text: 'Mục 7'),
          ],
        ),
      ),
    );
  }
}

// Widget Container tái sử dụng cho gọn
class MyContainer extends StatelessWidget {
  final Color color;
  final String text;

  const MyContainer({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120, // Chiều cao cố định cho mỗi hộp
      color: color,
      margin: const EdgeInsets.only(bottom: 16),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class GridViewW extends StatelessWidget {
  const GridViewW({super.key});

  @override
  Widget build(BuildContext context) {
    // return GridView.count(
    //   crossAxisCount: 2,
    //   mainAxisSpacing: 20,
    //   crossAxisSpacing: 20,
    //   children: [
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       color: Colors.teal[200],
    //       child: const Text('Heed not the rabble'),
    //     ),
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       color: Colors.teal[300],
    //       child: const Text('Sound of screams but the'),
    //     ),
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       color: Colors.teal[400],
    //       child: const Text('Who scream'),
    //     ),
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       color: Colors.teal[500],
    //       child: const Text('Revolution is coming...'),
    //     ),
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       color: Colors.teal[600],
    //       child: const Text('Revolution, they...'),
    //     ),
    //   ],
    // );
    // return GridView.extent(
    //   maxCrossAxisExtent: 70,
    //   children: [
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       color: Colors.teal[100],
    //       child: const Text("He'd have you all unravel at the"),
    //
    //     ),
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       color: Colors.teal[200],
    //       child: const Text('Heed not the rabble'),
    //     ),
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       color: Colors.teal[300],
    //       child: const Text('Sound of screams but the'),
    //     ),
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       color: Colors.teal[400],
    //       child: const Text('Who scream'),
    //     ),
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       color: Colors.teal[500],
    //       child: const Text('Revolution is coming...'),
    //     ),
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       color: Colors.teal[600],
    //       child: const Text('Revolution, they...'),
    //     ),
    //     ListView()
    //   ],
    // );
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 10,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 1.5, // Hình vuông
      ),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.green[100 * (index % 9)],
          ),
          child: Center(child: Text('Item $index')),
        );
      },
    );
  }
}

class FlexibleW extends StatelessWidget {
  const FlexibleW({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Container(
            height: 100,
            color: Colors.green,
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.black54,
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}

class ExpandedW extends StatelessWidget {
  const ExpandedW({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.green,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.black54,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}

class StackW extends StatelessWidget {
  const StackW({super.key});

  @override
  Widget build(BuildContext context) {
    // return Stack(
    //   children: [
    //     Positioned(
    //       left: 20,
    //       top: 40,
    //       child: Container(
    //         width: 100,
    //         height: 100,
    //         color: Colors.red,
    //       ),
    //     ),
    //   ],
    // );
    // return Stack(
    //   children: [
    //     Container(
    //       width: 200,
    //       height: 200,
    //       color: Colors.grey[300], // nền Stack màu xám
    //     ),
    //     // Container(
    //     //   width: 50,
    //     //   height: 50,
    //     //   color: Colors.red,
    //     // ),
    //     // Positioned.directional(
    //     //   textDirection: TextDirection.rtl, // left to right
    //     //   start: 10,
    //     //   top: 10,
    //     //   child: Container(
    //     //     width: 50,
    //     //     height: 50,
    //     //     color: Colors.green,
    //     //   ),
    //     // )
    //     Positioned.fill(
    //       child: Container(
    //         color: Colors.blue.withOpacity(0.3),
    //       ),
    //     )
    //     // Positioned.fromRect(
    //     //   rect: Rect.fromLTWH(40, 50, 60, 60),
    //     //   child: Container(
    //     //     color: Colors.orange,
    //     //   ),
    //     // )
    //
    //     //
    //     // Positioned.fromRelativeRect(
    //     //   rect: RelativeRect.fromLTRB(10, 10, 30, 30),
    //     //   child: Container(
    //     //     color: Colors.purple,
    //     //   ),
    //     // )
    //   ],
    // );

    return Center(
      child: Column(
        children: [
          Container(
            color: Colors.yellow,
            height: 100,
            width: 200,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
              Positioned(
                bottom: 150,
                left: 50,
                child: InkWell(
                  onTap: () {
                    print("hi xin chào");
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                    child: Center(
                        child: Text(
                      'Chạm vào tôi !',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class PageViewW extends StatelessWidget {
  const PageViewW({super.key});

  @override
  Widget build(BuildContext context) {
    // return PageView(
    //   children: [
    //     Container(
    //       child: Center(
    //         child: Text(
    //           "Page1",
    //           style: TextStyle(fontSize: 30),
    //         ),
    //       ),
    //       color: Colors.redAccent,
    //     ),
    //     Container(
    //       child: Center(
    //         child: Text(
    //           "Page2",
    //           style: TextStyle(fontSize: 30),
    //         ),
    //       ),
    //       color: Colors.pinkAccent,
    //     ),
    //     Container(
    //       child: Center(
    //         child: Text(
    //           "Page3",
    //           style: TextStyle(fontSize: 30),
    //         ),
    //       ),
    //       color: Colors.green,
    //     ),
    //   ],
    //   scrollDirection: Axis.horizontal,
    //   physics: ClampingScrollPhysics(),
    //   pageSnapping: false,
    // );
    // return PageView.builder(
    //
    //   itemCount: 4,
    //   itemBuilder: (context, index) {
    //     return Container(
    //       child: Center(child: Text("data + $index")),
    //       color: Colors.pinkAccent[(index + 1) * 50],
    //     );
    //   },
    //   onPageChanged:(value) {
    //     print("data $value");
    //   },
    // );
    return PageView.custom(
      childrenDelegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          // Logic để trả về widget cho trang thứ 'index'
          return Container(
            color: Colors.primaries[index % Colors.primaries.length],
            alignment: Alignment.center,
            child: Text('Trang ${index + 1}',
                style: TextStyle(fontSize: 40, color: Colors.white)),
          );
        },
        childCount: 10,

        // Tổng số trang
        // Các tùy chọn nâng cao khác của SliverChildBuilderDelegate:
        // addAutomaticKeepAlives: true/false,
        // addRepaintBoundaries: true/false,
        // addSemanticIndexes: true/false,
        // findChildIndexCallback: (Key key) { ... }
      ),
      // controller: PageController(),
      onPageChanged: (int index) {
        print('Chuyển sang trang: $index');
      },
      // Các thuộc tính khác của PageView
    );
  }
}

class TabBarW extends StatelessWidget {
  const TabBarW({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("TabBar"),
          bottom: TabBar(
            indicatorColor: Colors.green,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.green,
            labelStyle: TextStyle(fontSize: 10),
            tabAlignment: TabAlignment.fill,
            tabs: [
              Tab(
                icon: Icon(Icons.airplanemode_active),
                text: "May bay",
              ),
              Tab(
                icon: Icon(Icons.directions_car),
                text: "O to",
              ),
              Tab(
                icon: Icon(Icons.motorcycle_outlined),
                text: "Xe may",
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          dragStartBehavior: DragStartBehavior.start,
          children: [
            Container(
              child: Center(
                child: Text(
                  "Noi dung trang",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              color: Colors.pink[200],
            ),
            Container(
              child: Center(
                child: Text(
                  "Noi dung trang",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              color: Colors.green[200],
            ),
            Container(
              child: Center(
                child: Text(
                  "Noi dung trang",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              color: Colors.blue[200],
            ),
          ],
        ),
        drawer: Drawer(
          width: 300,
          //backgroundColor: Colors.grey,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: 300, // giới hạn chiều cao
              color: Colors.white,
              child: ListView(
                padding: EdgeInsets.zero,
                children: const [
                  ListTile(
                    leading: Icon(Icons.airplanemode_active),
                    title: Text("Nội dung 1"),
                  ),
                  ListTile(
                    leading: Icon(Icons.directions_car),
                    title: Text("Nội dung 2"),
                  ),
                  ListTile(
                    leading: Icon(Icons.motorcycle),
                    title: Text("Nội dung 3"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    // )
    // ,
    // );
  }
}

class TabBarWithCustomController extends StatefulWidget {
  const TabBarWithCustomController({super.key});

  @override
  _TabBarWithCustomControllerState createState() =>
      _TabBarWithCustomControllerState();
}

// Bước 2: Thêm SingleTickerProviderStateMixin vào State của bạn
class _TabBarWithCustomControllerState extends State<TabBarWithCustomController>
    with SingleTickerProviderStateMixin {
  // <-- Rất quan trọng

  // Khai báo TabController
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Bước 3: Khởi tạo TabController trong initState()
    _tabController = TabController(
        length: 3,
        vsync: this); // length = số lượng tab, vsync là `this` (từ mixin)

    // Tùy chọn: Thêm Listener để theo dõi sự thay đổi tab
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        // Điều này sẽ được gọi khi người dùng hoàn tất việc chuyển tab hoặc khi tab thay đổi bằng cách lập trình
        print('Tab hiện tại đã thay đổi sang index: ${_tabController.index}');
        // Ví dụ: Bạn có thể tải dữ liệu mới cho tab này ở đây
      }
    });
  }

  @override
  void dispose() {
    // Bước 5: Giải phóng TabController trong dispose()
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ứng dụng với TabController tùy chỉnh'),
        bottom: TabBar(
          indicatorColor: Colors.orangeAccent,
          // Bước 4: Gán TabController cho TabBar
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.airplanemode_active), text: "Máy bay"),
            Tab(icon: Icon(Icons.directions_car), text: "Ô tô"),
            Tab(icon: Icon(Icons.motorcycle_outlined), text: "Xe máy"),
          ],
        ),
      ),
      body: TabBarView(
        // Bước 4: Gán TabController cho TabBarView
        controller: _tabController,
        children: const [
          Center(child: Text('Nội dung trang Máy bay')),
          Center(child: Text('Nội dung trang Ô tô')),
          Center(child: Text('Nội dung trang Xe máy')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ví dụ: Điều khiển chuyển tab bằng lập trình
          if (_tabController.index < _tabController.length - 1) {
            _tabController.animateTo(
                _tabController.index + 1); // Chuyển sang tab tiếp theo
          } else {
            _tabController.animateTo(0); // Quay về tab đầu tiên nếu đang ở cuối
          }
        },
        child: const Icon(Icons.navigate_next),
        tooltip: 'Chuyển tab tiếp theo',
      ),
    );
  }
}

class BottomNavigationBarW extends StatefulWidget {
  const BottomNavigationBarW({super.key});

  @override
  State<BottomNavigationBarW> createState() => _BottomNavigationBarWState();
}

class _BottomNavigationBarWState extends State<BottomNavigationBarW> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Center(child: Text('Nội dung Trang chủ')),
    Center(child: Text('Nội dung Trang Tìm kiếm')),
    Center(child: Text('Nội dung Trang Hồ sơ')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ứng dụng với BottomNavigationBarW'),
        backgroundColor: Colors.blueAccent,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Tìm kiếm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Hồ sơ',
          ),
        ],
        currentIndex: _selectedIndex,
        // Gán chỉ mục hiện tại
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        // Màu khi không chọn
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class DataLoadingScreen extends StatefulWidget {
  const DataLoadingScreen({super.key});

  @override
  State<DataLoadingScreen> createState() => _DataLoadingScreenState();
}

class _DataLoadingScreenState extends State<DataLoadingScreen> {
  late Future<String> _dataFuture;

  bool _shouldSucceed = true;

  @override
  void initState() {
    super.initState();

    _dataFuture = _fetchData();
  }

  Future<String> _fetchData() async {
    await Future.delayed(const Duration(seconds: 2));

    if (_shouldSucceed) {
      _shouldSucceed = false;
      return 'Dữ liệu của bạn đã được tải thành công!';
    } else {
      _shouldSucceed = true;
      throw Exception('Không thể tải dữ liệu! Đã xảy ra lỗi.');
    }
  }

  // Hàm để refresh dữ liệu (khi nhấn nút)
  void _refreshData() {
    setState(() {
      _dataFuture = _fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ví dụ FutureBuilder'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshData, // Nút refresh để tải lại dữ liệu
            tooltip: 'Tải lại dữ liệu',
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<String>(
          // <-- Sử dụng FutureBuilder
          future: _dataFuture, // Gán Future đã tạo sẵn
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            // Kiểm tra trạng thái của snapshot (tương tác với Future)
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Đang tải dữ liệu...', style: TextStyle(fontSize: 18)),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline,
                        color: Colors.red, size: 60),
                    const SizedBox(height: 16),
                    Text(
                      'Lỗi: ${snapshot.error}', // Hiển thị thông báo lỗi
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red, fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    const Text('Nhấn refresh để thử lại',
                        style: TextStyle(color: Colors.grey)),
                  ],
                );
              } else if (snapshot.hasData) {
                // Nếu Future hoàn thành thành công với dữ liệu
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.check_circle_outline,
                        color: Colors.green, size: 60),
                    const SizedBox(height: 16),
                    Text(
                      'Thành công: ${snapshot.data}', // Hiển thị dữ liệu
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.green, fontSize: 20),
                    ),
                  ],
                );
              } else {
                return const Text('Không có dữ liệu.');
              }
            }
            return const Text('Chờ đợi khởi tạo...');
          },
        ),
      ),
    );
  }
}

//StreamBuilder
class LiveCounterScreen extends StatefulWidget {
  const LiveCounterScreen({super.key});

  @override
  State<LiveCounterScreen> createState() => _LiveCounterScreenState();
}

class _LiveCounterScreenState extends State<LiveCounterScreen> {
  late Stream<int> _liveCounterStream;

  @override
  void initState() {
    super.initState();
    _liveCounterStream = _createLiveCounterStream().asBroadcastStream();
  }

  Stream<int> _createLiveCounterStream() async* {
    int counter = 0;
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield counter++;
      if (counter > 10) {
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ví dụ StreamBuilder'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Người 1:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            StreamBuilder<int>(
              stream: _liveCounterStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Lỗi: ${snapshot.error}',
                      style: const TextStyle(color: Colors.red, fontSize: 18));
                }

                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Text('Chưa có Stream.',
                        style: TextStyle(fontSize: 18));
                  case ConnectionState.waiting:
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text('Đang chờ giá trị đầu tiên...',
                            style: TextStyle(fontSize: 18)),
                      ],
                    );
                  case ConnectionState.active:
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.cached, color: Colors.blue, size: 50),
                        const SizedBox(height: 16),
                        Text(
                          'Giá trị hiện tại: ${snapshot.data}',
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          '(Cập nhật mỗi giây)',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    );
                  case ConnectionState.done:
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.check_circle,
                            color: Colors.green, size: 50),
                        const SizedBox(height: 16),
                        Text(
                          'Stream đã kết thúc. Giá trị cuối cùng: ${snapshot.data}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.green),
                        ),
                      ],
                    );
                }
              },
            ),
            const SizedBox(height: 50),
            const Text(
              'Người 2:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            StreamBuilder<int>(
              stream: _liveCounterStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    '${snapshot.data}',
                    style: const TextStyle(fontSize: 40, color: Colors.purple),
                  );
                } else if (snapshot.hasError) {
                  return Text('Lỗi: ${snapshot.error}',
                      style: const TextStyle(color: Colors.red));
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return Text('Đã xong: ${snapshot.data}',
                      style: const TextStyle(color: Colors.green));
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenW extends StatefulWidget {
  const HomeScreenW({super.key});

  @override
  State<HomeScreenW> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenW> {
  OverlayEntry? _overlayEntry;

  void _showCustomOverlay(BuildContext context) {
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: MediaQuery.of(context).size.height * 0.4,
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1,
          child: Material(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: () {
                _removeOverlay();
              },
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.red[700],
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.info_outline, color: Colors.white, size: 40),
                      SizedBox(height: 10),
                      Text(
                        'Đây là một thông báo tùy chỉnh!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Pop-up này xuất hiện bằng OverlayEntry.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);

    Future.delayed(const Duration(seconds: 3), () {
      _removeOverlay();
    });
  }

  void _removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OverlayEntry Demo'),
      ),
      body: const Center(
        child: Text(
          'Nhấn nút "+" để hiển thị pop-up!',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCustomOverlay(context),
        tooltip: 'Hiển thị Pop-up',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }
}

class ChatReverseRefresh extends StatefulWidget {
  @override
  _ChatReverseRefreshState createState() => _ChatReverseRefreshState();
}

class _ChatReverseRefreshState extends State<ChatReverseRefresh> {
  final ScrollController _controller = ScrollController();
  List<String> messages = List.generate(20, (i) => 'Tin nhắn ${i + 1}');
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    if (_controller.offset <= 0 && !isLoading) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    setState(() => isLoading = true);
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      final newMessages =
          List.generate(10, (i) => 'Tin cũ ${messages.length + i + 1}');
      messages.addAll(newMessages);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kéo xuống để tải thêm tin nhắn')),
      body: Stack(
        children: [
          ListView.builder(
            controller: _controller,
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(messages[index]),
              );
            },
          ),
          if (isLoading)
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}


