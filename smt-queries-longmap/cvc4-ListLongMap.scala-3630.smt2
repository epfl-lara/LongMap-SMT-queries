; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50070 () Bool)

(assert start!50070)

(declare-fun b!548662 () Bool)

(declare-fun res!341987 () Bool)

(declare-fun e!316943 () Bool)

(assert (=> b!548662 (=> (not res!341987) (not e!316943))))

(declare-datatypes ((array!34607 0))(
  ( (array!34608 (arr!16622 (Array (_ BitVec 32) (_ BitVec 64))) (size!16986 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34607)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548662 (= res!341987 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548663 () Bool)

(declare-fun res!341989 () Bool)

(assert (=> b!548663 (=> (not res!341989) (not e!316943))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548663 (= res!341989 (validKeyInArray!0 (select (arr!16622 a!3118) j!142)))))

(declare-fun b!548664 () Bool)

(declare-fun res!341986 () Bool)

(declare-fun e!316944 () Bool)

(assert (=> b!548664 (=> (not res!341986) (not e!316944))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34607 (_ BitVec 32)) Bool)

(assert (=> b!548664 (= res!341986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548665 () Bool)

(assert (=> b!548665 (= e!316943 e!316944)))

(declare-fun res!341988 () Bool)

(assert (=> b!548665 (=> (not res!341988) (not e!316944))))

(declare-datatypes ((SeekEntryResult!5071 0))(
  ( (MissingZero!5071 (index!22511 (_ BitVec 32))) (Found!5071 (index!22512 (_ BitVec 32))) (Intermediate!5071 (undefined!5883 Bool) (index!22513 (_ BitVec 32)) (x!51446 (_ BitVec 32))) (Undefined!5071) (MissingVacant!5071 (index!22514 (_ BitVec 32))) )
))
(declare-fun lt!249880 () SeekEntryResult!5071)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548665 (= res!341988 (or (= lt!249880 (MissingZero!5071 i!1132)) (= lt!249880 (MissingVacant!5071 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34607 (_ BitVec 32)) SeekEntryResult!5071)

(assert (=> b!548665 (= lt!249880 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!548666 () Bool)

(declare-fun res!341985 () Bool)

(assert (=> b!548666 (=> (not res!341985) (not e!316944))))

(declare-datatypes ((List!10702 0))(
  ( (Nil!10699) (Cons!10698 (h!11668 (_ BitVec 64)) (t!16930 List!10702)) )
))
(declare-fun arrayNoDuplicates!0 (array!34607 (_ BitVec 32) List!10702) Bool)

(assert (=> b!548666 (= res!341985 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10699))))

(declare-fun b!548667 () Bool)

(declare-fun res!341990 () Bool)

(assert (=> b!548667 (=> (not res!341990) (not e!316943))))

(assert (=> b!548667 (= res!341990 (validKeyInArray!0 k!1914))))

(declare-fun b!548668 () Bool)

(declare-fun res!341983 () Bool)

(assert (=> b!548668 (=> (not res!341983) (not e!316943))))

(assert (=> b!548668 (= res!341983 (and (= (size!16986 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16986 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16986 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548669 () Bool)

(assert (=> b!548669 (= e!316944 (and (bvsge mask!3119 #b00000000000000000000000000000000) (bvsgt mask!3119 #b00111111111111111111111111111111)))))

(declare-fun res!341984 () Bool)

(assert (=> start!50070 (=> (not res!341984) (not e!316943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50070 (= res!341984 (validMask!0 mask!3119))))

(assert (=> start!50070 e!316943))

(assert (=> start!50070 true))

(declare-fun array_inv!12418 (array!34607) Bool)

(assert (=> start!50070 (array_inv!12418 a!3118)))

(assert (= (and start!50070 res!341984) b!548668))

(assert (= (and b!548668 res!341983) b!548663))

(assert (= (and b!548663 res!341989) b!548667))

(assert (= (and b!548667 res!341990) b!548662))

(assert (= (and b!548662 res!341987) b!548665))

(assert (= (and b!548665 res!341988) b!548664))

(assert (= (and b!548664 res!341986) b!548666))

(assert (= (and b!548666 res!341985) b!548669))

(declare-fun m!525633 () Bool)

(assert (=> b!548664 m!525633))

(declare-fun m!525635 () Bool)

(assert (=> b!548667 m!525635))

(declare-fun m!525637 () Bool)

(assert (=> b!548663 m!525637))

(assert (=> b!548663 m!525637))

(declare-fun m!525639 () Bool)

(assert (=> b!548663 m!525639))

(declare-fun m!525641 () Bool)

(assert (=> b!548666 m!525641))

(declare-fun m!525643 () Bool)

(assert (=> b!548662 m!525643))

(declare-fun m!525645 () Bool)

(assert (=> b!548665 m!525645))

(declare-fun m!525647 () Bool)

(assert (=> start!50070 m!525647))

(declare-fun m!525649 () Bool)

(assert (=> start!50070 m!525649))

(push 1)

(assert (not b!548666))

(assert (not b!548665))

(assert (not start!50070))

(assert (not b!548663))

(assert (not b!548662))

(assert (not b!548667))

(assert (not b!548664))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!548690 () Bool)

(declare-fun e!316957 () Bool)

(declare-fun e!316958 () Bool)

(assert (=> b!548690 (= e!316957 e!316958)))

(declare-fun lt!249894 () (_ BitVec 64))

(assert (=> b!548690 (= lt!249894 (select (arr!16622 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16974 0))(
  ( (Unit!16975) )
))
(declare-fun lt!249895 () Unit!16974)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34607 (_ BitVec 64) (_ BitVec 32)) Unit!16974)

(assert (=> b!548690 (= lt!249895 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!249894 #b00000000000000000000000000000000))))

(assert (=> b!548690 (arrayContainsKey!0 a!3118 lt!249894 #b00000000000000000000000000000000)))

(declare-fun lt!249893 () Unit!16974)

(assert (=> b!548690 (= lt!249893 lt!249895)))

(declare-fun res!341996 () Bool)

(assert (=> b!548690 (= res!341996 (= (seekEntryOrOpen!0 (select (arr!16622 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5071 #b00000000000000000000000000000000)))))

(assert (=> b!548690 (=> (not res!341996) (not e!316958))))

(declare-fun d!82677 () Bool)

(declare-fun res!341995 () Bool)

(declare-fun e!316959 () Bool)

(assert (=> d!82677 (=> res!341995 e!316959)))

(assert (=> d!82677 (= res!341995 (bvsge #b00000000000000000000000000000000 (size!16986 a!3118)))))

(assert (=> d!82677 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!316959)))

(declare-fun b!548691 () Bool)

(assert (=> b!548691 (= e!316959 e!316957)))

(declare-fun c!63677 () Bool)

(assert (=> b!548691 (= c!63677 (validKeyInArray!0 (select (arr!16622 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32210 () Bool)

(declare-fun call!32213 () Bool)

(assert (=> bm!32210 (= call!32213 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!548692 () Bool)

(assert (=> b!548692 (= e!316957 call!32213)))

(declare-fun b!548693 () Bool)

(assert (=> b!548693 (= e!316958 call!32213)))

(assert (= (and d!82677 (not res!341995)) b!548691))

(assert (= (and b!548691 c!63677) b!548690))

(assert (= (and b!548691 (not c!63677)) b!548692))

(assert (= (and b!548690 res!341996) b!548693))

(assert (= (or b!548693 b!548692) bm!32210))

(declare-fun m!525651 () Bool)

(assert (=> b!548690 m!525651))

(declare-fun m!525653 () Bool)

(assert (=> b!548690 m!525653))

(declare-fun m!525655 () Bool)

(assert (=> b!548690 m!525655))

(assert (=> b!548690 m!525651))

(declare-fun m!525657 () Bool)

(assert (=> b!548690 m!525657))

(assert (=> b!548691 m!525651))

(assert (=> b!548691 m!525651))

(declare-fun m!525659 () Bool)

(assert (=> b!548691 m!525659))

(declare-fun m!525661 () Bool)

(assert (=> bm!32210 m!525661))

(assert (=> b!548664 d!82677))

(declare-fun d!82679 () Bool)

(assert (=> d!82679 (= (validKeyInArray!0 (select (arr!16622 a!3118) j!142)) (and (not (= (select (arr!16622 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16622 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!548663 d!82679))

(declare-fun d!82681 () Bool)

(assert (=> d!82681 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50070 d!82681))

(declare-fun d!82687 () Bool)

(assert (=> d!82687 (= (array_inv!12418 a!3118) (bvsge (size!16986 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50070 d!82687))

(declare-fun d!82689 () Bool)

(declare-fun res!342013 () Bool)

(declare-fun e!316991 () Bool)

(assert (=> d!82689 (=> res!342013 e!316991)))

(assert (=> d!82689 (= res!342013 (= (select (arr!16622 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!82689 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!316991)))

(declare-fun b!548740 () Bool)

(declare-fun e!316992 () Bool)

(assert (=> b!548740 (= e!316991 e!316992)))

(declare-fun res!342014 () Bool)

(assert (=> b!548740 (=> (not res!342014) (not e!316992))))

(assert (=> b!548740 (= res!342014 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16986 a!3118)))))

(declare-fun b!548741 () Bool)

(assert (=> b!548741 (= e!316992 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82689 (not res!342013)) b!548740))

(assert (= (and b!548740 res!342014) b!548741))

(assert (=> d!82689 m!525651))

(declare-fun m!525707 () Bool)

(assert (=> b!548741 m!525707))

(assert (=> b!548662 d!82689))

(declare-fun d!82695 () Bool)

(assert (=> d!82695 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!548667 d!82695))

(declare-fun b!548752 () Bool)

(declare-fun e!317003 () Bool)

(declare-fun e!317002 () Bool)

(assert (=> b!548752 (= e!317003 e!317002)))

(declare-fun c!63695 () Bool)

(assert (=> b!548752 (= c!63695 (validKeyInArray!0 (select (arr!16622 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!82697 () Bool)

(declare-fun res!342021 () Bool)

(declare-fun e!317001 () Bool)

(assert (=> d!82697 (=> res!342021 e!317001)))

(assert (=> d!82697 (= res!342021 (bvsge #b00000000000000000000000000000000 (size!16986 a!3118)))))

(assert (=> d!82697 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10699) e!317001)))

(declare-fun bm!32216 () Bool)

(declare-fun call!32219 () Bool)

(assert (=> bm!32216 (= call!32219 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63695 (Cons!10698 (select (arr!16622 a!3118) #b00000000000000000000000000000000) Nil!10699) Nil!10699)))))

(declare-fun b!548753 () Bool)

(declare-fun e!317004 () Bool)

(declare-fun contains!2829 (List!10702 (_ BitVec 64)) Bool)

(assert (=> b!548753 (= e!317004 (contains!2829 Nil!10699 (select (arr!16622 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!548754 () Bool)

(assert (=> b!548754 (= e!317002 call!32219)))

(declare-fun b!548755 () Bool)

(assert (=> b!548755 (= e!317001 e!317003)))

(declare-fun res!342023 () Bool)

