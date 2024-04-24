; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50114 () Bool)

(assert start!50114)

(declare-fun b!548814 () Bool)

(declare-fun res!342031 () Bool)

(declare-fun e!317053 () Bool)

(assert (=> b!548814 (=> (not res!342031) (not e!317053))))

(declare-datatypes ((array!34597 0))(
  ( (array!34598 (arr!16615 (Array (_ BitVec 32) (_ BitVec 64))) (size!16979 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34597)

(declare-datatypes ((List!10602 0))(
  ( (Nil!10599) (Cons!10598 (h!11571 (_ BitVec 64)) (t!16822 List!10602)) )
))
(declare-fun arrayNoDuplicates!0 (array!34597 (_ BitVec 32) List!10602) Bool)

(assert (=> b!548814 (= res!342031 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10599))))

(declare-fun b!548815 () Bool)

(declare-fun res!342033 () Bool)

(assert (=> b!548815 (=> (not res!342033) (not e!317053))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34597 (_ BitVec 32)) Bool)

(assert (=> b!548815 (= res!342033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!342035 () Bool)

(declare-fun e!317054 () Bool)

(assert (=> start!50114 (=> (not res!342035) (not e!317054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50114 (= res!342035 (validMask!0 mask!3119))))

(assert (=> start!50114 e!317054))

(assert (=> start!50114 true))

(declare-fun array_inv!12474 (array!34597) Bool)

(assert (=> start!50114 (array_inv!12474 a!3118)))

(declare-fun b!548816 () Bool)

(declare-fun res!342032 () Bool)

(assert (=> b!548816 (=> (not res!342032) (not e!317054))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548816 (= res!342032 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548817 () Bool)

(declare-fun res!342030 () Bool)

(assert (=> b!548817 (=> (not res!342030) (not e!317054))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548817 (= res!342030 (validKeyInArray!0 (select (arr!16615 a!3118) j!142)))))

(declare-fun b!548818 () Bool)

(declare-fun res!342036 () Bool)

(assert (=> b!548818 (=> (not res!342036) (not e!317054))))

(assert (=> b!548818 (= res!342036 (validKeyInArray!0 k0!1914))))

(declare-fun b!548819 () Bool)

(assert (=> b!548819 (= e!317054 e!317053)))

(declare-fun res!342037 () Bool)

(assert (=> b!548819 (=> (not res!342037) (not e!317053))))

(declare-datatypes ((SeekEntryResult!5020 0))(
  ( (MissingZero!5020 (index!22307 (_ BitVec 32))) (Found!5020 (index!22308 (_ BitVec 32))) (Intermediate!5020 (undefined!5832 Bool) (index!22309 (_ BitVec 32)) (x!51398 (_ BitVec 32))) (Undefined!5020) (MissingVacant!5020 (index!22310 (_ BitVec 32))) )
))
(declare-fun lt!249985 () SeekEntryResult!5020)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548819 (= res!342037 (or (= lt!249985 (MissingZero!5020 i!1132)) (= lt!249985 (MissingVacant!5020 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34597 (_ BitVec 32)) SeekEntryResult!5020)

(assert (=> b!548819 (= lt!249985 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!548820 () Bool)

(declare-fun res!342034 () Bool)

(assert (=> b!548820 (=> (not res!342034) (not e!317054))))

(assert (=> b!548820 (= res!342034 (and (= (size!16979 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16979 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16979 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548821 () Bool)

(assert (=> b!548821 (= e!317053 (and (bvsge mask!3119 #b00000000000000000000000000000000) (bvsgt mask!3119 #b00111111111111111111111111111111)))))

(assert (= (and start!50114 res!342035) b!548820))

(assert (= (and b!548820 res!342034) b!548817))

(assert (= (and b!548817 res!342030) b!548818))

(assert (= (and b!548818 res!342036) b!548816))

(assert (= (and b!548816 res!342032) b!548819))

(assert (= (and b!548819 res!342037) b!548815))

(assert (= (and b!548815 res!342033) b!548814))

(assert (= (and b!548814 res!342031) b!548821))

(declare-fun m!525949 () Bool)

(assert (=> b!548818 m!525949))

(declare-fun m!525951 () Bool)

(assert (=> b!548816 m!525951))

(declare-fun m!525953 () Bool)

(assert (=> b!548814 m!525953))

(declare-fun m!525955 () Bool)

(assert (=> start!50114 m!525955))

(declare-fun m!525957 () Bool)

(assert (=> start!50114 m!525957))

(declare-fun m!525959 () Bool)

(assert (=> b!548815 m!525959))

(declare-fun m!525961 () Bool)

(assert (=> b!548819 m!525961))

(declare-fun m!525963 () Bool)

(assert (=> b!548817 m!525963))

(assert (=> b!548817 m!525963))

(declare-fun m!525965 () Bool)

(assert (=> b!548817 m!525965))

(check-sat (not b!548814) (not b!548815) (not b!548817) (not b!548818) (not b!548816) (not b!548819) (not start!50114))
(check-sat)
(get-model)

(declare-fun d!82785 () Bool)

(assert (=> d!82785 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50114 d!82785))

(declare-fun d!82789 () Bool)

(assert (=> d!82789 (= (array_inv!12474 a!3118) (bvsge (size!16979 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50114 d!82789))

(declare-fun d!82793 () Bool)

(declare-fun res!342101 () Bool)

(declare-fun e!317095 () Bool)

(assert (=> d!82793 (=> res!342101 e!317095)))

(assert (=> d!82793 (= res!342101 (bvsge #b00000000000000000000000000000000 (size!16979 a!3118)))))

(assert (=> d!82793 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10599) e!317095)))

(declare-fun b!548890 () Bool)

(declare-fun e!317090 () Bool)

(declare-fun call!32219 () Bool)

(assert (=> b!548890 (= e!317090 call!32219)))

(declare-fun b!548891 () Bool)

(assert (=> b!548891 (= e!317090 call!32219)))

(declare-fun bm!32216 () Bool)

(declare-fun c!63727 () Bool)

(assert (=> bm!32216 (= call!32219 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63727 (Cons!10598 (select (arr!16615 a!3118) #b00000000000000000000000000000000) Nil!10599) Nil!10599)))))

(declare-fun b!548892 () Bool)

(declare-fun e!317094 () Bool)

(declare-fun contains!2804 (List!10602 (_ BitVec 64)) Bool)

(assert (=> b!548892 (= e!317094 (contains!2804 Nil!10599 (select (arr!16615 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!548893 () Bool)

(declare-fun e!317093 () Bool)

(assert (=> b!548893 (= e!317095 e!317093)))

(declare-fun res!342102 () Bool)

(assert (=> b!548893 (=> (not res!342102) (not e!317093))))

(assert (=> b!548893 (= res!342102 (not e!317094))))

(declare-fun res!342098 () Bool)

(assert (=> b!548893 (=> (not res!342098) (not e!317094))))

(assert (=> b!548893 (= res!342098 (validKeyInArray!0 (select (arr!16615 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!548894 () Bool)

(assert (=> b!548894 (= e!317093 e!317090)))

(assert (=> b!548894 (= c!63727 (validKeyInArray!0 (select (arr!16615 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!82793 (not res!342101)) b!548893))

(assert (= (and b!548893 res!342098) b!548892))

(assert (= (and b!548893 res!342102) b!548894))

(assert (= (and b!548894 c!63727) b!548891))

(assert (= (and b!548894 (not c!63727)) b!548890))

(assert (= (or b!548891 b!548890) bm!32216))

(declare-fun m!526003 () Bool)

(assert (=> bm!32216 m!526003))

(declare-fun m!526005 () Bool)

(assert (=> bm!32216 m!526005))

(assert (=> b!548892 m!526003))

(assert (=> b!548892 m!526003))

(declare-fun m!526007 () Bool)

(assert (=> b!548892 m!526007))

(assert (=> b!548893 m!526003))

(assert (=> b!548893 m!526003))

(declare-fun m!526009 () Bool)

(assert (=> b!548893 m!526009))

(assert (=> b!548894 m!526003))

(assert (=> b!548894 m!526003))

(assert (=> b!548894 m!526009))

(assert (=> b!548814 d!82793))

(declare-fun b!548956 () Bool)

(declare-fun e!317139 () SeekEntryResult!5020)

(declare-fun e!317138 () SeekEntryResult!5020)

(assert (=> b!548956 (= e!317139 e!317138)))

(declare-fun lt!250016 () (_ BitVec 64))

(declare-fun lt!250018 () SeekEntryResult!5020)

(assert (=> b!548956 (= lt!250016 (select (arr!16615 a!3118) (index!22309 lt!250018)))))

(declare-fun c!63745 () Bool)

(assert (=> b!548956 (= c!63745 (= lt!250016 k0!1914))))

(declare-fun b!548957 () Bool)

(assert (=> b!548957 (= e!317138 (Found!5020 (index!22309 lt!250018)))))

(declare-fun b!548958 () Bool)

(declare-fun c!63744 () Bool)

(assert (=> b!548958 (= c!63744 (= lt!250016 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!317140 () SeekEntryResult!5020)

(assert (=> b!548958 (= e!317138 e!317140)))

(declare-fun b!548959 () Bool)

(assert (=> b!548959 (= e!317140 (MissingZero!5020 (index!22309 lt!250018)))))

(declare-fun b!548960 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34597 (_ BitVec 32)) SeekEntryResult!5020)

(assert (=> b!548960 (= e!317140 (seekKeyOrZeroReturnVacant!0 (x!51398 lt!250018) (index!22309 lt!250018) (index!22309 lt!250018) k0!1914 a!3118 mask!3119))))

(declare-fun b!548955 () Bool)

(assert (=> b!548955 (= e!317139 Undefined!5020)))

(declare-fun d!82795 () Bool)

(declare-fun lt!250017 () SeekEntryResult!5020)

(get-info :version)

(assert (=> d!82795 (and (or ((_ is Undefined!5020) lt!250017) (not ((_ is Found!5020) lt!250017)) (and (bvsge (index!22308 lt!250017) #b00000000000000000000000000000000) (bvslt (index!22308 lt!250017) (size!16979 a!3118)))) (or ((_ is Undefined!5020) lt!250017) ((_ is Found!5020) lt!250017) (not ((_ is MissingZero!5020) lt!250017)) (and (bvsge (index!22307 lt!250017) #b00000000000000000000000000000000) (bvslt (index!22307 lt!250017) (size!16979 a!3118)))) (or ((_ is Undefined!5020) lt!250017) ((_ is Found!5020) lt!250017) ((_ is MissingZero!5020) lt!250017) (not ((_ is MissingVacant!5020) lt!250017)) (and (bvsge (index!22310 lt!250017) #b00000000000000000000000000000000) (bvslt (index!22310 lt!250017) (size!16979 a!3118)))) (or ((_ is Undefined!5020) lt!250017) (ite ((_ is Found!5020) lt!250017) (= (select (arr!16615 a!3118) (index!22308 lt!250017)) k0!1914) (ite ((_ is MissingZero!5020) lt!250017) (= (select (arr!16615 a!3118) (index!22307 lt!250017)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5020) lt!250017) (= (select (arr!16615 a!3118) (index!22310 lt!250017)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82795 (= lt!250017 e!317139)))

(declare-fun c!63746 () Bool)

(assert (=> d!82795 (= c!63746 (and ((_ is Intermediate!5020) lt!250018) (undefined!5832 lt!250018)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34597 (_ BitVec 32)) SeekEntryResult!5020)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82795 (= lt!250018 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!82795 (validMask!0 mask!3119)))

(assert (=> d!82795 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!250017)))

(assert (= (and d!82795 c!63746) b!548955))

(assert (= (and d!82795 (not c!63746)) b!548956))

(assert (= (and b!548956 c!63745) b!548957))

(assert (= (and b!548956 (not c!63745)) b!548958))

(assert (= (and b!548958 c!63744) b!548959))

(assert (= (and b!548958 (not c!63744)) b!548960))

(declare-fun m!526043 () Bool)

(assert (=> b!548956 m!526043))

(declare-fun m!526045 () Bool)

(assert (=> b!548960 m!526045))

(declare-fun m!526047 () Bool)

(assert (=> d!82795 m!526047))

(declare-fun m!526049 () Bool)

(assert (=> d!82795 m!526049))

(declare-fun m!526051 () Bool)

(assert (=> d!82795 m!526051))

(assert (=> d!82795 m!526049))

(declare-fun m!526053 () Bool)

(assert (=> d!82795 m!526053))

(declare-fun m!526055 () Bool)

(assert (=> d!82795 m!526055))

(assert (=> d!82795 m!525955))

(assert (=> b!548819 d!82795))

(declare-fun d!82809 () Bool)

(assert (=> d!82809 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!548818 d!82809))

(declare-fun d!82813 () Bool)

(assert (=> d!82813 (= (validKeyInArray!0 (select (arr!16615 a!3118) j!142)) (and (not (= (select (arr!16615 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16615 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!548817 d!82813))

(declare-fun d!82815 () Bool)

(declare-fun res!342141 () Bool)

(declare-fun e!317153 () Bool)

(assert (=> d!82815 (=> res!342141 e!317153)))

(assert (=> d!82815 (= res!342141 (= (select (arr!16615 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!82815 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!317153)))

(declare-fun b!548973 () Bool)

(declare-fun e!317154 () Bool)

(assert (=> b!548973 (= e!317153 e!317154)))

(declare-fun res!342142 () Bool)

(assert (=> b!548973 (=> (not res!342142) (not e!317154))))

(assert (=> b!548973 (= res!342142 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16979 a!3118)))))

(declare-fun b!548974 () Bool)

(assert (=> b!548974 (= e!317154 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82815 (not res!342141)) b!548973))

(assert (= (and b!548973 res!342142) b!548974))

(assert (=> d!82815 m!526003))

(declare-fun m!526061 () Bool)

(assert (=> b!548974 m!526061))

(assert (=> b!548816 d!82815))

(declare-fun b!548983 () Bool)

(declare-fun e!317162 () Bool)

(declare-fun call!32232 () Bool)

(assert (=> b!548983 (= e!317162 call!32232)))

(declare-fun bm!32229 () Bool)

(assert (=> bm!32229 (= call!32232 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!548984 () Bool)

(declare-fun e!317163 () Bool)

(assert (=> b!548984 (= e!317162 e!317163)))

(declare-fun lt!250027 () (_ BitVec 64))

(assert (=> b!548984 (= lt!250027 (select (arr!16615 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16949 0))(
  ( (Unit!16950) )
))
(declare-fun lt!250026 () Unit!16949)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34597 (_ BitVec 64) (_ BitVec 32)) Unit!16949)

(assert (=> b!548984 (= lt!250026 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250027 #b00000000000000000000000000000000))))

(assert (=> b!548984 (arrayContainsKey!0 a!3118 lt!250027 #b00000000000000000000000000000000)))

(declare-fun lt!250025 () Unit!16949)

(assert (=> b!548984 (= lt!250025 lt!250026)))

(declare-fun res!342148 () Bool)

(assert (=> b!548984 (= res!342148 (= (seekEntryOrOpen!0 (select (arr!16615 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5020 #b00000000000000000000000000000000)))))

(assert (=> b!548984 (=> (not res!342148) (not e!317163))))

(declare-fun b!548985 () Bool)

(declare-fun e!317161 () Bool)

(assert (=> b!548985 (= e!317161 e!317162)))

(declare-fun c!63749 () Bool)

(assert (=> b!548985 (= c!63749 (validKeyInArray!0 (select (arr!16615 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!548986 () Bool)

(assert (=> b!548986 (= e!317163 call!32232)))

(declare-fun d!82821 () Bool)

(declare-fun res!342147 () Bool)

(assert (=> d!82821 (=> res!342147 e!317161)))

(assert (=> d!82821 (= res!342147 (bvsge #b00000000000000000000000000000000 (size!16979 a!3118)))))

(assert (=> d!82821 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!317161)))

(assert (= (and d!82821 (not res!342147)) b!548985))

(assert (= (and b!548985 c!63749) b!548984))

(assert (= (and b!548985 (not c!63749)) b!548983))

(assert (= (and b!548984 res!342148) b!548986))

(assert (= (or b!548986 b!548983) bm!32229))

(declare-fun m!526063 () Bool)

(assert (=> bm!32229 m!526063))

(assert (=> b!548984 m!526003))

(declare-fun m!526065 () Bool)

(assert (=> b!548984 m!526065))

(declare-fun m!526067 () Bool)

(assert (=> b!548984 m!526067))

(assert (=> b!548984 m!526003))

(declare-fun m!526069 () Bool)

(assert (=> b!548984 m!526069))

(assert (=> b!548985 m!526003))

(assert (=> b!548985 m!526003))

(assert (=> b!548985 m!526009))

(assert (=> b!548815 d!82821))

(check-sat (not b!548985) (not b!548974) (not b!548894) (not bm!32216) (not b!548960) (not b!548984) (not d!82795) (not b!548893) (not bm!32229) (not b!548892))
(check-sat)
