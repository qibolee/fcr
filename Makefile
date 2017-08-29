INC=./include
OUT=./out
SRC=./src

# compiler
CXX=clang++
# compile args
CXXFLAGS=-std=c++14 \
		 -Wall \
		 -I. \
		 -I./include
# link args
CXXLNKS=-lpthread \
		-lrt

# head files
INCFILES=mlog.h \
		 config.h \
		 config_parser.h \
		 blocking_queue.h \
		 accept_thread.h \
		 process_thread.h \
		 reload_thread.h \
		 notice_data.h \
		 ad_data.h \
		 string_util.h \
		 inet_sockets.h

# source files
SRCFILES=main.cpp \
		 mlog.cpp \
		 config.cpp \
		 config_parser.cpp \
		 accept_thread.cpp \
		 process_thread.cpp \
		 reload_thread.cpp \
		 string_util.cpp \
		 inet_sockets.cpp

# substr *.h to ./include/*.h
TMP=$(INCFILES:%.h=$(INC)/%.h)
INCS=$(TMP:%.hpp=$(INC)/%.hpp)

# substr *.cpp to ./src/*.cpp
SRCS=$(SRCFILES:%.cpp=$(SRC)/%.cpp)

# substr *.cpp to ./out/*.o
OBJS=$(SRCFILES:%.cpp=$(OUT)/%.o)

# target, default make target
TARGET=$(OUT)/main

# biuld target
$(TARGET):$(OBJS)
	$(CXX) $(CXXLNKS) -o $@ $^
	@echo "make done"

# to all ./out/*.o:./src/*.cpp
$(OUT)/%.o:$(SRC)/%.cpp $(INCS)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# phony target
clean:
	rm -rf $(OUT)/*.o $(TARGET)

# show var
show:
	@echo "INC: $(INC)"
	@echo "SRC: $(SRC)"
	@echo "OUT: $(OUT)"
	@echo "CXX: $(CXX)"
	@echo "CXXFLAGS: $(CXXFLAGS)"
	@echo "CXXLNKS: $(CXXLNKS)"
	@echo "INCFILES: $(INCFILES)"
	@echo "SRCFILES: $(SRCFILES)"
	@echo "INCS: $(INCS)"
	@echo "SRCS: $(SRCS)"
	@echo "OBJS: $(OBJS)"
	@echo "TARGET: $(TARGET)"




