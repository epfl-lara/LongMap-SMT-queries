; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32290 () Bool)

(assert start!32290)

(declare-fun b!321794 () Bool)

(declare-fun e!199284 () Bool)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun lt!156261 () (_ BitVec 32))

(assert (=> b!321794 (= e!199284 (and (bvsge mask!3777 #b00000000000000000000000000000000) (or (bvslt lt!156261 #b00000000000000000000000000000000) (bvsge lt!156261 (bvadd #b00000000000000000000000000000001 mask!3777)))))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321794 (= lt!156261 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!321795 () Bool)

(declare-fun res!175920 () Bool)

(declare-fun e!199283 () Bool)

(assert (=> b!321795 (=> (not res!175920) (not e!199283))))

(declare-datatypes ((array!16480 0))(
  ( (array!16481 (arr!7799 (Array (_ BitVec 32) (_ BitVec 64))) (size!8151 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16480)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2930 0))(
  ( (MissingZero!2930 (index!13896 (_ BitVec 32))) (Found!2930 (index!13897 (_ BitVec 32))) (Intermediate!2930 (undefined!3742 Bool) (index!13898 (_ BitVec 32)) (x!32157 (_ BitVec 32))) (Undefined!2930) (MissingVacant!2930 (index!13899 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16480 (_ BitVec 32)) SeekEntryResult!2930)

(assert (=> b!321795 (= res!175920 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2930 i!1250)))))

(declare-fun b!321796 () Bool)

(declare-fun res!175918 () Bool)

(assert (=> b!321796 (=> (not res!175918) (not e!199283))))

(declare-fun arrayContainsKey!0 (array!16480 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321796 (= res!175918 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321797 () Bool)

(declare-fun res!175921 () Bool)

(assert (=> b!321797 (=> (not res!175921) (not e!199283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321797 (= res!175921 (validKeyInArray!0 k!2497))))

(declare-fun b!321798 () Bool)

(declare-fun res!175922 () Bool)

(assert (=> b!321798 (=> (not res!175922) (not e!199284))))

(declare-fun lt!156260 () SeekEntryResult!2930)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16480 (_ BitVec 32)) SeekEntryResult!2930)

(assert (=> b!321798 (= res!175922 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156260))))

(declare-fun b!321799 () Bool)

(declare-fun res!175916 () Bool)

(assert (=> b!321799 (=> (not res!175916) (not e!199284))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!321799 (= res!175916 (and (= (select (arr!7799 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8151 a!3305))))))

(declare-fun res!175914 () Bool)

(assert (=> start!32290 (=> (not res!175914) (not e!199283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32290 (= res!175914 (validMask!0 mask!3777))))

(assert (=> start!32290 e!199283))

(declare-fun array_inv!5762 (array!16480) Bool)

(assert (=> start!32290 (array_inv!5762 a!3305)))

(assert (=> start!32290 true))

(declare-fun b!321800 () Bool)

(declare-fun res!175923 () Bool)

(assert (=> b!321800 (=> (not res!175923) (not e!199283))))

(assert (=> b!321800 (= res!175923 (and (= (size!8151 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8151 a!3305))))))

(declare-fun b!321801 () Bool)

(declare-fun res!175919 () Bool)

(assert (=> b!321801 (=> (not res!175919) (not e!199283))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16480 (_ BitVec 32)) Bool)

(assert (=> b!321801 (= res!175919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321802 () Bool)

(assert (=> b!321802 (= e!199283 e!199284)))

(declare-fun res!175915 () Bool)

(assert (=> b!321802 (=> (not res!175915) (not e!199284))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321802 (= res!175915 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156260))))

(assert (=> b!321802 (= lt!156260 (Intermediate!2930 false resIndex!58 resX!58))))

(declare-fun b!321803 () Bool)

(declare-fun res!175917 () Bool)

(assert (=> b!321803 (=> (not res!175917) (not e!199284))))

(assert (=> b!321803 (= res!175917 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7799 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7799 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7799 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!32290 res!175914) b!321800))

(assert (= (and b!321800 res!175923) b!321797))

(assert (= (and b!321797 res!175921) b!321796))

(assert (= (and b!321796 res!175918) b!321795))

(assert (= (and b!321795 res!175920) b!321801))

(assert (= (and b!321801 res!175919) b!321802))

(assert (= (and b!321802 res!175915) b!321799))

(assert (= (and b!321799 res!175916) b!321798))

(assert (= (and b!321798 res!175922) b!321803))

(assert (= (and b!321803 res!175917) b!321794))

(declare-fun m!329867 () Bool)

(assert (=> b!321803 m!329867))

(declare-fun m!329869 () Bool)

(assert (=> b!321801 m!329869))

(declare-fun m!329871 () Bool)

(assert (=> b!321802 m!329871))

(assert (=> b!321802 m!329871))

(declare-fun m!329873 () Bool)

(assert (=> b!321802 m!329873))

(declare-fun m!329875 () Bool)

(assert (=> b!321797 m!329875))

(declare-fun m!329877 () Bool)

(assert (=> b!321795 m!329877))

(declare-fun m!329879 () Bool)

(assert (=> b!321799 m!329879))

(declare-fun m!329881 () Bool)

(assert (=> b!321796 m!329881))

(declare-fun m!329883 () Bool)

(assert (=> start!32290 m!329883))

(declare-fun m!329885 () Bool)

(assert (=> start!32290 m!329885))

(declare-fun m!329887 () Bool)

(assert (=> b!321798 m!329887))

(declare-fun m!329889 () Bool)

(assert (=> b!321794 m!329889))

(push 1)

(assert (not b!321794))

(assert (not b!321798))

(assert (not b!321796))

(assert (not b!321801))

(assert (not b!321797))

(assert (not b!321802))

(assert (not start!32290))

(assert (not b!321795))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!321930 () Bool)

(declare-fun lt!156295 () SeekEntryResult!2930)

(assert (=> b!321930 (and (bvsge (index!13898 lt!156295) #b00000000000000000000000000000000) (bvslt (index!13898 lt!156295) (size!8151 a!3305)))))

(declare-fun e!199345 () Bool)

(assert (=> b!321930 (= e!199345 (= (select (arr!7799 a!3305) (index!13898 lt!156295)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!321931 () Bool)

(assert (=> b!321931 (and (bvsge (index!13898 lt!156295) #b00000000000000000000000000000000) (bvslt (index!13898 lt!156295) (size!8151 a!3305)))))

(declare-fun res!176009 () Bool)

(assert (=> b!321931 (= res!176009 (= (select (arr!7799 a!3305) (index!13898 lt!156295)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!321931 (=> res!176009 e!199345)))

(declare-fun b!321932 () Bool)

(declare-fun e!199347 () Bool)

(declare-fun e!199346 () Bool)

(assert (=> b!321932 (= e!199347 e!199346)))

(declare-fun res!176008 () Bool)

(assert (=> b!321932 (= res!176008 (and (is-Intermediate!2930 lt!156295) (not (undefined!3742 lt!156295)) (bvslt (x!32157 lt!156295) #b01111111111111111111111111111110) (bvsge (x!32157 lt!156295) #b00000000000000000000000000000000) (bvsge (x!32157 lt!156295) x!1490)))))

(assert (=> b!321932 (=> (not res!176008) (not e!199346))))

(declare-fun b!321933 () Bool)

(declare-fun e!199343 () SeekEntryResult!2930)

(assert (=> b!321933 (= e!199343 (Intermediate!2930 false index!1840 x!1490))))

(declare-fun b!321934 () Bool)

(declare-fun e!199344 () SeekEntryResult!2930)

(assert (=> b!321934 (= e!199344 e!199343)))

(declare-fun c!50587 () Bool)

(declare-fun lt!156296 () (_ BitVec 64))

(assert (=> b!321934 (= c!50587 (or (= lt!156296 k!2497) (= (bvadd lt!156296 lt!156296) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!321935 () Bool)

(assert (=> b!321935 (= e!199347 (bvsge (x!32157 lt!156295) #b01111111111111111111111111111110))))

(declare-fun b!321936 () Bool)

(assert (=> b!321936 (= e!199343 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!321937 () Bool)

(assert (=> b!321937 (= e!199344 (Intermediate!2930 true index!1840 x!1490))))

(declare-fun b!321938 () Bool)

(assert (=> b!321938 (and (bvsge (index!13898 lt!156295) #b00000000000000000000000000000000) (bvslt (index!13898 lt!156295) (size!8151 a!3305)))))

(declare-fun res!176010 () Bool)

(assert (=> b!321938 (= res!176010 (= (select (arr!7799 a!3305) (index!13898 lt!156295)) k!2497))))

(assert (=> b!321938 (=> res!176010 e!199345)))

(assert (=> b!321938 (= e!199346 e!199345)))

(declare-fun d!69529 () Bool)

(assert (=> d!69529 e!199347))

(declare-fun c!50588 () Bool)

(assert (=> d!69529 (= c!50588 (and (is-Intermediate!2930 lt!156295) (undefined!3742 lt!156295)))))

(assert (=> d!69529 (= lt!156295 e!199344)))

(declare-fun c!50589 () Bool)

(assert (=> d!69529 (= c!50589 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!69529 (= lt!156296 (select (arr!7799 a!3305) index!1840))))

(assert (=> d!69529 (validMask!0 mask!3777)))

(assert (=> d!69529 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156295)))

(assert (= (and d!69529 c!50589) b!321937))

(assert (= (and d!69529 (not c!50589)) b!321934))

(assert (= (and b!321934 c!50587) b!321933))

(assert (= (and b!321934 (not c!50587)) b!321936))

(assert (= (and d!69529 c!50588) b!321935))

(assert (= (and d!69529 (not c!50588)) b!321932))

(assert (= (and b!321932 res!176008) b!321938))

(assert (= (and b!321938 (not res!176010)) b!321931))

(assert (= (and b!321931 (not res!176009)) b!321930))

(declare-fun m!329951 () Bool)

(assert (=> b!321938 m!329951))

(assert (=> b!321931 m!329951))

(assert (=> d!69529 m!329867))

(assert (=> d!69529 m!329883))

(assert (=> b!321930 m!329951))

(assert (=> b!321936 m!329889))

(assert (=> b!321936 m!329889))

(declare-fun m!329955 () Bool)

(assert (=> b!321936 m!329955))

(assert (=> b!321798 d!69529))

(declare-fun d!69537 () Bool)

(assert (=> d!69537 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32290 d!69537))

(declare-fun d!69559 () Bool)

(assert (=> d!69559 (= (array_inv!5762 a!3305) (bvsge (size!8151 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32290 d!69559))

(declare-fun d!69561 () Bool)

(assert (=> d!69561 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!321797 d!69561))

(declare-fun b!321987 () Bool)

(declare-fun lt!156323 () SeekEntryResult!2930)

(assert (=> b!321987 (and (bvsge (index!13898 lt!156323) #b00000000000000000000000000000000) (bvslt (index!13898 lt!156323) (size!8151 a!3305)))))

(declare-fun e!199382 () Bool)

(assert (=> b!321987 (= e!199382 (= (select (arr!7799 a!3305) (index!13898 lt!156323)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!321988 () Bool)

(assert (=> b!321988 (and (bvsge (index!13898 lt!156323) #b00000000000000000000000000000000) (bvslt (index!13898 lt!156323) (size!8151 a!3305)))))

(declare-fun res!176038 () Bool)

(assert (=> b!321988 (= res!176038 (= (select (arr!7799 a!3305) (index!13898 lt!156323)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!321988 (=> res!176038 e!199382)))

(declare-fun b!321989 () Bool)

(declare-fun e!199384 () Bool)

(declare-fun e!199383 () Bool)

(assert (=> b!321989 (= e!199384 e!199383)))

(declare-fun res!176037 () Bool)

(assert (=> b!321989 (= res!176037 (and (is-Intermediate!2930 lt!156323) (not (undefined!3742 lt!156323)) (bvslt (x!32157 lt!156323) #b01111111111111111111111111111110) (bvsge (x!32157 lt!156323) #b00000000000000000000000000000000) (bvsge (x!32157 lt!156323) #b00000000000000000000000000000000)))))

(assert (=> b!321989 (=> (not res!176037) (not e!199383))))

(declare-fun b!321990 () Bool)

(declare-fun e!199380 () SeekEntryResult!2930)

(assert (=> b!321990 (= e!199380 (Intermediate!2930 false (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!321991 () Bool)

(declare-fun e!199381 () SeekEntryResult!2930)

(assert (=> b!321991 (= e!199381 e!199380)))

(declare-fun c!50602 () Bool)

(declare-fun lt!156324 () (_ BitVec 64))

(assert (=> b!321991 (= c!50602 (or (= lt!156324 k!2497) (= (bvadd lt!156324 lt!156324) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!321992 () Bool)

(assert (=> b!321992 (= e!199384 (bvsge (x!32157 lt!156323) #b01111111111111111111111111111110))))

(declare-fun b!321993 () Bool)

(assert (=> b!321993 (= e!199380 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!321994 () Bool)

(assert (=> b!321994 (= e!199381 (Intermediate!2930 true (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!321995 () Bool)

(assert (=> b!321995 (and (bvsge (index!13898 lt!156323) #b00000000000000000000000000000000) (bvslt (index!13898 lt!156323) (size!8151 a!3305)))))

(declare-fun res!176039 () Bool)

(assert (=> b!321995 (= res!176039 (= (select (arr!7799 a!3305) (index!13898 lt!156323)) k!2497))))

(assert (=> b!321995 (=> res!176039 e!199382)))

(assert (=> b!321995 (= e!199383 e!199382)))

(declare-fun d!69565 () Bool)

(assert (=> d!69565 e!199384))

(declare-fun c!50603 () Bool)

(assert (=> d!69565 (= c!50603 (and (is-Intermediate!2930 lt!156323) (undefined!3742 lt!156323)))))

(assert (=> d!69565 (= lt!156323 e!199381)))

(declare-fun c!50604 () Bool)

(assert (=> d!69565 (= c!50604 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!69565 (= lt!156324 (select (arr!7799 a!3305) (toIndex!0 k!2497 mask!3777)))))

(assert (=> d!69565 (validMask!0 mask!3777)))

(assert (=> d!69565 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156323)))

(assert (= (and d!69565 c!50604) b!321994))

(assert (= (and d!69565 (not c!50604)) b!321991))

(assert (= (and b!321991 c!50602) b!321990))

(assert (= (and b!321991 (not c!50602)) b!321993))

(assert (= (and d!69565 c!50603) b!321992))

(assert (= (and d!69565 (not c!50603)) b!321989))

(assert (= (and b!321989 res!176037) b!321995))

(assert (= (and b!321995 (not res!176039)) b!321988))

(assert (= (and b!321988 (not res!176038)) b!321987))

(declare-fun m!329989 () Bool)

(assert (=> b!321995 m!329989))

(assert (=> b!321988 m!329989))

(assert (=> d!69565 m!329871))

(declare-fun m!329991 () Bool)

(assert (=> d!69565 m!329991))

(assert (=> d!69565 m!329883))

(assert (=> b!321987 m!329989))

(assert (=> b!321993 m!329871))

(declare-fun m!329993 () Bool)

(assert (=> b!321993 m!329993))

(assert (=> b!321993 m!329993))

(declare-fun m!329995 () Bool)

(assert (=> b!321993 m!329995))

(assert (=> b!321802 d!69565))

(declare-fun d!69567 () Bool)

(declare-fun lt!156336 () (_ BitVec 32))

(declare-fun lt!156335 () (_ BitVec 32))

(assert (=> d!69567 (= lt!156336 (bvmul (bvxor lt!156335 (bvlshr lt!156335 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69567 (= lt!156335 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69567 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!176040 (let ((h!5390 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32167 (bvmul (bvxor h!5390 (bvlshr h!5390 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32167 (bvlshr x!32167 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!176040 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!176040 #b00000000000000000000000000000000))))))

(assert (=> d!69567 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!156336 (bvlshr lt!156336 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!321802 d!69567))

(declare-fun d!69569 () Bool)

(declare-fun res!176051 () Bool)

(declare-fun e!199398 () Bool)

(assert (=> d!69569 (=> res!176051 e!199398)))

(assert (=> d!69569 (= res!176051 (= (select (arr!7799 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!69569 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!199398)))

(declare-fun b!322012 () Bool)

(declare-fun e!199399 () Bool)

(assert (=> b!322012 (= e!199398 e!199399)))

(declare-fun res!176052 () Bool)

(assert (=> b!322012 (=> (not res!176052) (not e!199399))))

(assert (=> b!322012 (= res!176052 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8151 a!3305)))))

(declare-fun b!322013 () Bool)

(assert (=> b!322013 (= e!199399 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69569 (not res!176051)) b!322012))

(assert (= (and b!322012 res!176052) b!322013))

(declare-fun m!330007 () Bool)

(assert (=> d!69569 m!330007))

(declare-fun m!330009 () Bool)

(assert (=> b!322013 m!330009))

(assert (=> b!321796 d!69569))

(declare-fun bm!26068 () Bool)

(declare-fun call!26071 () Bool)

(assert (=> bm!26068 (= call!26071 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!322040 () Bool)

(declare-fun e!199416 () Bool)

(declare-fun e!199417 () Bool)

(assert (=> b!322040 (= e!199416 e!199417)))

(declare-fun lt!156356 () (_ BitVec 64))

(assert (=> b!322040 (= lt!156356 (select (arr!7799 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9832 0))(
  ( (Unit!9833) )
))
(declare-fun lt!156357 () Unit!9832)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16480 (_ BitVec 64) (_ BitVec 32)) Unit!9832)

(assert (=> b!322040 (= lt!156357 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!156356 #b00000000000000000000000000000000))))

(assert (=> b!322040 (arrayContainsKey!0 a!3305 lt!156356 #b00000000000000000000000000000000)))

(declare-fun lt!156355 () Unit!9832)

(assert (=> b!322040 (= lt!156355 lt!156357)))

(declare-fun res!176057 () Bool)

(assert (=> b!322040 (= res!176057 (= (seekEntryOrOpen!0 (select (arr!7799 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!2930 #b00000000000000000000000000000000)))))

(assert (=> b!322040 (=> (not res!176057) (not e!199417))))

(declare-fun b!322041 () Bool)

(assert (=> b!322041 (= e!199417 call!26071)))

(declare-fun d!69573 () Bool)

(declare-fun res!176058 () Bool)

(declare-fun e!199415 () Bool)

(assert (=> d!69573 (=> res!176058 e!199415)))

(assert (=> d!69573 (= res!176058 (bvsge #b00000000000000000000000000000000 (size!8151 a!3305)))))

(assert (=> d!69573 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!199415)))

(declare-fun b!322042 () Bool)

(assert (=> b!322042 (= e!199416 call!26071)))

(declare-fun b!322043 () Bool)

(assert (=> b!322043 (= e!199415 e!199416)))

(declare-fun c!50619 () Bool)

(assert (=> b!322043 (= c!50619 (validKeyInArray!0 (select (arr!7799 a!3305) #b00000000000000000000000000000000)))))

(assert (= (and d!69573 (not res!176058)) b!322043))

(assert (= (and b!322043 c!50619) b!322040))

(assert (= (and b!322043 (not c!50619)) b!322042))

(assert (= (and b!322040 res!176057) b!322041))

(assert (= (or b!322041 b!322042) bm!26068))

(declare-fun m!330021 () Bool)

(assert (=> bm!26068 m!330021))

(assert (=> b!322040 m!330007))

(declare-fun m!330023 () Bool)

(assert (=> b!322040 m!330023))

(declare-fun m!330025 () Bool)

(assert (=> b!322040 m!330025))

(assert (=> b!322040 m!330007))

(declare-fun m!330027 () Bool)

(assert (=> b!322040 m!330027))

(assert (=> b!322043 m!330007))

(assert (=> b!322043 m!330007))

(declare-fun m!330029 () Bool)

(assert (=> b!322043 m!330029))

(assert (=> b!321801 d!69573))

(declare-fun b!322068 () Bool)

(declare-fun e!199431 () SeekEntryResult!2930)

(declare-fun lt!156370 () SeekEntryResult!2930)

(assert (=> b!322068 (= e!199431 (MissingZero!2930 (index!13898 lt!156370)))))

(declare-fun b!322069 () Bool)

(declare-fun e!199430 () SeekEntryResult!2930)

(declare-fun e!199432 () SeekEntryResult!2930)

(assert (=> b!322069 (= e!199430 e!199432)))

(declare-fun lt!156371 () (_ BitVec 64))

(assert (=> b!322069 (= lt!156371 (select (arr!7799 a!3305) (index!13898 lt!156370)))))

(declare-fun c!50632 () Bool)

(assert (=> b!322069 (= c!50632 (= lt!156371 k!2497))))

(declare-fun b!322070 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16480 (_ BitVec 32)) SeekEntryResult!2930)

(assert (=> b!322070 (= e!199431 (seekKeyOrZeroReturnVacant!0 (x!32157 lt!156370) (index!13898 lt!156370) (index!13898 lt!156370) k!2497 a!3305 mask!3777))))

(declare-fun d!69579 () Bool)

(declare-fun lt!156372 () SeekEntryResult!2930)

(assert (=> d!69579 (and (or (is-Undefined!2930 lt!156372) (not (is-Found!2930 lt!156372)) (and (bvsge (index!13897 lt!156372) #b00000000000000000000000000000000) (bvslt (index!13897 lt!156372) (size!8151 a!3305)))) (or (is-Undefined!2930 lt!156372) (is-Found!2930 lt!156372) (not (is-MissingZero!2930 lt!156372)) (and (bvsge (index!13896 lt!156372) #b00000000000000000000000000000000) (bvslt (index!13896 lt!156372) (size!8151 a!3305)))) (or (is-Undefined!2930 lt!156372) (is-Found!2930 lt!156372) (is-MissingZero!2930 lt!156372) (not (is-MissingVacant!2930 lt!156372)) (and (bvsge (index!13899 lt!156372) #b00000000000000000000000000000000) (bvslt (index!13899 lt!156372) (size!8151 a!3305)))) (or (is-Undefined!2930 lt!156372) (ite (is-Found!2930 lt!156372) (= (select (arr!7799 a!3305) (index!13897 lt!156372)) k!2497) (ite (is-MissingZero!2930 lt!156372) (= (select (arr!7799 a!3305) (index!13896 lt!156372)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2930 lt!156372) (= (select (arr!7799 a!3305) (index!13899 lt!156372)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69579 (= lt!156372 e!199430)))

(declare-fun c!50634 () Bool)

(assert (=> d!69579 (= c!50634 (and (is-Intermediate!2930 lt!156370) (undefined!3742 lt!156370)))))

(assert (=> d!69579 (= lt!156370 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!69579 (validMask!0 mask!3777)))

(assert (=> d!69579 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!156372)))

(declare-fun b!322071 () Bool)

(assert (=> b!322071 (= e!199430 Undefined!2930)))

(declare-fun b!322072 () Bool)

(declare-fun c!50633 () Bool)

(assert (=> b!322072 (= c!50633 (= lt!156371 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!322072 (= e!199432 e!199431)))

(declare-fun b!322073 () Bool)

(assert (=> b!322073 (= e!199432 (Found!2930 (index!13898 lt!156370)))))

(assert (= (and d!69579 c!50634) b!322071))

(assert (= (and d!69579 (not c!50634)) b!322069))

(assert (= (and b!322069 c!50632) b!322073))

(assert (= (and b!322069 (not c!50632)) b!322072))

(assert (= (and b!322072 c!50633) b!322068))

(assert (= (and b!322072 (not c!50633)) b!322070))

(declare-fun m!330031 () Bool)

(assert (=> b!322069 m!330031))

(declare-fun m!330033 () Bool)

(assert (=> b!322070 m!330033))

(assert (=> d!69579 m!329871))

(assert (=> d!69579 m!329873))

(declare-fun m!330035 () Bool)

(assert (=> d!69579 m!330035))

(declare-fun m!330037 () Bool)

(assert (=> d!69579 m!330037))

(assert (=> d!69579 m!329883))

(assert (=> d!69579 m!329871))

(declare-fun m!330039 () Bool)

(assert (=> d!69579 m!330039))

(assert (=> b!321795 d!69579))

(declare-fun d!69581 () Bool)

(declare-fun lt!156375 () (_ BitVec 32))

(assert (=> d!69581 (and (bvsge lt!156375 #b00000000000000000000000000000000) (bvslt lt!156375 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69581 (= lt!156375 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!69581 (validMask!0 mask!3777)))

(assert (=> d!69581 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!156375)))

(declare-fun bs!11230 () Bool)

(assert (= bs!11230 d!69581))

(declare-fun m!330041 () Bool)

(assert (=> bs!11230 m!330041))

(assert (=> bs!11230 m!329883))

(assert (=> b!321794 d!69581))

(push 1)

