# pal_start returns everything we expect in the console

    Code
      pal_start()
    Message <rlang_message>
      i Check if you have XCode installed by running 'xcode-select -p' in the Terminal. If you don't, browse to https://cran.r-project.org/bin/windows/Rtools/
      i Check if you have Git installed by running 'git --version' in the Terminal. If you don't, browse to https://git-scm.com/downloads
      v Congrats, you've already installed 'devtools'!
      i You can check your GitHub token status with `usethis::gh_token_help()`
      i When you're ready, you can call `available()` or go straight to `usethis::create_package()` to continue.

# check_for_package_development_toolchain behaves correctly

    Code
      check_for_package_development_toolchain("Windows")
    Message <rlang_message>
      i Check if you have Rtools installed by running `FALSE` in the Console. If you don't, browse to https://apps.apple.com/us/app/xcode/id497799835

---

    Code
      check_for_package_development_toolchain("MacOS")
    Message <rlang_message>
      i Check if you have XCode installed by running 'xcode-select -p' in the Terminal. If you don't, browse to https://cran.r-project.org/bin/windows/Rtools/

---

    Code
      check_for_package_development_toolchain("Linux")
    Message <rlang_message>
      x You seem to be using Linux. `packagepal` doesn't support Linux, but you probably don't need to use it anyway right?

