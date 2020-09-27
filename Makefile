FILE		= tex
SRC_PATH	= src/
OUT_PATH	= bin/
COMPILER	= pdflatex
FLAGS		= -output-directory $(OUT_PATH)
SRC_FILES	= $(wildcard $(SRC_PATH)*.$(FILE))
TARGET		= $(patsubst $(SRC_PATH)%.$(FILE),%,$(SRC_FILES))

all:
	$(COMPILER) $(FLAGS) $(SRC_FILES)
	pdftoppm $(OUT_PATH)$(TARGET).pdf | pnmtopng > $(OUT_PATH)$(TARGET).png

clean:
	rm -rf $(wildcard $(OUT_PATH)*)
