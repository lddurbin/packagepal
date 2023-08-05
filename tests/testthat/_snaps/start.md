# check_for_git tells the user they've already installed Git

    Code
      check_for_git(testing = TRUE)
    Message <rlang_message>
      v Congrats, you've already installed Git!

# pal_check_git_token tells the user that it won't check the GitHub token situation

    Code
      pal_check_git_token(testing = TRUE)
    Message <rlang_message>
      v OK, I won't do that right now.

# check_for_package tells the user that they've already installed the package

    Code
      check_for_package("test_package", testing = TRUE)
    Message <rlang_message>
      v Congrats, you've already installed 'test_package'!

# check_for_rtools tells the user that it they've already installed Rtools

    Code
      check_for_rtools(testing = TRUE)
    Message <rlang_message>
      v Congrats, you've already installed Rtools!

# check_for_xcode tells the user that it they've already installed XCode

    Code
      check_for_xcode(testing = TRUE)
    Message <rlang_message>
      v Congrats, you've already installed XCode!

# pal_install_software tells the user that it won't install the software right now

    Code
      pal_install_software("Test Software", "https://example.com", testing = TRUE)
    Message <rlang_message>
      v OK, I won't download 'Test Software' right now.

# pal_install_package tells the user that it won't install the package right now

    Code
      pal_install_package("test_package", testing = TRUE)
    Message <rlang_message>
      v OK, I won't install 'test_package' right now.

