#
# This file is part of the GROMACS molecular simulation package.
#
# Copyright 2009- The GROMACS Authors
# and the project initiators Erik Lindahl, Berk Hess and David van der Spoel.
# Consult the AUTHORS/COPYING files and https://www.gromacs.org for details.
#
# GROMACS is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public License
# as published by the Free Software Foundation; either version 2.1
# of the License, or (at your option) any later version.
#
# GROMACS is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with GROMACS; if not, see
# https://www.gnu.org/licenses, or write to the Free Software Foundation,
# Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA.
#
# If you want to redistribute modifications to GROMACS, please
# consider that scientific software is very special. Version
# control is crucial - bugs must be traceable. We will be happy to
# consider code for inclusion in the official distribution, but
# derived work must not be called official GROMACS. Details are found
# in the README & COPYING files - if they are missing, get the
# official version at https://www.gromacs.org.
#
# To help us fund GROMACS development, we humbly ask that you cite
# the research papers on the package. Check out https://www.gromacs.org.

# - Define macro to check if system XDR routines are present
#
#  GMX_TEST_XDR(VARIABLE)
#
#  VARIABLE will be set to true if XDR support is present
#
#  Remember to have a cmakedefine for it too...

macro(GMX_TEST_XDR VARIABLE)
    if(NOT DEFINED ${VARIABLE})

        message(STATUS "Checking for system XDR support")

        # First check without any special flags
        try_compile(XDR_COMPILE_OK "${CMAKE_BINARY_DIR}"
                    "${CMAKE_SOURCE_DIR}/cmake/TestXDR.cpp")

        if(XDR_COMPILE_OK)
            message(STATUS "Checking for system XDR support - present")
        else()
            message(STATUS "Checking for system XDR support - not present")
        endif()

        set(${VARIABLE} ${XDR_COMPILE_OK} CACHE INTERNAL "Result of test for system XDR support" FORCE)

    endif()
endmacro(GMX_TEST_XDR VARIABLE)



