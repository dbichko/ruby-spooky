require 'mkmf'

$CFLAGS += ' -std=c99 -Wall -O3'
$ARCH_FLAG = '-march=native -mtune=native'

create_makefile 'spooky/spooky'
