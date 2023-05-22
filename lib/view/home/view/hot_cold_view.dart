import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hot_or_cold_game/core/extension/context_extension.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/base/widget/base_widget.dart';
import '../../../core/component/button/standard_elevated_button.dart';
import '../../../core/component/lottie/lottie_widget.dart';
import '../model/result_enum.dart';
import '../viewmodel/hot_cold_viewmodel.dart';

class HotColdView extends StatefulWidget {
  @override
  _HotColdViewState createState() => _HotColdViewState();
}

class _HotColdViewState extends BaseState<HotColdView> {
  HotColdViewModel viewModel = HotColdViewModel();

  @override
  Widget build(BuildContext context) {
    return BaseView<HotColdViewModel>(
      onDispose: () {},
      viewModel: HotColdViewModel(),
      onModelReady: (model) {
        // model type is HotColdViewModelStore
        context;
        model.init();
        viewModel = model;
      },
      onPageBuilder: (BuildContext context, HotColdViewModel value) => Scaffold(
        appBar: AppBar(
          title: const Text("Hot Or Cold"),
        ),
        body: buildView(),
      ),
    );
  }

  SingleChildScrollView buildView() {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 2,
              child: hotOrColdColumn(),
            ),
            Flexible(
              flex: 1,
              child: randomShower(),
            ),
          ],
        ),
      ),
    );
  }

  Column hotOrColdColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            hotObserver(),
            greenObserver(),
            coldObserver(),
          ],
        ),
        buildGuessContainer(),
        makeGuessButton(),
        cheatRaisedButton()
      ],
    );
  }

  Observer greenObserver() {
    return Observer(builder: (context) {
      return Container(
        width: dynamicWidth(0.2),
        height: dynamicHeight(0.15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.borderRadius),
            color: viewModel.resultEnum == ResultEnum.NORMAL
                ? Colors.grey.shade300
                : viewModel.resultEnum == ResultEnum.HIT
                    ? Colors.orange.shade400
                    : Colors.grey.shade300),
        child: viewModel.resultEnum == ResultEnum.HIT
            ? const LottieWidget(path: "17297-fireworks")
            : const Icon(Icons.done),
      );
    });
  }

  Observer coldObserver() {
    return Observer(builder: (context) {
      return Container(
        width: dynamicWidth(0.2),
        height: dynamicHeight(0.15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.borderRadius),
            color: viewModel.resultEnum == ResultEnum.COLD
                ? Colors.blue.shade300
                : Colors.grey.shade300),
        child: const Icon(Icons.ac_unit),
      );
    });
  }

  Observer hotObserver() {
    return Observer(builder: (context) {
      return Container(
        width: dynamicWidth(0.2),
        height: dynamicHeight(0.15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.borderRadius),
            color: viewModel.resultEnum == ResultEnum.HOT
                ? Colors.red.shade300
                : Colors.grey.shade300),
        child: const Icon(Icons.wb_sunny),
      );
    });
  }

  Container buildGuessContainer() {
    return Container(
      width: dynamicWidth(0.45),
      color: Colors.white,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: context.paddingLow,
          hintText: 'Tahmin Yap',
        ),
        controller: viewModel.myController,
      ),
    );
  }

  StandardElevatedButton makeGuessButton() {
    return StandardElevatedButton(
      color: Colors.orange.shade100,
      onPressed: () {
        viewModel.isHotOrCold(int.parse(viewModel.myController.text));
      },
      child: Text(
        'Tahmin Yolla',
        textScaleFactor: context.fixScaleFactor,
      ),
    );
  }

  StandardElevatedButton cheatRaisedButton() {
    return StandardElevatedButton(
        color: Colors.blue.shade200,
        onPressed: () {
          viewModel.changeVisibility();
        },
        child: Observer(builder: (context) {
          return viewModel.isVisible
              ? Text(
                  'Cevabı Sakla',
                  textScaleFactor: context.fixScaleFactor,
                )
              : Text(
                  'Cevabı Göster',
                  textScaleFactor: context.fixScaleFactor,
                );
        }));
  }

  Observer randomShower() {
    return Observer(builder: (context) {
      return Visibility(
          visible: viewModel.isVisible,
          child: Text(
            viewModel.randomNumber.toString(),
            textScaleFactor: context.fixScaleFactor,
          ));
    });
  }
}
