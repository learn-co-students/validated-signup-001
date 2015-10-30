

# Validated Sign Up

## Instructions

  1. Set up the delegate for all of your `UITextField`s.
  2. Implement validation when a user taps the return button on the keyboard. [Check out the documentation for which method you need](https://developer.apple.com/library/ios/documentation/uikit/reference/UITextFieldDelegate_Protocol/UITextFieldDelegate/UITextFieldDelegate.html).
  3. The validation rules are as follows:
    * First Name:
      * > 0 characters
      * No Digits
    * Last Name:
      * > 0 characters
      * No Digits
    * Email:
      * > 0 characters
      * valid email format (something@something.something)
    * Username:
      * > 0 characters
      * No Digits
    * Password:
      * > 6 characters
  4. When the user taps return one each field. You should validate it, then present a [UIAlertController](http://useyourloaf.com/blog/2014/09/05/uialertcontroller-changes-in-ios-8.html) with an appropriate error message. The alert view should have two buttons: `OK` and `Clear`. When you press `Clear` it should clear the currently editing textfield.
  5. Start with only the first textfield `enabled`. If a textfield passes validation, then set the `enabled` property of the _next_ textfield to `YES` (and so on and so forth).
  6. When the final textfield is correct, enable the sign up button.

## Hints

  * To dismiss the keyboard call [resignFirstResponder](https://developer.apple.com/library/ios/documentation/uikit/reference/UIResponder_Class/Reference/Reference.html#//apple_ref/occ/instm/UIResponder/resignFirstResponder) instance method on the currently editing `UITextField`. To move the focus to another `UITextField` call the [becomeFirstResponder](https://developer.apple.com/library/ios/documentation/uikit/reference/UIResponder_Class/Reference/Reference.html#//apple_ref/occ/instm/UIResponder/becomeFirstResponder) instance method on the `UITextField` you want to be focused.

## Extra Credit 

  * This lab lends itself to some messy code if you don't put a lot of thought into the software design. How clean can you make the code? Remember each method should be short. Minimal copy-paste. Descriptive Names.
