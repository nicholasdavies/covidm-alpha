# covidm: alpha version 0.1.0

Dynamic model of SARS-CoV-2 transmission, implemented in C++ and R.

This code is under active development. Currently, the developers cannot provide technical support.

# Table of contents

1. [Installing on Windows](#installing-on-windows)
2. [Installing on Mac OS X](#installing-on-mac-os-x)

## Installing on Windows

### For R version 4.0.0 or later

These instructions were tested on Windows using R 4.0.2.

1. Install `Rtools` (https://cran.r-project.org/bin/windows/Rtools/).

2. You can now install `covidm` from Github. First make sure you have the `remotes` package installed
```R
install.packages("remotes")
```
then install `covidm` from github:
```R
remotes::install_github("nicholasdavies/covidm-alpha")
```

### For R before version 4.0.0

This was tested using R version 3.6.3.

1. Install the correct version of Rtools for your version of R (https://cran.r-project.org/bin/windows/Rtools/history.html). For example, for version 3.6.3 you want Rtools35.exe.

2. Run the Rtools installer. The instructions that follow assume you install to C:\Rtools, the recommended directory.

3. So that R can find tools bundled with Rtools, run this command from R:
```R
writeLines('PATH="C:\\Rtools\\bin;${PATH}"', con = "~/.Renviron")
```
This creates a file called `.Renviron` in your Documents folder and writes the line `PATH="C:\\Rtools\\bin;${PATH}"` to it. You can also do this manually if you prefer.

4. You can now install `covidm` from Github. First make sure you have the `remotes` package installed
```R
install.packages("remotes")
```
then install `covidm` from github:
```R
remotes::install_github("nicholasdavies/covidm-alpha")
```

## Installing on Mac OS X

1. First, you need to have the Command Line Tools installed. To check if you do, type `clang -v` in the Terminal; if it gives you information on the version number then you have Command Line Tools installed. If you get an error like `zsh: command not found: clang`, then install Command Line Tools by typing `xcode-select --install` and following the prompts.

2. (*Optional*) If you want `covidm` to be able to use multithreading (i.e. speed up simulations by distributing them across multiple processor cores), you will need to install OpenMP support. The latest instructions for how to do this on Mac OS X are available at https://mac.r-project.org/openmp, but here's the gist of it:

> a. Type `clang -v` in the Terminal to see which version of **clang** you have installed. You are looking for something like `Apple clang version 11.0.3 (clang-YYYY.12.34.56)` — it's the 4-digit YYYY number you need.

> b. Go to https://mac.r-project.org/openmp and look in the table under **OpenMP run-time downloads** for the right file. Under the **Build** header, you'll see that each file corresponds to an LLVM version, an XCode version, and an Apple clang version; you want the **Release** file that corresponds to the Apple clang version YYYY from step a. 

> c. Type `curl -O https://mac.r-project.org/openmp/openmp-9.0.1-darwin17-Release.tar.gz` in the Terminal, substituting the file name you need, to download OpenMP.

> d. Then run `sudo tar fvx openmp-9.0.1-darwin17-Release.tar.gz -C /` in the Terminal to install OpenMP. You will be asked for your password.

3. You can now install `covidm` from Github. First make sure you have the `remotes` package installed
```R
install.packages("remotes")
```
then install `covidm` from github:
```R
remotes::install_github("nicholasdavies/covidm-alpha")
```

<!-- OLD
### For R before version 4.0.0

1. First, you need to have the Command Line Tools installed. To check if you do, type `clang -v` in the Terminal; if it gives you information on the version number then you have Command Line Tools installed. If you get an error like `zsh: command not found: clang`, then install Command Line Tools by typing `xcode-select --install` and following the prompts.

2. Then, install gfortran binaries from here: https://github.com/fxcoudert/gfortran-for-macOS/releases.

3. Then, install the GNU Scientific Library (GSL) using Homebrew (https://brew.sh/) by typing
```
brew install gsl
```
in the Terminal.

4. Now, run 
```
gcc --version
```
in the Terminal to get your current version, e.g. `Target: x86_64-apple-darwin18.8.2.0`. 

5. Finally, run this in Terminal, substituting the version from step 3 into the last line:
```
cd ~
mkdir .R
cd .R
echo FLIBS=-L/usr/local/gfortran/lib/gcc/x86_64-apple-darwin18/8.2.0 -L/usr/local/gfortran/lib -lgfortran -lquadmath -lm >> Makevars
```

6. (*Optional*) If you want covidm to be able to use multithreading (i.e. speed up simulations by distributing them across multiple processor cores), you will need to install OpenMP support. The latest instructions for how to do this on Mac OS X are available at https://mac.r-project.org/openmp, but here's the gist of it:

> a. Type `clang -v` in the Terminal to see which version of **clang** you have installed. You are looking for something like `Apple clang version 11.0.3 (clang-YYYY.12.34.56)` — it's the 4-digit YYYY number you need.

> b. Go to https://mac.r-project.org/openmp and look in the table under **OpenMP run-time downloads** for the right file. Under the **Build** header, you'll see that each file corresponds to an LLVM version, an XCode version, and an Apple clang version; you want the **Release** file that corresponds to the Apple clang version YYYY from step a. 

> c. Type `curl -O https://mac.r-project.org/openmp/openmp-9.0.1-darwin17-Release.tar.gz` in the Terminal, substituting the file name you need, in the Terminal to download OpenMP.

> d. Then run `sudo tar fvx openmp-9.0.1-darwin17-Release.tar.gz -C /` in the Terminal to install OpenMP. You will be asked for your password.

> e. Finally, add the following two lines to `~/.R/Makevars` to enable OpenMP support in R:

>> `CPPFLAGS += -Xclang -fopenmp`

>> `LDFLAGS += -lomp`

7. You can now install covidm from Github. First make sure you have the `remotes` package installed
```R
install.packages("remotes")
```
then install covidm from github:
```R
remotes::install_github("nicholasdavies/covidm-alpha")
```
And you're done.

--!>
