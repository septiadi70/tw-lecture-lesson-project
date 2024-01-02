
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:trinity_lecture_app/presentation/widgets/atoms/title_section_text.dart';
import 'package:trinity_lecture_app/presentation/widgets/molecules/action_text.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/grid_sample_container_card.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/sample_container.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/text_form_field.dart';
import 'package:trinity_lecture_app/presentation/widgets/organisms/ui_helper.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class DummyPage extends StatelessWidget {
  const DummyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dummy UI'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UIHelper.padding(all: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ActionText(
                onTap: () => AutoRouter.of(context).pushNamed('/dummySecond'), 
                title: 'Next', 
                desc: 'Tab Bar, GridView, ListView',
              ),
              const TitleSectionText(
                'CONTAINER AND TEXT',
              ),
              UIHelper.verticalSpace(10),
              const SampleContainer(),
              UIHelper.verticalSpace(30),
              const TitleSectionText(
                'COLUMN',
              ),
              UIHelper.verticalSpace(10),
              Column(
                children: [
                  const SampleContainer(),
                  UIHelper.verticalSpace(10),
                  const SampleContainer()
                ],
              ),
              UIHelper.verticalSpace(30),
              const TitleSectionText(
                'ROW',
              ),
              UIHelper.verticalSpace(10),
              Row(
                children: [
                  const Flexible(child: GridSampleContainerCard(title: 'Container 1')),
                  UIHelper.horizontalSpace(10),
                  const Flexible(child: GridSampleContainerCard(title: 'Container 2')),
                  UIHelper.horizontalSpace(10),
                  const Flexible(child: GridSampleContainerCard(title: 'Container 3')),
                ],
              ),
              UIHelper.verticalSpace(30),
              const TitleSectionText(
                'BUTTON',
              ),
              UIHelper.verticalSpace(10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {}, 
                  child: const Text('SUBMIT')
                ),
              ),
              UIHelper.verticalSpace(30),
              const TitleSectionText(
                'INPUT',
              ),
              UIHelper.verticalSpace(10),
              TextFormFieldCustom(
                title: 'Email',
                hintText: 'Enter your email',
                preffixIcon: SvgPicture.asset('assets/svgs/email_icon.svg'),
              ),
              UIHelper.verticalSpace(30),
              const TitleSectionText(
                'IMAGE ASSETS, SIZED BOX, AND EXPANDED',
              ),
              UIHelper.verticalSpace(10),
              Row(
                children: [
                  const Expanded(child: GridSampleContainerCard(title: 'Container 1')),
                  UIHelper.horizontalSpace(10),
                  const GridSampleContainerCard(title: 'Container 2'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}