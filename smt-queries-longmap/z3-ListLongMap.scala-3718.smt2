; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51150 () Bool)

(assert start!51150)

(declare-fun b!558786 () Bool)

(declare-fun e!321908 () Bool)

(declare-fun e!321907 () Bool)

(assert (=> b!558786 (= e!321908 e!321907)))

(declare-fun res!350547 () Bool)

(assert (=> b!558786 (=> res!350547 e!321907)))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5284 0))(
  ( (MissingZero!5284 (index!23363 (_ BitVec 32))) (Found!5284 (index!23364 (_ BitVec 32))) (Intermediate!5284 (undefined!6096 Bool) (index!23365 (_ BitVec 32)) (x!52411 (_ BitVec 32))) (Undefined!5284) (MissingVacant!5284 (index!23366 (_ BitVec 32))) )
))
(declare-fun lt!253968 () SeekEntryResult!5284)

(declare-datatypes ((array!35151 0))(
  ( (array!35152 (arr!16879 (Array (_ BitVec 32) (_ BitVec 64))) (size!17243 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35151)

(get-info :version)

(assert (=> b!558786 (= res!350547 (or (undefined!6096 lt!253968) (not ((_ is Intermediate!5284) lt!253968)) (= (select (arr!16879 a!3118) (index!23365 lt!253968)) (select (arr!16879 a!3118) j!142)) (= (select (arr!16879 a!3118) (index!23365 lt!253968)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558787 () Bool)

(declare-fun res!350549 () Bool)

(declare-fun e!321912 () Bool)

(assert (=> b!558787 (=> (not res!350549) (not e!321912))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558787 (= res!350549 (validKeyInArray!0 k0!1914))))

(declare-fun b!558788 () Bool)

(declare-fun res!350548 () Bool)

(assert (=> b!558788 (=> (not res!350548) (not e!321912))))

(assert (=> b!558788 (= res!350548 (validKeyInArray!0 (select (arr!16879 a!3118) j!142)))))

(declare-fun res!350544 () Bool)

(assert (=> start!51150 (=> (not res!350544) (not e!321912))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51150 (= res!350544 (validMask!0 mask!3119))))

(assert (=> start!51150 e!321912))

(assert (=> start!51150 true))

(declare-fun array_inv!12738 (array!35151) Bool)

(assert (=> start!51150 (array_inv!12738 a!3118)))

(declare-fun lt!253967 () SeekEntryResult!5284)

(declare-fun b!558789 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35151 (_ BitVec 32)) SeekEntryResult!5284)

(assert (=> b!558789 (= e!321907 (= lt!253967 (seekKeyOrZeroReturnVacant!0 (x!52411 lt!253968) (index!23365 lt!253968) (index!23365 lt!253968) (select (arr!16879 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun e!321911 () Bool)

(declare-fun b!558790 () Bool)

(assert (=> b!558790 (= e!321911 (not (or (undefined!6096 lt!253968) (not ((_ is Intermediate!5284) lt!253968)) (= (select (arr!16879 a!3118) (index!23365 lt!253968)) (select (arr!16879 a!3118) j!142)) (= (select (arr!16879 a!3118) (index!23365 lt!253968)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (and (bvsge (index!23365 lt!253968) #b00000000000000000000000000000000) (bvslt (index!23365 lt!253968) (bvadd #b00000000000000000000000000000001 mask!3119))))))))

(assert (=> b!558790 e!321908))

(declare-fun res!350552 () Bool)

(assert (=> b!558790 (=> (not res!350552) (not e!321908))))

(assert (=> b!558790 (= res!350552 (= lt!253967 (Found!5284 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35151 (_ BitVec 32)) SeekEntryResult!5284)

(assert (=> b!558790 (= lt!253967 (seekEntryOrOpen!0 (select (arr!16879 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35151 (_ BitVec 32)) Bool)

(assert (=> b!558790 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17413 0))(
  ( (Unit!17414) )
))
(declare-fun lt!253970 () Unit!17413)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35151 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17413)

(assert (=> b!558790 (= lt!253970 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558791 () Bool)

(declare-fun res!350554 () Bool)

(declare-fun e!321910 () Bool)

(assert (=> b!558791 (=> (not res!350554) (not e!321910))))

(declare-datatypes ((List!10866 0))(
  ( (Nil!10863) (Cons!10862 (h!11859 (_ BitVec 64)) (t!17086 List!10866)) )
))
(declare-fun arrayNoDuplicates!0 (array!35151 (_ BitVec 32) List!10866) Bool)

(assert (=> b!558791 (= res!350554 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10863))))

(declare-fun b!558792 () Bool)

(assert (=> b!558792 (= e!321912 e!321910)))

(declare-fun res!350551 () Bool)

(assert (=> b!558792 (=> (not res!350551) (not e!321910))))

(declare-fun lt!253969 () SeekEntryResult!5284)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!558792 (= res!350551 (or (= lt!253969 (MissingZero!5284 i!1132)) (= lt!253969 (MissingVacant!5284 i!1132))))))

(assert (=> b!558792 (= lt!253969 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!558793 () Bool)

(declare-fun res!350545 () Bool)

(assert (=> b!558793 (=> (not res!350545) (not e!321912))))

(assert (=> b!558793 (= res!350545 (and (= (size!17243 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17243 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17243 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558794 () Bool)

(declare-fun res!350553 () Bool)

(assert (=> b!558794 (=> (not res!350553) (not e!321910))))

(assert (=> b!558794 (= res!350553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!558795 () Bool)

(assert (=> b!558795 (= e!321910 e!321911)))

(declare-fun res!350550 () Bool)

(assert (=> b!558795 (=> (not res!350550) (not e!321911))))

(declare-fun lt!253971 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35151 (_ BitVec 32)) SeekEntryResult!5284)

(assert (=> b!558795 (= res!350550 (= lt!253968 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253971 (select (store (arr!16879 a!3118) i!1132 k0!1914) j!142) (array!35152 (store (arr!16879 a!3118) i!1132 k0!1914) (size!17243 a!3118)) mask!3119)))))

(declare-fun lt!253972 () (_ BitVec 32))

(assert (=> b!558795 (= lt!253968 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253972 (select (arr!16879 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558795 (= lt!253971 (toIndex!0 (select (store (arr!16879 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!558795 (= lt!253972 (toIndex!0 (select (arr!16879 a!3118) j!142) mask!3119))))

(declare-fun b!558796 () Bool)

(declare-fun res!350546 () Bool)

(assert (=> b!558796 (=> (not res!350546) (not e!321912))))

(declare-fun arrayContainsKey!0 (array!35151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558796 (= res!350546 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51150 res!350544) b!558793))

(assert (= (and b!558793 res!350545) b!558788))

(assert (= (and b!558788 res!350548) b!558787))

(assert (= (and b!558787 res!350549) b!558796))

(assert (= (and b!558796 res!350546) b!558792))

(assert (= (and b!558792 res!350551) b!558794))

(assert (= (and b!558794 res!350553) b!558791))

(assert (= (and b!558791 res!350554) b!558795))

(assert (= (and b!558795 res!350550) b!558790))

(assert (= (and b!558790 res!350552) b!558786))

(assert (= (and b!558786 (not res!350547)) b!558789))

(declare-fun m!536933 () Bool)

(assert (=> b!558788 m!536933))

(assert (=> b!558788 m!536933))

(declare-fun m!536935 () Bool)

(assert (=> b!558788 m!536935))

(declare-fun m!536937 () Bool)

(assert (=> b!558790 m!536937))

(assert (=> b!558790 m!536933))

(declare-fun m!536939 () Bool)

(assert (=> b!558790 m!536939))

(declare-fun m!536941 () Bool)

(assert (=> b!558790 m!536941))

(assert (=> b!558790 m!536933))

(declare-fun m!536943 () Bool)

(assert (=> b!558790 m!536943))

(declare-fun m!536945 () Bool)

(assert (=> b!558796 m!536945))

(declare-fun m!536947 () Bool)

(assert (=> b!558795 m!536947))

(declare-fun m!536949 () Bool)

(assert (=> b!558795 m!536949))

(assert (=> b!558795 m!536933))

(declare-fun m!536951 () Bool)

(assert (=> b!558795 m!536951))

(assert (=> b!558795 m!536933))

(assert (=> b!558795 m!536947))

(assert (=> b!558795 m!536933))

(declare-fun m!536953 () Bool)

(assert (=> b!558795 m!536953))

(declare-fun m!536955 () Bool)

(assert (=> b!558795 m!536955))

(assert (=> b!558795 m!536947))

(declare-fun m!536957 () Bool)

(assert (=> b!558795 m!536957))

(declare-fun m!536959 () Bool)

(assert (=> b!558787 m!536959))

(assert (=> b!558786 m!536937))

(assert (=> b!558786 m!536933))

(declare-fun m!536961 () Bool)

(assert (=> b!558794 m!536961))

(declare-fun m!536963 () Bool)

(assert (=> b!558791 m!536963))

(assert (=> b!558789 m!536933))

(assert (=> b!558789 m!536933))

(declare-fun m!536965 () Bool)

(assert (=> b!558789 m!536965))

(declare-fun m!536967 () Bool)

(assert (=> b!558792 m!536967))

(declare-fun m!536969 () Bool)

(assert (=> start!51150 m!536969))

(declare-fun m!536971 () Bool)

(assert (=> start!51150 m!536971))

(check-sat (not b!558788) (not b!558795) (not b!558796) (not start!51150) (not b!558792) (not b!558794) (not b!558787) (not b!558791) (not b!558789) (not b!558790))
(check-sat)
(get-model)

(declare-fun e!321955 () SeekEntryResult!5284)

(declare-fun b!558875 () Bool)

(declare-fun lt!254016 () SeekEntryResult!5284)

(assert (=> b!558875 (= e!321955 (seekKeyOrZeroReturnVacant!0 (x!52411 lt!254016) (index!23365 lt!254016) (index!23365 lt!254016) (select (arr!16879 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!558876 () Bool)

(declare-fun c!64470 () Bool)

(declare-fun lt!254015 () (_ BitVec 64))

(assert (=> b!558876 (= c!64470 (= lt!254015 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!321956 () SeekEntryResult!5284)

(assert (=> b!558876 (= e!321956 e!321955)))

(declare-fun d!83691 () Bool)

(declare-fun lt!254017 () SeekEntryResult!5284)

(assert (=> d!83691 (and (or ((_ is Undefined!5284) lt!254017) (not ((_ is Found!5284) lt!254017)) (and (bvsge (index!23364 lt!254017) #b00000000000000000000000000000000) (bvslt (index!23364 lt!254017) (size!17243 a!3118)))) (or ((_ is Undefined!5284) lt!254017) ((_ is Found!5284) lt!254017) (not ((_ is MissingZero!5284) lt!254017)) (and (bvsge (index!23363 lt!254017) #b00000000000000000000000000000000) (bvslt (index!23363 lt!254017) (size!17243 a!3118)))) (or ((_ is Undefined!5284) lt!254017) ((_ is Found!5284) lt!254017) ((_ is MissingZero!5284) lt!254017) (not ((_ is MissingVacant!5284) lt!254017)) (and (bvsge (index!23366 lt!254017) #b00000000000000000000000000000000) (bvslt (index!23366 lt!254017) (size!17243 a!3118)))) (or ((_ is Undefined!5284) lt!254017) (ite ((_ is Found!5284) lt!254017) (= (select (arr!16879 a!3118) (index!23364 lt!254017)) (select (arr!16879 a!3118) j!142)) (ite ((_ is MissingZero!5284) lt!254017) (= (select (arr!16879 a!3118) (index!23363 lt!254017)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5284) lt!254017) (= (select (arr!16879 a!3118) (index!23366 lt!254017)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!321957 () SeekEntryResult!5284)

(assert (=> d!83691 (= lt!254017 e!321957)))

(declare-fun c!64471 () Bool)

(assert (=> d!83691 (= c!64471 (and ((_ is Intermediate!5284) lt!254016) (undefined!6096 lt!254016)))))

(assert (=> d!83691 (= lt!254016 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16879 a!3118) j!142) mask!3119) (select (arr!16879 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83691 (validMask!0 mask!3119)))

(assert (=> d!83691 (= (seekEntryOrOpen!0 (select (arr!16879 a!3118) j!142) a!3118 mask!3119) lt!254017)))

(declare-fun b!558877 () Bool)

(assert (=> b!558877 (= e!321955 (MissingZero!5284 (index!23365 lt!254016)))))

(declare-fun b!558878 () Bool)

(assert (=> b!558878 (= e!321957 Undefined!5284)))

(declare-fun b!558879 () Bool)

(assert (=> b!558879 (= e!321956 (Found!5284 (index!23365 lt!254016)))))

(declare-fun b!558880 () Bool)

(assert (=> b!558880 (= e!321957 e!321956)))

(assert (=> b!558880 (= lt!254015 (select (arr!16879 a!3118) (index!23365 lt!254016)))))

(declare-fun c!64472 () Bool)

(assert (=> b!558880 (= c!64472 (= lt!254015 (select (arr!16879 a!3118) j!142)))))

(assert (= (and d!83691 c!64471) b!558878))

(assert (= (and d!83691 (not c!64471)) b!558880))

(assert (= (and b!558880 c!64472) b!558879))

(assert (= (and b!558880 (not c!64472)) b!558876))

(assert (= (and b!558876 c!64470) b!558877))

(assert (= (and b!558876 (not c!64470)) b!558875))

(assert (=> b!558875 m!536933))

(declare-fun m!537053 () Bool)

(assert (=> b!558875 m!537053))

(assert (=> d!83691 m!536933))

(assert (=> d!83691 m!536951))

(assert (=> d!83691 m!536969))

(declare-fun m!537055 () Bool)

(assert (=> d!83691 m!537055))

(declare-fun m!537057 () Bool)

(assert (=> d!83691 m!537057))

(declare-fun m!537059 () Bool)

(assert (=> d!83691 m!537059))

(assert (=> d!83691 m!536951))

(assert (=> d!83691 m!536933))

(declare-fun m!537061 () Bool)

(assert (=> d!83691 m!537061))

(declare-fun m!537063 () Bool)

(assert (=> b!558880 m!537063))

(assert (=> b!558790 d!83691))

(declare-fun b!558889 () Bool)

(declare-fun e!321966 () Bool)

(declare-fun call!32400 () Bool)

(assert (=> b!558889 (= e!321966 call!32400)))

(declare-fun b!558890 () Bool)

(declare-fun e!321965 () Bool)

(assert (=> b!558890 (= e!321965 e!321966)))

(declare-fun lt!254025 () (_ BitVec 64))

(assert (=> b!558890 (= lt!254025 (select (arr!16879 a!3118) j!142))))

(declare-fun lt!254026 () Unit!17413)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35151 (_ BitVec 64) (_ BitVec 32)) Unit!17413)

(assert (=> b!558890 (= lt!254026 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!254025 j!142))))

(assert (=> b!558890 (arrayContainsKey!0 a!3118 lt!254025 #b00000000000000000000000000000000)))

(declare-fun lt!254024 () Unit!17413)

(assert (=> b!558890 (= lt!254024 lt!254026)))

(declare-fun res!350626 () Bool)

(assert (=> b!558890 (= res!350626 (= (seekEntryOrOpen!0 (select (arr!16879 a!3118) j!142) a!3118 mask!3119) (Found!5284 j!142)))))

(assert (=> b!558890 (=> (not res!350626) (not e!321966))))

(declare-fun b!558891 () Bool)

(assert (=> b!558891 (= e!321965 call!32400)))

(declare-fun b!558892 () Bool)

(declare-fun e!321964 () Bool)

(assert (=> b!558892 (= e!321964 e!321965)))

(declare-fun c!64475 () Bool)

(assert (=> b!558892 (= c!64475 (validKeyInArray!0 (select (arr!16879 a!3118) j!142)))))

(declare-fun d!83697 () Bool)

(declare-fun res!350625 () Bool)

(assert (=> d!83697 (=> res!350625 e!321964)))

(assert (=> d!83697 (= res!350625 (bvsge j!142 (size!17243 a!3118)))))

(assert (=> d!83697 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!321964)))

(declare-fun bm!32397 () Bool)

(assert (=> bm!32397 (= call!32400 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!83697 (not res!350625)) b!558892))

(assert (= (and b!558892 c!64475) b!558890))

(assert (= (and b!558892 (not c!64475)) b!558891))

(assert (= (and b!558890 res!350626) b!558889))

(assert (= (or b!558889 b!558891) bm!32397))

(assert (=> b!558890 m!536933))

(declare-fun m!537065 () Bool)

(assert (=> b!558890 m!537065))

(declare-fun m!537067 () Bool)

(assert (=> b!558890 m!537067))

(assert (=> b!558890 m!536933))

(assert (=> b!558890 m!536943))

(assert (=> b!558892 m!536933))

(assert (=> b!558892 m!536933))

(assert (=> b!558892 m!536935))

(declare-fun m!537069 () Bool)

(assert (=> bm!32397 m!537069))

(assert (=> b!558790 d!83697))

(declare-fun d!83699 () Bool)

(assert (=> d!83699 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!254029 () Unit!17413)

(declare-fun choose!38 (array!35151 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17413)

(assert (=> d!83699 (= lt!254029 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83699 (validMask!0 mask!3119)))

(assert (=> d!83699 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!254029)))

(declare-fun bs!17405 () Bool)

(assert (= bs!17405 d!83699))

(assert (=> bs!17405 m!536939))

(declare-fun m!537071 () Bool)

(assert (=> bs!17405 m!537071))

(assert (=> bs!17405 m!536969))

(assert (=> b!558790 d!83699))

(declare-fun d!83701 () Bool)

(assert (=> d!83701 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51150 d!83701))

(declare-fun d!83709 () Bool)

(assert (=> d!83709 (= (array_inv!12738 a!3118) (bvsge (size!17243 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51150 d!83709))

(declare-fun lt!254049 () SeekEntryResult!5284)

(declare-fun b!558980 () Bool)

(assert (=> b!558980 (and (bvsge (index!23365 lt!254049) #b00000000000000000000000000000000) (bvslt (index!23365 lt!254049) (size!17243 (array!35152 (store (arr!16879 a!3118) i!1132 k0!1914) (size!17243 a!3118)))))))

(declare-fun res!350663 () Bool)

(assert (=> b!558980 (= res!350663 (= (select (arr!16879 (array!35152 (store (arr!16879 a!3118) i!1132 k0!1914) (size!17243 a!3118))) (index!23365 lt!254049)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!322021 () Bool)

(assert (=> b!558980 (=> res!350663 e!322021)))

(declare-fun b!558981 () Bool)

(declare-fun e!322025 () SeekEntryResult!5284)

(declare-fun e!322023 () SeekEntryResult!5284)

(assert (=> b!558981 (= e!322025 e!322023)))

(declare-fun lt!254048 () (_ BitVec 64))

(declare-fun c!64503 () Bool)

(assert (=> b!558981 (= c!64503 (or (= lt!254048 (select (store (arr!16879 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!254048 lt!254048) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558982 () Bool)

(declare-fun e!322024 () Bool)

(declare-fun e!322022 () Bool)

(assert (=> b!558982 (= e!322024 e!322022)))

(declare-fun res!350661 () Bool)

(assert (=> b!558982 (= res!350661 (and ((_ is Intermediate!5284) lt!254049) (not (undefined!6096 lt!254049)) (bvslt (x!52411 lt!254049) #b01111111111111111111111111111110) (bvsge (x!52411 lt!254049) #b00000000000000000000000000000000) (bvsge (x!52411 lt!254049) #b00000000000000000000000000000000)))))

(assert (=> b!558982 (=> (not res!350661) (not e!322022))))

(declare-fun b!558983 () Bool)

(assert (=> b!558983 (and (bvsge (index!23365 lt!254049) #b00000000000000000000000000000000) (bvslt (index!23365 lt!254049) (size!17243 (array!35152 (store (arr!16879 a!3118) i!1132 k0!1914) (size!17243 a!3118)))))))

(declare-fun res!350662 () Bool)

(assert (=> b!558983 (= res!350662 (= (select (arr!16879 (array!35152 (store (arr!16879 a!3118) i!1132 k0!1914) (size!17243 a!3118))) (index!23365 lt!254049)) (select (store (arr!16879 a!3118) i!1132 k0!1914) j!142)))))

(assert (=> b!558983 (=> res!350662 e!322021)))

(assert (=> b!558983 (= e!322022 e!322021)))

(declare-fun b!558984 () Bool)

(assert (=> b!558984 (= e!322023 (Intermediate!5284 false lt!253971 #b00000000000000000000000000000000))))

(declare-fun b!558985 () Bool)

(assert (=> b!558985 (= e!322024 (bvsge (x!52411 lt!254049) #b01111111111111111111111111111110))))

(declare-fun b!558986 () Bool)

(assert (=> b!558986 (and (bvsge (index!23365 lt!254049) #b00000000000000000000000000000000) (bvslt (index!23365 lt!254049) (size!17243 (array!35152 (store (arr!16879 a!3118) i!1132 k0!1914) (size!17243 a!3118)))))))

(assert (=> b!558986 (= e!322021 (= (select (arr!16879 (array!35152 (store (arr!16879 a!3118) i!1132 k0!1914) (size!17243 a!3118))) (index!23365 lt!254049)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!83711 () Bool)

(assert (=> d!83711 e!322024))

(declare-fun c!64505 () Bool)

(assert (=> d!83711 (= c!64505 (and ((_ is Intermediate!5284) lt!254049) (undefined!6096 lt!254049)))))

(assert (=> d!83711 (= lt!254049 e!322025)))

(declare-fun c!64504 () Bool)

(assert (=> d!83711 (= c!64504 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83711 (= lt!254048 (select (arr!16879 (array!35152 (store (arr!16879 a!3118) i!1132 k0!1914) (size!17243 a!3118))) lt!253971))))

(assert (=> d!83711 (validMask!0 mask!3119)))

(assert (=> d!83711 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253971 (select (store (arr!16879 a!3118) i!1132 k0!1914) j!142) (array!35152 (store (arr!16879 a!3118) i!1132 k0!1914) (size!17243 a!3118)) mask!3119) lt!254049)))

(declare-fun b!558987 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558987 (= e!322023 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253971 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (store (arr!16879 a!3118) i!1132 k0!1914) j!142) (array!35152 (store (arr!16879 a!3118) i!1132 k0!1914) (size!17243 a!3118)) mask!3119))))

(declare-fun b!558988 () Bool)

(assert (=> b!558988 (= e!322025 (Intermediate!5284 true lt!253971 #b00000000000000000000000000000000))))

(assert (= (and d!83711 c!64504) b!558988))

(assert (= (and d!83711 (not c!64504)) b!558981))

(assert (= (and b!558981 c!64503) b!558984))

(assert (= (and b!558981 (not c!64503)) b!558987))

(assert (= (and d!83711 c!64505) b!558985))

(assert (= (and d!83711 (not c!64505)) b!558982))

(assert (= (and b!558982 res!350661) b!558983))

(assert (= (and b!558983 (not res!350662)) b!558980))

(assert (= (and b!558980 (not res!350663)) b!558986))

(declare-fun m!537099 () Bool)

(assert (=> b!558987 m!537099))

(assert (=> b!558987 m!537099))

(assert (=> b!558987 m!536947))

(declare-fun m!537101 () Bool)

(assert (=> b!558987 m!537101))

(declare-fun m!537103 () Bool)

(assert (=> b!558983 m!537103))

(declare-fun m!537105 () Bool)

(assert (=> d!83711 m!537105))

(assert (=> d!83711 m!536969))

(assert (=> b!558980 m!537103))

(assert (=> b!558986 m!537103))

(assert (=> b!558795 d!83711))

(declare-fun b!558989 () Bool)

(declare-fun lt!254051 () SeekEntryResult!5284)

(assert (=> b!558989 (and (bvsge (index!23365 lt!254051) #b00000000000000000000000000000000) (bvslt (index!23365 lt!254051) (size!17243 a!3118)))))

(declare-fun res!350666 () Bool)

(assert (=> b!558989 (= res!350666 (= (select (arr!16879 a!3118) (index!23365 lt!254051)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!322026 () Bool)

(assert (=> b!558989 (=> res!350666 e!322026)))

(declare-fun b!558990 () Bool)

(declare-fun e!322030 () SeekEntryResult!5284)

(declare-fun e!322028 () SeekEntryResult!5284)

(assert (=> b!558990 (= e!322030 e!322028)))

(declare-fun lt!254050 () (_ BitVec 64))

(declare-fun c!64506 () Bool)

(assert (=> b!558990 (= c!64506 (or (= lt!254050 (select (arr!16879 a!3118) j!142)) (= (bvadd lt!254050 lt!254050) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558991 () Bool)

(declare-fun e!322029 () Bool)

(declare-fun e!322027 () Bool)

(assert (=> b!558991 (= e!322029 e!322027)))

(declare-fun res!350664 () Bool)

(assert (=> b!558991 (= res!350664 (and ((_ is Intermediate!5284) lt!254051) (not (undefined!6096 lt!254051)) (bvslt (x!52411 lt!254051) #b01111111111111111111111111111110) (bvsge (x!52411 lt!254051) #b00000000000000000000000000000000) (bvsge (x!52411 lt!254051) #b00000000000000000000000000000000)))))

(assert (=> b!558991 (=> (not res!350664) (not e!322027))))

(declare-fun b!558992 () Bool)

(assert (=> b!558992 (and (bvsge (index!23365 lt!254051) #b00000000000000000000000000000000) (bvslt (index!23365 lt!254051) (size!17243 a!3118)))))

(declare-fun res!350665 () Bool)

(assert (=> b!558992 (= res!350665 (= (select (arr!16879 a!3118) (index!23365 lt!254051)) (select (arr!16879 a!3118) j!142)))))

(assert (=> b!558992 (=> res!350665 e!322026)))

(assert (=> b!558992 (= e!322027 e!322026)))

(declare-fun b!558993 () Bool)

(assert (=> b!558993 (= e!322028 (Intermediate!5284 false lt!253972 #b00000000000000000000000000000000))))

(declare-fun b!558994 () Bool)

(assert (=> b!558994 (= e!322029 (bvsge (x!52411 lt!254051) #b01111111111111111111111111111110))))

(declare-fun b!558995 () Bool)

(assert (=> b!558995 (and (bvsge (index!23365 lt!254051) #b00000000000000000000000000000000) (bvslt (index!23365 lt!254051) (size!17243 a!3118)))))

(assert (=> b!558995 (= e!322026 (= (select (arr!16879 a!3118) (index!23365 lt!254051)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!83721 () Bool)

(assert (=> d!83721 e!322029))

(declare-fun c!64508 () Bool)

(assert (=> d!83721 (= c!64508 (and ((_ is Intermediate!5284) lt!254051) (undefined!6096 lt!254051)))))

(assert (=> d!83721 (= lt!254051 e!322030)))

(declare-fun c!64507 () Bool)

(assert (=> d!83721 (= c!64507 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83721 (= lt!254050 (select (arr!16879 a!3118) lt!253972))))

(assert (=> d!83721 (validMask!0 mask!3119)))

(assert (=> d!83721 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253972 (select (arr!16879 a!3118) j!142) a!3118 mask!3119) lt!254051)))

(declare-fun b!558996 () Bool)

(assert (=> b!558996 (= e!322028 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253972 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (arr!16879 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!558997 () Bool)

(assert (=> b!558997 (= e!322030 (Intermediate!5284 true lt!253972 #b00000000000000000000000000000000))))

(assert (= (and d!83721 c!64507) b!558997))

(assert (= (and d!83721 (not c!64507)) b!558990))

(assert (= (and b!558990 c!64506) b!558993))

(assert (= (and b!558990 (not c!64506)) b!558996))

(assert (= (and d!83721 c!64508) b!558994))

(assert (= (and d!83721 (not c!64508)) b!558991))

(assert (= (and b!558991 res!350664) b!558992))

(assert (= (and b!558992 (not res!350665)) b!558989))

(assert (= (and b!558989 (not res!350666)) b!558995))

(declare-fun m!537107 () Bool)

(assert (=> b!558996 m!537107))

(assert (=> b!558996 m!537107))

(assert (=> b!558996 m!536933))

(declare-fun m!537109 () Bool)

(assert (=> b!558996 m!537109))

(declare-fun m!537111 () Bool)

(assert (=> b!558992 m!537111))

(declare-fun m!537113 () Bool)

(assert (=> d!83721 m!537113))

(assert (=> d!83721 m!536969))

(assert (=> b!558989 m!537111))

(assert (=> b!558995 m!537111))

(assert (=> b!558795 d!83721))

(declare-fun d!83723 () Bool)

(declare-fun lt!254068 () (_ BitVec 32))

(declare-fun lt!254067 () (_ BitVec 32))

(assert (=> d!83723 (= lt!254068 (bvmul (bvxor lt!254067 (bvlshr lt!254067 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83723 (= lt!254067 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16879 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16879 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83723 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!350667 (let ((h!11863 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16879 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16879 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52417 (bvmul (bvxor h!11863 (bvlshr h!11863 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52417 (bvlshr x!52417 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!350667 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!350667 #b00000000000000000000000000000000))))))

(assert (=> d!83723 (= (toIndex!0 (select (store (arr!16879 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!254068 (bvlshr lt!254068 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!558795 d!83723))

(declare-fun d!83733 () Bool)

(declare-fun lt!254070 () (_ BitVec 32))

(declare-fun lt!254069 () (_ BitVec 32))

(assert (=> d!83733 (= lt!254070 (bvmul (bvxor lt!254069 (bvlshr lt!254069 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83733 (= lt!254069 ((_ extract 31 0) (bvand (bvxor (select (arr!16879 a!3118) j!142) (bvlshr (select (arr!16879 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83733 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!350667 (let ((h!11863 ((_ extract 31 0) (bvand (bvxor (select (arr!16879 a!3118) j!142) (bvlshr (select (arr!16879 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52417 (bvmul (bvxor h!11863 (bvlshr h!11863 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52417 (bvlshr x!52417 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!350667 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!350667 #b00000000000000000000000000000000))))))

(assert (=> d!83733 (= (toIndex!0 (select (arr!16879 a!3118) j!142) mask!3119) (bvand (bvxor lt!254070 (bvlshr lt!254070 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!558795 d!83733))

(declare-fun b!559044 () Bool)

(declare-fun e!322058 () SeekEntryResult!5284)

(assert (=> b!559044 (= e!322058 (MissingVacant!5284 (index!23365 lt!253968)))))

(declare-fun b!559045 () Bool)

(declare-fun c!64529 () Bool)

(declare-fun lt!254096 () (_ BitVec 64))

(assert (=> b!559045 (= c!64529 (= lt!254096 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!322060 () SeekEntryResult!5284)

(assert (=> b!559045 (= e!322060 e!322058)))

(declare-fun b!559046 () Bool)

(declare-fun e!322059 () SeekEntryResult!5284)

(assert (=> b!559046 (= e!322059 e!322060)))

(declare-fun c!64530 () Bool)

(assert (=> b!559046 (= c!64530 (= lt!254096 (select (arr!16879 a!3118) j!142)))))

(declare-fun lt!254097 () SeekEntryResult!5284)

(declare-fun d!83735 () Bool)

(assert (=> d!83735 (and (or ((_ is Undefined!5284) lt!254097) (not ((_ is Found!5284) lt!254097)) (and (bvsge (index!23364 lt!254097) #b00000000000000000000000000000000) (bvslt (index!23364 lt!254097) (size!17243 a!3118)))) (or ((_ is Undefined!5284) lt!254097) ((_ is Found!5284) lt!254097) (not ((_ is MissingVacant!5284) lt!254097)) (not (= (index!23366 lt!254097) (index!23365 lt!253968))) (and (bvsge (index!23366 lt!254097) #b00000000000000000000000000000000) (bvslt (index!23366 lt!254097) (size!17243 a!3118)))) (or ((_ is Undefined!5284) lt!254097) (ite ((_ is Found!5284) lt!254097) (= (select (arr!16879 a!3118) (index!23364 lt!254097)) (select (arr!16879 a!3118) j!142)) (and ((_ is MissingVacant!5284) lt!254097) (= (index!23366 lt!254097) (index!23365 lt!253968)) (= (select (arr!16879 a!3118) (index!23366 lt!254097)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!83735 (= lt!254097 e!322059)))

(declare-fun c!64528 () Bool)

(assert (=> d!83735 (= c!64528 (bvsge (x!52411 lt!253968) #b01111111111111111111111111111110))))

(assert (=> d!83735 (= lt!254096 (select (arr!16879 a!3118) (index!23365 lt!253968)))))

(assert (=> d!83735 (validMask!0 mask!3119)))

(assert (=> d!83735 (= (seekKeyOrZeroReturnVacant!0 (x!52411 lt!253968) (index!23365 lt!253968) (index!23365 lt!253968) (select (arr!16879 a!3118) j!142) a!3118 mask!3119) lt!254097)))

(declare-fun b!559047 () Bool)

(assert (=> b!559047 (= e!322058 (seekKeyOrZeroReturnVacant!0 (bvadd (x!52411 lt!253968) #b00000000000000000000000000000001) (nextIndex!0 (index!23365 lt!253968) (bvadd (x!52411 lt!253968) #b00000000000000000000000000000001) mask!3119) (index!23365 lt!253968) (select (arr!16879 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!559048 () Bool)

(assert (=> b!559048 (= e!322060 (Found!5284 (index!23365 lt!253968)))))

(declare-fun b!559049 () Bool)

(assert (=> b!559049 (= e!322059 Undefined!5284)))

(assert (= (and d!83735 c!64528) b!559049))

(assert (= (and d!83735 (not c!64528)) b!559046))

(assert (= (and b!559046 c!64530) b!559048))

(assert (= (and b!559046 (not c!64530)) b!559045))

(assert (= (and b!559045 c!64529) b!559044))

(assert (= (and b!559045 (not c!64529)) b!559047))

(declare-fun m!537143 () Bool)

(assert (=> d!83735 m!537143))

(declare-fun m!537145 () Bool)

(assert (=> d!83735 m!537145))

(assert (=> d!83735 m!536937))

(assert (=> d!83735 m!536969))

(declare-fun m!537147 () Bool)

(assert (=> b!559047 m!537147))

(assert (=> b!559047 m!537147))

(assert (=> b!559047 m!536933))

(declare-fun m!537149 () Bool)

(assert (=> b!559047 m!537149))

(assert (=> b!558789 d!83735))

(declare-fun b!559050 () Bool)

(declare-fun e!322063 () Bool)

(declare-fun call!32408 () Bool)

(assert (=> b!559050 (= e!322063 call!32408)))

(declare-fun b!559051 () Bool)

(declare-fun e!322062 () Bool)

(assert (=> b!559051 (= e!322062 e!322063)))

(declare-fun lt!254099 () (_ BitVec 64))

(assert (=> b!559051 (= lt!254099 (select (arr!16879 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!254100 () Unit!17413)

(assert (=> b!559051 (= lt!254100 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!254099 #b00000000000000000000000000000000))))

(assert (=> b!559051 (arrayContainsKey!0 a!3118 lt!254099 #b00000000000000000000000000000000)))

(declare-fun lt!254098 () Unit!17413)

(assert (=> b!559051 (= lt!254098 lt!254100)))

(declare-fun res!350677 () Bool)

(assert (=> b!559051 (= res!350677 (= (seekEntryOrOpen!0 (select (arr!16879 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5284 #b00000000000000000000000000000000)))))

(assert (=> b!559051 (=> (not res!350677) (not e!322063))))

(declare-fun b!559052 () Bool)

(assert (=> b!559052 (= e!322062 call!32408)))

(declare-fun b!559053 () Bool)

(declare-fun e!322061 () Bool)

(assert (=> b!559053 (= e!322061 e!322062)))

(declare-fun c!64531 () Bool)

(assert (=> b!559053 (= c!64531 (validKeyInArray!0 (select (arr!16879 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!83745 () Bool)

(declare-fun res!350676 () Bool)

(assert (=> d!83745 (=> res!350676 e!322061)))

(assert (=> d!83745 (= res!350676 (bvsge #b00000000000000000000000000000000 (size!17243 a!3118)))))

(assert (=> d!83745 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!322061)))

(declare-fun bm!32405 () Bool)

(assert (=> bm!32405 (= call!32408 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!83745 (not res!350676)) b!559053))

(assert (= (and b!559053 c!64531) b!559051))

(assert (= (and b!559053 (not c!64531)) b!559052))

(assert (= (and b!559051 res!350677) b!559050))

(assert (= (or b!559050 b!559052) bm!32405))

(declare-fun m!537151 () Bool)

(assert (=> b!559051 m!537151))

(declare-fun m!537153 () Bool)

(assert (=> b!559051 m!537153))

(declare-fun m!537155 () Bool)

(assert (=> b!559051 m!537155))

(assert (=> b!559051 m!537151))

(declare-fun m!537157 () Bool)

(assert (=> b!559051 m!537157))

(assert (=> b!559053 m!537151))

(assert (=> b!559053 m!537151))

(declare-fun m!537159 () Bool)

(assert (=> b!559053 m!537159))

(declare-fun m!537161 () Bool)

(assert (=> bm!32405 m!537161))

(assert (=> b!558794 d!83745))

(declare-fun d!83747 () Bool)

(assert (=> d!83747 (= (validKeyInArray!0 (select (arr!16879 a!3118) j!142)) (and (not (= (select (arr!16879 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16879 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!558788 d!83747))

(declare-fun d!83751 () Bool)

(assert (=> d!83751 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!558787 d!83751))

(declare-fun b!559060 () Bool)

(declare-fun e!322067 () SeekEntryResult!5284)

(declare-fun lt!254105 () SeekEntryResult!5284)

(assert (=> b!559060 (= e!322067 (seekKeyOrZeroReturnVacant!0 (x!52411 lt!254105) (index!23365 lt!254105) (index!23365 lt!254105) k0!1914 a!3118 mask!3119))))

(declare-fun b!559061 () Bool)

(declare-fun c!64535 () Bool)

(declare-fun lt!254104 () (_ BitVec 64))

(assert (=> b!559061 (= c!64535 (= lt!254104 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!322068 () SeekEntryResult!5284)

(assert (=> b!559061 (= e!322068 e!322067)))

(declare-fun d!83753 () Bool)

(declare-fun lt!254106 () SeekEntryResult!5284)

(assert (=> d!83753 (and (or ((_ is Undefined!5284) lt!254106) (not ((_ is Found!5284) lt!254106)) (and (bvsge (index!23364 lt!254106) #b00000000000000000000000000000000) (bvslt (index!23364 lt!254106) (size!17243 a!3118)))) (or ((_ is Undefined!5284) lt!254106) ((_ is Found!5284) lt!254106) (not ((_ is MissingZero!5284) lt!254106)) (and (bvsge (index!23363 lt!254106) #b00000000000000000000000000000000) (bvslt (index!23363 lt!254106) (size!17243 a!3118)))) (or ((_ is Undefined!5284) lt!254106) ((_ is Found!5284) lt!254106) ((_ is MissingZero!5284) lt!254106) (not ((_ is MissingVacant!5284) lt!254106)) (and (bvsge (index!23366 lt!254106) #b00000000000000000000000000000000) (bvslt (index!23366 lt!254106) (size!17243 a!3118)))) (or ((_ is Undefined!5284) lt!254106) (ite ((_ is Found!5284) lt!254106) (= (select (arr!16879 a!3118) (index!23364 lt!254106)) k0!1914) (ite ((_ is MissingZero!5284) lt!254106) (= (select (arr!16879 a!3118) (index!23363 lt!254106)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5284) lt!254106) (= (select (arr!16879 a!3118) (index!23366 lt!254106)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!322069 () SeekEntryResult!5284)

(assert (=> d!83753 (= lt!254106 e!322069)))

(declare-fun c!64536 () Bool)

(assert (=> d!83753 (= c!64536 (and ((_ is Intermediate!5284) lt!254105) (undefined!6096 lt!254105)))))

(assert (=> d!83753 (= lt!254105 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!83753 (validMask!0 mask!3119)))

(assert (=> d!83753 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!254106)))

(declare-fun b!559062 () Bool)

(assert (=> b!559062 (= e!322067 (MissingZero!5284 (index!23365 lt!254105)))))

(declare-fun b!559063 () Bool)

(assert (=> b!559063 (= e!322069 Undefined!5284)))

(declare-fun b!559064 () Bool)

(assert (=> b!559064 (= e!322068 (Found!5284 (index!23365 lt!254105)))))

(declare-fun b!559065 () Bool)

(assert (=> b!559065 (= e!322069 e!322068)))

(assert (=> b!559065 (= lt!254104 (select (arr!16879 a!3118) (index!23365 lt!254105)))))

(declare-fun c!64537 () Bool)

(assert (=> b!559065 (= c!64537 (= lt!254104 k0!1914))))

(assert (= (and d!83753 c!64536) b!559063))

(assert (= (and d!83753 (not c!64536)) b!559065))

(assert (= (and b!559065 c!64537) b!559064))

(assert (= (and b!559065 (not c!64537)) b!559061))

(assert (= (and b!559061 c!64535) b!559062))

(assert (= (and b!559061 (not c!64535)) b!559060))

(declare-fun m!537177 () Bool)

(assert (=> b!559060 m!537177))

(declare-fun m!537179 () Bool)

(assert (=> d!83753 m!537179))

(assert (=> d!83753 m!536969))

(declare-fun m!537181 () Bool)

(assert (=> d!83753 m!537181))

(declare-fun m!537183 () Bool)

(assert (=> d!83753 m!537183))

(declare-fun m!537185 () Bool)

(assert (=> d!83753 m!537185))

(assert (=> d!83753 m!537179))

(declare-fun m!537187 () Bool)

(assert (=> d!83753 m!537187))

(declare-fun m!537189 () Bool)

(assert (=> b!559065 m!537189))

(assert (=> b!558792 d!83753))

(declare-fun b!559078 () Bool)

(declare-fun e!322078 () Bool)

(declare-fun e!322079 () Bool)

(assert (=> b!559078 (= e!322078 e!322079)))

(declare-fun res!350684 () Bool)

(assert (=> b!559078 (=> (not res!350684) (not e!322079))))

(declare-fun e!322080 () Bool)

(assert (=> b!559078 (= res!350684 (not e!322080))))

(declare-fun res!350686 () Bool)

(assert (=> b!559078 (=> (not res!350686) (not e!322080))))

(assert (=> b!559078 (= res!350686 (validKeyInArray!0 (select (arr!16879 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!559079 () Bool)

(declare-fun e!322081 () Bool)

(declare-fun call!32411 () Bool)

(assert (=> b!559079 (= e!322081 call!32411)))

(declare-fun b!559080 () Bool)

(assert (=> b!559080 (= e!322081 call!32411)))

(declare-fun bm!32408 () Bool)

(declare-fun c!64540 () Bool)

(assert (=> bm!32408 (= call!32411 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64540 (Cons!10862 (select (arr!16879 a!3118) #b00000000000000000000000000000000) Nil!10863) Nil!10863)))))

(declare-fun b!559081 () Bool)

(declare-fun contains!2829 (List!10866 (_ BitVec 64)) Bool)

(assert (=> b!559081 (= e!322080 (contains!2829 Nil!10863 (select (arr!16879 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!559082 () Bool)

(assert (=> b!559082 (= e!322079 e!322081)))

(assert (=> b!559082 (= c!64540 (validKeyInArray!0 (select (arr!16879 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!83755 () Bool)

(declare-fun res!350685 () Bool)

(assert (=> d!83755 (=> res!350685 e!322078)))

(assert (=> d!83755 (= res!350685 (bvsge #b00000000000000000000000000000000 (size!17243 a!3118)))))

(assert (=> d!83755 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10863) e!322078)))

(assert (= (and d!83755 (not res!350685)) b!559078))

(assert (= (and b!559078 res!350686) b!559081))

(assert (= (and b!559078 res!350684) b!559082))

(assert (= (and b!559082 c!64540) b!559080))

(assert (= (and b!559082 (not c!64540)) b!559079))

(assert (= (or b!559080 b!559079) bm!32408))

(assert (=> b!559078 m!537151))

(assert (=> b!559078 m!537151))

(assert (=> b!559078 m!537159))

(assert (=> bm!32408 m!537151))

(declare-fun m!537191 () Bool)

(assert (=> bm!32408 m!537191))

(assert (=> b!559081 m!537151))

(assert (=> b!559081 m!537151))

(declare-fun m!537193 () Bool)

(assert (=> b!559081 m!537193))

(assert (=> b!559082 m!537151))

(assert (=> b!559082 m!537151))

(assert (=> b!559082 m!537159))

(assert (=> b!558791 d!83755))

(declare-fun d!83757 () Bool)

(declare-fun res!350697 () Bool)

(declare-fun e!322096 () Bool)

(assert (=> d!83757 (=> res!350697 e!322096)))

(assert (=> d!83757 (= res!350697 (= (select (arr!16879 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!83757 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!322096)))

(declare-fun b!559103 () Bool)

(declare-fun e!322097 () Bool)

(assert (=> b!559103 (= e!322096 e!322097)))

(declare-fun res!350698 () Bool)

(assert (=> b!559103 (=> (not res!350698) (not e!322097))))

(assert (=> b!559103 (= res!350698 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17243 a!3118)))))

(declare-fun b!559104 () Bool)

(assert (=> b!559104 (= e!322097 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83757 (not res!350697)) b!559103))

(assert (= (and b!559103 res!350698) b!559104))

(assert (=> d!83757 m!537151))

(declare-fun m!537195 () Bool)

(assert (=> b!559104 m!537195))

(assert (=> b!558796 d!83757))

(check-sat (not b!559060) (not b!559047) (not d!83699) (not d!83735) (not bm!32397) (not b!558892) (not b!559078) (not d!83721) (not bm!32405) (not b!559081) (not bm!32408) (not b!558987) (not d!83711) (not b!559053) (not b!558890) (not b!558875) (not b!559104) (not d!83691) (not b!559082) (not b!558996) (not b!559051) (not d!83753))
(check-sat)
