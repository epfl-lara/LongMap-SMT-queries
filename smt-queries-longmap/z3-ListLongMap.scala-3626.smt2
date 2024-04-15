; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49982 () Bool)

(assert start!49982)

(declare-fun b!547902 () Bool)

(declare-fun res!341458 () Bool)

(declare-fun e!316534 () Bool)

(assert (=> b!547902 (=> (not res!341458) (not e!316534))))

(declare-datatypes ((array!34573 0))(
  ( (array!34574 (arr!16607 (Array (_ BitVec 32) (_ BitVec 64))) (size!16972 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34573)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547902 (= res!341458 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547903 () Bool)

(declare-fun e!316536 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!249508 () (_ BitVec 32))

(assert (=> b!547903 (= e!316536 (and (bvsge mask!3119 #b00000000000000000000000000000000) (or (bvslt lt!249508 #b00000000000000000000000000000000) (bvsge lt!249508 (bvadd #b00000000000000000000000000000001 mask!3119)))))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!547903 (= lt!249508 (toIndex!0 (select (arr!16607 a!3118) j!142) mask!3119))))

(declare-fun res!341453 () Bool)

(assert (=> start!49982 (=> (not res!341453) (not e!316534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49982 (= res!341453 (validMask!0 mask!3119))))

(assert (=> start!49982 e!316534))

(assert (=> start!49982 true))

(declare-fun array_inv!12490 (array!34573) Bool)

(assert (=> start!49982 (array_inv!12490 a!3118)))

(declare-fun b!547904 () Bool)

(assert (=> b!547904 (= e!316534 e!316536)))

(declare-fun res!341457 () Bool)

(assert (=> b!547904 (=> (not res!341457) (not e!316536))))

(declare-datatypes ((SeekEntryResult!5053 0))(
  ( (MissingZero!5053 (index!22439 (_ BitVec 32))) (Found!5053 (index!22440 (_ BitVec 32))) (Intermediate!5053 (undefined!5865 Bool) (index!22441 (_ BitVec 32)) (x!51388 (_ BitVec 32))) (Undefined!5053) (MissingVacant!5053 (index!22442 (_ BitVec 32))) )
))
(declare-fun lt!249507 () SeekEntryResult!5053)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547904 (= res!341457 (or (= lt!249507 (MissingZero!5053 i!1132)) (= lt!249507 (MissingVacant!5053 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34573 (_ BitVec 32)) SeekEntryResult!5053)

(assert (=> b!547904 (= lt!249507 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!547905 () Bool)

(declare-fun res!341454 () Bool)

(assert (=> b!547905 (=> (not res!341454) (not e!316536))))

(declare-datatypes ((List!10726 0))(
  ( (Nil!10723) (Cons!10722 (h!11689 (_ BitVec 64)) (t!16945 List!10726)) )
))
(declare-fun arrayNoDuplicates!0 (array!34573 (_ BitVec 32) List!10726) Bool)

(assert (=> b!547905 (= res!341454 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10723))))

(declare-fun b!547906 () Bool)

(declare-fun res!341452 () Bool)

(assert (=> b!547906 (=> (not res!341452) (not e!316534))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547906 (= res!341452 (validKeyInArray!0 (select (arr!16607 a!3118) j!142)))))

(declare-fun b!547907 () Bool)

(declare-fun res!341459 () Bool)

(assert (=> b!547907 (=> (not res!341459) (not e!316534))))

(assert (=> b!547907 (= res!341459 (validKeyInArray!0 k0!1914))))

(declare-fun b!547908 () Bool)

(declare-fun res!341456 () Bool)

(assert (=> b!547908 (=> (not res!341456) (not e!316536))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34573 (_ BitVec 32)) Bool)

(assert (=> b!547908 (= res!341456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!547909 () Bool)

(declare-fun res!341455 () Bool)

(assert (=> b!547909 (=> (not res!341455) (not e!316534))))

(assert (=> b!547909 (= res!341455 (and (= (size!16972 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16972 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16972 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!49982 res!341453) b!547909))

(assert (= (and b!547909 res!341455) b!547906))

(assert (= (and b!547906 res!341452) b!547907))

(assert (= (and b!547907 res!341459) b!547902))

(assert (= (and b!547902 res!341458) b!547904))

(assert (= (and b!547904 res!341457) b!547908))

(assert (= (and b!547908 res!341456) b!547905))

(assert (= (and b!547905 res!341454) b!547903))

(declare-fun m!524495 () Bool)

(assert (=> b!547905 m!524495))

(declare-fun m!524497 () Bool)

(assert (=> b!547904 m!524497))

(declare-fun m!524499 () Bool)

(assert (=> b!547908 m!524499))

(declare-fun m!524501 () Bool)

(assert (=> b!547902 m!524501))

(declare-fun m!524503 () Bool)

(assert (=> start!49982 m!524503))

(declare-fun m!524505 () Bool)

(assert (=> start!49982 m!524505))

(declare-fun m!524507 () Bool)

(assert (=> b!547907 m!524507))

(declare-fun m!524509 () Bool)

(assert (=> b!547906 m!524509))

(assert (=> b!547906 m!524509))

(declare-fun m!524511 () Bool)

(assert (=> b!547906 m!524511))

(assert (=> b!547903 m!524509))

(assert (=> b!547903 m!524509))

(declare-fun m!524513 () Bool)

(assert (=> b!547903 m!524513))

(check-sat (not b!547907) (not b!547908) (not b!547902) (not b!547903) (not b!547906) (not start!49982) (not b!547904) (not b!547905))
(check-sat)
(get-model)

(declare-fun d!82403 () Bool)

(declare-fun res!341512 () Bool)

(declare-fun e!316559 () Bool)

(assert (=> d!82403 (=> res!341512 e!316559)))

(assert (=> d!82403 (= res!341512 (= (select (arr!16607 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!82403 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!316559)))

(declare-fun b!547962 () Bool)

(declare-fun e!316560 () Bool)

(assert (=> b!547962 (= e!316559 e!316560)))

(declare-fun res!341513 () Bool)

(assert (=> b!547962 (=> (not res!341513) (not e!316560))))

(assert (=> b!547962 (= res!341513 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16972 a!3118)))))

(declare-fun b!547963 () Bool)

(assert (=> b!547963 (= e!316560 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82403 (not res!341512)) b!547962))

(assert (= (and b!547962 res!341513) b!547963))

(declare-fun m!524555 () Bool)

(assert (=> d!82403 m!524555))

(declare-fun m!524557 () Bool)

(assert (=> b!547963 m!524557))

(assert (=> b!547902 d!82403))

(declare-fun d!82405 () Bool)

(assert (=> d!82405 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547907 d!82405))

(declare-fun d!82407 () Bool)

(declare-fun lt!249526 () (_ BitVec 32))

(declare-fun lt!249525 () (_ BitVec 32))

(assert (=> d!82407 (= lt!249526 (bvmul (bvxor lt!249525 (bvlshr lt!249525 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82407 (= lt!249525 ((_ extract 31 0) (bvand (bvxor (select (arr!16607 a!3118) j!142) (bvlshr (select (arr!16607 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82407 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!341514 (let ((h!11692 ((_ extract 31 0) (bvand (bvxor (select (arr!16607 a!3118) j!142) (bvlshr (select (arr!16607 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51391 (bvmul (bvxor h!11692 (bvlshr h!11692 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51391 (bvlshr x!51391 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!341514 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!341514 #b00000000000000000000000000000000))))))

(assert (=> d!82407 (= (toIndex!0 (select (arr!16607 a!3118) j!142) mask!3119) (bvand (bvxor lt!249526 (bvlshr lt!249526 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!547903 d!82407))

(declare-fun d!82411 () Bool)

(declare-fun res!341529 () Bool)

(declare-fun e!316580 () Bool)

(assert (=> d!82411 (=> res!341529 e!316580)))

(assert (=> d!82411 (= res!341529 (bvsge #b00000000000000000000000000000000 (size!16972 a!3118)))))

(assert (=> d!82411 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!316580)))

(declare-fun b!547986 () Bool)

(declare-fun e!316579 () Bool)

(declare-fun e!316581 () Bool)

(assert (=> b!547986 (= e!316579 e!316581)))

(declare-fun lt!249541 () (_ BitVec 64))

(assert (=> b!547986 (= lt!249541 (select (arr!16607 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16948 0))(
  ( (Unit!16949) )
))
(declare-fun lt!249540 () Unit!16948)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34573 (_ BitVec 64) (_ BitVec 32)) Unit!16948)

(assert (=> b!547986 (= lt!249540 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!249541 #b00000000000000000000000000000000))))

(assert (=> b!547986 (arrayContainsKey!0 a!3118 lt!249541 #b00000000000000000000000000000000)))

(declare-fun lt!249539 () Unit!16948)

(assert (=> b!547986 (= lt!249539 lt!249540)))

(declare-fun res!341530 () Bool)

(assert (=> b!547986 (= res!341530 (= (seekEntryOrOpen!0 (select (arr!16607 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5053 #b00000000000000000000000000000000)))))

(assert (=> b!547986 (=> (not res!341530) (not e!316581))))

(declare-fun bm!32169 () Bool)

(declare-fun call!32172 () Bool)

(assert (=> bm!32169 (= call!32172 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!547987 () Bool)

(assert (=> b!547987 (= e!316580 e!316579)))

(declare-fun c!63557 () Bool)

(assert (=> b!547987 (= c!63557 (validKeyInArray!0 (select (arr!16607 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!547988 () Bool)

(assert (=> b!547988 (= e!316579 call!32172)))

(declare-fun b!547989 () Bool)

(assert (=> b!547989 (= e!316581 call!32172)))

(assert (= (and d!82411 (not res!341529)) b!547987))

(assert (= (and b!547987 c!63557) b!547986))

(assert (= (and b!547987 (not c!63557)) b!547988))

(assert (= (and b!547986 res!341530) b!547989))

(assert (= (or b!547989 b!547988) bm!32169))

(assert (=> b!547986 m!524555))

(declare-fun m!524563 () Bool)

(assert (=> b!547986 m!524563))

(declare-fun m!524565 () Bool)

(assert (=> b!547986 m!524565))

(assert (=> b!547986 m!524555))

(declare-fun m!524567 () Bool)

(assert (=> b!547986 m!524567))

(declare-fun m!524569 () Bool)

(assert (=> bm!32169 m!524569))

(assert (=> b!547987 m!524555))

(assert (=> b!547987 m!524555))

(declare-fun m!524571 () Bool)

(assert (=> b!547987 m!524571))

(assert (=> b!547908 d!82411))

(declare-fun bm!32173 () Bool)

(declare-fun call!32176 () Bool)

(declare-fun c!63561 () Bool)

(assert (=> bm!32173 (= call!32176 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63561 (Cons!10722 (select (arr!16607 a!3118) #b00000000000000000000000000000000) Nil!10723) Nil!10723)))))

(declare-fun d!82417 () Bool)

(declare-fun res!341541 () Bool)

(declare-fun e!316594 () Bool)

(assert (=> d!82417 (=> res!341541 e!316594)))

(assert (=> d!82417 (= res!341541 (bvsge #b00000000000000000000000000000000 (size!16972 a!3118)))))

(assert (=> d!82417 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10723) e!316594)))

(declare-fun b!548004 () Bool)

(declare-fun e!316595 () Bool)

(assert (=> b!548004 (= e!316595 call!32176)))

(declare-fun b!548005 () Bool)

(declare-fun e!316593 () Bool)

(assert (=> b!548005 (= e!316593 e!316595)))

(assert (=> b!548005 (= c!63561 (validKeyInArray!0 (select (arr!16607 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!548006 () Bool)

(declare-fun e!316596 () Bool)

(declare-fun contains!2805 (List!10726 (_ BitVec 64)) Bool)

(assert (=> b!548006 (= e!316596 (contains!2805 Nil!10723 (select (arr!16607 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!548007 () Bool)

(assert (=> b!548007 (= e!316595 call!32176)))

(declare-fun b!548008 () Bool)

(assert (=> b!548008 (= e!316594 e!316593)))

(declare-fun res!341539 () Bool)

(assert (=> b!548008 (=> (not res!341539) (not e!316593))))

(assert (=> b!548008 (= res!341539 (not e!316596))))

(declare-fun res!341540 () Bool)

(assert (=> b!548008 (=> (not res!341540) (not e!316596))))

(assert (=> b!548008 (= res!341540 (validKeyInArray!0 (select (arr!16607 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!82417 (not res!341541)) b!548008))

(assert (= (and b!548008 res!341540) b!548006))

(assert (= (and b!548008 res!341539) b!548005))

(assert (= (and b!548005 c!63561) b!548007))

(assert (= (and b!548005 (not c!63561)) b!548004))

(assert (= (or b!548007 b!548004) bm!32173))

(assert (=> bm!32173 m!524555))

(declare-fun m!524583 () Bool)

(assert (=> bm!32173 m!524583))

(assert (=> b!548005 m!524555))

(assert (=> b!548005 m!524555))

(assert (=> b!548005 m!524571))

(assert (=> b!548006 m!524555))

(assert (=> b!548006 m!524555))

(declare-fun m!524585 () Bool)

(assert (=> b!548006 m!524585))

(assert (=> b!548008 m!524555))

(assert (=> b!548008 m!524555))

(assert (=> b!548008 m!524571))

(assert (=> b!547905 d!82417))

(declare-fun d!82421 () Bool)

(assert (=> d!82421 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!49982 d!82421))

(declare-fun d!82425 () Bool)

(assert (=> d!82425 (= (array_inv!12490 a!3118) (bvsge (size!16972 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!49982 d!82425))

(declare-fun b!548082 () Bool)

(declare-fun c!63589 () Bool)

(declare-fun lt!249583 () (_ BitVec 64))

(assert (=> b!548082 (= c!63589 (= lt!249583 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!316647 () SeekEntryResult!5053)

(declare-fun e!316646 () SeekEntryResult!5053)

(assert (=> b!548082 (= e!316647 e!316646)))

(declare-fun b!548083 () Bool)

(declare-fun e!316645 () SeekEntryResult!5053)

(assert (=> b!548083 (= e!316645 e!316647)))

(declare-fun lt!249581 () SeekEntryResult!5053)

(assert (=> b!548083 (= lt!249583 (select (arr!16607 a!3118) (index!22441 lt!249581)))))

(declare-fun c!63591 () Bool)

(assert (=> b!548083 (= c!63591 (= lt!249583 k0!1914))))

(declare-fun b!548084 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34573 (_ BitVec 32)) SeekEntryResult!5053)

(assert (=> b!548084 (= e!316646 (seekKeyOrZeroReturnVacant!0 (x!51388 lt!249581) (index!22441 lt!249581) (index!22441 lt!249581) k0!1914 a!3118 mask!3119))))

(declare-fun b!548085 () Bool)

(assert (=> b!548085 (= e!316646 (MissingZero!5053 (index!22441 lt!249581)))))

(declare-fun b!548086 () Bool)

(assert (=> b!548086 (= e!316647 (Found!5053 (index!22441 lt!249581)))))

(declare-fun d!82427 () Bool)

(declare-fun lt!249582 () SeekEntryResult!5053)

(get-info :version)

(assert (=> d!82427 (and (or ((_ is Undefined!5053) lt!249582) (not ((_ is Found!5053) lt!249582)) (and (bvsge (index!22440 lt!249582) #b00000000000000000000000000000000) (bvslt (index!22440 lt!249582) (size!16972 a!3118)))) (or ((_ is Undefined!5053) lt!249582) ((_ is Found!5053) lt!249582) (not ((_ is MissingZero!5053) lt!249582)) (and (bvsge (index!22439 lt!249582) #b00000000000000000000000000000000) (bvslt (index!22439 lt!249582) (size!16972 a!3118)))) (or ((_ is Undefined!5053) lt!249582) ((_ is Found!5053) lt!249582) ((_ is MissingZero!5053) lt!249582) (not ((_ is MissingVacant!5053) lt!249582)) (and (bvsge (index!22442 lt!249582) #b00000000000000000000000000000000) (bvslt (index!22442 lt!249582) (size!16972 a!3118)))) (or ((_ is Undefined!5053) lt!249582) (ite ((_ is Found!5053) lt!249582) (= (select (arr!16607 a!3118) (index!22440 lt!249582)) k0!1914) (ite ((_ is MissingZero!5053) lt!249582) (= (select (arr!16607 a!3118) (index!22439 lt!249582)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5053) lt!249582) (= (select (arr!16607 a!3118) (index!22442 lt!249582)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82427 (= lt!249582 e!316645)))

(declare-fun c!63590 () Bool)

(assert (=> d!82427 (= c!63590 (and ((_ is Intermediate!5053) lt!249581) (undefined!5865 lt!249581)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34573 (_ BitVec 32)) SeekEntryResult!5053)

(assert (=> d!82427 (= lt!249581 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!82427 (validMask!0 mask!3119)))

(assert (=> d!82427 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!249582)))

(declare-fun b!548087 () Bool)

(assert (=> b!548087 (= e!316645 Undefined!5053)))

(assert (= (and d!82427 c!63590) b!548087))

(assert (= (and d!82427 (not c!63590)) b!548083))

(assert (= (and b!548083 c!63591) b!548086))

(assert (= (and b!548083 (not c!63591)) b!548082))

(assert (= (and b!548082 c!63589) b!548085))

(assert (= (and b!548082 (not c!63589)) b!548084))

(declare-fun m!524623 () Bool)

(assert (=> b!548083 m!524623))

(declare-fun m!524625 () Bool)

(assert (=> b!548084 m!524625))

(declare-fun m!524627 () Bool)

(assert (=> d!82427 m!524627))

(declare-fun m!524629 () Bool)

(assert (=> d!82427 m!524629))

(declare-fun m!524631 () Bool)

(assert (=> d!82427 m!524631))

(declare-fun m!524633 () Bool)

(assert (=> d!82427 m!524633))

(declare-fun m!524635 () Bool)

(assert (=> d!82427 m!524635))

(assert (=> d!82427 m!524503))

(assert (=> d!82427 m!524627))

(assert (=> b!547904 d!82427))

(declare-fun d!82451 () Bool)

(assert (=> d!82451 (= (validKeyInArray!0 (select (arr!16607 a!3118) j!142)) (and (not (= (select (arr!16607 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16607 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547906 d!82451))

(check-sat (not b!547987) (not b!547986) (not b!547963) (not bm!32169) (not bm!32173) (not d!82427) (not b!548008) (not b!548006) (not b!548084) (not b!548005))
(check-sat)
