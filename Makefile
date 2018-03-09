obj = entry.o main.o
link_script = src/linker.ld

CC = i686-elf-gcc
CFLAGS += -O0 -ffreestanding -Wall -Wextra -g

object_files = $(addprefix src/, $(obj))

LINKFLAGS = -T $(link_script) -ffreestanding -nostdlib -lgcc 

quark-test: $(addprefix src/, $(obj))
	mkdir -p bin
	$(CC) -I$(HOME)/.quark/include $(LINKFLAGS) $(object_files) -o bin/quark-test
	rm $(addprefix src/, $(obj))

install:
	mkdir -p $(HOME)/.quark/bin
	cp bin/quark-test $(HOME)/.quark

