// **********************************************************************
//
// Copyright (c) 2003
// ZeroC, Inc.
// Huntsville, AL, USA
//
// All Rights Reserved.
//
// Ice is free software; you can redistribute it and/or modify it under
// the terms of the GNU General Public License version 2 as published by
// the Free Software Foundation.
//
// **********************************************************************

//
// Basic checks (all OK)
//
const bool boolconst = false;
const bool boolconst2 = true;
const byte byteconst = 0;
const short shortconst = 0;
const int intconst = 0;
const long longconst = 0;
const float floatconst = 0.;
const double doubleconst = 0.;
const string stringconst = "X\aX\x00001X\rX\007\xffX\xffffX\xff7f";
const string stringconst2 = "Hello World!";
enum color { red, green, blue };
const color colorconst = blue;
const ::color colorconst2 = ::green;

//
// Checks for number formats (all OK)
//
const long l1 = 127;
const long l2 = 0177;
const long l3 = 0x7f;

const float f1 = .1;
const float f2 = 1.1;
const float f3 = 1.;
const float f4 = .1e1;
const float f5 = 1.E1;
const float f6 = 1.1e+1;
const float f7 = 1.1e-1;
const float f8 = 1e-1;
const float f9 = 1E+1;
const float f10 = 1E+1f;
const float f11 = 1E1F;

const XXX ic1 = 1;		// no such type
const long f11 = 1;		// redifinition
const long F10 = 1;		// case-insensitive redefinition

sequence<long> LS;
const LS ic2 = 1;		// illegal constant type
const Object ic3 = 0;		// illegal constant type

const bool ic4 = 0;		// type mismatch
const byte ic5 = "hello";	// type mismatch
const short ic6 = 1.1;		// type mismatch
const int ic7 = blue;		// type mismatch
const long ic8 = false;		// type mismatch

const long = 0;			// missing identifier

enum digit { one, two };
const color ic9 = two;		// wrong enumerator type
const color ic10 = 0;		// wrong initializer type

//
// Range checks
//
const long r1 = 9223372036854775807;	// LLONG_MAX, OK
const long r2 = -9223372036854775807;	// -LLONG_MAX, OK

//
// TODO: This should work, but doesn't. STLport can't handle inserting
// LLONG_MIN onto a stream and inserts garbage. We can periodically try
// this again as new versions of STLport come out...
//
// const long r3 = -9223372036854775808;	// LLONG_MIN, OK
//

const long r4 = -9223372036854775809;	// underflow
const long r5 = +9223372036854775808;	// overflow

const int i1 = -2147483648;		// INT_MIN, OK
const int i2 = +2147483647;		// INT_MAX, OK
const int i3 = -2147483649;		// underflow
const int i4 = +2147483648;		// overflow

const short s1 = -32768;		// SHORT_MIN, OK
const short s2 = +32767;		// SHORT_MAX, OK
const short s3 = -32769;		// underflow
const short s4 = +32768;		// overflow

const byte b1 = 0;			// OK
const byte b2 = 255;			// OK
const byte b3 = -1;			// underflow
const byte b4 = 256;			// overflow