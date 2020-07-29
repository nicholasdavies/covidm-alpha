# covidm

Dynamic model of SARS-nCoV-2 transmission, implemented in C++ and R.

This code is under active development. Currently, the developers cannot provide technical support.

Installation

Windows




R 4.0.0

Install R.
(Go to https://www.r-project.org/, follow the links to download R for windows, download the base distribution.)

Download Rtools from the same page you downloaded R.
Install Rtools, the default directory for Rtools is fine.

From R, run the command

```R
writeLines('PATH="${RTOOLS40_HOME}\\usr\\bin;${PATH}"', con = "~/.Renviron")
```

to add Rtools to your path.

Restart R and type

```R
Sys.which("make")
## "C:\\rtools40\\usr\\bin\\make.exe"
```

to check your installation. (It should return a path like the above.)


((( you can even do it from R like so:

writeLines('PATH="${RTOOLS40_HOME}\\usr\\bin;${PATH}"', con = "~/.Renviron")
Now restart R, and verify that make can be found, which should show the path to your Rtools installation.

Sys.which("make")
## "C:\\rtools40\\usr\\bin\\make.exe"
)))


install GSL using Rtools' pacman utility. Start > Rtools > Rtools Bash. At the prompt type

```
pacman -Sy
```

to update the package list for pacman, then

```
pacman -S mingw-w64-{i686,x86_64}-gsl
```

to install the GSL library.


Finally, to install covidm, make sure you have the remotes package installed

```R
install.packages("remotes")
```

then install covidm from github:

```R
remotes::install_github("nicholasdavies/covidm-alpha")
```




## Installation for Windows 10

Before using covidm, you will need to have `Rcpp` set up and install the GNU Scientific Library. Instructions for how to do so follow.

1. Install R packages Rcpp and RcppGSL.
2. Install Rtools (https://cran.r-project.org/bin/windows/Rtools/).
3. Download a prebuilt GSL library by downloading `localXXX.zip` from http://www.stats.ox.ac.uk/pub/Rtools/goodies/multilib/. As of May 2nd 2020 the latest version was `local323.zip`. Download this file and unzip the contents to a folder of your choosing; for example, to `C:/Users/[YourUsername]/Documents/GSL`. The zip file contains two folders, `include` and `lib`; in the example folder, the full path to these two folders would be `C:/Users/[YourUsername]/Documents/GSL/include` and `C:/Users/[YourUsername]/Documents/GSL/lib`.
4. Go to your `Documents` folder (i.e. `C:/Users/[YourUsername]/Documents`), and make the folder `.R` if it does not exist. (The dot at the start of the folder name is important.) Make a new plain text file (e.g. in Notepad), paste the two lines below making the appropriate changes as needed and save it as `C:/Users/[YourUsername]/Documents/.R/Makevars.win`.
```
PKG_CPPFLAGS=-I "C:/Users/[YourUsername]/Documents/GSL/include" -I../inst/include
PKG_LIBS=-L "C:/Users/[YourUsername]/Documents/GSL/lib/i386" -lgsl -lgslcblas
```
**Note: The path `C:/Users/[YourUsername]/GSL` in the two `Makevars.win` lines in step 4 should be the same path where you unzipped the include and lib directories as in step 3. The quotation marks around the paths in each line are needed if the paths contain spaces.**

### Troubleshooting on Windows
An alternative, non-preferred workaround to step 4 if the environment variables cannot be successfully changed when executing the R-scripts (possibly due to lack of admin rights) may be to manually copy and paste the folder `gsl` found in `C:/Users/[YourUsername]/GSL/include` into the sub-folder of the R package `RcppGSL` named `include` (e.g. at `.../R/library/RcppGSL/include`), and the files `libgsl.a` and `libgslcblas.a` found in `C:/Users/[YourUsername]/GSL/lib/x64` into the respective sub-folder in rtools named `mingw` (e.g for Rtools 4.0 the folder may be found at `C:/rtools40/mingw64/lib`). Note that Rtools 4.0 requires R 4.0.0 or newer. Also, if the R scripts already compiled successfully as intended after step 4, this workaround is not required.

## Installation for Mac OS X

You will need to install gfortran binaries from here: https://github.com/fxcoudert/gfortran-for-macOS/releases

Once installed, run `gcc --version` in terminal to get your current version, e.g. `Target: x86_64-apple-darwin18.8.2.0`. Then run below in terminal to add library path for R:

```
cd ~
mkdir .R
cd .R
echo FLIBS=-L/usr/local/gfortran/lib/gcc/x86_64-apple-darwin18/8.2.0 -L/usr/local/gfortran/lib -lgfortran -lquadmath -lm >> Makevars
```
