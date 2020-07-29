# covidm: alpha version 0.1.0

Dynamic model of SARS-nCoV-2 transmission, implemented in C++ and R.

This code is under active development. Currently, the developers cannot provide technical support.

## Installing on Windows

### For R version 4.0.0 or later

These instructions were tested on Windows using R 4.0.2.

1. Download the `Rtools40` installer for Windows from CRAN. (Go to https://www.r-project.org/, following the links to download R for Windows, select a mirror, click through to Rtools, download the installer).

2. Run the Rtools installer.

3. So that R can find tools bundled with Rtools, run this command from R:
```R
writeLines('PATH="${RTOOLS40_HOME}\\usr\\bin;${PATH}"', con = "~/.Renviron")
```
This creates a file called `.Renviron` in your Documents folder and writes the line `PATH="${RTOOLS40_HOME}\\usr\\bin;${PATH}"` to it. You can also do this manually if you prefer.

4. To test your Rtools installation, restart R and type:
```R
Sys.which("make")
## "C:\\rtools40\\usr\\bin\\make.exe"
```
It should give you a path like the above rather than an empty string.

5. Finally, install the GNU Scientific Library (GSL) using Rtools' `pacman` utility. Go to Start > Rtools > Rtools Bash. At the prompt type
```
pacman -Sy
```
to update the package list for pacman, then
```
pacman -S mingw-w64-{i686,x86_64}-gsl
```
to install GSL.

6. You can now install covidm from Github. First make sure you have the `remotes` package installed
```R
install.packages("remotes")
```
then install covidm from github:
```R
remotes::install_github("nicholasdavies/covidm-alpha")
```
And you're done.

### For R before version 4.0.0

This was tested using R version 3.6.3.

1. Install the correct version of Rtools for your version of R (https://cran.r-project.org/bin/windows/Rtools/history.html). For example, for version 3.6.3 you want Rtools35.exe.

2. Run the Rtools installer. The instructions that follow assume you install to C:\Rtools, the recommended directory.

3. So that R can find tools bundled with Rtools, run this command from R:
```R
writeLines('PATH="C:\\Rtools\\bin;${PATH}"', con = "~/.Renviron")
```
This creates a file called `.Renviron` in your Documents folder and writes the line `PATH="C:\\Rtools\\bin;${PATH}"` to it. You can also do this manually if you prefer.

4. Download a prebuilt GSL library by downloading `localXXX.zip` from http://www.stats.ox.ac.uk/pub/Rtools/goodies/multilib/. As of May 2nd 2020 the latest version was `local323.zip`. Download this file and unzip the contents to a folder of your choosing; for example, to `C:/Users/[YourUsername]/Documents/GSL`. The zip file contains two folders, `include` and `lib`; in the example folder, the full path to these two folders would be `C:/Users/[YourUsername]/Documents/GSL/include` and `C:/Users/[YourUsername]/Documents/GSL/lib`.

5. Go to your `Documents` folder (i.e. `C:/Users/[YourUsername]/Documents`), and make the folder `.R` if it does not exist. (The dot at the start of the folder name is important.) Make a new plain text file (e.g. in Notepad), paste the two lines below making the appropriate changes to `[YourUsername]` as needed and save it as `C:/Users/[YourUsername]/Documents/.R/Makevars.win`.
```
PKG_CPPFLAGS=-I "C:/Users/[YourUsername]/Documents/GSL/include" -I../inst/include
PKG_LIBS=-L "C:/Users/[YourUsername]/Documents/GSL/lib/i386" -lgsl -lgslcblas
```
**Note: The path `C:/Users/[YourUsername]/Documents/GSL` in the two `Makevars.win` lines in step 4 should be the same path where you unzipped the include and lib directories as in step 3. The quotation marks around the paths in each line are needed if the paths contain spaces.**

6. You can now install covidm from Github. First make sure you have the `remotes` package installed
```R
install.packages("remotes")
```
then install covidm from github:
```R
remotes::install_github("nicholasdavies/covidm-alpha")
```
And you're done.

## Installing on Mac OS X

1. First, you need to install gfortran binaries from here: https://github.com/fxcoudert/gfortran-for-macOS/releases.

2. Then, install the GNU Scientific Library (GSL) using Homebrew (https://brew.sh/) by typing
```
brew install gsl
```
in the Terminal.

3. Now, run 
```
gcc --version
```
in the Terminal to get your current version, e.g. `Target: x86_64-apple-darwin18.8.2.0`. 

4. Finally, run this in Terminal, substituting the version from step 3 into the last line:
```
cd ~
mkdir .R
cd .R
echo FLIBS=-L/usr/local/gfortran/lib/gcc/x86_64-apple-darwin18/8.2.0 -L/usr/local/gfortran/lib -lgfortran -lquadmath -lm >> Makevars
```

5. You can now install covidm from Github. First make sure you have the `remotes` package installed
```R
install.packages("remotes")
```
then install covidm from github:
```R
remotes::install_github("nicholasdavies/covidm-alpha")
```
And you're done.
