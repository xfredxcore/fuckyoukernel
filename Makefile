all:
	as --32 boot/boot.s -o boot.o
	gcc -ffreestanding -m32 -O2 -c kernel/kmain.c -o kmain.o
	ld -m elf_i386 -T boot/linker.ld -o fuckyou.bin boot.o kmain.o
	mkdir -p isofiles/boot/grub
	cp fuckyou.bin isofiles/boot/
	echo 'set timeout=0; menuentry "os" { multiboot2 /boot/fuckyou.bin; boot }' > isofiles/boot/grub/grub.cfg
	/usr/bin/grub2-mkrescue -o fuckyou.iso isofiles