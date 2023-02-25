import 'package:anup_portfolio/customWidgets/rounded_container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:profile_repository/profile_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
            // max width and height
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // decoration: BoxDecoration(color: Colors.white),
            child: _buildHomePage(context)),
      ),
    );
  }

  Widget _buildHomePage(BuildContext context) {
    Future<Profile> profile = ProfileLocalDataSource().getProfile();
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder<Profile>(
          future: profile,
          builder: (BuildContext context, AsyncSnapshot<Profile> snapshot) {
            if (snapshot.hasError) {
              if (kDebugMode) {
                print(snapshot.error);
              }
              return Text("Error loading data: ${snapshot.error}");
            }
            if (!snapshot.hasData) {
              return const Text("Loading...");
            }
            return LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth > 800) {
                return _buildWideHomePage(context, snapshot.data!);
              }
              return _buildNarrowHomePage(context, snapshot.data!);
            });
          },
        ));
  }

  Widget _buildNarrowHomePage(BuildContext context, Profile profile) {
    return SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        _buildTitleWidget("Intro"),
        _buildProfileIntroCard(context, profile),
        _buildPictureCard(profile.image),
        _buildTitleWidget("Experience"),
        Column(
          children: _buildExperienceCards(profile.experience),
        ),
        _buildTitleWidget("Education"),
        Column(
          children: _buildEducationCards(profile.education),
        )
      ]),
    );
  }

  Widget _buildWideHomePage(BuildContext context, Profile profile) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTitleWidget("Intro"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: _buildProfileIntroCard(context, profile)),
              _buildPictureCard(profile.image)
            ],
          ),
          _buildTitleWidget("Experience"),
          Column(
            children: _buildExperienceCards(profile.experience),
          ),
          _buildTitleWidget("Education"),
          Column(
            children: _buildEducationCards(profile.education),
          )
        ],
      ),
    );
  }

  List<Widget> _buildExperienceCards(List<Experience> experienceList) {
    List<Widget> experienceCards = List.empty(growable: true);
    for (var element in experienceList) {
      experienceCards.add(_buildRoundedWidget(Column(children: [
        Text("${element.position} | ${element.companyName}"),
        Text(element.startEnd),
        Text(element.description)
      ])));
    }
    return experienceCards;
  }

  Widget _buildProfileIntroCard(BuildContext context, Profile profile) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRoundedWidget(Align(
            alignment: Alignment.centerLeft,
            child: Text(
              profile.profileIntro,
              style: const TextStyle(fontSize: 16.0),
            ))),
        _buildRoundedWidget(Wrap(children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(profile.email),
                  Text(
                    profile.phoneNumber,
                    textAlign: TextAlign.start,
                  )
                ],
              )),
        ])),
        _buildRoundedWidget(Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildSkillsCard(profile.skills),
        ))
      ],
    );
  }

  List<Widget> _buildSkillsCard(List<String> skills) {
    List<Widget> skillWidgets = List.empty(growable: true);
    for (var element in skills) {
      skillWidgets.add(Text(
        " - $element",
        textAlign: TextAlign.start,
      ));
    }
    return skillWidgets;
  }

  Widget _buildPictureCard(String? src) {
    if (src == null) {
      return const Text("No image");
    }
    return _buildRoundedWidget(
      Image(height: 300, width: 200, image: AssetImage(src)),
    );
  }

  List<Widget> _buildEducationCards(List<Education> educationList) {
    List<Widget> educationWidgets = List.empty(growable: true);
    for (var education in educationList) {
      educationWidgets.add(_buildRoundedWidget(Column(
        children: [
          Text(education.course),
          Text(education.year),
          Text(education.school),
          Text(education.university)
        ],
      )));
    }
    return educationWidgets;
  }

  Widget _buildRoundedWidget(Widget child) {
    return Padding(
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
        child: RoundedContainer(
          child: (ClipRRect(
              borderRadius: BorderRadius.circular(4.0), child: child)),
        ));
  }

  Widget _buildTitleWidget(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(title),
    );
  }

  Future<String> loadAsset(BuildContext context, String asset) async {
    return await DefaultAssetBundle.of(context).loadString(asset);
  }
}
