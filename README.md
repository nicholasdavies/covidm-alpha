# covidm: alpha version 0.1.0

Dynamic model of SARS-CoV-2 transmission, implemented in C++ and R.

This code is under active development. Currently, the developers cannot provide technical support.

# Table of contents

1. [Installing covidm](#installing-covidm)
2. [Setup on Mac OS X](#setup-on-mac-os-x)
3. [Setup on Windows](#setup-on-windows)

## Installing covidm

In order to use `covidm`, you will need to be able to build packages from source. Instructions for how to set this up for [Mac OS X](#setup-on-mac-os-x) and [Windows](#setup-on-windows) are below. Be sure to read the instructions if you want `covidm` to be able to use multithreading on Mac OS X.

To install `covidm` from github, you will need the `remotes` package:
```R
install.packages("remotes")
```
You can then install `covidm` from github:
```R
remotes::install_github("nicholasdavies/covidm-alpha")
```

## Setup on Mac OS X

To build packages from source on Mac OS X, you need to have the Command Line Tools installed. To check if you do, type `clang -v` in the Terminal; if it gives you information on the version number then you have Command Line Tools installed. If you get an error like `zsh: command not found: clang`, then install Command Line Tools by typing `xcode-select --install` and following the prompts.

(*Optional*) If you want `covidm` to be able to use multithreading (i.e. speed up simulations by distributing them across multiple processor cores), you will need to install OpenMP support. The latest instructions for how to do this on Mac OS X are available at https://mac.r-project.org/openmp, but here's the gist of it:

1. Type `clang -v` in the Terminal to see which version of **clang** you have installed. You are looking for something like `Apple clang version 11.0.3 (clang-YYYY.12.34.56)` — it's the 4-digit YYYY number you need.

2. Go to https://mac.r-project.org/openmp and look in the table under **OpenMP run-time downloads** for the right file. Under the **Build** header, you'll see that each file corresponds to an LLVM version, an XCode version, and an Apple clang version; you want the **Release** file that corresponds to the Apple clang version YYYY from step 1. 

3. Run `curl -O https://mac.r-project.org/openmp/openmp-9.0.1-darwin17-Release.tar.gz` in the Terminal, substituting the file name you need, to download OpenMP.

4. Then run `sudo tar fvx openmp-9.0.1-darwin17-Release.tar.gz -C /` in the Terminal, again substituting the name of the file from step 2, to install OpenMP. You will be asked for your password.

## Setup on Windows

To build packages from source on Windows, read on.

### For R version 4.0.0 or later

Install `Rtools` by following the instructions at https://cran.r-project.org/bin/windows/Rtools/.

### For R before version 4.0.0

1. Install the correct version of `Rtools` for your version of R (https://cran.r-project.org/bin/windows/Rtools/history.html). For example, for version 3.6.3 you want Rtools35.exe. The next step assumes that you install to `C:\Rtools`, the recommended directory.

2. So that R can find `Rtools`, run this command from R:
```R
writeLines('PATH="C:\\Rtools\\bin;${PATH}"', con = "~/.Renviron")
```
This creates a file called `.Renviron` in your Documents folder and writes the line `PATH="C:\\Rtools\\bin;${PATH}"` to it. You can also do this manually if you prefer.
