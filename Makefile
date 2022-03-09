FILE		= tex
SRC_DIR		= src
OUT_DIR		= bin
COMPILER	= pdflatex
FLAGS		= -output-directory $(OUT_DIR)
SRC_FILES	= $(wildcard $(SRC_DIR)/*.$(FILE))
TARGET		= $(patsubst $(SRC_DIR)/%.$(FILE),%,$(SRC_FILES))

all: pdf png

pdf:
	mkdir -p $(OUT_DIR)
	$(COMPILER) $(FLAGS) $(SRC_FILES)

png: pdf
	pdftoppm $(OUT_DIR)/$(TARGET).pdf | pnmtopng > $(OUT_DIR)/$(TARGET).png

clean:
	rm -r $(OUT_DIR)
