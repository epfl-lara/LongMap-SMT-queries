; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50344 () Bool)

(assert start!50344)

(declare-fun b!550892 () Bool)

(declare-fun res!343855 () Bool)

(declare-fun e!317966 () Bool)

(assert (=> b!550892 (=> (not res!343855) (not e!317966))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34740 0))(
  ( (array!34741 (arr!16684 (Array (_ BitVec 32) (_ BitVec 64))) (size!17048 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34740)

(assert (=> b!550892 (= res!343855 (and (= (size!17048 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17048 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17048 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550893 () Bool)

(declare-fun res!343860 () Bool)

(assert (=> b!550893 (=> (not res!343860) (not e!317966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550893 (= res!343860 (validKeyInArray!0 (select (arr!16684 a!3118) j!142)))))

(declare-fun b!550894 () Bool)

(declare-fun res!343857 () Bool)

(declare-fun e!317970 () Bool)

(assert (=> b!550894 (=> (not res!343857) (not e!317970))))

(declare-datatypes ((List!10764 0))(
  ( (Nil!10761) (Cons!10760 (h!11736 (_ BitVec 64)) (t!16992 List!10764)) )
))
(declare-fun arrayNoDuplicates!0 (array!34740 (_ BitVec 32) List!10764) Bool)

(assert (=> b!550894 (= res!343857 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10761))))

(declare-fun b!550895 () Bool)

(declare-fun e!317968 () Bool)

(declare-fun lt!250648 () (_ BitVec 32))

(assert (=> b!550895 (= e!317968 (not (or (bvslt mask!3119 #b00000000000000000000000000000000) (and (bvsge lt!250648 #b00000000000000000000000000000000) (bvslt lt!250648 (bvadd #b00000000000000000000000000000001 mask!3119))))))))

(declare-fun e!317969 () Bool)

(assert (=> b!550895 e!317969))

(declare-fun res!343859 () Bool)

(assert (=> b!550895 (=> (not res!343859) (not e!317969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34740 (_ BitVec 32)) Bool)

(assert (=> b!550895 (= res!343859 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17040 0))(
  ( (Unit!17041) )
))
(declare-fun lt!250647 () Unit!17040)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34740 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17040)

(assert (=> b!550895 (= lt!250647 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550896 () Bool)

(declare-fun res!343856 () Bool)

(assert (=> b!550896 (=> (not res!343856) (not e!317966))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!550896 (= res!343856 (validKeyInArray!0 k0!1914))))

(declare-fun res!343854 () Bool)

(assert (=> start!50344 (=> (not res!343854) (not e!317966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50344 (= res!343854 (validMask!0 mask!3119))))

(assert (=> start!50344 e!317966))

(assert (=> start!50344 true))

(declare-fun array_inv!12480 (array!34740) Bool)

(assert (=> start!50344 (array_inv!12480 a!3118)))

(declare-fun b!550897 () Bool)

(declare-fun res!343853 () Bool)

(assert (=> b!550897 (=> (not res!343853) (not e!317970))))

(assert (=> b!550897 (= res!343853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!550898 () Bool)

(assert (=> b!550898 (= e!317966 e!317970)))

(declare-fun res!343861 () Bool)

(assert (=> b!550898 (=> (not res!343861) (not e!317970))))

(declare-datatypes ((SeekEntryResult!5133 0))(
  ( (MissingZero!5133 (index!22759 (_ BitVec 32))) (Found!5133 (index!22760 (_ BitVec 32))) (Intermediate!5133 (undefined!5945 Bool) (index!22761 (_ BitVec 32)) (x!51685 (_ BitVec 32))) (Undefined!5133) (MissingVacant!5133 (index!22762 (_ BitVec 32))) )
))
(declare-fun lt!250646 () SeekEntryResult!5133)

(assert (=> b!550898 (= res!343861 (or (= lt!250646 (MissingZero!5133 i!1132)) (= lt!250646 (MissingVacant!5133 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34740 (_ BitVec 32)) SeekEntryResult!5133)

(assert (=> b!550898 (= lt!250646 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!550899 () Bool)

(assert (=> b!550899 (= e!317969 (= (seekEntryOrOpen!0 (select (arr!16684 a!3118) j!142) a!3118 mask!3119) (Found!5133 j!142)))))

(declare-fun b!550900 () Bool)

(assert (=> b!550900 (= e!317970 e!317968)))

(declare-fun res!343858 () Bool)

(assert (=> b!550900 (=> (not res!343858) (not e!317968))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34740 (_ BitVec 32)) SeekEntryResult!5133)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550900 (= res!343858 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250648 (select (arr!16684 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16684 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16684 a!3118) i!1132 k0!1914) j!142) (array!34741 (store (arr!16684 a!3118) i!1132 k0!1914) (size!17048 a!3118)) mask!3119)))))

(assert (=> b!550900 (= lt!250648 (toIndex!0 (select (arr!16684 a!3118) j!142) mask!3119))))

(declare-fun b!550901 () Bool)

(declare-fun res!343862 () Bool)

(assert (=> b!550901 (=> (not res!343862) (not e!317966))))

(declare-fun arrayContainsKey!0 (array!34740 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550901 (= res!343862 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50344 res!343854) b!550892))

(assert (= (and b!550892 res!343855) b!550893))

(assert (= (and b!550893 res!343860) b!550896))

(assert (= (and b!550896 res!343856) b!550901))

(assert (= (and b!550901 res!343862) b!550898))

(assert (= (and b!550898 res!343861) b!550897))

(assert (= (and b!550897 res!343853) b!550894))

(assert (= (and b!550894 res!343857) b!550900))

(assert (= (and b!550900 res!343858) b!550895))

(assert (= (and b!550895 res!343859) b!550899))

(declare-fun m!527913 () Bool)

(assert (=> b!550897 m!527913))

(declare-fun m!527915 () Bool)

(assert (=> b!550896 m!527915))

(declare-fun m!527917 () Bool)

(assert (=> b!550899 m!527917))

(assert (=> b!550899 m!527917))

(declare-fun m!527919 () Bool)

(assert (=> b!550899 m!527919))

(declare-fun m!527921 () Bool)

(assert (=> b!550894 m!527921))

(assert (=> b!550893 m!527917))

(assert (=> b!550893 m!527917))

(declare-fun m!527923 () Bool)

(assert (=> b!550893 m!527923))

(declare-fun m!527925 () Bool)

(assert (=> b!550901 m!527925))

(assert (=> b!550900 m!527917))

(declare-fun m!527927 () Bool)

(assert (=> b!550900 m!527927))

(assert (=> b!550900 m!527917))

(declare-fun m!527929 () Bool)

(assert (=> b!550900 m!527929))

(assert (=> b!550900 m!527917))

(declare-fun m!527931 () Bool)

(assert (=> b!550900 m!527931))

(declare-fun m!527933 () Bool)

(assert (=> b!550900 m!527933))

(assert (=> b!550900 m!527929))

(declare-fun m!527935 () Bool)

(assert (=> b!550900 m!527935))

(declare-fun m!527937 () Bool)

(assert (=> b!550900 m!527937))

(assert (=> b!550900 m!527929))

(assert (=> b!550900 m!527933))

(declare-fun m!527939 () Bool)

(assert (=> b!550895 m!527939))

(declare-fun m!527941 () Bool)

(assert (=> b!550895 m!527941))

(declare-fun m!527943 () Bool)

(assert (=> start!50344 m!527943))

(declare-fun m!527945 () Bool)

(assert (=> start!50344 m!527945))

(declare-fun m!527947 () Bool)

(assert (=> b!550898 m!527947))

(check-sat (not b!550894) (not b!550901) (not b!550898) (not b!550900) (not b!550893) (not start!50344) (not b!550895) (not b!550897) (not b!550899) (not b!550896))
(check-sat)
(get-model)

(declare-fun d!82907 () Bool)

(declare-fun res!343897 () Bool)

(declare-fun e!317993 () Bool)

(assert (=> d!82907 (=> res!343897 e!317993)))

(assert (=> d!82907 (= res!343897 (bvsge j!142 (size!17048 a!3118)))))

(assert (=> d!82907 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!317993)))

(declare-fun b!550940 () Bool)

(declare-fun e!317994 () Bool)

(declare-fun e!317992 () Bool)

(assert (=> b!550940 (= e!317994 e!317992)))

(declare-fun lt!250666 () (_ BitVec 64))

(assert (=> b!550940 (= lt!250666 (select (arr!16684 a!3118) j!142))))

(declare-fun lt!250665 () Unit!17040)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34740 (_ BitVec 64) (_ BitVec 32)) Unit!17040)

(assert (=> b!550940 (= lt!250665 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250666 j!142))))

(assert (=> b!550940 (arrayContainsKey!0 a!3118 lt!250666 #b00000000000000000000000000000000)))

(declare-fun lt!250664 () Unit!17040)

(assert (=> b!550940 (= lt!250664 lt!250665)))

(declare-fun res!343898 () Bool)

(assert (=> b!550940 (= res!343898 (= (seekEntryOrOpen!0 (select (arr!16684 a!3118) j!142) a!3118 mask!3119) (Found!5133 j!142)))))

(assert (=> b!550940 (=> (not res!343898) (not e!317992))))

(declare-fun b!550941 () Bool)

(assert (=> b!550941 (= e!317993 e!317994)))

(declare-fun c!63854 () Bool)

(assert (=> b!550941 (= c!63854 (validKeyInArray!0 (select (arr!16684 a!3118) j!142)))))

(declare-fun bm!32267 () Bool)

(declare-fun call!32270 () Bool)

(assert (=> bm!32267 (= call!32270 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!550942 () Bool)

(assert (=> b!550942 (= e!317994 call!32270)))

(declare-fun b!550943 () Bool)

(assert (=> b!550943 (= e!317992 call!32270)))

(assert (= (and d!82907 (not res!343897)) b!550941))

(assert (= (and b!550941 c!63854) b!550940))

(assert (= (and b!550941 (not c!63854)) b!550942))

(assert (= (and b!550940 res!343898) b!550943))

(assert (= (or b!550943 b!550942) bm!32267))

(assert (=> b!550940 m!527917))

(declare-fun m!527985 () Bool)

(assert (=> b!550940 m!527985))

(declare-fun m!527987 () Bool)

(assert (=> b!550940 m!527987))

(assert (=> b!550940 m!527917))

(assert (=> b!550940 m!527919))

(assert (=> b!550941 m!527917))

(assert (=> b!550941 m!527917))

(assert (=> b!550941 m!527923))

(declare-fun m!527989 () Bool)

(assert (=> bm!32267 m!527989))

(assert (=> b!550895 d!82907))

(declare-fun d!82911 () Bool)

(assert (=> d!82911 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!250669 () Unit!17040)

(declare-fun choose!38 (array!34740 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17040)

(assert (=> d!82911 (= lt!250669 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!82911 (validMask!0 mask!3119)))

(assert (=> d!82911 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!250669)))

(declare-fun bs!17167 () Bool)

(assert (= bs!17167 d!82911))

(assert (=> bs!17167 m!527939))

(declare-fun m!527991 () Bool)

(assert (=> bs!17167 m!527991))

(assert (=> bs!17167 m!527943))

(assert (=> b!550895 d!82911))

(declare-fun b!551010 () Bool)

(declare-fun lt!250697 () SeekEntryResult!5133)

(assert (=> b!551010 (and (bvsge (index!22761 lt!250697) #b00000000000000000000000000000000) (bvslt (index!22761 lt!250697) (size!17048 a!3118)))))

(declare-fun res!343918 () Bool)

(assert (=> b!551010 (= res!343918 (= (select (arr!16684 a!3118) (index!22761 lt!250697)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318033 () Bool)

(assert (=> b!551010 (=> res!343918 e!318033)))

(declare-fun b!551011 () Bool)

(declare-fun e!318032 () SeekEntryResult!5133)

(assert (=> b!551011 (= e!318032 (Intermediate!5133 false lt!250648 #b00000000000000000000000000000000))))

(declare-fun b!551012 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551012 (= e!318032 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!250648 #b00000000000000000000000000000000 mask!3119) (select (arr!16684 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!82913 () Bool)

(declare-fun e!318034 () Bool)

(assert (=> d!82913 e!318034))

(declare-fun c!63881 () Bool)

(get-info :version)

(assert (=> d!82913 (= c!63881 (and ((_ is Intermediate!5133) lt!250697) (undefined!5945 lt!250697)))))

(declare-fun e!318035 () SeekEntryResult!5133)

(assert (=> d!82913 (= lt!250697 e!318035)))

(declare-fun c!63880 () Bool)

(assert (=> d!82913 (= c!63880 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!250696 () (_ BitVec 64))

(assert (=> d!82913 (= lt!250696 (select (arr!16684 a!3118) lt!250648))))

(assert (=> d!82913 (validMask!0 mask!3119)))

(assert (=> d!82913 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250648 (select (arr!16684 a!3118) j!142) a!3118 mask!3119) lt!250697)))

(declare-fun b!551013 () Bool)

(declare-fun e!318031 () Bool)

(assert (=> b!551013 (= e!318034 e!318031)))

(declare-fun res!343919 () Bool)

(assert (=> b!551013 (= res!343919 (and ((_ is Intermediate!5133) lt!250697) (not (undefined!5945 lt!250697)) (bvslt (x!51685 lt!250697) #b01111111111111111111111111111110) (bvsge (x!51685 lt!250697) #b00000000000000000000000000000000) (bvsge (x!51685 lt!250697) #b00000000000000000000000000000000)))))

(assert (=> b!551013 (=> (not res!343919) (not e!318031))))

(declare-fun b!551014 () Bool)

(assert (=> b!551014 (= e!318034 (bvsge (x!51685 lt!250697) #b01111111111111111111111111111110))))

(declare-fun b!551015 () Bool)

(assert (=> b!551015 (and (bvsge (index!22761 lt!250697) #b00000000000000000000000000000000) (bvslt (index!22761 lt!250697) (size!17048 a!3118)))))

(declare-fun res!343920 () Bool)

(assert (=> b!551015 (= res!343920 (= (select (arr!16684 a!3118) (index!22761 lt!250697)) (select (arr!16684 a!3118) j!142)))))

(assert (=> b!551015 (=> res!343920 e!318033)))

(assert (=> b!551015 (= e!318031 e!318033)))

(declare-fun b!551016 () Bool)

(assert (=> b!551016 (= e!318035 (Intermediate!5133 true lt!250648 #b00000000000000000000000000000000))))

(declare-fun b!551017 () Bool)

(assert (=> b!551017 (= e!318035 e!318032)))

(declare-fun c!63879 () Bool)

(assert (=> b!551017 (= c!63879 (or (= lt!250696 (select (arr!16684 a!3118) j!142)) (= (bvadd lt!250696 lt!250696) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!551018 () Bool)

(assert (=> b!551018 (and (bvsge (index!22761 lt!250697) #b00000000000000000000000000000000) (bvslt (index!22761 lt!250697) (size!17048 a!3118)))))

(assert (=> b!551018 (= e!318033 (= (select (arr!16684 a!3118) (index!22761 lt!250697)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!82913 c!63880) b!551016))

(assert (= (and d!82913 (not c!63880)) b!551017))

(assert (= (and b!551017 c!63879) b!551011))

(assert (= (and b!551017 (not c!63879)) b!551012))

(assert (= (and d!82913 c!63881) b!551014))

(assert (= (and d!82913 (not c!63881)) b!551013))

(assert (= (and b!551013 res!343919) b!551015))

(assert (= (and b!551015 (not res!343920)) b!551010))

(assert (= (and b!551010 (not res!343918)) b!551018))

(declare-fun m!528009 () Bool)

(assert (=> b!551012 m!528009))

(assert (=> b!551012 m!528009))

(assert (=> b!551012 m!527917))

(declare-fun m!528011 () Bool)

(assert (=> b!551012 m!528011))

(declare-fun m!528013 () Bool)

(assert (=> d!82913 m!528013))

(assert (=> d!82913 m!527943))

(declare-fun m!528015 () Bool)

(assert (=> b!551015 m!528015))

(assert (=> b!551010 m!528015))

(assert (=> b!551018 m!528015))

(assert (=> b!550900 d!82913))

(declare-fun b!551019 () Bool)

(declare-fun lt!250699 () SeekEntryResult!5133)

(assert (=> b!551019 (and (bvsge (index!22761 lt!250699) #b00000000000000000000000000000000) (bvslt (index!22761 lt!250699) (size!17048 (array!34741 (store (arr!16684 a!3118) i!1132 k0!1914) (size!17048 a!3118)))))))

(declare-fun res!343921 () Bool)

(assert (=> b!551019 (= res!343921 (= (select (arr!16684 (array!34741 (store (arr!16684 a!3118) i!1132 k0!1914) (size!17048 a!3118))) (index!22761 lt!250699)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318038 () Bool)

(assert (=> b!551019 (=> res!343921 e!318038)))

(declare-fun e!318037 () SeekEntryResult!5133)

(declare-fun b!551020 () Bool)

(assert (=> b!551020 (= e!318037 (Intermediate!5133 false (toIndex!0 (select (store (arr!16684 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!551021 () Bool)

(assert (=> b!551021 (= e!318037 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!16684 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000 mask!3119) (select (store (arr!16684 a!3118) i!1132 k0!1914) j!142) (array!34741 (store (arr!16684 a!3118) i!1132 k0!1914) (size!17048 a!3118)) mask!3119))))

(declare-fun d!82925 () Bool)

(declare-fun e!318039 () Bool)

(assert (=> d!82925 e!318039))

(declare-fun c!63884 () Bool)

(assert (=> d!82925 (= c!63884 (and ((_ is Intermediate!5133) lt!250699) (undefined!5945 lt!250699)))))

(declare-fun e!318040 () SeekEntryResult!5133)

(assert (=> d!82925 (= lt!250699 e!318040)))

(declare-fun c!63883 () Bool)

(assert (=> d!82925 (= c!63883 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!250698 () (_ BitVec 64))

(assert (=> d!82925 (= lt!250698 (select (arr!16684 (array!34741 (store (arr!16684 a!3118) i!1132 k0!1914) (size!17048 a!3118))) (toIndex!0 (select (store (arr!16684 a!3118) i!1132 k0!1914) j!142) mask!3119)))))

(assert (=> d!82925 (validMask!0 mask!3119)))

(assert (=> d!82925 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16684 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16684 a!3118) i!1132 k0!1914) j!142) (array!34741 (store (arr!16684 a!3118) i!1132 k0!1914) (size!17048 a!3118)) mask!3119) lt!250699)))

(declare-fun b!551022 () Bool)

(declare-fun e!318036 () Bool)

(assert (=> b!551022 (= e!318039 e!318036)))

(declare-fun res!343922 () Bool)

(assert (=> b!551022 (= res!343922 (and ((_ is Intermediate!5133) lt!250699) (not (undefined!5945 lt!250699)) (bvslt (x!51685 lt!250699) #b01111111111111111111111111111110) (bvsge (x!51685 lt!250699) #b00000000000000000000000000000000) (bvsge (x!51685 lt!250699) #b00000000000000000000000000000000)))))

(assert (=> b!551022 (=> (not res!343922) (not e!318036))))

(declare-fun b!551023 () Bool)

(assert (=> b!551023 (= e!318039 (bvsge (x!51685 lt!250699) #b01111111111111111111111111111110))))

(declare-fun b!551024 () Bool)

(assert (=> b!551024 (and (bvsge (index!22761 lt!250699) #b00000000000000000000000000000000) (bvslt (index!22761 lt!250699) (size!17048 (array!34741 (store (arr!16684 a!3118) i!1132 k0!1914) (size!17048 a!3118)))))))

(declare-fun res!343923 () Bool)

(assert (=> b!551024 (= res!343923 (= (select (arr!16684 (array!34741 (store (arr!16684 a!3118) i!1132 k0!1914) (size!17048 a!3118))) (index!22761 lt!250699)) (select (store (arr!16684 a!3118) i!1132 k0!1914) j!142)))))

(assert (=> b!551024 (=> res!343923 e!318038)))

(assert (=> b!551024 (= e!318036 e!318038)))

(declare-fun b!551025 () Bool)

(assert (=> b!551025 (= e!318040 (Intermediate!5133 true (toIndex!0 (select (store (arr!16684 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!551026 () Bool)

(assert (=> b!551026 (= e!318040 e!318037)))

(declare-fun c!63882 () Bool)

(assert (=> b!551026 (= c!63882 (or (= lt!250698 (select (store (arr!16684 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!250698 lt!250698) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!551027 () Bool)

(assert (=> b!551027 (and (bvsge (index!22761 lt!250699) #b00000000000000000000000000000000) (bvslt (index!22761 lt!250699) (size!17048 (array!34741 (store (arr!16684 a!3118) i!1132 k0!1914) (size!17048 a!3118)))))))

(assert (=> b!551027 (= e!318038 (= (select (arr!16684 (array!34741 (store (arr!16684 a!3118) i!1132 k0!1914) (size!17048 a!3118))) (index!22761 lt!250699)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!82925 c!63883) b!551025))

(assert (= (and d!82925 (not c!63883)) b!551026))

(assert (= (and b!551026 c!63882) b!551020))

(assert (= (and b!551026 (not c!63882)) b!551021))

(assert (= (and d!82925 c!63884) b!551023))

(assert (= (and d!82925 (not c!63884)) b!551022))

(assert (= (and b!551022 res!343922) b!551024))

(assert (= (and b!551024 (not res!343923)) b!551019))

(assert (= (and b!551019 (not res!343921)) b!551027))

(assert (=> b!551021 m!527933))

(declare-fun m!528017 () Bool)

(assert (=> b!551021 m!528017))

(assert (=> b!551021 m!528017))

(assert (=> b!551021 m!527929))

(declare-fun m!528019 () Bool)

(assert (=> b!551021 m!528019))

(assert (=> d!82925 m!527933))

(declare-fun m!528021 () Bool)

(assert (=> d!82925 m!528021))

(assert (=> d!82925 m!527943))

(declare-fun m!528023 () Bool)

(assert (=> b!551024 m!528023))

(assert (=> b!551019 m!528023))

(assert (=> b!551027 m!528023))

(assert (=> b!550900 d!82925))

(declare-fun d!82927 () Bool)

(declare-fun lt!250708 () (_ BitVec 32))

(declare-fun lt!250707 () (_ BitVec 32))

(assert (=> d!82927 (= lt!250708 (bvmul (bvxor lt!250707 (bvlshr lt!250707 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82927 (= lt!250707 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16684 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16684 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82927 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!343924 (let ((h!11739 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16684 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16684 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51690 (bvmul (bvxor h!11739 (bvlshr h!11739 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51690 (bvlshr x!51690 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!343924 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!343924 #b00000000000000000000000000000000))))))

(assert (=> d!82927 (= (toIndex!0 (select (store (arr!16684 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!250708 (bvlshr lt!250708 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!550900 d!82927))

(declare-fun d!82937 () Bool)

(declare-fun lt!250710 () (_ BitVec 32))

(declare-fun lt!250709 () (_ BitVec 32))

(assert (=> d!82937 (= lt!250710 (bvmul (bvxor lt!250709 (bvlshr lt!250709 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82937 (= lt!250709 ((_ extract 31 0) (bvand (bvxor (select (arr!16684 a!3118) j!142) (bvlshr (select (arr!16684 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82937 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!343924 (let ((h!11739 ((_ extract 31 0) (bvand (bvxor (select (arr!16684 a!3118) j!142) (bvlshr (select (arr!16684 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51690 (bvmul (bvxor h!11739 (bvlshr h!11739 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51690 (bvlshr x!51690 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!343924 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!343924 #b00000000000000000000000000000000))))))

(assert (=> d!82937 (= (toIndex!0 (select (arr!16684 a!3118) j!142) mask!3119) (bvand (bvxor lt!250710 (bvlshr lt!250710 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!550900 d!82937))

(declare-fun d!82939 () Bool)

(declare-fun res!343929 () Bool)

(declare-fun e!318048 () Bool)

(assert (=> d!82939 (=> res!343929 e!318048)))

(assert (=> d!82939 (= res!343929 (= (select (arr!16684 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!82939 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!318048)))

(declare-fun b!551038 () Bool)

(declare-fun e!318049 () Bool)

(assert (=> b!551038 (= e!318048 e!318049)))

(declare-fun res!343930 () Bool)

(assert (=> b!551038 (=> (not res!343930) (not e!318049))))

(assert (=> b!551038 (= res!343930 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17048 a!3118)))))

(declare-fun b!551039 () Bool)

(assert (=> b!551039 (= e!318049 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82939 (not res!343929)) b!551038))

(assert (= (and b!551038 res!343930) b!551039))

(declare-fun m!528037 () Bool)

(assert (=> d!82939 m!528037))

(declare-fun m!528039 () Bool)

(assert (=> b!551039 m!528039))

(assert (=> b!550901 d!82939))

(declare-fun d!82941 () Bool)

(assert (=> d!82941 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!550896 d!82941))

(declare-fun b!551112 () Bool)

(declare-fun e!318093 () SeekEntryResult!5133)

(declare-fun lt!250734 () SeekEntryResult!5133)

(assert (=> b!551112 (= e!318093 (MissingZero!5133 (index!22761 lt!250734)))))

(declare-fun b!551113 () Bool)

(declare-fun e!318092 () SeekEntryResult!5133)

(assert (=> b!551113 (= e!318092 (Found!5133 (index!22761 lt!250734)))))

(declare-fun d!82943 () Bool)

(declare-fun lt!250735 () SeekEntryResult!5133)

(assert (=> d!82943 (and (or ((_ is Undefined!5133) lt!250735) (not ((_ is Found!5133) lt!250735)) (and (bvsge (index!22760 lt!250735) #b00000000000000000000000000000000) (bvslt (index!22760 lt!250735) (size!17048 a!3118)))) (or ((_ is Undefined!5133) lt!250735) ((_ is Found!5133) lt!250735) (not ((_ is MissingZero!5133) lt!250735)) (and (bvsge (index!22759 lt!250735) #b00000000000000000000000000000000) (bvslt (index!22759 lt!250735) (size!17048 a!3118)))) (or ((_ is Undefined!5133) lt!250735) ((_ is Found!5133) lt!250735) ((_ is MissingZero!5133) lt!250735) (not ((_ is MissingVacant!5133) lt!250735)) (and (bvsge (index!22762 lt!250735) #b00000000000000000000000000000000) (bvslt (index!22762 lt!250735) (size!17048 a!3118)))) (or ((_ is Undefined!5133) lt!250735) (ite ((_ is Found!5133) lt!250735) (= (select (arr!16684 a!3118) (index!22760 lt!250735)) k0!1914) (ite ((_ is MissingZero!5133) lt!250735) (= (select (arr!16684 a!3118) (index!22759 lt!250735)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5133) lt!250735) (= (select (arr!16684 a!3118) (index!22762 lt!250735)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!318091 () SeekEntryResult!5133)

(assert (=> d!82943 (= lt!250735 e!318091)))

(declare-fun c!63915 () Bool)

(assert (=> d!82943 (= c!63915 (and ((_ is Intermediate!5133) lt!250734) (undefined!5945 lt!250734)))))

(assert (=> d!82943 (= lt!250734 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!82943 (validMask!0 mask!3119)))

(assert (=> d!82943 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!250735)))

(declare-fun b!551114 () Bool)

(assert (=> b!551114 (= e!318091 Undefined!5133)))

(declare-fun b!551115 () Bool)

(assert (=> b!551115 (= e!318091 e!318092)))

(declare-fun lt!250736 () (_ BitVec 64))

(assert (=> b!551115 (= lt!250736 (select (arr!16684 a!3118) (index!22761 lt!250734)))))

(declare-fun c!63917 () Bool)

(assert (=> b!551115 (= c!63917 (= lt!250736 k0!1914))))

(declare-fun b!551116 () Bool)

(declare-fun c!63916 () Bool)

(assert (=> b!551116 (= c!63916 (= lt!250736 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!551116 (= e!318092 e!318093)))

(declare-fun b!551117 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34740 (_ BitVec 32)) SeekEntryResult!5133)

(assert (=> b!551117 (= e!318093 (seekKeyOrZeroReturnVacant!0 (x!51685 lt!250734) (index!22761 lt!250734) (index!22761 lt!250734) k0!1914 a!3118 mask!3119))))

(assert (= (and d!82943 c!63915) b!551114))

(assert (= (and d!82943 (not c!63915)) b!551115))

(assert (= (and b!551115 c!63917) b!551113))

(assert (= (and b!551115 (not c!63917)) b!551116))

(assert (= (and b!551116 c!63916) b!551112))

(assert (= (and b!551116 (not c!63916)) b!551117))

(declare-fun m!528075 () Bool)

(assert (=> d!82943 m!528075))

(declare-fun m!528077 () Bool)

(assert (=> d!82943 m!528077))

(declare-fun m!528079 () Bool)

(assert (=> d!82943 m!528079))

(assert (=> d!82943 m!528079))

(declare-fun m!528081 () Bool)

(assert (=> d!82943 m!528081))

(declare-fun m!528083 () Bool)

(assert (=> d!82943 m!528083))

(assert (=> d!82943 m!527943))

(declare-fun m!528085 () Bool)

(assert (=> b!551115 m!528085))

(declare-fun m!528087 () Bool)

(assert (=> b!551117 m!528087))

(assert (=> b!550898 d!82943))

(declare-fun d!82953 () Bool)

(declare-fun res!343950 () Bool)

(declare-fun e!318095 () Bool)

(assert (=> d!82953 (=> res!343950 e!318095)))

(assert (=> d!82953 (= res!343950 (bvsge #b00000000000000000000000000000000 (size!17048 a!3118)))))

(assert (=> d!82953 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!318095)))

(declare-fun b!551118 () Bool)

(declare-fun e!318096 () Bool)

(declare-fun e!318094 () Bool)

(assert (=> b!551118 (= e!318096 e!318094)))

(declare-fun lt!250745 () (_ BitVec 64))

(assert (=> b!551118 (= lt!250745 (select (arr!16684 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!250744 () Unit!17040)

(assert (=> b!551118 (= lt!250744 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250745 #b00000000000000000000000000000000))))

(assert (=> b!551118 (arrayContainsKey!0 a!3118 lt!250745 #b00000000000000000000000000000000)))

(declare-fun lt!250743 () Unit!17040)

(assert (=> b!551118 (= lt!250743 lt!250744)))

(declare-fun res!343951 () Bool)

(assert (=> b!551118 (= res!343951 (= (seekEntryOrOpen!0 (select (arr!16684 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5133 #b00000000000000000000000000000000)))))

(assert (=> b!551118 (=> (not res!343951) (not e!318094))))

(declare-fun b!551119 () Bool)

(assert (=> b!551119 (= e!318095 e!318096)))

(declare-fun c!63918 () Bool)

(assert (=> b!551119 (= c!63918 (validKeyInArray!0 (select (arr!16684 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32268 () Bool)

(declare-fun call!32271 () Bool)

(assert (=> bm!32268 (= call!32271 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!551120 () Bool)

(assert (=> b!551120 (= e!318096 call!32271)))

(declare-fun b!551121 () Bool)

(assert (=> b!551121 (= e!318094 call!32271)))

(assert (= (and d!82953 (not res!343950)) b!551119))

(assert (= (and b!551119 c!63918) b!551118))

(assert (= (and b!551119 (not c!63918)) b!551120))

(assert (= (and b!551118 res!343951) b!551121))

(assert (= (or b!551121 b!551120) bm!32268))

(assert (=> b!551118 m!528037))

(declare-fun m!528089 () Bool)

(assert (=> b!551118 m!528089))

(declare-fun m!528091 () Bool)

(assert (=> b!551118 m!528091))

(assert (=> b!551118 m!528037))

(declare-fun m!528093 () Bool)

(assert (=> b!551118 m!528093))

(assert (=> b!551119 m!528037))

(assert (=> b!551119 m!528037))

(declare-fun m!528095 () Bool)

(assert (=> b!551119 m!528095))

(declare-fun m!528097 () Bool)

(assert (=> bm!32268 m!528097))

(assert (=> b!550897 d!82953))

(declare-fun d!82959 () Bool)

(assert (=> d!82959 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50344 d!82959))

(declare-fun d!82965 () Bool)

(assert (=> d!82965 (= (array_inv!12480 a!3118) (bvsge (size!17048 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50344 d!82965))

(declare-fun b!551163 () Bool)

(declare-fun e!318129 () SeekEntryResult!5133)

(declare-fun lt!250766 () SeekEntryResult!5133)

(assert (=> b!551163 (= e!318129 (MissingZero!5133 (index!22761 lt!250766)))))

(declare-fun b!551164 () Bool)

(declare-fun e!318128 () SeekEntryResult!5133)

(assert (=> b!551164 (= e!318128 (Found!5133 (index!22761 lt!250766)))))

(declare-fun d!82969 () Bool)

(declare-fun lt!250767 () SeekEntryResult!5133)

(assert (=> d!82969 (and (or ((_ is Undefined!5133) lt!250767) (not ((_ is Found!5133) lt!250767)) (and (bvsge (index!22760 lt!250767) #b00000000000000000000000000000000) (bvslt (index!22760 lt!250767) (size!17048 a!3118)))) (or ((_ is Undefined!5133) lt!250767) ((_ is Found!5133) lt!250767) (not ((_ is MissingZero!5133) lt!250767)) (and (bvsge (index!22759 lt!250767) #b00000000000000000000000000000000) (bvslt (index!22759 lt!250767) (size!17048 a!3118)))) (or ((_ is Undefined!5133) lt!250767) ((_ is Found!5133) lt!250767) ((_ is MissingZero!5133) lt!250767) (not ((_ is MissingVacant!5133) lt!250767)) (and (bvsge (index!22762 lt!250767) #b00000000000000000000000000000000) (bvslt (index!22762 lt!250767) (size!17048 a!3118)))) (or ((_ is Undefined!5133) lt!250767) (ite ((_ is Found!5133) lt!250767) (= (select (arr!16684 a!3118) (index!22760 lt!250767)) (select (arr!16684 a!3118) j!142)) (ite ((_ is MissingZero!5133) lt!250767) (= (select (arr!16684 a!3118) (index!22759 lt!250767)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5133) lt!250767) (= (select (arr!16684 a!3118) (index!22762 lt!250767)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!318127 () SeekEntryResult!5133)

(assert (=> d!82969 (= lt!250767 e!318127)))

(declare-fun c!63930 () Bool)

(assert (=> d!82969 (= c!63930 (and ((_ is Intermediate!5133) lt!250766) (undefined!5945 lt!250766)))))

(assert (=> d!82969 (= lt!250766 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16684 a!3118) j!142) mask!3119) (select (arr!16684 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!82969 (validMask!0 mask!3119)))

(assert (=> d!82969 (= (seekEntryOrOpen!0 (select (arr!16684 a!3118) j!142) a!3118 mask!3119) lt!250767)))

(declare-fun b!551165 () Bool)

(assert (=> b!551165 (= e!318127 Undefined!5133)))

(declare-fun b!551166 () Bool)

(assert (=> b!551166 (= e!318127 e!318128)))

(declare-fun lt!250768 () (_ BitVec 64))

(assert (=> b!551166 (= lt!250768 (select (arr!16684 a!3118) (index!22761 lt!250766)))))

(declare-fun c!63932 () Bool)

(assert (=> b!551166 (= c!63932 (= lt!250768 (select (arr!16684 a!3118) j!142)))))

(declare-fun b!551167 () Bool)

(declare-fun c!63931 () Bool)

(assert (=> b!551167 (= c!63931 (= lt!250768 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!551167 (= e!318128 e!318129)))

(declare-fun b!551168 () Bool)

(assert (=> b!551168 (= e!318129 (seekKeyOrZeroReturnVacant!0 (x!51685 lt!250766) (index!22761 lt!250766) (index!22761 lt!250766) (select (arr!16684 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!82969 c!63930) b!551165))

(assert (= (and d!82969 (not c!63930)) b!551166))

(assert (= (and b!551166 c!63932) b!551164))

(assert (= (and b!551166 (not c!63932)) b!551167))

(assert (= (and b!551167 c!63931) b!551163))

(assert (= (and b!551167 (not c!63931)) b!551168))

(declare-fun m!528125 () Bool)

(assert (=> d!82969 m!528125))

(declare-fun m!528127 () Bool)

(assert (=> d!82969 m!528127))

(assert (=> d!82969 m!527917))

(assert (=> d!82969 m!527927))

(assert (=> d!82969 m!527927))

(assert (=> d!82969 m!527917))

(declare-fun m!528129 () Bool)

(assert (=> d!82969 m!528129))

(declare-fun m!528131 () Bool)

(assert (=> d!82969 m!528131))

(assert (=> d!82969 m!527943))

(declare-fun m!528133 () Bool)

(assert (=> b!551166 m!528133))

(assert (=> b!551168 m!527917))

(declare-fun m!528135 () Bool)

(assert (=> b!551168 m!528135))

(assert (=> b!550899 d!82969))

(declare-fun bm!32280 () Bool)

(declare-fun call!32283 () Bool)

(declare-fun c!63936 () Bool)

(assert (=> bm!32280 (= call!32283 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63936 (Cons!10760 (select (arr!16684 a!3118) #b00000000000000000000000000000000) Nil!10761) Nil!10761)))))

(declare-fun b!551189 () Bool)

(declare-fun e!318147 () Bool)

(assert (=> b!551189 (= e!318147 call!32283)))

(declare-fun b!551190 () Bool)

(assert (=> b!551190 (= e!318147 call!32283)))

(declare-fun b!551191 () Bool)

(declare-fun e!318148 () Bool)

(declare-fun contains!2837 (List!10764 (_ BitVec 64)) Bool)

(assert (=> b!551191 (= e!318148 (contains!2837 Nil!10761 (select (arr!16684 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!551192 () Bool)

(declare-fun e!318150 () Bool)

(declare-fun e!318149 () Bool)

(assert (=> b!551192 (= e!318150 e!318149)))

(declare-fun res!343985 () Bool)

(assert (=> b!551192 (=> (not res!343985) (not e!318149))))

(assert (=> b!551192 (= res!343985 (not e!318148))))

(declare-fun res!343987 () Bool)

(assert (=> b!551192 (=> (not res!343987) (not e!318148))))

(assert (=> b!551192 (= res!343987 (validKeyInArray!0 (select (arr!16684 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!551193 () Bool)

(assert (=> b!551193 (= e!318149 e!318147)))

(assert (=> b!551193 (= c!63936 (validKeyInArray!0 (select (arr!16684 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!82971 () Bool)

(declare-fun res!343986 () Bool)

(assert (=> d!82971 (=> res!343986 e!318150)))

(assert (=> d!82971 (= res!343986 (bvsge #b00000000000000000000000000000000 (size!17048 a!3118)))))

(assert (=> d!82971 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10761) e!318150)))

(assert (= (and d!82971 (not res!343986)) b!551192))

(assert (= (and b!551192 res!343987) b!551191))

(assert (= (and b!551192 res!343985) b!551193))

(assert (= (and b!551193 c!63936) b!551189))

(assert (= (and b!551193 (not c!63936)) b!551190))

(assert (= (or b!551189 b!551190) bm!32280))

(assert (=> bm!32280 m!528037))

(declare-fun m!528151 () Bool)

(assert (=> bm!32280 m!528151))

(assert (=> b!551191 m!528037))

(assert (=> b!551191 m!528037))

(declare-fun m!528155 () Bool)

(assert (=> b!551191 m!528155))

(assert (=> b!551192 m!528037))

(assert (=> b!551192 m!528037))

(assert (=> b!551192 m!528095))

(assert (=> b!551193 m!528037))

(assert (=> b!551193 m!528037))

(assert (=> b!551193 m!528095))

(assert (=> b!550894 d!82971))

(declare-fun d!82985 () Bool)

(assert (=> d!82985 (= (validKeyInArray!0 (select (arr!16684 a!3118) j!142)) (and (not (= (select (arr!16684 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16684 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!550893 d!82985))

(check-sat (not b!550940) (not b!551039) (not d!82911) (not b!551192) (not b!551021) (not bm!32267) (not d!82943) (not b!551117) (not d!82925) (not bm!32280) (not d!82913) (not b!550941) (not d!82969) (not b!551012) (not b!551168) (not b!551193) (not bm!32268) (not b!551119) (not b!551118) (not b!551191))
(check-sat)
