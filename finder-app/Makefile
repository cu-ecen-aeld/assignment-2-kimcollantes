CC = gcc
CROSS_COMPILE = 
CFLAGS = -Wall -Wextra
SRCS = writer.c
OBJS = $(SRCS:.c=.o)
TARGET = writer


all: $(TARGET)
$(TARGET): $(OBJS)
	$(CC)$(CROSS_COMPILE) $(CFLAGS) -o $@ $^
clean:
	rm -f $(OBJS) $(TARGET)	
