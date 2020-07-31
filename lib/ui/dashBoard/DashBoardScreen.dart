
import 'dart:convert';
import 'package:flutter_web_001/data/model/GithubResponse.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class DashBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashBoardScreenWidget(),
    );
  }
}

class DashBoardScreenWidget extends StatefulWidget {

  @override
  _DashBoardScreenWidgetState createState() => _DashBoardScreenWidgetState();

}

class _DashBoardScreenWidgetState extends State<DashBoardScreenWidget> {
  BuildContext mContext;
  var _members = <GithubResponse>[];
  final _biggerFont = const TextStyle(fontSize: 18.0,color: Colors.white);
  final _smallFont = const TextStyle(fontSize: 12.0,color: Colors.white);

  @override
  void initState() {
    super.initState();
    _loadData();
    this.mContext = context;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff001266)  ,
      body: Padding(
        padding: EdgeInsets.fromLTRB(0,20,0,0),
        child: ListView.builder(
            itemCount: _members.length,
            itemBuilder: (BuildContext context, int position) {
              return _buildCustomView(context, _members[position]);
            }),
      ),
    );
  }

  _loadData() async {
    String dataURL = "https://api.github.com/orgs/raywenderlich/members";
    http.Response response = await http.get(dataURL);
    setState(() {
      final responseBody = json.decode(response.body);
      for (var member in responseBody) {
        var githubMember = GithubResponse.fromJson(member);
        _members.add(githubMember);
      }
    });
  }

  Widget _buildRow(int i) {
    return ListTile(
      title: Text("${_members[i].login}", style: _biggerFont),
      leading: CircleAvatar(
          backgroundColor: Colors.black,
          backgroundImage: NetworkImage(_members[i].avatar_url)
      ),
      trailing: Icon(Icons.keyboard_arrow_right,color: Colors.white,)
      ,onTap: (){
      _pushMember(_members[i]);
    },
    );
  }


  Widget _buildCustomView(BuildContext buildContext,GithubResponse data){

    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0,0,10,0),
      child: Card(
        color: Colors.white12,
        child: InkWell(
          onTap: (){
            openBottomSheet(data,buildContext);
          },
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(
                    data.avatar_url,
                    height: 50.0,
                    width: 50.0,
                  ),
                )//Image.network(data.avatar_url,width: 50,height: 50, fit: BoxFit.scaleDown,),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(data.login, style: _biggerFont),
                    Text(data.type, style: _smallFont),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

  }

  _pushMember(GithubResponse member) {
    /*
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MemberDetailWidget(member)));*/
  }

  void openBottomSheet(GithubResponse data, BuildContext buildContext) {
    showModalBottomSheet(context: buildContext, builder: (BuildContext bc){
      return Container(
        color: Color(0xff001266),
          height: MediaQuery.of(context).size.height * 50,
          child: Padding(padding: EdgeInsets.all(20),
              child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.network(
                    data.avatar_url,
                    height: 200.0,
                    width: 200.0,
                  ),
                ),
                SizedBox(width: 10,height: 30,),
                Text(data.login, style: _biggerFont),
                Text(data.type, style: _smallFont),
              ],
          ),
          ),
      );
    });
  }

}

