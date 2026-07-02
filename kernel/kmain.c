void kmain(void* mb_struct) {
    (void)mb_struct;

    // Адрес текстового буфера VGA
    unsigned short* vga = (unsigned short*)0xB8000;

    // Очистка экрана (заполнение пробелами с черным фоном)
    for (int i = 0; i < 80 * 25; i++) {
        vga[i] = 0x0F20;
    }

    // Строка "FUCK YOU"
    const char* str1 = "FUCK YOU";
    int offset1 = (80 * 12) + 36; // Центр экрана (примерно)
    for (int i = 0; str1[i] != '\0'; i++) {
        vga[offset1 + i] = 0x0F00 | (unsigned char)str1[i];
    }

    // Строка "and fuck your hardware"
    const char* str2 = "and fuck your hardware";
    int offset2 = (80 * 13) + 29;
    for (int i = 0; str2[i] != '\0'; i++) {
        vga[offset2 + i] = 0x0F00 | (unsigned char)str2[i];
    }

    while(1) {
        asm volatile ("hlt");
    }
}