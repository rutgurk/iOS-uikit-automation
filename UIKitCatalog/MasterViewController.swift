/*
Copyright (C) 2017 Apple Inc. All Rights Reserved.
See LICENSE.txt for this sample’s licensing information

Abstract:
The primary table view controller displaying all the UIKit examples.
*/

import UIKit

class MasterViewController: BaseTableViewController {

	struct Example {
		var title: String
		var subTitle: String
		var twoLevel: Bool
        var accessibilityIdentifier: String
	}

    var exampleList = [
        Example(title: "Activity Indicators", subTitle: "ActivityIndicatorViewController", twoLevel: false, accessibilityIdentifier: "activityIndicatorsId"),
		Example(title: "Alert Controller", subTitle: "AlertControllerViewController", twoLevel: false, accessibilityIdentifier: "alertControllerId"),
		Example(title: "Buttons", subTitle: "ButtonViewController", twoLevel: false, accessibilityIdentifier: "buttonsId"),
		Example(title: "Date Picker", subTitle: "DatePickerController", twoLevel: false, accessibilityIdentifier: "datePickerId"),
		Example(title: "Image View", subTitle: "ImageViewController", twoLevel: false, accessibilityIdentifier: "imageViewId"),
		Example(title: "Page Control", subTitle: "PageControlViewController", twoLevel: false, accessibilityIdentifier: "pageControlId"),
		Example(title: "Picker View", subTitle: "PickerViewController", twoLevel: false, accessibilityIdentifier: "pickerViewerId"),
		Example(title: "Progress Views", subTitle: "ProgressViewController", twoLevel: false, accessibilityIdentifier: "progressViewsId"),
		Example(title: "Search", subTitle: "SearchViewControllers", twoLevel: true, accessibilityIdentifier: "searchId"),
		Example(title: "Segmented Controls", subTitle: "SegmentedControlViewController", twoLevel: false, accessibilityIdentifier: "segmentedControlsId"),
		Example(title: "Sliders", subTitle: "SliderViewController", twoLevel: false, accessibilityIdentifier: "slidersId"),
		Example(title: "Stack Views", subTitle: "StackViewController", twoLevel: false, accessibilityIdentifier: "stackViewsId"),
		Example(title: "Steppers", subTitle: "StepperViewController", twoLevel: false, accessibilityIdentifier: "steppersId"),
		Example(title: "Switches", subTitle: "SwitchViewController", twoLevel: false, accessibilityIdentifier: "switchesId"),
		Example(title: "Text Fields", subTitle: "TextFieldViewController", twoLevel: false, accessibilityIdentifier: "textFieldsId"),
		Example(title: "Text View", subTitle: "TextViewController", twoLevel: false, accessibilityIdentifier: "textViewId"),
		Example(title: "Toolbars", subTitle: "ToolbarViewControllers", twoLevel: true, accessibilityIdentifier: "toolbarsId"),
		Example(title: "Web View", subTitle: "WebViewController", twoLevel: false, accessibilityIdentifier: "webViewId")
    ]

	override func isTwoLevelCell(indexPath: IndexPath) -> Bool {
	 	var twoLevelCell = false
		twoLevelCell = exampleList[indexPath.row].twoLevel
		return twoLevelCell
	}
	
	override func configureCell(cell: UITableViewCell, indexPath: IndexPath) {
		let splitViewWantsToShowDetail = splitViewController?.traitCollection.horizontalSizeClass == .regular
		if splitViewWantsToShowDetail {
			if isTwoLevelCell(indexPath: indexPath) {
				cell.accessoryType = .disclosureIndicator
			}
		} else {
			// Cells 8 and 16 in split view master/detail mode we don't navidate but just present
			if isTwoLevelCell(indexPath: indexPath) {
				cell.accessoryType = isTwoLevelCell(indexPath: indexPath) ? .disclosureIndicator : .none
			}
		}
	}
	
}

// MARK: - UITableViewDataSource

extension MasterViewController {
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return exampleList.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		let example = exampleList[indexPath.row]
		cell.textLabel?.text = example.title
        cell.textLabel?.accessibilityIdentifier = "textLabel"+example.accessibilityIdentifier
		cell.detailTextLabel?.text = example.subTitle
        cell.accessibilityIdentifier = "cell"+example.accessibilityIdentifier
		return cell
	}
}

// MARK: - UITableViewDelegate

extension MasterViewController {
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let example = exampleList[indexPath.row]
		pushOrPresentStoryboard(storyboardName: example.subTitle, cellIndexPath: indexPath)
	}
	
}

