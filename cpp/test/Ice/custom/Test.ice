// **********************************************************************
//
// Copyright (c) 2003-2011 ZeroC, Inc. All rights reserved.
//
// This copy of Ice is licensed to you under the terms described in the
// ICE_LICENSE file included in this distribution.
//
// **********************************************************************

#ifndef TEST_ICE
#define TEST_ICE

[["cpp:include:deque", "cpp:include:list", "cpp:include:MyByteSeq.h"]]

module Test
{

sequence<bool> BoolSeq;
["cpp:type:std::list<bool>"] sequence<bool> BoolList;

["cpp:type:std::list< ::Test::BoolList>"] sequence<BoolList> BoolListList;
sequence<BoolList> BoolListSeq;
["cpp:type:std::list< ::Test::BoolSeq>"] sequence<BoolSeq> BoolSeqList;

sequence<byte> ByteSeq;
["cpp:type:std::list< ::Ice::Byte>"] sequence<byte> ByteList;

["cpp:type:std::list< ::Test::ByteList>"] sequence<ByteList> ByteListList;
sequence<ByteList> ByteListSeq;
["cpp:type:std::list< ::Test::ByteSeq>"] sequence<ByteSeq> ByteSeqList;

sequence<string> StringSeq;
["cpp:type:std::list<std::string>"] sequence<string> StringList;

["cpp:type:std::list< ::Test::StringList>"] sequence<StringList> StringListList;
sequence<StringList> StringListSeq;
["cpp:type:std::list< ::Test::StringSeq>"] sequence<StringSeq> StringSeqList;

struct Fixed
{
    short s;
};

sequence<Fixed> FixedSeq;
["cpp:type:std::list< ::Test::Fixed>"] sequence<Fixed> FixedList;

["cpp:type:std::list< ::Test::FixedList>"] sequence<FixedList> FixedListList;
sequence<FixedList> FixedListSeq;
["cpp:type:std::list< ::Test::FixedSeq>"] sequence<FixedSeq> FixedSeqList;

struct Variable
{
    string s;
    BoolList bl;
    ["cpp:type:std::list<std::string>"] StringSeq ss;
};

sequence<Variable> VariableSeq;
["cpp:type:std::list< ::Test::Variable>"] sequence<Variable> VariableList;

["cpp:type:std::list< ::Test::VariableList>"] sequence<VariableList> VariableListList;
sequence<VariableList> VariableListSeq;
["cpp:type:std::list< ::Test::VariableSeq>"] sequence<VariableSeq> VariableSeqList;

dictionary<string, string> StringStringDict;
sequence<StringStringDict> StringStringDictSeq;
["cpp:type:std::list< ::Test::StringStringDict>"] sequence<StringStringDict> StringStringDictList;

["cpp:type:std::list< ::Test::StringStringDictList>"] sequence<StringStringDictList> StringStringDictListList;
sequence<StringStringDictList> StringStringDictListSeq;
["cpp:type:std::list< ::Test::StringStringDictSeq>"] sequence<StringStringDictSeq> StringStringDictSeqList;

enum E { E1, E2, E3 };
sequence<E> ESeq;
["cpp:type:std::list< ::Test::E>"] sequence<E> EList;

["cpp:type:std::list< ::Test::EList>"] sequence<EList> EListList;
sequence<EList> EListSeq;
["cpp:type:std::list< ::Test::ESeq>"] sequence<ESeq> ESeqList;

class C {};
sequence<C> CSeq;
["cpp:type:std::list< ::Test::CPtr>"] sequence<C> CList;

["cpp:type:std::list< ::Test::CList>"] sequence<CList> CListList;
sequence<CList> CListSeq;
["cpp:type:std::list< ::Test::CSeq>"] sequence<CSeq> CSeqList;

sequence<C*> CPrxSeq;
["cpp:type:std::list< ::Test::CPrx>"] sequence<C*> CPrxList;

["cpp:type:std::list< ::Test::CPrxList>"] sequence<CPrxList> CPrxListList;
sequence<CPrxList> CPrxListSeq;
["cpp:type:std::list< ::Test::CPrxSeq>"] sequence<CPrxSeq> CPrxSeqList;

sequence<double> DoubleSeq;

["cpp:class"] struct ClassOtherStruct
{
    int x;
};
sequence<ClassOtherStruct> ClassOtherStructSeq;

["cpp:class"] struct ClassStruct
{
    ClassOtherStructSeq otherSeq;
    ClassOtherStruct other;
    int y;
};
sequence<ClassStruct> ClassStructSeq;

["ami"] class TestIntf
{
    ["cpp:array"] DoubleSeq opDoubleArray(["cpp:array"] DoubleSeq inSeq, out ["cpp:array"] DoubleSeq outSeq);

    ["cpp:array"] BoolSeq opBoolArray(["cpp:array"] BoolSeq inSeq, out ["cpp:array"] BoolSeq outSeq);

    ["cpp:array"] ByteList opByteArray(["cpp:array"] ByteList inSeq, out ["cpp:array"] ByteList outSeq);

    ["cpp:array"] VariableList opVariableArray(["cpp:array"] VariableList inSeq, out ["cpp:array"] VariableList outSeq);

    ["cpp:range"] BoolSeq opBoolRange(["cpp:range"] BoolSeq inSeq, out ["cpp:range"] BoolSeq outSeq);

    ["cpp:range"] ByteList opByteRange(["cpp:range"] ByteList inSeq, out ["cpp:range"] ByteList outSeq);

    ["cpp:range"] VariableList opVariableRange(["cpp:range"] VariableList inSeq, out ["cpp:range"] VariableList outSeq);

    ["cpp:range:array"] BoolSeq opBoolRangeType(["cpp:range:array"] BoolSeq inSeq,
                                                out ["cpp:range:array"] BoolSeq outSeq);
    
    ["cpp:range:::Test::ByteList"] ByteList opByteRangeType(["cpp:range:::Test::ByteList"] ByteList inSeq, 
                                                            out ["cpp:range:::Test::ByteList"] ByteList outSeq);

    ["cpp:range:std::deque< ::Test::Variable>"] VariableList
    opVariableRangeType(["cpp:range:std::deque< ::Test::Variable>"] VariableList inSeq, 
                        out ["cpp:range:std::deque< ::Test::Variable>"] VariableList outSeq);

    ["cpp:type:std::deque<bool>"] BoolSeq 
    opBoolSeq(["cpp:type:std::deque<bool>"] BoolSeq inSeq, out ["cpp:type:std::deque<bool>"]BoolSeq outSeq);

    BoolList opBoolList(BoolList inSeq, out BoolList outSeq);

    ["cpp:type:std::deque< ::Ice::Byte>"] ByteSeq 
    opByteSeq(["cpp:type:std::deque< ::Ice::Byte>"] ByteSeq inSeq, 
              out ["cpp:type:std::deque< ::Ice::Byte>"] ByteSeq outSeq);

    ByteList opByteList(ByteList inSeq, out ByteList outSeq);

    ["cpp:type:MyByteSeq"] ByteSeq 
    opMyByteSeq(["cpp:type:MyByteSeq"] ByteSeq inSeq, out ["cpp:type:MyByteSeq"] ByteSeq outSeq);

    ["cpp:type:std::deque<std::string>"] StringSeq 
    opStringSeq(["cpp:type:std::deque<std::string>"] StringSeq inSeq, 
                out ["cpp:type:std::deque<std::string>"] StringSeq outSeq);

    StringList opStringList(StringList inSeq, out StringList outSeq);

    ["cpp:type:std::deque< ::Test::Fixed>"] FixedSeq 
    opFixedSeq(["cpp:type:std::deque< ::Test::Fixed>"] FixedSeq inSeq,
               out ["cpp:type:std::deque< ::Test::Fixed>"] FixedSeq outSeq);

    FixedList opFixedList(FixedList inSeq, out FixedList outSeq);

    ["cpp:type:std::deque< ::Test::Variable>"] VariableSeq 
    opVariableSeq(["cpp:type:std::deque< ::Test::Variable>"] VariableSeq inSeq, 
                  out ["cpp:type:std::deque< ::Test::Variable>"] VariableSeq outSeq);

    VariableList opVariableList(VariableList inSeq, out VariableList outSeq);

    ["cpp:type:std::deque< ::Test::StringStringDict>"] StringStringDictSeq 
    opStringStringDictSeq(["cpp:type:std::deque< ::Test::StringStringDict>"] StringStringDictSeq inSeq,
                          out ["cpp:type:std::deque< ::Test::StringStringDict>"] StringStringDictSeq outSeq);

    StringStringDictList opStringStringDictList(StringStringDictList inSeq, out StringStringDictList outSeq);

    ["cpp:type:std::deque< ::Test::E>"] ESeq 
    opESeq(["cpp:type:std::deque< ::Test::E>"] ESeq inSeq, out ["cpp:type:std::deque< ::Test::E>"] ESeq outSeq);

    EList opEList(EList inSeq, out EList outSeq);

    ["cpp:type:std::deque< ::Test::CPrx>"] CPrxSeq 
    opCPrxSeq(["cpp:type:std::deque< ::Test::CPrx>"] CPrxSeq inSeq, 
              out ["cpp:type:std::deque< ::Test::CPrx>"] CPrxSeq outSeq);

    CPrxList opCPrxList(CPrxList inSeq, out CPrxList outSeq);

    ["cpp:type:std::deque< ::Test::CPtr>"] CSeq
    opCSeq(["cpp:type:std::deque< ::Test::CPtr>"] CSeq inSeq, out ["cpp:type:std::deque< ::Test::CPtr>"] CSeq outSeq);

    CList opCList(CList inSeq, out CList outSeq);

    ClassStruct opClassStruct(ClassStruct inS, ClassStructSeq inSeq, out ClassStruct outS, out ClassStructSeq outSeq);
    
    void opOutArrayByteSeq(ByteSeq org, out ["cpp:array"] ByteSeq copy);
    
    void opOutRangeByteSeq(ByteSeq org, out ["cpp:range"] ByteSeq copy);

    void shutdown();
};

};

#endif
