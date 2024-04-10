; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49928 () Bool)

(assert start!49928)

(declare-fun b!547732 () Bool)

(declare-fun res!341237 () Bool)

(declare-fun e!316492 () Bool)

(assert (=> b!547732 (=> (not res!341237) (not e!316492))))

(declare-datatypes ((array!34549 0))(
  ( (array!34550 (arr!16596 (Array (_ BitVec 32) (_ BitVec 64))) (size!16960 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34549)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547732 (= res!341237 (validKeyInArray!0 (select (arr!16596 a!3118) j!142)))))

(declare-fun res!341232 () Bool)

(assert (=> start!49928 (=> (not res!341232) (not e!316492))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49928 (= res!341232 (validMask!0 mask!3119))))

(assert (=> start!49928 e!316492))

(assert (=> start!49928 true))

(declare-fun array_inv!12392 (array!34549) Bool)

(assert (=> start!49928 (array_inv!12392 a!3118)))

(declare-fun b!547733 () Bool)

(declare-fun res!341231 () Bool)

(assert (=> b!547733 (=> (not res!341231) (not e!316492))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!547733 (= res!341231 (validKeyInArray!0 k!1914))))

(declare-fun b!547734 () Bool)

(declare-fun e!316493 () Bool)

(assert (=> b!547734 (= e!316493 (and (bvsge mask!3119 #b00000000000000000000000000000000) (bvsgt mask!3119 #b00111111111111111111111111111111)))))

(declare-fun b!547735 () Bool)

(declare-fun res!341235 () Bool)

(assert (=> b!547735 (=> (not res!341235) (not e!316493))))

(declare-datatypes ((List!10676 0))(
  ( (Nil!10673) (Cons!10672 (h!11639 (_ BitVec 64)) (t!16904 List!10676)) )
))
(declare-fun arrayNoDuplicates!0 (array!34549 (_ BitVec 32) List!10676) Bool)

(assert (=> b!547735 (= res!341235 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10673))))

(declare-fun b!547736 () Bool)

(declare-fun res!341236 () Bool)

(assert (=> b!547736 (=> (not res!341236) (not e!316492))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547736 (= res!341236 (and (= (size!16960 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16960 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16960 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547737 () Bool)

(assert (=> b!547737 (= e!316492 e!316493)))

(declare-fun res!341233 () Bool)

(assert (=> b!547737 (=> (not res!341233) (not e!316493))))

(declare-datatypes ((SeekEntryResult!5045 0))(
  ( (MissingZero!5045 (index!22407 (_ BitVec 32))) (Found!5045 (index!22408 (_ BitVec 32))) (Intermediate!5045 (undefined!5857 Bool) (index!22409 (_ BitVec 32)) (x!51353 (_ BitVec 32))) (Undefined!5045) (MissingVacant!5045 (index!22410 (_ BitVec 32))) )
))
(declare-fun lt!249622 () SeekEntryResult!5045)

(assert (=> b!547737 (= res!341233 (or (= lt!249622 (MissingZero!5045 i!1132)) (= lt!249622 (MissingVacant!5045 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34549 (_ BitVec 32)) SeekEntryResult!5045)

(assert (=> b!547737 (= lt!249622 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!547738 () Bool)

(declare-fun res!341234 () Bool)

(assert (=> b!547738 (=> (not res!341234) (not e!316492))))

(declare-fun arrayContainsKey!0 (array!34549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547738 (= res!341234 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547739 () Bool)

(declare-fun res!341230 () Bool)

(assert (=> b!547739 (=> (not res!341230) (not e!316493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34549 (_ BitVec 32)) Bool)

(assert (=> b!547739 (= res!341230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!49928 res!341232) b!547736))

(assert (= (and b!547736 res!341236) b!547732))

(assert (= (and b!547732 res!341237) b!547733))

(assert (= (and b!547733 res!341231) b!547738))

(assert (= (and b!547738 res!341234) b!547737))

(assert (= (and b!547737 res!341233) b!547739))

(assert (= (and b!547739 res!341230) b!547735))

(assert (= (and b!547735 res!341235) b!547734))

(declare-fun m!524937 () Bool)

(assert (=> b!547735 m!524937))

(declare-fun m!524939 () Bool)

(assert (=> b!547739 m!524939))

(declare-fun m!524941 () Bool)

(assert (=> b!547737 m!524941))

(declare-fun m!524943 () Bool)

(assert (=> b!547738 m!524943))

(declare-fun m!524945 () Bool)

(assert (=> start!49928 m!524945))

(declare-fun m!524947 () Bool)

(assert (=> start!49928 m!524947))

(declare-fun m!524949 () Bool)

(assert (=> b!547732 m!524949))

(assert (=> b!547732 m!524949))

(declare-fun m!524951 () Bool)

(assert (=> b!547732 m!524951))

(declare-fun m!524953 () Bool)

(assert (=> b!547733 m!524953))

(push 1)

(assert (not b!547735))

(assert (not start!49928))

(assert (not b!547737))

(assert (not b!547739))

(assert (not b!547732))

(assert (not b!547738))

(assert (not b!547733))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!547818 () Bool)

(declare-fun e!316530 () SeekEntryResult!5045)

(declare-fun e!316529 () SeekEntryResult!5045)

(assert (=> b!547818 (= e!316530 e!316529)))

(declare-fun lt!249646 () (_ BitVec 64))

(declare-fun lt!249645 () SeekEntryResult!5045)

(assert (=> b!547818 (= lt!249646 (select (arr!16596 a!3118) (index!22409 lt!249645)))))

(declare-fun c!63594 () Bool)

(assert (=> b!547818 (= c!63594 (= lt!249646 k!1914))))

(declare-fun b!547819 () Bool)

(assert (=> b!547819 (= e!316530 Undefined!5045)))

(declare-fun b!547820 () Bool)

(assert (=> b!547820 (= e!316529 (Found!5045 (index!22409 lt!249645)))))

(declare-fun e!316528 () SeekEntryResult!5045)

(declare-fun b!547821 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34549 (_ BitVec 32)) SeekEntryResult!5045)

(assert (=> b!547821 (= e!316528 (seekKeyOrZeroReturnVacant!0 (x!51353 lt!249645) (index!22409 lt!249645) (index!22409 lt!249645) k!1914 a!3118 mask!3119))))

(declare-fun b!547822 () Bool)

(assert (=> b!547822 (= e!316528 (MissingZero!5045 (index!22409 lt!249645)))))

(declare-fun b!547823 () Bool)

(declare-fun c!63595 () Bool)

(assert (=> b!547823 (= c!63595 (= lt!249646 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!547823 (= e!316529 e!316528)))

(declare-fun d!82557 () Bool)

(declare-fun lt!249644 () SeekEntryResult!5045)

(assert (=> d!82557 (and (or (is-Undefined!5045 lt!249644) (not (is-Found!5045 lt!249644)) (and (bvsge (index!22408 lt!249644) #b00000000000000000000000000000000) (bvslt (index!22408 lt!249644) (size!16960 a!3118)))) (or (is-Undefined!5045 lt!249644) (is-Found!5045 lt!249644) (not (is-MissingZero!5045 lt!249644)) (and (bvsge (index!22407 lt!249644) #b00000000000000000000000000000000) (bvslt (index!22407 lt!249644) (size!16960 a!3118)))) (or (is-Undefined!5045 lt!249644) (is-Found!5045 lt!249644) (is-MissingZero!5045 lt!249644) (not (is-MissingVacant!5045 lt!249644)) (and (bvsge (index!22410 lt!249644) #b00000000000000000000000000000000) (bvslt (index!22410 lt!249644) (size!16960 a!3118)))) (or (is-Undefined!5045 lt!249644) (ite (is-Found!5045 lt!249644) (= (select (arr!16596 a!3118) (index!22408 lt!249644)) k!1914) (ite (is-MissingZero!5045 lt!249644) (= (select (arr!16596 a!3118) (index!22407 lt!249644)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5045 lt!249644) (= (select (arr!16596 a!3118) (index!22410 lt!249644)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82557 (= lt!249644 e!316530)))

(declare-fun c!63596 () Bool)

(assert (=> d!82557 (= c!63596 (and (is-Intermediate!5045 lt!249645) (undefined!5857 lt!249645)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34549 (_ BitVec 32)) SeekEntryResult!5045)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82557 (= lt!249645 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!82557 (validMask!0 mask!3119)))

(assert (=> d!82557 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!249644)))

(assert (= (and d!82557 c!63596) b!547819))

(assert (= (and d!82557 (not c!63596)) b!547818))

(assert (= (and b!547818 c!63594) b!547820))

(assert (= (and b!547818 (not c!63594)) b!547823))

(assert (= (and b!547823 c!63595) b!547822))

(assert (= (and b!547823 (not c!63595)) b!547821))

(declare-fun m!525003 () Bool)

(assert (=> b!547818 m!525003))

(declare-fun m!525007 () Bool)

(assert (=> b!547821 m!525007))

(declare-fun m!525009 () Bool)

(assert (=> d!82557 m!525009))

(assert (=> d!82557 m!524945))

(declare-fun m!525011 () Bool)

(assert (=> d!82557 m!525011))

(declare-fun m!525013 () Bool)

(assert (=> d!82557 m!525013))

(declare-fun m!525015 () Bool)

(assert (=> d!82557 m!525015))

(assert (=> d!82557 m!525013))

(declare-fun m!525017 () Bool)

(assert (=> d!82557 m!525017))

(assert (=> b!547737 d!82557))

(declare-fun d!82563 () Bool)

(assert (=> d!82563 (= (validKeyInArray!0 (select (arr!16596 a!3118) j!142)) (and (not (= (select (arr!16596 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16596 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547732 d!82563))

(declare-fun bm!32176 () Bool)

(declare-fun call!32179 () Bool)

(declare-fun c!63607 () Bool)

(assert (=> bm!32176 (= call!32179 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63607 (Cons!10672 (select (arr!16596 a!3118) #b00000000000000000000000000000000) Nil!10673) Nil!10673)))))

(declare-fun b!547856 () Bool)

(declare-fun e!316556 () Bool)

(assert (=> b!547856 (= e!316556 call!32179)))

(declare-fun b!547857 () Bool)

(declare-fun e!316555 () Bool)

(declare-fun e!316553 () Bool)

(assert (=> b!547857 (= e!316555 e!316553)))

(declare-fun res!341299 () Bool)

(assert (=> b!547857 (=> (not res!341299) (not e!316553))))

(declare-fun e!316554 () Bool)

(assert (=> b!547857 (= res!341299 (not e!316554))))

(declare-fun res!341298 () Bool)

(assert (=> b!547857 (=> (not res!341298) (not e!316554))))

(assert (=> b!547857 (= res!341298 (validKeyInArray!0 (select (arr!16596 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!547858 () Bool)

(assert (=> b!547858 (= e!316553 e!316556)))

(assert (=> b!547858 (= c!63607 (validKeyInArray!0 (select (arr!16596 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!547859 () Bool)

(declare-fun contains!2822 (List!10676 (_ BitVec 64)) Bool)

(assert (=> b!547859 (= e!316554 (contains!2822 Nil!10673 (select (arr!16596 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!82565 () Bool)

(declare-fun res!341300 () Bool)

(assert (=> d!82565 (=> res!341300 e!316555)))

(assert (=> d!82565 (= res!341300 (bvsge #b00000000000000000000000000000000 (size!16960 a!3118)))))

(assert (=> d!82565 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10673) e!316555)))

(declare-fun b!547860 () Bool)

(assert (=> b!547860 (= e!316556 call!32179)))

(assert (= (and d!82565 (not res!341300)) b!547857))

(assert (= (and b!547857 res!341298) b!547859))

(assert (= (and b!547857 res!341299) b!547858))

(assert (= (and b!547858 c!63607) b!547856))

(assert (= (and b!547858 (not c!63607)) b!547860))

(assert (= (or b!547856 b!547860) bm!32176))

(declare-fun m!525019 () Bool)

(assert (=> bm!32176 m!525019))

(declare-fun m!525021 () Bool)

(assert (=> bm!32176 m!525021))

(assert (=> b!547857 m!525019))

(assert (=> b!547857 m!525019))

(declare-fun m!525023 () Bool)

(assert (=> b!547857 m!525023))

(assert (=> b!547858 m!525019))

(assert (=> b!547858 m!525019))

(assert (=> b!547858 m!525023))

(assert (=> b!547859 m!525019))

(assert (=> b!547859 m!525019))

(declare-fun m!525025 () Bool)

(assert (=> b!547859 m!525025))

(assert (=> b!547735 d!82565))

(declare-fun b!547890 () Bool)

(declare-fun e!316582 () Bool)

(declare-fun call!32183 () Bool)

(assert (=> b!547890 (= e!316582 call!32183)))

(declare-fun d!82569 () Bool)

(declare-fun res!341319 () Bool)

(declare-fun e!316580 () Bool)

(assert (=> d!82569 (=> res!341319 e!316580)))

(assert (=> d!82569 (= res!341319 (bvsge #b00000000000000000000000000000000 (size!16960 a!3118)))))

(assert (=> d!82569 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!316580)))

(declare-fun b!547891 () Bool)

(declare-fun e!316581 () Bool)

(assert (=> b!547891 (= e!316581 call!32183)))

(declare-fun b!547892 () Bool)

(assert (=> b!547892 (= e!316582 e!316581)))

(declare-fun lt!249663 () (_ BitVec 64))

(assert (=> b!547892 (= lt!249663 (select (arr!16596 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16962 0))(
  ( (Unit!16963) )
))
(declare-fun lt!249664 () Unit!16962)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34549 (_ BitVec 64) (_ BitVec 32)) Unit!16962)

(assert (=> b!547892 (= lt!249664 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!249663 #b00000000000000000000000000000000))))

(assert (=> b!547892 (arrayContainsKey!0 a!3118 lt!249663 #b00000000000000000000000000000000)))

(declare-fun lt!249662 () Unit!16962)

(assert (=> b!547892 (= lt!249662 lt!249664)))

(declare-fun res!341318 () Bool)

(assert (=> b!547892 (= res!341318 (= (seekEntryOrOpen!0 (select (arr!16596 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5045 #b00000000000000000000000000000000)))))

(assert (=> b!547892 (=> (not res!341318) (not e!316581))))

(declare-fun b!547893 () Bool)

(assert (=> b!547893 (= e!316580 e!316582)))

(declare-fun c!63614 () Bool)

(assert (=> b!547893 (= c!63614 (validKeyInArray!0 (select (arr!16596 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32180 () Bool)

(assert (=> bm!32180 (= call!32183 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!82569 (not res!341319)) b!547893))

(assert (= (and b!547893 c!63614) b!547892))

(assert (= (and b!547893 (not c!63614)) b!547890))

(assert (= (and b!547892 res!341318) b!547891))

(assert (= (or b!547891 b!547890) bm!32180))

(assert (=> b!547892 m!525019))

(declare-fun m!525051 () Bool)

(assert (=> b!547892 m!525051))

(declare-fun m!525053 () Bool)

(assert (=> b!547892 m!525053))

(assert (=> b!547892 m!525019))

(declare-fun m!525055 () Bool)

(assert (=> b!547892 m!525055))

(assert (=> b!547893 m!525019))

(assert (=> b!547893 m!525019))

(assert (=> b!547893 m!525023))

(declare-fun m!525057 () Bool)

(assert (=> bm!32180 m!525057))

(assert (=> b!547739 d!82569))

(declare-fun d!82579 () Bool)

(assert (=> d!82579 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!49928 d!82579))

(declare-fun d!82585 () Bool)

(assert (=> d!82585 (= (array_inv!12392 a!3118) (bvsge (size!16960 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!49928 d!82585))

(declare-fun d!82587 () Bool)

(declare-fun res!341326 () Bool)

(declare-fun e!316589 () Bool)

(assert (=> d!82587 (=> res!341326 e!316589)))

(assert (=> d!82587 (= res!341326 (= (select (arr!16596 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!82587 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!316589)))

(declare-fun b!547900 () Bool)

(declare-fun e!316590 () Bool)

(assert (=> b!547900 (= e!316589 e!316590)))

(declare-fun res!341327 () Bool)

(assert (=> b!547900 (=> (not res!341327) (not e!316590))))

(assert (=> b!547900 (= res!341327 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16960 a!3118)))))

(declare-fun b!547901 () Bool)

(assert (=> b!547901 (= e!316590 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82587 (not res!341326)) b!547900))

(assert (= (and b!547900 res!341327) b!547901))

(assert (=> d!82587 m!525019))

(declare-fun m!525063 () Bool)

(assert (=> b!547901 m!525063))

(assert (=> b!547738 d!82587))

(declare-fun d!82589 () Bool)

(assert (=> d!82589 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547733 d!82589))

(push 1)

(assert (not bm!32176))

(assert (not b!547892))

(assert (not b!547859))

(assert (not b!547858))

(assert (not d!82557))

(assert (not b!547893))

(assert (not b!547901))

(assert (not bm!32180))

(assert (not b!547821))

(assert (not b!547857))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

