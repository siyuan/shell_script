#!/bin/bash

new_license="* Copyright (c) 2008 - 2012, Advanced Micro Devices, Inc.\
\n * All rights reserved.\
\n * \
\n * Redistribution and use in source and binary forms, with or without\
\n * modification, are permitted provided that the following conditions are met:\
\n *     * Redistributions of source code must retain the above copyright\
\n *       notice, this list of conditions and the following disclaimer.\
\n *     * Redistributions in binary form must reproduce the above copyright\
\n *       notice, this list of conditions and the following disclaimer in the\
\n *       documentation and/or other materials provided with the distribution.\
\n *     * Neither the name of Advanced Micro Devices, Inc. nor the names of \
\n *       its contributors may be used to endorse or promote products derived \
\n *       from this software without specific prior written permission.\
\n * \
\n * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS \"AS IS\" AND\
\n * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED\
\n * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE\
\n * DISCLAIMED. IN NO EVENT SHALL ADVANCED MICRO DEVICES, INC. BE LIABLE FOR ANY\
\n * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES\
\n * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;\
\n * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND\
\n * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT\
\n * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS\
\n * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."

grep -rn "You agree that you will not reverse engineer or decompile the Materials" src/ | while read grep_out
do
#       echo "$grep_out"
        file_name=`echo $grep_out|awk -F ":" '{print $1}'`
#       echo "file name is $file_name"
        line_nu=`echo $grep_out|awk -F ":" '{print $2}'`
#       echo "line nu is $line_nu"
        del_begin=$((line_nu-32))
#       echo "del begin $del_begin"
        del_end=$((line_nu+18))
#       echo "del end $del_end"
        sed -i "$del_begin,$del_end d" $file_name
#       sed -i ''"$del_begin"' i\ '"${new_license}"'' $file_name
        sed -i "$del_begin i\ ${new_license}" $file_name
done
