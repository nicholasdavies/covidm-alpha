
AC_INIT([covidm], 0.1.0)

#  ## Use gsl-config to find arguments for compiler and linker flags
#  ##
#  ## Check for non-standard programs: gsl-config(1)
#  AC_PATH_PROG([GSL_CONFIG], [gsl-config])
#  ## If gsl-config was found, let's use it
#  if test "${GSL_CONFIG}" != ""; then
#      # Use gsl-config for header and linker arguments (without BLAS which we get from R)
#      GSL_CFLAGS=`${GSL_CONFIG} --cflags`
#      GSL_LIBS=`${GSL_CONFIG} --libs`
#  else
#      AC_MSG_ERROR([gsl-config not found, is GSL installed?])
#  fi
#
#  ## Use Rscript to query Rcpp for compiler and linker flags
#  ## link flag providing libary as well as path to library, and optionally rpath
#  ##RCPP_LDFLAGS=`${R_HOME}/bin/Rscript -e 'Rcpp:::LdFlags()'`
#
#  #####
#
#  #!/usr/bin/env sh
#
#  # Find R compilers
#  CC=`${R_HOME}/bin/R CMD config CC`
#  CFLAGS=`${R_HOME}/bin/R CMD config CFLAGS`
#  # compiler and flags to 'cc' file
#  echo "CC=${CC}" > inst/cc
#  echo "CFLAGS=${CFLAGS}" >> inst/cc
#
#  # Thanks to data.table . . .
#
#  # Test if we have a OPENMP compatible compiler
#  # Aside: ${SHLIB_OPENMP_CFLAGS} does not appear to be defined at this point according to Matt's testing on
#  # Linux, and R CMD config SHLIB_OPENMP_CFLAGS also returns 'no information for variable'. That's not
#  # inconsistent with R-exts$1.2.1.1, though, which states it's 'available for use in Makevars' (so not
#  # necessarily here in configure). Hence use -fopenmp directly for this detection step.
#  # printf not echo to pass checkbashisms w.r.t. to the \n
#
#  cat <<EOF > test-omp.c
#  #include <omp.h>
#  int main() {
#    return omp_get_num_threads();
#  }
#  EOF
#
#  # First, try R CMD SHLIB to see if R can already compile
#  # things using OpenMP without any extra help from data.table
#  "${R_HOME}/bin/R" CMD SHLIB test-omp.c >/dev/null 2>&1 || R_NO_OPENMP=1
#
#  if [ "$R_NO_OPENMP" = "1" ]; then
#    # Compilation failed -- try forcing -fopenmp instead.
#    # TODO: doesn't R_NO_OPENMP need to be set to 0 before next line?
#    ${CC} ${CFLAGS} -fopenmp test-omp.c || R_NO_OPENMP=1
#    # TODO: and then nothing seems to be done with this outcome
#  else
#    echo "R CMD SHLIB supports OpenMP without any extra hint"
#  fi
#
#  # Clean up.
#  rm -f test-omp.* a.out
#
#  # Write to Makevars
#  if [ "$R_NO_OPENMP" = "1" ]; then
#    echo "*** OpenMP not supported! data.table uses OpenMP to automatically"
#    echo "***   parallelize operations like sorting, grouping, file reading, etc."
#    echo "*** For details on how to install the necessary toolchains on your OS see:"
#    echo "***   https://github.com/Rdatatable/data.table/wiki/Installation"
#    echo "*** Continuing installation without OpenMP support..."
#    sed -e "s|@openmp_cflags@||" src/Makevars.in > src/Makevars
#  else
#    sed -e "s|@openmp_cflags@|\$(SHLIB_OPENMP_CFLAGS)|" src/Makevars.in > src/Makevars
#  fi
#  # retain user supplied PKG_ env variables, #4664. See comments in Makevars.in too.
#  sed -e "s|@PKG_CFLAGS@|$PKG_CFLAGS|" src/Makevars > src/Makevars.tmp && mv src/Makevars.tmp src/Makevars
#  sed -e "s|@PKG_LIBS@|$PKG_LIBS|" src/Makevars > src/Makevars.tmp && mv src/Makevars.tmp src/Makevars
#
#
#  #####

# Now substitute these variables in src/Makevars.in to create src/Makevars
AC_SUBST(GSL_CFLAGS)
AC_SUBST(GSL_LIBS)
##AC_SUBST(RCPP_LDFLAGS)

AC_OUTPUT(src/Makevars)
