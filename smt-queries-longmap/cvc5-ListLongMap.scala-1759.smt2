; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32152 () Bool)

(assert start!32152)

(declare-fun b!320438 () Bool)

(declare-fun res!174686 () Bool)

(declare-fun e!198813 () Bool)

(assert (=> b!320438 (=> (not res!174686) (not e!198813))))

(declare-datatypes ((array!16387 0))(
  ( (array!16388 (arr!7754 (Array (_ BitVec 32) (_ BitVec 64))) (size!8106 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16387)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320438 (= res!174686 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320439 () Bool)

(declare-fun res!174682 () Bool)

(assert (=> b!320439 (=> (not res!174682) (not e!198813))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320439 (= res!174682 (validKeyInArray!0 k!2497))))

(declare-fun res!174685 () Bool)

(assert (=> start!32152 (=> (not res!174685) (not e!198813))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32152 (= res!174685 (validMask!0 mask!3777))))

(assert (=> start!32152 e!198813))

(declare-fun array_inv!5717 (array!16387) Bool)

(assert (=> start!32152 (array_inv!5717 a!3305)))

(assert (=> start!32152 true))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun b!320440 () Bool)

(assert (=> b!320440 (= e!198813 (and (= (select (arr!7754 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8106 a!3305)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(declare-fun b!320441 () Bool)

(declare-fun res!174687 () Bool)

(assert (=> b!320441 (=> (not res!174687) (not e!198813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16387 (_ BitVec 32)) Bool)

(assert (=> b!320441 (= res!174687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320442 () Bool)

(declare-fun res!174684 () Bool)

(assert (=> b!320442 (=> (not res!174684) (not e!198813))))

(assert (=> b!320442 (= res!174684 (and (= (size!8106 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8106 a!3305))))))

(declare-fun b!320443 () Bool)

(declare-fun res!174681 () Bool)

(assert (=> b!320443 (=> (not res!174681) (not e!198813))))

(declare-datatypes ((SeekEntryResult!2885 0))(
  ( (MissingZero!2885 (index!13716 (_ BitVec 32))) (Found!2885 (index!13717 (_ BitVec 32))) (Intermediate!2885 (undefined!3697 Bool) (index!13718 (_ BitVec 32)) (x!31986 (_ BitVec 32))) (Undefined!2885) (MissingVacant!2885 (index!13719 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16387 (_ BitVec 32)) SeekEntryResult!2885)

(assert (=> b!320443 (= res!174681 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2885 i!1250)))))

(declare-fun b!320444 () Bool)

(declare-fun res!174683 () Bool)

(assert (=> b!320444 (=> (not res!174683) (not e!198813))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16387 (_ BitVec 32)) SeekEntryResult!2885)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320444 (= res!174683 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2885 false resIndex!58 resX!58)))))

(assert (= (and start!32152 res!174685) b!320442))

(assert (= (and b!320442 res!174684) b!320439))

(assert (= (and b!320439 res!174682) b!320438))

(assert (= (and b!320438 res!174686) b!320443))

(assert (= (and b!320443 res!174681) b!320441))

(assert (= (and b!320441 res!174687) b!320444))

(assert (= (and b!320444 res!174683) b!320440))

(declare-fun m!328817 () Bool)

(assert (=> start!32152 m!328817))

(declare-fun m!328819 () Bool)

(assert (=> start!32152 m!328819))

(declare-fun m!328821 () Bool)

(assert (=> b!320438 m!328821))

(declare-fun m!328823 () Bool)

(assert (=> b!320444 m!328823))

(assert (=> b!320444 m!328823))

(declare-fun m!328825 () Bool)

(assert (=> b!320444 m!328825))

(declare-fun m!328827 () Bool)

(assert (=> b!320439 m!328827))

(declare-fun m!328829 () Bool)

(assert (=> b!320440 m!328829))

(declare-fun m!328831 () Bool)

(assert (=> b!320443 m!328831))

(declare-fun m!328833 () Bool)

(assert (=> b!320441 m!328833))

(push 1)

(assert (not b!320444))

(assert (not b!320443))

(assert (not start!32152))

(assert (not b!320438))

(assert (not b!320441))

(assert (not b!320439))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!320517 () Bool)

(declare-fun c!50512 () Bool)

(declare-fun lt!156029 () (_ BitVec 64))

(assert (=> b!320517 (= c!50512 (= lt!156029 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!198850 () SeekEntryResult!2885)

(declare-fun e!198848 () SeekEntryResult!2885)

(assert (=> b!320517 (= e!198850 e!198848)))

(declare-fun b!320518 () Bool)

(declare-fun lt!156030 () SeekEntryResult!2885)

(assert (=> b!320518 (= e!198850 (Found!2885 (index!13718 lt!156030)))))

(declare-fun d!69445 () Bool)

(declare-fun lt!156028 () SeekEntryResult!2885)

(assert (=> d!69445 (and (or (is-Undefined!2885 lt!156028) (not (is-Found!2885 lt!156028)) (and (bvsge (index!13717 lt!156028) #b00000000000000000000000000000000) (bvslt (index!13717 lt!156028) (size!8106 a!3305)))) (or (is-Undefined!2885 lt!156028) (is-Found!2885 lt!156028) (not (is-MissingZero!2885 lt!156028)) (and (bvsge (index!13716 lt!156028) #b00000000000000000000000000000000) (bvslt (index!13716 lt!156028) (size!8106 a!3305)))) (or (is-Undefined!2885 lt!156028) (is-Found!2885 lt!156028) (is-MissingZero!2885 lt!156028) (not (is-MissingVacant!2885 lt!156028)) (and (bvsge (index!13719 lt!156028) #b00000000000000000000000000000000) (bvslt (index!13719 lt!156028) (size!8106 a!3305)))) (or (is-Undefined!2885 lt!156028) (ite (is-Found!2885 lt!156028) (= (select (arr!7754 a!3305) (index!13717 lt!156028)) k!2497) (ite (is-MissingZero!2885 lt!156028) (= (select (arr!7754 a!3305) (index!13716 lt!156028)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2885 lt!156028) (= (select (arr!7754 a!3305) (index!13719 lt!156028)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!198849 () SeekEntryResult!2885)

(assert (=> d!69445 (= lt!156028 e!198849)))

(declare-fun c!50514 () Bool)

(assert (=> d!69445 (= c!50514 (and (is-Intermediate!2885 lt!156030) (undefined!3697 lt!156030)))))

(assert (=> d!69445 (= lt!156030 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!69445 (validMask!0 mask!3777)))

(assert (=> d!69445 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!156028)))

(declare-fun b!320519 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16387 (_ BitVec 32)) SeekEntryResult!2885)

(assert (=> b!320519 (= e!198848 (seekKeyOrZeroReturnVacant!0 (x!31986 lt!156030) (index!13718 lt!156030) (index!13718 lt!156030) k!2497 a!3305 mask!3777))))

(declare-fun b!320520 () Bool)

(assert (=> b!320520 (= e!198849 e!198850)))

(assert (=> b!320520 (= lt!156029 (select (arr!7754 a!3305) (index!13718 lt!156030)))))

(declare-fun c!50513 () Bool)

(assert (=> b!320520 (= c!50513 (= lt!156029 k!2497))))

(declare-fun b!320521 () Bool)

(assert (=> b!320521 (= e!198849 Undefined!2885)))

(declare-fun b!320522 () Bool)

(assert (=> b!320522 (= e!198848 (MissingZero!2885 (index!13718 lt!156030)))))

(assert (= (and d!69445 c!50514) b!320521))

(assert (= (and d!69445 (not c!50514)) b!320520))

(assert (= (and b!320520 c!50513) b!320518))

(assert (= (and b!320520 (not c!50513)) b!320517))

(assert (= (and b!320517 c!50512) b!320522))

(assert (= (and b!320517 (not c!50512)) b!320519))

(declare-fun m!328887 () Bool)

(assert (=> d!69445 m!328887))

(declare-fun m!328889 () Bool)

(assert (=> d!69445 m!328889))

(assert (=> d!69445 m!328817))

(assert (=> d!69445 m!328823))

(declare-fun m!328891 () Bool)

(assert (=> d!69445 m!328891))

(assert (=> d!69445 m!328823))

(assert (=> d!69445 m!328825))

(declare-fun m!328893 () Bool)

(assert (=> b!320519 m!328893))

(declare-fun m!328895 () Bool)

(assert (=> b!320520 m!328895))

(assert (=> b!320443 d!69445))

(declare-fun b!320561 () Bool)

(declare-fun e!198873 () Bool)

(declare-fun call!26059 () Bool)

(assert (=> b!320561 (= e!198873 call!26059)))

(declare-fun b!320563 () Bool)

(declare-fun e!198874 () Bool)

(assert (=> b!320563 (= e!198874 e!198873)))

(declare-fun lt!156047 () (_ BitVec 64))

(assert (=> b!320563 (= lt!156047 (select (arr!7754 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9826 0))(
  ( (Unit!9827) )
))
(declare-fun lt!156049 () Unit!9826)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16387 (_ BitVec 64) (_ BitVec 32)) Unit!9826)

(assert (=> b!320563 (= lt!156049 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!156047 #b00000000000000000000000000000000))))

(assert (=> b!320563 (arrayContainsKey!0 a!3305 lt!156047 #b00000000000000000000000000000000)))

(declare-fun lt!156048 () Unit!9826)

(assert (=> b!320563 (= lt!156048 lt!156049)))

(declare-fun res!174753 () Bool)

(assert (=> b!320563 (= res!174753 (= (seekEntryOrOpen!0 (select (arr!7754 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!2885 #b00000000000000000000000000000000)))))

(assert (=> b!320563 (=> (not res!174753) (not e!198873))))

(declare-fun b!320564 () Bool)

(declare-fun e!198875 () Bool)

(assert (=> b!320564 (= e!198875 e!198874)))

(declare-fun c!50529 () Bool)

(assert (=> b!320564 (= c!50529 (validKeyInArray!0 (select (arr!7754 a!3305) #b00000000000000000000000000000000)))))

(declare-fun bm!26056 () Bool)

(assert (=> bm!26056 (= call!26059 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!320562 () Bool)

(assert (=> b!320562 (= e!198874 call!26059)))

(declare-fun d!69455 () Bool)

(declare-fun res!174752 () Bool)

(assert (=> d!69455 (=> res!174752 e!198875)))

(assert (=> d!69455 (= res!174752 (bvsge #b00000000000000000000000000000000 (size!8106 a!3305)))))

(assert (=> d!69455 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!198875)))

(assert (= (and d!69455 (not res!174752)) b!320564))

(assert (= (and b!320564 c!50529) b!320563))

(assert (= (and b!320564 (not c!50529)) b!320562))

(assert (= (and b!320563 res!174753) b!320561))

(assert (= (or b!320561 b!320562) bm!26056))

(declare-fun m!328897 () Bool)

(assert (=> b!320563 m!328897))

(declare-fun m!328899 () Bool)

(assert (=> b!320563 m!328899))

(declare-fun m!328901 () Bool)

(assert (=> b!320563 m!328901))

(assert (=> b!320563 m!328897))

(declare-fun m!328903 () Bool)

(assert (=> b!320563 m!328903))

(assert (=> b!320564 m!328897))

(assert (=> b!320564 m!328897))

(declare-fun m!328905 () Bool)

(assert (=> b!320564 m!328905))

(declare-fun m!328907 () Bool)

(assert (=> bm!26056 m!328907))

(assert (=> b!320441 d!69455))

(declare-fun b!320610 () Bool)

(declare-fun lt!156074 () SeekEntryResult!2885)

(assert (=> b!320610 (and (bvsge (index!13718 lt!156074) #b00000000000000000000000000000000) (bvslt (index!13718 lt!156074) (size!8106 a!3305)))))

(declare-fun res!174770 () Bool)

(assert (=> b!320610 (= res!174770 (= (select (arr!7754 a!3305) (index!13718 lt!156074)) k!2497))))

(declare-fun e!198907 () Bool)

(assert (=> b!320610 (=> res!174770 e!198907)))

(declare-fun e!198903 () Bool)

(assert (=> b!320610 (= e!198903 e!198907)))

(declare-fun d!69457 () Bool)

(declare-fun e!198904 () Bool)

(assert (=> d!69457 e!198904))

(declare-fun c!50545 () Bool)

(assert (=> d!69457 (= c!50545 (and (is-Intermediate!2885 lt!156074) (undefined!3697 lt!156074)))))

(declare-fun e!198905 () SeekEntryResult!2885)

(assert (=> d!69457 (= lt!156074 e!198905)))

(declare-fun c!50546 () Bool)

(assert (=> d!69457 (= c!50546 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!156075 () (_ BitVec 64))

(assert (=> d!69457 (= lt!156075 (select (arr!7754 a!3305) (toIndex!0 k!2497 mask!3777)))))

(assert (=> d!69457 (validMask!0 mask!3777)))

(assert (=> d!69457 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156074)))

(declare-fun b!320611 () Bool)

(declare-fun e!198906 () SeekEntryResult!2885)

(assert (=> b!320611 (= e!198906 (Intermediate!2885 false (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!320612 () Bool)

(assert (=> b!320612 (= e!198904 e!198903)))

(declare-fun res!174772 () Bool)

(assert (=> b!320612 (= res!174772 (and (is-Intermediate!2885 lt!156074) (not (undefined!3697 lt!156074)) (bvslt (x!31986 lt!156074) #b01111111111111111111111111111110) (bvsge (x!31986 lt!156074) #b00000000000000000000000000000000) (bvsge (x!31986 lt!156074) #b00000000000000000000000000000000)))))

(assert (=> b!320612 (=> (not res!174772) (not e!198903))))

(declare-fun b!320613 () Bool)

(assert (=> b!320613 (and (bvsge (index!13718 lt!156074) #b00000000000000000000000000000000) (bvslt (index!13718 lt!156074) (size!8106 a!3305)))))

(declare-fun res!174771 () Bool)

(assert (=> b!320613 (= res!174771 (= (select (arr!7754 a!3305) (index!13718 lt!156074)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!320613 (=> res!174771 e!198907)))

(declare-fun b!320614 () Bool)

(assert (=> b!320614 (and (bvsge (index!13718 lt!156074) #b00000000000000000000000000000000) (bvslt (index!13718 lt!156074) (size!8106 a!3305)))))

(assert (=> b!320614 (= e!198907 (= (select (arr!7754 a!3305) (index!13718 lt!156074)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!320615 () Bool)

(assert (=> b!320615 (= e!198905 e!198906)))

(declare-fun c!50547 () Bool)

(assert (=> b!320615 (= c!50547 (or (= lt!156075 k!2497) (= (bvadd lt!156075 lt!156075) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!320616 () Bool)

(assert (=> b!320616 (= e!198904 (bvsge (x!31986 lt!156074) #b01111111111111111111111111111110))))

(declare-fun b!320617 () Bool)

(assert (=> b!320617 (= e!198905 (Intermediate!2885 true (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!320618 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320618 (= e!198906 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k!2497 a!3305 mask!3777))))

(assert (= (and d!69457 c!50546) b!320617))

(assert (= (and d!69457 (not c!50546)) b!320615))

(assert (= (and b!320615 c!50547) b!320611))

(assert (= (and b!320615 (not c!50547)) b!320618))

(assert (= (and d!69457 c!50545) b!320616))

(assert (= (and d!69457 (not c!50545)) b!320612))

(assert (= (and b!320612 res!174772) b!320610))

(assert (= (and b!320610 (not res!174770)) b!320613))

(assert (= (and b!320613 (not res!174771)) b!320614))

(assert (=> d!69457 m!328823))

(declare-fun m!328937 () Bool)

(assert (=> d!69457 m!328937))

(assert (=> d!69457 m!328817))

(declare-fun m!328939 () Bool)

(assert (=> b!320610 m!328939))

(assert (=> b!320613 m!328939))

(assert (=> b!320618 m!328823))

(declare-fun m!328941 () Bool)

(assert (=> b!320618 m!328941))

(assert (=> b!320618 m!328941))

(declare-fun m!328943 () Bool)

(assert (=> b!320618 m!328943))

(assert (=> b!320614 m!328939))

(assert (=> b!320444 d!69457))

(declare-fun d!69467 () Bool)

(declare-fun lt!156087 () (_ BitVec 32))

(declare-fun lt!156086 () (_ BitVec 32))

(assert (=> d!69467 (= lt!156087 (bvmul (bvxor lt!156086 (bvlshr lt!156086 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69467 (= lt!156086 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69467 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!174773 (let ((h!5386 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31992 (bvmul (bvxor h!5386 (bvlshr h!5386 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31992 (bvlshr x!31992 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!174773 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!174773 #b00000000000000000000000000000000))))))

(assert (=> d!69467 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!156087 (bvlshr lt!156087 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!320444 d!69467))

(declare-fun d!69469 () Bool)

(assert (=> d!69469 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32152 d!69469))

(declare-fun d!69477 () Bool)

(assert (=> d!69477 (= (array_inv!5717 a!3305) (bvsge (size!8106 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32152 d!69477))

(declare-fun d!69479 () Bool)

(assert (=> d!69479 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!320439 d!69479))

(declare-fun d!69481 () Bool)

(declare-fun res!174790 () Bool)

(declare-fun e!198937 () Bool)

(assert (=> d!69481 (=> res!174790 e!198937)))

(assert (=> d!69481 (= res!174790 (= (select (arr!7754 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!69481 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!198937)))

(declare-fun b!320665 () Bool)

(declare-fun e!198938 () Bool)

(assert (=> b!320665 (= e!198937 e!198938)))

(declare-fun res!174791 () Bool)

(assert (=> b!320665 (=> (not res!174791) (not e!198938))))

(assert (=> b!320665 (= res!174791 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8106 a!3305)))))

(declare-fun b!320666 () Bool)

(assert (=> b!320666 (= e!198938 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69481 (not res!174790)) b!320665))

(assert (= (and b!320665 res!174791) b!320666))

(assert (=> d!69481 m!328897))

(declare-fun m!328957 () Bool)

(assert (=> b!320666 m!328957))

(assert (=> b!320438 d!69481))

(push 1)

(assert (not b!320564))

(assert (not b!320666))

(assert (not b!320519))

(assert (not b!320563))

(assert (not bm!26056))

(assert (not d!69445))

(assert (not b!320618))

(assert (not d!69457))

(check-sat)

(pop 1)

(push 1)

(check-sat)

