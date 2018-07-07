require 'mkmf'

$CFLAGS += ' --std=c99'
$ARCH_FLAG = '-march=native -mtune=native'

create_makefile 'spooky/spooky'
