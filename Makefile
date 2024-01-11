ASM=nasm

SRC_DIR=src
BUILD_DIR=build

$(BUILD_DIR)/main_floppy.img: $(BUILD_DIR)/main.bin
	cp $(BUILD_DIR)/main.bin $(BUILD_DIR)/main_floppy.bin
	truncate -s 1440k $(BUILD_DIR)/main_floppy.bin

$(BUILD_DIR)/main.bin: $(SRC_DIR)/micro.s
	@mkdir -p $(BUILD_DIR)
	$(ASM) $(SRC_DIR)/micro.s -f bin -o $(BUILD_DIR)/main.bin

run: $(BUILD_DIR)/main.bin
	qemu-system-i386 -fda $(BUILD_DIR)/main_floppy.bin

