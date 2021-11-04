# Devskiller programming task sample - Swift

## Introduction

With [Devskiller.com](https://devskiller.com) you can assess your candidates'
programming skills as a part of your recruitment process. We have found that
programming tasks are the best way to do this and have built our tests
accordingly. The way our test works is your candidate is asked to modify the
source code of an existing project.

During the test, your candidates have the option of using our browser-based
code editor and can build the project inside the browser at any time. If they
would prefer to use an IDE they are more comfortable with, they can also
download the project code or clone the project’s Git repository and work
locally.

You can check out this short video to see the test from the [candidate's
perspective](https://devskiller.zendesk.com/hc/en-us/articles/360019534639-How-the-TalentScore-test-looks-like-from-the-candidate-perspective).

This repo contains a sample project for Swift and below you can
find a detailed guide for creating your own programming project.

**Please make sure to read our [Getting started with programming
projects](https://devskiller.zendesk.com/hc/en-us/articles/360019531059-Getting-started-with-Programming-Tasks) guide first**

## Technical details

Any project which uses **xcodebuild**  can be used as a
programming task. We use **test** to execute unit tests.

Your project will be executed with following command:

```sh
xcodebuild -scheme Devskiller -destination 'platform=iOS Simulator,name=iPhone 11 Pro Max' clean test
```
NOTE: Make sure that your Build Scheme is named `Devskiller`

## Automatic assessment

It is possible to automatically assess the solution posted by the candidate.
Automatic assessment is based on unit tests results and code quality
measurements.

There are two kinds of unit tests:

1. **Candidate tests** - unit tests that the candidate can see during the test
should be used only for basic verification and to guide the candidate in
understanding the requirements of the project. Candidate tests WILL NOT be used
to calculate the final score.
2. **Verification tests** - unit tests that the candidate can’t see during the
test. Files containing verification tests will be added to the project after
the candidate finishes the test and will be executed during the verification
phase. The results of the verification tests will be used to calculate the
final score.

Once the solution is developed and submitted, the platform executes
verification tests and performs static code analysis.

## Devskiller project descriptor

Programming tasks can be configured with the Devskiller project descriptor file:

1. Create a `devskiller.json` file.
2. Place it in the root directory of your project.

Here is an example project descriptor:

```json
{
    "readOnlyFiles" : ["Calculator.xcodeproj/project.pbxproj", "Calculator/Info.plist", "Calculator/CalculatorViewController.swift", "Calculator/SupportingFiles/AppDelegate.swift", "Calculator/SupportingFiles/LogoImageView.swift", "Calculator/SupportingFiles/SceneDelegate.swift"],
    "verification": {
    "testNamePatterns": [".*VerifyTests.*"],
    "pathPatterns": ["**CalculatorTests/verify_pack**"],
    "overwrite": {
            "CalculatorTests/verify_pack/project_verif": "Calculator.xcodeproj/project.pbxproj"
        }
    }
}
```

You can find more details about the `devskiller.json` descriptor in our
[documentation](https://devskiller.zendesk.com/hc/en-us/articles/360019530419-Programming-task-project-descriptor).

## Automatic verification with verification tests

The solution submitted by the candidate may be verified using automated tests.
You’ll just have to define which tests should be treated as verification tests.

All files classified as verification tests will be removed from the project
prior to inviting the candidate.

To define verification tests, you need to set two configuration properties in
`devskiller.json`:

- `testNamePatterns` - an array of RegEx patterns which should match all the
names of the verification tests.
- `pathPatterns` - an array of GLOB patterns which should match all the files
containing verification tests. All the files that match defined patterns will
be deleted from candidates' projects and will be added to the projects during
the verification phase. These files will not be visible to the candidate during
the test.

In our sample project, all verification tests are in the `CalculatorVerifyTests`
class and the class is located in a file which names contains `CalculatorTests/verify_pack`. In
this case, the following patterns will be sufficient:

```json
"testNamePatterns": [".*VerifyTests.*"],
"pathPatterns": ["**CalculatorTests/verify_pack**"]
```
When you create your verification tests, add them in a new folder (group). In our example, the folder is named 'verify_pack'. They will be used for candidate verification.
Important note: For our system to automatically copy the verification tests, you need to save your project, including your verification in the project navigator and then go to finder and right-click on your xcodeproj file in this example `Calculator.xcodeproj` select show package contents and copy the `project.pbxproj` to your projects Tests and verify_pack folder in our case `CalculatorTests/verify_pack/`
Once you have done, that get the file info and make sure you have unselected the hide_extension on the file inspector. Next, rename `project.pbxproj` to `project_verif` or any other name but make sure the part of devskiller.json, which you can see below, reflects that.

```json
"overwrite" : {
    "CalculatorTests/verify_pack/project_verif": "Calculator.xcodeproj/project.pbxproj"
  }
```
Finally, go back to Xcode and delete the `verify_pack` folder (group) from your project. Make sure that you select `Remove reference` and NOT Move to trash. Save your project, and it should be ready to upload to the Devskiller platform.
