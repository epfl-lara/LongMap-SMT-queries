; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50330 () Bool)

(assert start!50330)

(declare-fun b!550591 () Bool)

(declare-fun res!343702 () Bool)

(declare-fun e!317780 () Bool)

(assert (=> b!550591 (=> (not res!343702) (not e!317780))))

(declare-datatypes ((array!34735 0))(
  ( (array!34736 (arr!16682 (Array (_ BitVec 32) (_ BitVec 64))) (size!17047 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34735)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550591 (= res!343702 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550592 () Bool)

(declare-fun res!343696 () Bool)

(assert (=> b!550592 (=> (not res!343696) (not e!317780))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550592 (= res!343696 (validKeyInArray!0 (select (arr!16682 a!3118) j!142)))))

(declare-fun res!343698 () Bool)

(assert (=> start!50330 (=> (not res!343698) (not e!317780))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50330 (= res!343698 (validMask!0 mask!3119))))

(assert (=> start!50330 e!317780))

(assert (=> start!50330 true))

(declare-fun array_inv!12565 (array!34735) Bool)

(assert (=> start!50330 (array_inv!12565 a!3118)))

(declare-fun b!550593 () Bool)

(declare-fun res!343697 () Bool)

(declare-fun e!317779 () Bool)

(assert (=> b!550593 (=> (not res!343697) (not e!317779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34735 (_ BitVec 32)) Bool)

(assert (=> b!550593 (= res!343697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!550594 () Bool)

(declare-fun res!343695 () Bool)

(assert (=> b!550594 (=> (not res!343695) (not e!317780))))

(assert (=> b!550594 (= res!343695 (validKeyInArray!0 k0!1914))))

(declare-fun b!550595 () Bool)

(declare-fun e!317777 () Bool)

(declare-fun lt!250404 () (_ BitVec 32))

(assert (=> b!550595 (= e!317777 (not (or (bvslt mask!3119 #b00000000000000000000000000000000) (and (bvsge lt!250404 #b00000000000000000000000000000000) (bvslt lt!250404 (bvadd #b00000000000000000000000000000001 mask!3119))))))))

(declare-fun e!317778 () Bool)

(assert (=> b!550595 e!317778))

(declare-fun res!343699 () Bool)

(assert (=> b!550595 (=> (not res!343699) (not e!317778))))

(assert (=> b!550595 (= res!343699 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17016 0))(
  ( (Unit!17017) )
))
(declare-fun lt!250403 () Unit!17016)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34735 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17016)

(assert (=> b!550595 (= lt!250403 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550596 () Bool)

(declare-fun res!343694 () Bool)

(assert (=> b!550596 (=> (not res!343694) (not e!317779))))

(declare-datatypes ((List!10801 0))(
  ( (Nil!10798) (Cons!10797 (h!11773 (_ BitVec 64)) (t!17020 List!10801)) )
))
(declare-fun arrayNoDuplicates!0 (array!34735 (_ BitVec 32) List!10801) Bool)

(assert (=> b!550596 (= res!343694 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10798))))

(declare-fun b!550597 () Bool)

(assert (=> b!550597 (= e!317780 e!317779)))

(declare-fun res!343703 () Bool)

(assert (=> b!550597 (=> (not res!343703) (not e!317779))))

(declare-datatypes ((SeekEntryResult!5128 0))(
  ( (MissingZero!5128 (index!22739 (_ BitVec 32))) (Found!5128 (index!22740 (_ BitVec 32))) (Intermediate!5128 (undefined!5940 Bool) (index!22741 (_ BitVec 32)) (x!51675 (_ BitVec 32))) (Undefined!5128) (MissingVacant!5128 (index!22742 (_ BitVec 32))) )
))
(declare-fun lt!250405 () SeekEntryResult!5128)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!550597 (= res!343703 (or (= lt!250405 (MissingZero!5128 i!1132)) (= lt!250405 (MissingVacant!5128 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34735 (_ BitVec 32)) SeekEntryResult!5128)

(assert (=> b!550597 (= lt!250405 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!550598 () Bool)

(assert (=> b!550598 (= e!317778 (= (seekEntryOrOpen!0 (select (arr!16682 a!3118) j!142) a!3118 mask!3119) (Found!5128 j!142)))))

(declare-fun b!550599 () Bool)

(assert (=> b!550599 (= e!317779 e!317777)))

(declare-fun res!343701 () Bool)

(assert (=> b!550599 (=> (not res!343701) (not e!317777))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34735 (_ BitVec 32)) SeekEntryResult!5128)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550599 (= res!343701 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250404 (select (arr!16682 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16682 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16682 a!3118) i!1132 k0!1914) j!142) (array!34736 (store (arr!16682 a!3118) i!1132 k0!1914) (size!17047 a!3118)) mask!3119)))))

(assert (=> b!550599 (= lt!250404 (toIndex!0 (select (arr!16682 a!3118) j!142) mask!3119))))

(declare-fun b!550600 () Bool)

(declare-fun res!343700 () Bool)

(assert (=> b!550600 (=> (not res!343700) (not e!317780))))

(assert (=> b!550600 (= res!343700 (and (= (size!17047 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17047 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17047 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50330 res!343698) b!550600))

(assert (= (and b!550600 res!343700) b!550592))

(assert (= (and b!550592 res!343696) b!550594))

(assert (= (and b!550594 res!343695) b!550591))

(assert (= (and b!550591 res!343702) b!550597))

(assert (= (and b!550597 res!343703) b!550593))

(assert (= (and b!550593 res!343697) b!550596))

(assert (= (and b!550596 res!343694) b!550599))

(assert (= (and b!550599 res!343701) b!550595))

(assert (= (and b!550595 res!343699) b!550598))

(declare-fun m!527105 () Bool)

(assert (=> b!550594 m!527105))

(declare-fun m!527107 () Bool)

(assert (=> b!550597 m!527107))

(declare-fun m!527109 () Bool)

(assert (=> start!50330 m!527109))

(declare-fun m!527111 () Bool)

(assert (=> start!50330 m!527111))

(declare-fun m!527113 () Bool)

(assert (=> b!550591 m!527113))

(declare-fun m!527115 () Bool)

(assert (=> b!550599 m!527115))

(declare-fun m!527117 () Bool)

(assert (=> b!550599 m!527117))

(assert (=> b!550599 m!527115))

(declare-fun m!527119 () Bool)

(assert (=> b!550599 m!527119))

(assert (=> b!550599 m!527115))

(declare-fun m!527121 () Bool)

(assert (=> b!550599 m!527121))

(declare-fun m!527123 () Bool)

(assert (=> b!550599 m!527123))

(assert (=> b!550599 m!527121))

(declare-fun m!527125 () Bool)

(assert (=> b!550599 m!527125))

(declare-fun m!527127 () Bool)

(assert (=> b!550599 m!527127))

(assert (=> b!550599 m!527121))

(assert (=> b!550599 m!527123))

(assert (=> b!550598 m!527115))

(assert (=> b!550598 m!527115))

(declare-fun m!527129 () Bool)

(assert (=> b!550598 m!527129))

(declare-fun m!527131 () Bool)

(assert (=> b!550593 m!527131))

(declare-fun m!527133 () Bool)

(assert (=> b!550595 m!527133))

(declare-fun m!527135 () Bool)

(assert (=> b!550595 m!527135))

(assert (=> b!550592 m!527115))

(assert (=> b!550592 m!527115))

(declare-fun m!527137 () Bool)

(assert (=> b!550592 m!527137))

(declare-fun m!527139 () Bool)

(assert (=> b!550596 m!527139))

(check-sat (not b!550594) (not b!550595) (not b!550597) (not b!550599) (not b!550598) (not b!550592) (not b!550591) (not start!50330) (not b!550593) (not b!550596))
(check-sat)
(get-model)

(declare-fun b!550671 () Bool)

(declare-fun e!317822 () Bool)

(declare-fun call!32245 () Bool)

(assert (=> b!550671 (= e!317822 call!32245)))

(declare-fun d!82699 () Bool)

(declare-fun res!343770 () Bool)

(declare-fun e!317820 () Bool)

(assert (=> d!82699 (=> res!343770 e!317820)))

(assert (=> d!82699 (= res!343770 (bvsge #b00000000000000000000000000000000 (size!17047 a!3118)))))

(assert (=> d!82699 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10798) e!317820)))

(declare-fun b!550672 () Bool)

(assert (=> b!550672 (= e!317822 call!32245)))

(declare-fun bm!32242 () Bool)

(declare-fun c!63783 () Bool)

(assert (=> bm!32242 (= call!32245 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63783 (Cons!10797 (select (arr!16682 a!3118) #b00000000000000000000000000000000) Nil!10798) Nil!10798)))))

(declare-fun b!550673 () Bool)

(declare-fun e!317823 () Bool)

(assert (=> b!550673 (= e!317820 e!317823)))

(declare-fun res!343771 () Bool)

(assert (=> b!550673 (=> (not res!343771) (not e!317823))))

(declare-fun e!317821 () Bool)

(assert (=> b!550673 (= res!343771 (not e!317821))))

(declare-fun res!343772 () Bool)

(assert (=> b!550673 (=> (not res!343772) (not e!317821))))

(assert (=> b!550673 (= res!343772 (validKeyInArray!0 (select (arr!16682 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!550674 () Bool)

(assert (=> b!550674 (= e!317823 e!317822)))

(assert (=> b!550674 (= c!63783 (validKeyInArray!0 (select (arr!16682 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!550675 () Bool)

(declare-fun contains!2817 (List!10801 (_ BitVec 64)) Bool)

(assert (=> b!550675 (= e!317821 (contains!2817 Nil!10798 (select (arr!16682 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!82699 (not res!343770)) b!550673))

(assert (= (and b!550673 res!343772) b!550675))

(assert (= (and b!550673 res!343771) b!550674))

(assert (= (and b!550674 c!63783) b!550672))

(assert (= (and b!550674 (not c!63783)) b!550671))

(assert (= (or b!550672 b!550671) bm!32242))

(declare-fun m!527213 () Bool)

(assert (=> bm!32242 m!527213))

(declare-fun m!527215 () Bool)

(assert (=> bm!32242 m!527215))

(assert (=> b!550673 m!527213))

(assert (=> b!550673 m!527213))

(declare-fun m!527217 () Bool)

(assert (=> b!550673 m!527217))

(assert (=> b!550674 m!527213))

(assert (=> b!550674 m!527213))

(assert (=> b!550674 m!527217))

(assert (=> b!550675 m!527213))

(assert (=> b!550675 m!527213))

(declare-fun m!527219 () Bool)

(assert (=> b!550675 m!527219))

(assert (=> b!550596 d!82699))

(declare-fun d!82701 () Bool)

(assert (=> d!82701 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50330 d!82701))

(declare-fun d!82713 () Bool)

(assert (=> d!82713 (= (array_inv!12565 a!3118) (bvsge (size!17047 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50330 d!82713))

(declare-fun d!82715 () Bool)

(declare-fun res!343786 () Bool)

(declare-fun e!317840 () Bool)

(assert (=> d!82715 (=> res!343786 e!317840)))

(assert (=> d!82715 (= res!343786 (= (select (arr!16682 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!82715 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!317840)))

(declare-fun b!550695 () Bool)

(declare-fun e!317841 () Bool)

(assert (=> b!550695 (= e!317840 e!317841)))

(declare-fun res!343787 () Bool)

(assert (=> b!550695 (=> (not res!343787) (not e!317841))))

(assert (=> b!550695 (= res!343787 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17047 a!3118)))))

(declare-fun b!550696 () Bool)

(assert (=> b!550696 (= e!317841 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82715 (not res!343786)) b!550695))

(assert (= (and b!550695 res!343787) b!550696))

(assert (=> d!82715 m!527213))

(declare-fun m!527229 () Bool)

(assert (=> b!550696 m!527229))

(assert (=> b!550591 d!82715))

(declare-fun d!82717 () Bool)

(assert (=> d!82717 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!550594 d!82717))

(declare-fun b!550717 () Bool)

(declare-fun e!317855 () Bool)

(declare-fun call!32251 () Bool)

(assert (=> b!550717 (= e!317855 call!32251)))

(declare-fun b!550719 () Bool)

(declare-fun e!317854 () Bool)

(assert (=> b!550719 (= e!317855 e!317854)))

(declare-fun lt!250442 () (_ BitVec 64))

(assert (=> b!550719 (= lt!250442 (select (arr!16682 a!3118) j!142))))

(declare-fun lt!250440 () Unit!17016)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34735 (_ BitVec 64) (_ BitVec 32)) Unit!17016)

(assert (=> b!550719 (= lt!250440 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250442 j!142))))

(assert (=> b!550719 (arrayContainsKey!0 a!3118 lt!250442 #b00000000000000000000000000000000)))

(declare-fun lt!250441 () Unit!17016)

(assert (=> b!550719 (= lt!250441 lt!250440)))

(declare-fun res!343793 () Bool)

(assert (=> b!550719 (= res!343793 (= (seekEntryOrOpen!0 (select (arr!16682 a!3118) j!142) a!3118 mask!3119) (Found!5128 j!142)))))

(assert (=> b!550719 (=> (not res!343793) (not e!317854))))

(declare-fun b!550720 () Bool)

(assert (=> b!550720 (= e!317854 call!32251)))

(declare-fun bm!32248 () Bool)

(assert (=> bm!32248 (= call!32251 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!550718 () Bool)

(declare-fun e!317856 () Bool)

(assert (=> b!550718 (= e!317856 e!317855)))

(declare-fun c!63795 () Bool)

(assert (=> b!550718 (= c!63795 (validKeyInArray!0 (select (arr!16682 a!3118) j!142)))))

(declare-fun d!82719 () Bool)

(declare-fun res!343792 () Bool)

(assert (=> d!82719 (=> res!343792 e!317856)))

(assert (=> d!82719 (= res!343792 (bvsge j!142 (size!17047 a!3118)))))

(assert (=> d!82719 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!317856)))

(assert (= (and d!82719 (not res!343792)) b!550718))

(assert (= (and b!550718 c!63795) b!550719))

(assert (= (and b!550718 (not c!63795)) b!550717))

(assert (= (and b!550719 res!343793) b!550720))

(assert (= (or b!550720 b!550717) bm!32248))

(assert (=> b!550719 m!527115))

(declare-fun m!527231 () Bool)

(assert (=> b!550719 m!527231))

(declare-fun m!527233 () Bool)

(assert (=> b!550719 m!527233))

(assert (=> b!550719 m!527115))

(assert (=> b!550719 m!527129))

(declare-fun m!527235 () Bool)

(assert (=> bm!32248 m!527235))

(assert (=> b!550718 m!527115))

(assert (=> b!550718 m!527115))

(assert (=> b!550718 m!527137))

(assert (=> b!550595 d!82719))

(declare-fun d!82721 () Bool)

(assert (=> d!82721 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!250448 () Unit!17016)

(declare-fun choose!38 (array!34735 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17016)

(assert (=> d!82721 (= lt!250448 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!82721 (validMask!0 mask!3119)))

(assert (=> d!82721 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!250448)))

(declare-fun bs!17137 () Bool)

(assert (= bs!17137 d!82721))

(assert (=> bs!17137 m!527133))

(declare-fun m!527251 () Bool)

(assert (=> bs!17137 m!527251))

(assert (=> bs!17137 m!527109))

(assert (=> b!550595 d!82721))

(declare-fun b!550796 () Bool)

(declare-fun c!63821 () Bool)

(declare-fun lt!250469 () (_ BitVec 64))

(assert (=> b!550796 (= c!63821 (= lt!250469 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!317906 () SeekEntryResult!5128)

(declare-fun e!317904 () SeekEntryResult!5128)

(assert (=> b!550796 (= e!317906 e!317904)))

(declare-fun b!550797 () Bool)

(declare-fun lt!250467 () SeekEntryResult!5128)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34735 (_ BitVec 32)) SeekEntryResult!5128)

(assert (=> b!550797 (= e!317904 (seekKeyOrZeroReturnVacant!0 (x!51675 lt!250467) (index!22741 lt!250467) (index!22741 lt!250467) (select (arr!16682 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!82725 () Bool)

(declare-fun lt!250468 () SeekEntryResult!5128)

(get-info :version)

(assert (=> d!82725 (and (or ((_ is Undefined!5128) lt!250468) (not ((_ is Found!5128) lt!250468)) (and (bvsge (index!22740 lt!250468) #b00000000000000000000000000000000) (bvslt (index!22740 lt!250468) (size!17047 a!3118)))) (or ((_ is Undefined!5128) lt!250468) ((_ is Found!5128) lt!250468) (not ((_ is MissingZero!5128) lt!250468)) (and (bvsge (index!22739 lt!250468) #b00000000000000000000000000000000) (bvslt (index!22739 lt!250468) (size!17047 a!3118)))) (or ((_ is Undefined!5128) lt!250468) ((_ is Found!5128) lt!250468) ((_ is MissingZero!5128) lt!250468) (not ((_ is MissingVacant!5128) lt!250468)) (and (bvsge (index!22742 lt!250468) #b00000000000000000000000000000000) (bvslt (index!22742 lt!250468) (size!17047 a!3118)))) (or ((_ is Undefined!5128) lt!250468) (ite ((_ is Found!5128) lt!250468) (= (select (arr!16682 a!3118) (index!22740 lt!250468)) (select (arr!16682 a!3118) j!142)) (ite ((_ is MissingZero!5128) lt!250468) (= (select (arr!16682 a!3118) (index!22739 lt!250468)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5128) lt!250468) (= (select (arr!16682 a!3118) (index!22742 lt!250468)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!317905 () SeekEntryResult!5128)

(assert (=> d!82725 (= lt!250468 e!317905)))

(declare-fun c!63822 () Bool)

(assert (=> d!82725 (= c!63822 (and ((_ is Intermediate!5128) lt!250467) (undefined!5940 lt!250467)))))

(assert (=> d!82725 (= lt!250467 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16682 a!3118) j!142) mask!3119) (select (arr!16682 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!82725 (validMask!0 mask!3119)))

(assert (=> d!82725 (= (seekEntryOrOpen!0 (select (arr!16682 a!3118) j!142) a!3118 mask!3119) lt!250468)))

(declare-fun b!550798 () Bool)

(assert (=> b!550798 (= e!317906 (Found!5128 (index!22741 lt!250467)))))

(declare-fun b!550799 () Bool)

(assert (=> b!550799 (= e!317905 Undefined!5128)))

(declare-fun b!550800 () Bool)

(assert (=> b!550800 (= e!317905 e!317906)))

(assert (=> b!550800 (= lt!250469 (select (arr!16682 a!3118) (index!22741 lt!250467)))))

(declare-fun c!63820 () Bool)

(assert (=> b!550800 (= c!63820 (= lt!250469 (select (arr!16682 a!3118) j!142)))))

(declare-fun b!550801 () Bool)

(assert (=> b!550801 (= e!317904 (MissingZero!5128 (index!22741 lt!250467)))))

(assert (= (and d!82725 c!63822) b!550799))

(assert (= (and d!82725 (not c!63822)) b!550800))

(assert (= (and b!550800 c!63820) b!550798))

(assert (= (and b!550800 (not c!63820)) b!550796))

(assert (= (and b!550796 c!63821) b!550801))

(assert (= (and b!550796 (not c!63821)) b!550797))

(assert (=> b!550797 m!527115))

(declare-fun m!527279 () Bool)

(assert (=> b!550797 m!527279))

(declare-fun m!527281 () Bool)

(assert (=> d!82725 m!527281))

(declare-fun m!527283 () Bool)

(assert (=> d!82725 m!527283))

(assert (=> d!82725 m!527119))

(assert (=> d!82725 m!527115))

(declare-fun m!527285 () Bool)

(assert (=> d!82725 m!527285))

(assert (=> d!82725 m!527115))

(assert (=> d!82725 m!527119))

(assert (=> d!82725 m!527109))

(declare-fun m!527287 () Bool)

(assert (=> d!82725 m!527287))

(declare-fun m!527289 () Bool)

(assert (=> b!550800 m!527289))

(assert (=> b!550598 d!82725))

(declare-fun b!550806 () Bool)

(declare-fun e!317912 () Bool)

(declare-fun call!32255 () Bool)

(assert (=> b!550806 (= e!317912 call!32255)))

(declare-fun b!550808 () Bool)

(declare-fun e!317911 () Bool)

(assert (=> b!550808 (= e!317912 e!317911)))

(declare-fun lt!250472 () (_ BitVec 64))

(assert (=> b!550808 (= lt!250472 (select (arr!16682 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!250470 () Unit!17016)

(assert (=> b!550808 (= lt!250470 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250472 #b00000000000000000000000000000000))))

(assert (=> b!550808 (arrayContainsKey!0 a!3118 lt!250472 #b00000000000000000000000000000000)))

(declare-fun lt!250471 () Unit!17016)

(assert (=> b!550808 (= lt!250471 lt!250470)))

(declare-fun res!343827 () Bool)

(assert (=> b!550808 (= res!343827 (= (seekEntryOrOpen!0 (select (arr!16682 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5128 #b00000000000000000000000000000000)))))

(assert (=> b!550808 (=> (not res!343827) (not e!317911))))

(declare-fun b!550809 () Bool)

(assert (=> b!550809 (= e!317911 call!32255)))

(declare-fun bm!32252 () Bool)

(assert (=> bm!32252 (= call!32255 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!550807 () Bool)

(declare-fun e!317913 () Bool)

(assert (=> b!550807 (= e!317913 e!317912)))

(declare-fun c!63823 () Bool)

(assert (=> b!550807 (= c!63823 (validKeyInArray!0 (select (arr!16682 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!82749 () Bool)

(declare-fun res!343826 () Bool)

(assert (=> d!82749 (=> res!343826 e!317913)))

(assert (=> d!82749 (= res!343826 (bvsge #b00000000000000000000000000000000 (size!17047 a!3118)))))

(assert (=> d!82749 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!317913)))

(assert (= (and d!82749 (not res!343826)) b!550807))

(assert (= (and b!550807 c!63823) b!550808))

(assert (= (and b!550807 (not c!63823)) b!550806))

(assert (= (and b!550808 res!343827) b!550809))

(assert (= (or b!550809 b!550806) bm!32252))

(assert (=> b!550808 m!527213))

(declare-fun m!527293 () Bool)

(assert (=> b!550808 m!527293))

(declare-fun m!527295 () Bool)

(assert (=> b!550808 m!527295))

(assert (=> b!550808 m!527213))

(declare-fun m!527297 () Bool)

(assert (=> b!550808 m!527297))

(declare-fun m!527299 () Bool)

(assert (=> bm!32252 m!527299))

(assert (=> b!550807 m!527213))

(assert (=> b!550807 m!527213))

(assert (=> b!550807 m!527217))

(assert (=> b!550593 d!82749))

(declare-fun b!550864 () Bool)

(declare-fun e!317952 () Bool)

(declare-fun lt!250508 () SeekEntryResult!5128)

(assert (=> b!550864 (= e!317952 (bvsge (x!51675 lt!250508) #b01111111111111111111111111111110))))

(declare-fun b!550865 () Bool)

(declare-fun e!317951 () SeekEntryResult!5128)

(assert (=> b!550865 (= e!317951 (Intermediate!5128 true lt!250404 #b00000000000000000000000000000000))))

(declare-fun b!550866 () Bool)

(declare-fun e!317950 () SeekEntryResult!5128)

(assert (=> b!550866 (= e!317950 (Intermediate!5128 false lt!250404 #b00000000000000000000000000000000))))

(declare-fun d!82755 () Bool)

(assert (=> d!82755 e!317952))

(declare-fun c!63840 () Bool)

(assert (=> d!82755 (= c!63840 (and ((_ is Intermediate!5128) lt!250508) (undefined!5940 lt!250508)))))

(assert (=> d!82755 (= lt!250508 e!317951)))

(declare-fun c!63841 () Bool)

(assert (=> d!82755 (= c!63841 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!250507 () (_ BitVec 64))

(assert (=> d!82755 (= lt!250507 (select (arr!16682 a!3118) lt!250404))))

(assert (=> d!82755 (validMask!0 mask!3119)))

(assert (=> d!82755 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250404 (select (arr!16682 a!3118) j!142) a!3118 mask!3119) lt!250508)))

(declare-fun b!550867 () Bool)

(assert (=> b!550867 (and (bvsge (index!22741 lt!250508) #b00000000000000000000000000000000) (bvslt (index!22741 lt!250508) (size!17047 a!3118)))))

(declare-fun res!343852 () Bool)

(assert (=> b!550867 (= res!343852 (= (select (arr!16682 a!3118) (index!22741 lt!250508)) (select (arr!16682 a!3118) j!142)))))

(declare-fun e!317953 () Bool)

(assert (=> b!550867 (=> res!343852 e!317953)))

(declare-fun e!317954 () Bool)

(assert (=> b!550867 (= e!317954 e!317953)))

(declare-fun b!550868 () Bool)

(assert (=> b!550868 (and (bvsge (index!22741 lt!250508) #b00000000000000000000000000000000) (bvslt (index!22741 lt!250508) (size!17047 a!3118)))))

(declare-fun res!343850 () Bool)

(assert (=> b!550868 (= res!343850 (= (select (arr!16682 a!3118) (index!22741 lt!250508)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!550868 (=> res!343850 e!317953)))

(declare-fun b!550869 () Bool)

(assert (=> b!550869 (= e!317951 e!317950)))

(declare-fun c!63842 () Bool)

(assert (=> b!550869 (= c!63842 (or (= lt!250507 (select (arr!16682 a!3118) j!142)) (= (bvadd lt!250507 lt!250507) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!550870 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550870 (= e!317950 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!250404 #b00000000000000000000000000000000 mask!3119) (select (arr!16682 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!550871 () Bool)

(assert (=> b!550871 (= e!317952 e!317954)))

(declare-fun res!343851 () Bool)

(assert (=> b!550871 (= res!343851 (and ((_ is Intermediate!5128) lt!250508) (not (undefined!5940 lt!250508)) (bvslt (x!51675 lt!250508) #b01111111111111111111111111111110) (bvsge (x!51675 lt!250508) #b00000000000000000000000000000000) (bvsge (x!51675 lt!250508) #b00000000000000000000000000000000)))))

(assert (=> b!550871 (=> (not res!343851) (not e!317954))))

(declare-fun b!550872 () Bool)

(assert (=> b!550872 (and (bvsge (index!22741 lt!250508) #b00000000000000000000000000000000) (bvslt (index!22741 lt!250508) (size!17047 a!3118)))))

(assert (=> b!550872 (= e!317953 (= (select (arr!16682 a!3118) (index!22741 lt!250508)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!82755 c!63841) b!550865))

(assert (= (and d!82755 (not c!63841)) b!550869))

(assert (= (and b!550869 c!63842) b!550866))

(assert (= (and b!550869 (not c!63842)) b!550870))

(assert (= (and d!82755 c!63840) b!550864))

(assert (= (and d!82755 (not c!63840)) b!550871))

(assert (= (and b!550871 res!343851) b!550867))

(assert (= (and b!550867 (not res!343852)) b!550868))

(assert (= (and b!550868 (not res!343850)) b!550872))

(declare-fun m!527337 () Bool)

(assert (=> b!550870 m!527337))

(assert (=> b!550870 m!527337))

(assert (=> b!550870 m!527115))

(declare-fun m!527339 () Bool)

(assert (=> b!550870 m!527339))

(declare-fun m!527341 () Bool)

(assert (=> d!82755 m!527341))

(assert (=> d!82755 m!527109))

(declare-fun m!527343 () Bool)

(assert (=> b!550872 m!527343))

(assert (=> b!550867 m!527343))

(assert (=> b!550868 m!527343))

(assert (=> b!550599 d!82755))

(declare-fun b!550873 () Bool)

(declare-fun e!317957 () Bool)

(declare-fun lt!250510 () SeekEntryResult!5128)

(assert (=> b!550873 (= e!317957 (bvsge (x!51675 lt!250510) #b01111111111111111111111111111110))))

(declare-fun e!317956 () SeekEntryResult!5128)

(declare-fun b!550874 () Bool)

(assert (=> b!550874 (= e!317956 (Intermediate!5128 true (toIndex!0 (select (store (arr!16682 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun e!317955 () SeekEntryResult!5128)

(declare-fun b!550875 () Bool)

(assert (=> b!550875 (= e!317955 (Intermediate!5128 false (toIndex!0 (select (store (arr!16682 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun d!82769 () Bool)

(assert (=> d!82769 e!317957))

(declare-fun c!63843 () Bool)

(assert (=> d!82769 (= c!63843 (and ((_ is Intermediate!5128) lt!250510) (undefined!5940 lt!250510)))))

(assert (=> d!82769 (= lt!250510 e!317956)))

(declare-fun c!63844 () Bool)

(assert (=> d!82769 (= c!63844 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!250509 () (_ BitVec 64))

(assert (=> d!82769 (= lt!250509 (select (arr!16682 (array!34736 (store (arr!16682 a!3118) i!1132 k0!1914) (size!17047 a!3118))) (toIndex!0 (select (store (arr!16682 a!3118) i!1132 k0!1914) j!142) mask!3119)))))

(assert (=> d!82769 (validMask!0 mask!3119)))

(assert (=> d!82769 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16682 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16682 a!3118) i!1132 k0!1914) j!142) (array!34736 (store (arr!16682 a!3118) i!1132 k0!1914) (size!17047 a!3118)) mask!3119) lt!250510)))

(declare-fun b!550876 () Bool)

(assert (=> b!550876 (and (bvsge (index!22741 lt!250510) #b00000000000000000000000000000000) (bvslt (index!22741 lt!250510) (size!17047 (array!34736 (store (arr!16682 a!3118) i!1132 k0!1914) (size!17047 a!3118)))))))

(declare-fun res!343855 () Bool)

(assert (=> b!550876 (= res!343855 (= (select (arr!16682 (array!34736 (store (arr!16682 a!3118) i!1132 k0!1914) (size!17047 a!3118))) (index!22741 lt!250510)) (select (store (arr!16682 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun e!317958 () Bool)

(assert (=> b!550876 (=> res!343855 e!317958)))

(declare-fun e!317959 () Bool)

(assert (=> b!550876 (= e!317959 e!317958)))

(declare-fun b!550877 () Bool)

(assert (=> b!550877 (and (bvsge (index!22741 lt!250510) #b00000000000000000000000000000000) (bvslt (index!22741 lt!250510) (size!17047 (array!34736 (store (arr!16682 a!3118) i!1132 k0!1914) (size!17047 a!3118)))))))

(declare-fun res!343853 () Bool)

(assert (=> b!550877 (= res!343853 (= (select (arr!16682 (array!34736 (store (arr!16682 a!3118) i!1132 k0!1914) (size!17047 a!3118))) (index!22741 lt!250510)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!550877 (=> res!343853 e!317958)))

(declare-fun b!550878 () Bool)

(assert (=> b!550878 (= e!317956 e!317955)))

(declare-fun c!63845 () Bool)

(assert (=> b!550878 (= c!63845 (or (= lt!250509 (select (store (arr!16682 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!250509 lt!250509) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!550879 () Bool)

(assert (=> b!550879 (= e!317955 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!16682 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000 mask!3119) (select (store (arr!16682 a!3118) i!1132 k0!1914) j!142) (array!34736 (store (arr!16682 a!3118) i!1132 k0!1914) (size!17047 a!3118)) mask!3119))))

(declare-fun b!550880 () Bool)

(assert (=> b!550880 (= e!317957 e!317959)))

(declare-fun res!343854 () Bool)

(assert (=> b!550880 (= res!343854 (and ((_ is Intermediate!5128) lt!250510) (not (undefined!5940 lt!250510)) (bvslt (x!51675 lt!250510) #b01111111111111111111111111111110) (bvsge (x!51675 lt!250510) #b00000000000000000000000000000000) (bvsge (x!51675 lt!250510) #b00000000000000000000000000000000)))))

(assert (=> b!550880 (=> (not res!343854) (not e!317959))))

(declare-fun b!550881 () Bool)

(assert (=> b!550881 (and (bvsge (index!22741 lt!250510) #b00000000000000000000000000000000) (bvslt (index!22741 lt!250510) (size!17047 (array!34736 (store (arr!16682 a!3118) i!1132 k0!1914) (size!17047 a!3118)))))))

(assert (=> b!550881 (= e!317958 (= (select (arr!16682 (array!34736 (store (arr!16682 a!3118) i!1132 k0!1914) (size!17047 a!3118))) (index!22741 lt!250510)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!82769 c!63844) b!550874))

(assert (= (and d!82769 (not c!63844)) b!550878))

(assert (= (and b!550878 c!63845) b!550875))

(assert (= (and b!550878 (not c!63845)) b!550879))

(assert (= (and d!82769 c!63843) b!550873))

(assert (= (and d!82769 (not c!63843)) b!550880))

(assert (= (and b!550880 res!343854) b!550876))

(assert (= (and b!550876 (not res!343855)) b!550877))

(assert (= (and b!550877 (not res!343853)) b!550881))

(assert (=> b!550879 m!527123))

(declare-fun m!527345 () Bool)

(assert (=> b!550879 m!527345))

(assert (=> b!550879 m!527345))

(assert (=> b!550879 m!527121))

(declare-fun m!527347 () Bool)

(assert (=> b!550879 m!527347))

(assert (=> d!82769 m!527123))

(declare-fun m!527349 () Bool)

(assert (=> d!82769 m!527349))

(assert (=> d!82769 m!527109))

(declare-fun m!527351 () Bool)

(assert (=> b!550881 m!527351))

(assert (=> b!550876 m!527351))

(assert (=> b!550877 m!527351))

(assert (=> b!550599 d!82769))

(declare-fun d!82771 () Bool)

(declare-fun lt!250520 () (_ BitVec 32))

(declare-fun lt!250519 () (_ BitVec 32))

(assert (=> d!82771 (= lt!250520 (bvmul (bvxor lt!250519 (bvlshr lt!250519 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82771 (= lt!250519 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16682 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16682 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82771 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!343856 (let ((h!11777 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16682 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16682 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51681 (bvmul (bvxor h!11777 (bvlshr h!11777 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51681 (bvlshr x!51681 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!343856 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!343856 #b00000000000000000000000000000000))))))

(assert (=> d!82771 (= (toIndex!0 (select (store (arr!16682 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!250520 (bvlshr lt!250520 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!550599 d!82771))

(declare-fun d!82773 () Bool)

(declare-fun lt!250522 () (_ BitVec 32))

(declare-fun lt!250521 () (_ BitVec 32))

(assert (=> d!82773 (= lt!250522 (bvmul (bvxor lt!250521 (bvlshr lt!250521 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82773 (= lt!250521 ((_ extract 31 0) (bvand (bvxor (select (arr!16682 a!3118) j!142) (bvlshr (select (arr!16682 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82773 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!343856 (let ((h!11777 ((_ extract 31 0) (bvand (bvxor (select (arr!16682 a!3118) j!142) (bvlshr (select (arr!16682 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51681 (bvmul (bvxor h!11777 (bvlshr h!11777 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51681 (bvlshr x!51681 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!343856 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!343856 #b00000000000000000000000000000000))))))

(assert (=> d!82773 (= (toIndex!0 (select (arr!16682 a!3118) j!142) mask!3119) (bvand (bvxor lt!250522 (bvlshr lt!250522 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!550599 d!82773))

(declare-fun b!550900 () Bool)

(declare-fun c!63853 () Bool)

(declare-fun lt!250525 () (_ BitVec 64))

(assert (=> b!550900 (= c!63853 (= lt!250525 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!317972 () SeekEntryResult!5128)

(declare-fun e!317970 () SeekEntryResult!5128)

(assert (=> b!550900 (= e!317972 e!317970)))

(declare-fun b!550901 () Bool)

(declare-fun lt!250523 () SeekEntryResult!5128)

(assert (=> b!550901 (= e!317970 (seekKeyOrZeroReturnVacant!0 (x!51675 lt!250523) (index!22741 lt!250523) (index!22741 lt!250523) k0!1914 a!3118 mask!3119))))

(declare-fun d!82775 () Bool)

(declare-fun lt!250524 () SeekEntryResult!5128)

(assert (=> d!82775 (and (or ((_ is Undefined!5128) lt!250524) (not ((_ is Found!5128) lt!250524)) (and (bvsge (index!22740 lt!250524) #b00000000000000000000000000000000) (bvslt (index!22740 lt!250524) (size!17047 a!3118)))) (or ((_ is Undefined!5128) lt!250524) ((_ is Found!5128) lt!250524) (not ((_ is MissingZero!5128) lt!250524)) (and (bvsge (index!22739 lt!250524) #b00000000000000000000000000000000) (bvslt (index!22739 lt!250524) (size!17047 a!3118)))) (or ((_ is Undefined!5128) lt!250524) ((_ is Found!5128) lt!250524) ((_ is MissingZero!5128) lt!250524) (not ((_ is MissingVacant!5128) lt!250524)) (and (bvsge (index!22742 lt!250524) #b00000000000000000000000000000000) (bvslt (index!22742 lt!250524) (size!17047 a!3118)))) (or ((_ is Undefined!5128) lt!250524) (ite ((_ is Found!5128) lt!250524) (= (select (arr!16682 a!3118) (index!22740 lt!250524)) k0!1914) (ite ((_ is MissingZero!5128) lt!250524) (= (select (arr!16682 a!3118) (index!22739 lt!250524)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5128) lt!250524) (= (select (arr!16682 a!3118) (index!22742 lt!250524)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!317971 () SeekEntryResult!5128)

(assert (=> d!82775 (= lt!250524 e!317971)))

(declare-fun c!63854 () Bool)

(assert (=> d!82775 (= c!63854 (and ((_ is Intermediate!5128) lt!250523) (undefined!5940 lt!250523)))))

(assert (=> d!82775 (= lt!250523 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!82775 (validMask!0 mask!3119)))

(assert (=> d!82775 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!250524)))

(declare-fun b!550902 () Bool)

(assert (=> b!550902 (= e!317972 (Found!5128 (index!22741 lt!250523)))))

(declare-fun b!550903 () Bool)

(assert (=> b!550903 (= e!317971 Undefined!5128)))

(declare-fun b!550904 () Bool)

(assert (=> b!550904 (= e!317971 e!317972)))

(assert (=> b!550904 (= lt!250525 (select (arr!16682 a!3118) (index!22741 lt!250523)))))

(declare-fun c!63852 () Bool)

(assert (=> b!550904 (= c!63852 (= lt!250525 k0!1914))))

(declare-fun b!550905 () Bool)

(assert (=> b!550905 (= e!317970 (MissingZero!5128 (index!22741 lt!250523)))))

(assert (= (and d!82775 c!63854) b!550903))

(assert (= (and d!82775 (not c!63854)) b!550904))

(assert (= (and b!550904 c!63852) b!550902))

(assert (= (and b!550904 (not c!63852)) b!550900))

(assert (= (and b!550900 c!63853) b!550905))

(assert (= (and b!550900 (not c!63853)) b!550901))

(declare-fun m!527353 () Bool)

(assert (=> b!550901 m!527353))

(declare-fun m!527355 () Bool)

(assert (=> d!82775 m!527355))

(declare-fun m!527357 () Bool)

(assert (=> d!82775 m!527357))

(declare-fun m!527359 () Bool)

(assert (=> d!82775 m!527359))

(declare-fun m!527361 () Bool)

(assert (=> d!82775 m!527361))

(assert (=> d!82775 m!527359))

(assert (=> d!82775 m!527109))

(declare-fun m!527363 () Bool)

(assert (=> d!82775 m!527363))

(declare-fun m!527365 () Bool)

(assert (=> b!550904 m!527365))

(assert (=> b!550597 d!82775))

(declare-fun d!82777 () Bool)

(assert (=> d!82777 (= (validKeyInArray!0 (select (arr!16682 a!3118) j!142)) (and (not (= (select (arr!16682 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16682 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!550592 d!82777))

(check-sat (not b!550879) (not d!82721) (not b!550674) (not d!82755) (not b!550901) (not bm!32252) (not bm!32248) (not b!550719) (not b!550718) (not d!82725) (not d!82775) (not b!550675) (not b!550673) (not b!550696) (not b!550870) (not d!82769) (not b!550807) (not b!550808) (not b!550797) (not bm!32242))
(check-sat)
