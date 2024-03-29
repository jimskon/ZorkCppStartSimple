# MakeFile to build the Zork Start program 

CC= g++

#For Optimization
#CFLAGS= -O2
#For debugging
CFLAGS= -std=c++14

RM= /bin/rm -f

all: zork

border.o: border.cpp border.h
	$(CC) $(CFLAGS) border.cpp -c

room.o: room.cpp room.h
	$(CC) $(CFLAGS) room.cpp -c

world.o: world.cpp world.h
	$(CC) $(CFLAGS) world.cpp -c

xmlParser.o: xmlParser.cpp xmlParser.h
	$(CC) $(CFLAGS) xmlParser.cpp -c

zork.o: zork.cpp xmlParser.h world.h room.h border.h
	$(CC) $(CFLAGS) zork.cpp -c

zork: zork.o border.o room.o world.o xmlParser.o
	$(CC) $(CFLAGS) zork.o border.o room.o world.o xmlParser.o -o zork

clean:
	rm -f *.o  zork
