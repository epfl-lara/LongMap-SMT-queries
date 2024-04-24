; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52032 () Bool)

(assert start!52032)

(declare-fun b!568192 () Bool)

(declare-fun res!358480 () Bool)

(declare-fun e!326951 () Bool)

(assert (=> b!568192 (=> (not res!358480) (not e!326951))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!568192 (= res!358480 (validKeyInArray!0 k0!1914))))

(declare-fun b!568193 () Bool)

(declare-fun e!326954 () Bool)

(assert (=> b!568193 (= e!326951 e!326954)))

(declare-fun res!358471 () Bool)

(assert (=> b!568193 (=> (not res!358471) (not e!326954))))

(declare-datatypes ((SeekEntryResult!5506 0))(
  ( (MissingZero!5506 (index!24251 (_ BitVec 32))) (Found!5506 (index!24252 (_ BitVec 32))) (Intermediate!5506 (undefined!6318 Bool) (index!24253 (_ BitVec 32)) (x!53276 (_ BitVec 32))) (Undefined!5506) (MissingVacant!5506 (index!24254 (_ BitVec 32))) )
))
(declare-fun lt!258875 () SeekEntryResult!5506)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!568193 (= res!358471 (or (= lt!258875 (MissingZero!5506 i!1132)) (= lt!258875 (MissingVacant!5506 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35616 0))(
  ( (array!35617 (arr!17101 (Array (_ BitVec 32) (_ BitVec 64))) (size!17465 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35616)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35616 (_ BitVec 32)) SeekEntryResult!5506)

(assert (=> b!568193 (= lt!258875 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!568195 () Bool)

(declare-fun lt!258874 () SeekEntryResult!5506)

(declare-fun e!326953 () Bool)

(get-info :version)

(assert (=> b!568195 (= e!326953 (not (or (not ((_ is Intermediate!5506) lt!258874)) (undefined!6318 lt!258874) (= (select (arr!17101 a!3118) (index!24253 lt!258874)) (select (arr!17101 a!3118) j!142)) (and (bvsge (index!24253 lt!258874) #b00000000000000000000000000000000) (bvslt (index!24253 lt!258874) (size!17465 a!3118))))))))

(declare-fun e!326952 () Bool)

(assert (=> b!568195 e!326952))

(declare-fun res!358477 () Bool)

(assert (=> b!568195 (=> (not res!358477) (not e!326952))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35616 (_ BitVec 32)) Bool)

(assert (=> b!568195 (= res!358477 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17785 0))(
  ( (Unit!17786) )
))
(declare-fun lt!258873 () Unit!17785)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35616 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17785)

(assert (=> b!568195 (= lt!258873 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!568196 () Bool)

(assert (=> b!568196 (= e!326952 (= (seekEntryOrOpen!0 (select (arr!17101 a!3118) j!142) a!3118 mask!3119) (Found!5506 j!142)))))

(declare-fun b!568197 () Bool)

(declare-fun res!358478 () Bool)

(assert (=> b!568197 (=> (not res!358478) (not e!326951))))

(assert (=> b!568197 (= res!358478 (validKeyInArray!0 (select (arr!17101 a!3118) j!142)))))

(declare-fun b!568198 () Bool)

(declare-fun res!358472 () Bool)

(assert (=> b!568198 (=> (not res!358472) (not e!326954))))

(declare-datatypes ((List!11088 0))(
  ( (Nil!11085) (Cons!11084 (h!12102 (_ BitVec 64)) (t!17308 List!11088)) )
))
(declare-fun arrayNoDuplicates!0 (array!35616 (_ BitVec 32) List!11088) Bool)

(assert (=> b!568198 (= res!358472 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11085))))

(declare-fun b!568199 () Bool)

(declare-fun res!358475 () Bool)

(assert (=> b!568199 (=> (not res!358475) (not e!326954))))

(assert (=> b!568199 (= res!358475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!568200 () Bool)

(declare-fun res!358473 () Bool)

(assert (=> b!568200 (=> (not res!358473) (not e!326951))))

(assert (=> b!568200 (= res!358473 (and (= (size!17465 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17465 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17465 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!568201 () Bool)

(declare-fun res!358476 () Bool)

(assert (=> b!568201 (=> (not res!358476) (not e!326951))))

(declare-fun arrayContainsKey!0 (array!35616 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!568201 (= res!358476 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!358479 () Bool)

(assert (=> start!52032 (=> (not res!358479) (not e!326951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52032 (= res!358479 (validMask!0 mask!3119))))

(assert (=> start!52032 e!326951))

(assert (=> start!52032 true))

(declare-fun array_inv!12960 (array!35616) Bool)

(assert (=> start!52032 (array_inv!12960 a!3118)))

(declare-fun b!568194 () Bool)

(assert (=> b!568194 (= e!326954 e!326953)))

(declare-fun res!358474 () Bool)

(assert (=> b!568194 (=> (not res!358474) (not e!326953))))

(declare-fun lt!258876 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35616 (_ BitVec 32)) SeekEntryResult!5506)

(assert (=> b!568194 (= res!358474 (= lt!258874 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258876 (select (store (arr!17101 a!3118) i!1132 k0!1914) j!142) (array!35617 (store (arr!17101 a!3118) i!1132 k0!1914) (size!17465 a!3118)) mask!3119)))))

(declare-fun lt!258877 () (_ BitVec 32))

(assert (=> b!568194 (= lt!258874 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258877 (select (arr!17101 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568194 (= lt!258876 (toIndex!0 (select (store (arr!17101 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!568194 (= lt!258877 (toIndex!0 (select (arr!17101 a!3118) j!142) mask!3119))))

(assert (= (and start!52032 res!358479) b!568200))

(assert (= (and b!568200 res!358473) b!568197))

(assert (= (and b!568197 res!358478) b!568192))

(assert (= (and b!568192 res!358480) b!568201))

(assert (= (and b!568201 res!358476) b!568193))

(assert (= (and b!568193 res!358471) b!568199))

(assert (= (and b!568199 res!358475) b!568198))

(assert (= (and b!568198 res!358472) b!568194))

(assert (= (and b!568194 res!358474) b!568195))

(assert (= (and b!568195 res!358477) b!568196))

(declare-fun m!546911 () Bool)

(assert (=> b!568198 m!546911))

(declare-fun m!546913 () Bool)

(assert (=> b!568201 m!546913))

(declare-fun m!546915 () Bool)

(assert (=> start!52032 m!546915))

(declare-fun m!546917 () Bool)

(assert (=> start!52032 m!546917))

(declare-fun m!546919 () Bool)

(assert (=> b!568199 m!546919))

(declare-fun m!546921 () Bool)

(assert (=> b!568196 m!546921))

(assert (=> b!568196 m!546921))

(declare-fun m!546923 () Bool)

(assert (=> b!568196 m!546923))

(declare-fun m!546925 () Bool)

(assert (=> b!568192 m!546925))

(declare-fun m!546927 () Bool)

(assert (=> b!568193 m!546927))

(assert (=> b!568197 m!546921))

(assert (=> b!568197 m!546921))

(declare-fun m!546929 () Bool)

(assert (=> b!568197 m!546929))

(assert (=> b!568194 m!546921))

(declare-fun m!546931 () Bool)

(assert (=> b!568194 m!546931))

(assert (=> b!568194 m!546921))

(declare-fun m!546933 () Bool)

(assert (=> b!568194 m!546933))

(declare-fun m!546935 () Bool)

(assert (=> b!568194 m!546935))

(assert (=> b!568194 m!546921))

(declare-fun m!546937 () Bool)

(assert (=> b!568194 m!546937))

(assert (=> b!568194 m!546933))

(declare-fun m!546939 () Bool)

(assert (=> b!568194 m!546939))

(assert (=> b!568194 m!546933))

(declare-fun m!546941 () Bool)

(assert (=> b!568194 m!546941))

(declare-fun m!546943 () Bool)

(assert (=> b!568195 m!546943))

(assert (=> b!568195 m!546921))

(declare-fun m!546945 () Bool)

(assert (=> b!568195 m!546945))

(declare-fun m!546947 () Bool)

(assert (=> b!568195 m!546947))

(check-sat (not b!568197) (not b!568195) (not b!568194) (not b!568198) (not start!52032) (not b!568193) (not b!568192) (not b!568196) (not b!568201) (not b!568199))
(check-sat)
(get-model)

(declare-fun bm!32544 () Bool)

(declare-fun call!32547 () Bool)

(assert (=> bm!32544 (= call!32547 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!568270 () Bool)

(declare-fun e!326994 () Bool)

(declare-fun e!326992 () Bool)

(assert (=> b!568270 (= e!326994 e!326992)))

(declare-fun lt!258915 () (_ BitVec 64))

(assert (=> b!568270 (= lt!258915 (select (arr!17101 a!3118) j!142))))

(declare-fun lt!258914 () Unit!17785)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35616 (_ BitVec 64) (_ BitVec 32)) Unit!17785)

(assert (=> b!568270 (= lt!258914 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258915 j!142))))

(assert (=> b!568270 (arrayContainsKey!0 a!3118 lt!258915 #b00000000000000000000000000000000)))

(declare-fun lt!258916 () Unit!17785)

(assert (=> b!568270 (= lt!258916 lt!258914)))

(declare-fun res!358545 () Bool)

(assert (=> b!568270 (= res!358545 (= (seekEntryOrOpen!0 (select (arr!17101 a!3118) j!142) a!3118 mask!3119) (Found!5506 j!142)))))

(assert (=> b!568270 (=> (not res!358545) (not e!326992))))

(declare-fun b!568271 () Bool)

(assert (=> b!568271 (= e!326992 call!32547)))

(declare-fun b!568272 () Bool)

(declare-fun e!326993 () Bool)

(assert (=> b!568272 (= e!326993 e!326994)))

(declare-fun c!65216 () Bool)

(assert (=> b!568272 (= c!65216 (validKeyInArray!0 (select (arr!17101 a!3118) j!142)))))

(declare-fun b!568273 () Bool)

(assert (=> b!568273 (= e!326994 call!32547)))

(declare-fun d!84499 () Bool)

(declare-fun res!358546 () Bool)

(assert (=> d!84499 (=> res!358546 e!326993)))

(assert (=> d!84499 (= res!358546 (bvsge j!142 (size!17465 a!3118)))))

(assert (=> d!84499 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!326993)))

(assert (= (and d!84499 (not res!358546)) b!568272))

(assert (= (and b!568272 c!65216) b!568270))

(assert (= (and b!568272 (not c!65216)) b!568273))

(assert (= (and b!568270 res!358545) b!568271))

(assert (= (or b!568271 b!568273) bm!32544))

(declare-fun m!547025 () Bool)

(assert (=> bm!32544 m!547025))

(assert (=> b!568270 m!546921))

(declare-fun m!547027 () Bool)

(assert (=> b!568270 m!547027))

(declare-fun m!547029 () Bool)

(assert (=> b!568270 m!547029))

(assert (=> b!568270 m!546921))

(assert (=> b!568270 m!546923))

(assert (=> b!568272 m!546921))

(assert (=> b!568272 m!546921))

(assert (=> b!568272 m!546929))

(assert (=> b!568195 d!84499))

(declare-fun d!84501 () Bool)

(assert (=> d!84501 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!258919 () Unit!17785)

(declare-fun choose!38 (array!35616 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17785)

(assert (=> d!84501 (= lt!258919 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84501 (validMask!0 mask!3119)))

(assert (=> d!84501 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!258919)))

(declare-fun bs!17648 () Bool)

(assert (= bs!17648 d!84501))

(assert (=> bs!17648 m!546945))

(declare-fun m!547031 () Bool)

(assert (=> bs!17648 m!547031))

(assert (=> bs!17648 m!546915))

(assert (=> b!568195 d!84501))

(declare-fun d!84505 () Bool)

(assert (=> d!84505 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52032 d!84505))

(declare-fun d!84511 () Bool)

(assert (=> d!84511 (= (array_inv!12960 a!3118) (bvsge (size!17465 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52032 d!84511))

(declare-fun d!84517 () Bool)

(declare-fun res!358559 () Bool)

(declare-fun e!327011 () Bool)

(assert (=> d!84517 (=> res!358559 e!327011)))

(assert (=> d!84517 (= res!358559 (= (select (arr!17101 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84517 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!327011)))

(declare-fun b!568294 () Bool)

(declare-fun e!327012 () Bool)

(assert (=> b!568294 (= e!327011 e!327012)))

(declare-fun res!358560 () Bool)

(assert (=> b!568294 (=> (not res!358560) (not e!327012))))

(assert (=> b!568294 (= res!358560 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17465 a!3118)))))

(declare-fun b!568295 () Bool)

(assert (=> b!568295 (= e!327012 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84517 (not res!358559)) b!568294))

(assert (= (and b!568294 res!358560) b!568295))

(declare-fun m!547051 () Bool)

(assert (=> d!84517 m!547051))

(declare-fun m!547053 () Bool)

(assert (=> b!568295 m!547053))

(assert (=> b!568201 d!84517))

(declare-fun b!568338 () Bool)

(declare-fun e!327040 () SeekEntryResult!5506)

(declare-fun lt!258959 () SeekEntryResult!5506)

(assert (=> b!568338 (= e!327040 (Found!5506 (index!24253 lt!258959)))))

(declare-fun b!568339 () Bool)

(declare-fun e!327041 () SeekEntryResult!5506)

(assert (=> b!568339 (= e!327041 e!327040)))

(declare-fun lt!258960 () (_ BitVec 64))

(assert (=> b!568339 (= lt!258960 (select (arr!17101 a!3118) (index!24253 lt!258959)))))

(declare-fun c!65237 () Bool)

(assert (=> b!568339 (= c!65237 (= lt!258960 (select (arr!17101 a!3118) j!142)))))

(declare-fun b!568340 () Bool)

(declare-fun e!327042 () SeekEntryResult!5506)

(assert (=> b!568340 (= e!327042 (MissingZero!5506 (index!24253 lt!258959)))))

(declare-fun b!568341 () Bool)

(assert (=> b!568341 (= e!327041 Undefined!5506)))

(declare-fun b!568342 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35616 (_ BitVec 32)) SeekEntryResult!5506)

(assert (=> b!568342 (= e!327042 (seekKeyOrZeroReturnVacant!0 (x!53276 lt!258959) (index!24253 lt!258959) (index!24253 lt!258959) (select (arr!17101 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!84523 () Bool)

(declare-fun lt!258961 () SeekEntryResult!5506)

(assert (=> d!84523 (and (or ((_ is Undefined!5506) lt!258961) (not ((_ is Found!5506) lt!258961)) (and (bvsge (index!24252 lt!258961) #b00000000000000000000000000000000) (bvslt (index!24252 lt!258961) (size!17465 a!3118)))) (or ((_ is Undefined!5506) lt!258961) ((_ is Found!5506) lt!258961) (not ((_ is MissingZero!5506) lt!258961)) (and (bvsge (index!24251 lt!258961) #b00000000000000000000000000000000) (bvslt (index!24251 lt!258961) (size!17465 a!3118)))) (or ((_ is Undefined!5506) lt!258961) ((_ is Found!5506) lt!258961) ((_ is MissingZero!5506) lt!258961) (not ((_ is MissingVacant!5506) lt!258961)) (and (bvsge (index!24254 lt!258961) #b00000000000000000000000000000000) (bvslt (index!24254 lt!258961) (size!17465 a!3118)))) (or ((_ is Undefined!5506) lt!258961) (ite ((_ is Found!5506) lt!258961) (= (select (arr!17101 a!3118) (index!24252 lt!258961)) (select (arr!17101 a!3118) j!142)) (ite ((_ is MissingZero!5506) lt!258961) (= (select (arr!17101 a!3118) (index!24251 lt!258961)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5506) lt!258961) (= (select (arr!17101 a!3118) (index!24254 lt!258961)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84523 (= lt!258961 e!327041)))

(declare-fun c!65236 () Bool)

(assert (=> d!84523 (= c!65236 (and ((_ is Intermediate!5506) lt!258959) (undefined!6318 lt!258959)))))

(assert (=> d!84523 (= lt!258959 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17101 a!3118) j!142) mask!3119) (select (arr!17101 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84523 (validMask!0 mask!3119)))

(assert (=> d!84523 (= (seekEntryOrOpen!0 (select (arr!17101 a!3118) j!142) a!3118 mask!3119) lt!258961)))

(declare-fun b!568343 () Bool)

(declare-fun c!65238 () Bool)

(assert (=> b!568343 (= c!65238 (= lt!258960 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!568343 (= e!327040 e!327042)))

(assert (= (and d!84523 c!65236) b!568341))

(assert (= (and d!84523 (not c!65236)) b!568339))

(assert (= (and b!568339 c!65237) b!568338))

(assert (= (and b!568339 (not c!65237)) b!568343))

(assert (= (and b!568343 c!65238) b!568340))

(assert (= (and b!568343 (not c!65238)) b!568342))

(declare-fun m!547069 () Bool)

(assert (=> b!568339 m!547069))

(assert (=> b!568342 m!546921))

(declare-fun m!547071 () Bool)

(assert (=> b!568342 m!547071))

(declare-fun m!547073 () Bool)

(assert (=> d!84523 m!547073))

(assert (=> d!84523 m!546931))

(assert (=> d!84523 m!546921))

(declare-fun m!547075 () Bool)

(assert (=> d!84523 m!547075))

(assert (=> d!84523 m!546915))

(declare-fun m!547077 () Bool)

(assert (=> d!84523 m!547077))

(assert (=> d!84523 m!546921))

(assert (=> d!84523 m!546931))

(declare-fun m!547079 () Bool)

(assert (=> d!84523 m!547079))

(assert (=> b!568196 d!84523))

(declare-fun bm!32554 () Bool)

(declare-fun call!32557 () Bool)

(declare-fun c!65244 () Bool)

(assert (=> bm!32554 (= call!32557 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65244 (Cons!11084 (select (arr!17101 a!3118) #b00000000000000000000000000000000) Nil!11085) Nil!11085)))))

(declare-fun b!568366 () Bool)

(declare-fun e!327060 () Bool)

(assert (=> b!568366 (= e!327060 call!32557)))

(declare-fun b!568367 () Bool)

(declare-fun e!327062 () Bool)

(declare-fun contains!2846 (List!11088 (_ BitVec 64)) Bool)

(assert (=> b!568367 (= e!327062 (contains!2846 Nil!11085 (select (arr!17101 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!568368 () Bool)

(declare-fun e!327063 () Bool)

(declare-fun e!327061 () Bool)

(assert (=> b!568368 (= e!327063 e!327061)))

(declare-fun res!358585 () Bool)

(assert (=> b!568368 (=> (not res!358585) (not e!327061))))

(assert (=> b!568368 (= res!358585 (not e!327062))))

(declare-fun res!358586 () Bool)

(assert (=> b!568368 (=> (not res!358586) (not e!327062))))

(assert (=> b!568368 (= res!358586 (validKeyInArray!0 (select (arr!17101 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!568370 () Bool)

(assert (=> b!568370 (= e!327061 e!327060)))

(assert (=> b!568370 (= c!65244 (validKeyInArray!0 (select (arr!17101 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!568369 () Bool)

(assert (=> b!568369 (= e!327060 call!32557)))

(declare-fun d!84533 () Bool)

(declare-fun res!358587 () Bool)

(assert (=> d!84533 (=> res!358587 e!327063)))

(assert (=> d!84533 (= res!358587 (bvsge #b00000000000000000000000000000000 (size!17465 a!3118)))))

(assert (=> d!84533 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11085) e!327063)))

(assert (= (and d!84533 (not res!358587)) b!568368))

(assert (= (and b!568368 res!358586) b!568367))

(assert (= (and b!568368 res!358585) b!568370))

(assert (= (and b!568370 c!65244) b!568369))

(assert (= (and b!568370 (not c!65244)) b!568366))

(assert (= (or b!568369 b!568366) bm!32554))

(assert (=> bm!32554 m!547051))

(declare-fun m!547097 () Bool)

(assert (=> bm!32554 m!547097))

(assert (=> b!568367 m!547051))

(assert (=> b!568367 m!547051))

(declare-fun m!547099 () Bool)

(assert (=> b!568367 m!547099))

(assert (=> b!568368 m!547051))

(assert (=> b!568368 m!547051))

(declare-fun m!547101 () Bool)

(assert (=> b!568368 m!547101))

(assert (=> b!568370 m!547051))

(assert (=> b!568370 m!547051))

(assert (=> b!568370 m!547101))

(assert (=> b!568198 d!84533))

(declare-fun d!84539 () Bool)

(assert (=> d!84539 (= (validKeyInArray!0 (select (arr!17101 a!3118) j!142)) (and (not (= (select (arr!17101 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17101 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!568197 d!84539))

(declare-fun d!84541 () Bool)

(assert (=> d!84541 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!568192 d!84541))

(declare-fun bm!32555 () Bool)

(declare-fun call!32558 () Bool)

(assert (=> bm!32555 (= call!32558 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!568375 () Bool)

(declare-fun e!327068 () Bool)

(declare-fun e!327066 () Bool)

(assert (=> b!568375 (= e!327068 e!327066)))

(declare-fun lt!258970 () (_ BitVec 64))

(assert (=> b!568375 (= lt!258970 (select (arr!17101 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!258969 () Unit!17785)

(assert (=> b!568375 (= lt!258969 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258970 #b00000000000000000000000000000000))))

(assert (=> b!568375 (arrayContainsKey!0 a!3118 lt!258970 #b00000000000000000000000000000000)))

(declare-fun lt!258971 () Unit!17785)

(assert (=> b!568375 (= lt!258971 lt!258969)))

(declare-fun res!358588 () Bool)

(assert (=> b!568375 (= res!358588 (= (seekEntryOrOpen!0 (select (arr!17101 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5506 #b00000000000000000000000000000000)))))

(assert (=> b!568375 (=> (not res!358588) (not e!327066))))

(declare-fun b!568376 () Bool)

(assert (=> b!568376 (= e!327066 call!32558)))

(declare-fun b!568377 () Bool)

(declare-fun e!327067 () Bool)

(assert (=> b!568377 (= e!327067 e!327068)))

(declare-fun c!65247 () Bool)

(assert (=> b!568377 (= c!65247 (validKeyInArray!0 (select (arr!17101 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!568378 () Bool)

(assert (=> b!568378 (= e!327068 call!32558)))

(declare-fun d!84543 () Bool)

(declare-fun res!358589 () Bool)

(assert (=> d!84543 (=> res!358589 e!327067)))

(assert (=> d!84543 (= res!358589 (bvsge #b00000000000000000000000000000000 (size!17465 a!3118)))))

(assert (=> d!84543 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!327067)))

(assert (= (and d!84543 (not res!358589)) b!568377))

(assert (= (and b!568377 c!65247) b!568375))

(assert (= (and b!568377 (not c!65247)) b!568378))

(assert (= (and b!568375 res!358588) b!568376))

(assert (= (or b!568376 b!568378) bm!32555))

(declare-fun m!547103 () Bool)

(assert (=> bm!32555 m!547103))

(assert (=> b!568375 m!547051))

(declare-fun m!547105 () Bool)

(assert (=> b!568375 m!547105))

(declare-fun m!547107 () Bool)

(assert (=> b!568375 m!547107))

(assert (=> b!568375 m!547051))

(declare-fun m!547109 () Bool)

(assert (=> b!568375 m!547109))

(assert (=> b!568377 m!547051))

(assert (=> b!568377 m!547051))

(assert (=> b!568377 m!547101))

(assert (=> b!568199 d!84543))

(declare-fun b!568442 () Bool)

(declare-fun e!327109 () SeekEntryResult!5506)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568442 (= e!327109 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258876 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (store (arr!17101 a!3118) i!1132 k0!1914) j!142) (array!35617 (store (arr!17101 a!3118) i!1132 k0!1914) (size!17465 a!3118)) mask!3119))))

(declare-fun b!568443 () Bool)

(declare-fun e!327107 () Bool)

(declare-fun lt!258991 () SeekEntryResult!5506)

(assert (=> b!568443 (= e!327107 (bvsge (x!53276 lt!258991) #b01111111111111111111111111111110))))

(declare-fun b!568444 () Bool)

(assert (=> b!568444 (and (bvsge (index!24253 lt!258991) #b00000000000000000000000000000000) (bvslt (index!24253 lt!258991) (size!17465 (array!35617 (store (arr!17101 a!3118) i!1132 k0!1914) (size!17465 a!3118)))))))

(declare-fun res!358607 () Bool)

(assert (=> b!568444 (= res!358607 (= (select (arr!17101 (array!35617 (store (arr!17101 a!3118) i!1132 k0!1914) (size!17465 a!3118))) (index!24253 lt!258991)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!327108 () Bool)

(assert (=> b!568444 (=> res!358607 e!327108)))

(declare-fun d!84545 () Bool)

(assert (=> d!84545 e!327107))

(declare-fun c!65272 () Bool)

(assert (=> d!84545 (= c!65272 (and ((_ is Intermediate!5506) lt!258991) (undefined!6318 lt!258991)))))

(declare-fun e!327110 () SeekEntryResult!5506)

(assert (=> d!84545 (= lt!258991 e!327110)))

(declare-fun c!65273 () Bool)

(assert (=> d!84545 (= c!65273 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!258990 () (_ BitVec 64))

(assert (=> d!84545 (= lt!258990 (select (arr!17101 (array!35617 (store (arr!17101 a!3118) i!1132 k0!1914) (size!17465 a!3118))) lt!258876))))

(assert (=> d!84545 (validMask!0 mask!3119)))

(assert (=> d!84545 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258876 (select (store (arr!17101 a!3118) i!1132 k0!1914) j!142) (array!35617 (store (arr!17101 a!3118) i!1132 k0!1914) (size!17465 a!3118)) mask!3119) lt!258991)))

(declare-fun b!568445 () Bool)

(assert (=> b!568445 (and (bvsge (index!24253 lt!258991) #b00000000000000000000000000000000) (bvslt (index!24253 lt!258991) (size!17465 (array!35617 (store (arr!17101 a!3118) i!1132 k0!1914) (size!17465 a!3118)))))))

(assert (=> b!568445 (= e!327108 (= (select (arr!17101 (array!35617 (store (arr!17101 a!3118) i!1132 k0!1914) (size!17465 a!3118))) (index!24253 lt!258991)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!568446 () Bool)

(assert (=> b!568446 (= e!327110 (Intermediate!5506 true lt!258876 #b00000000000000000000000000000000))))

(declare-fun b!568447 () Bool)

(assert (=> b!568447 (and (bvsge (index!24253 lt!258991) #b00000000000000000000000000000000) (bvslt (index!24253 lt!258991) (size!17465 (array!35617 (store (arr!17101 a!3118) i!1132 k0!1914) (size!17465 a!3118)))))))

(declare-fun res!358609 () Bool)

(assert (=> b!568447 (= res!358609 (= (select (arr!17101 (array!35617 (store (arr!17101 a!3118) i!1132 k0!1914) (size!17465 a!3118))) (index!24253 lt!258991)) (select (store (arr!17101 a!3118) i!1132 k0!1914) j!142)))))

(assert (=> b!568447 (=> res!358609 e!327108)))

(declare-fun e!327111 () Bool)

(assert (=> b!568447 (= e!327111 e!327108)))

(declare-fun b!568448 () Bool)

(assert (=> b!568448 (= e!327109 (Intermediate!5506 false lt!258876 #b00000000000000000000000000000000))))

(declare-fun b!568449 () Bool)

(assert (=> b!568449 (= e!327110 e!327109)))

(declare-fun c!65271 () Bool)

(assert (=> b!568449 (= c!65271 (or (= lt!258990 (select (store (arr!17101 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!258990 lt!258990) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!568450 () Bool)

(assert (=> b!568450 (= e!327107 e!327111)))

(declare-fun res!358608 () Bool)

(assert (=> b!568450 (= res!358608 (and ((_ is Intermediate!5506) lt!258991) (not (undefined!6318 lt!258991)) (bvslt (x!53276 lt!258991) #b01111111111111111111111111111110) (bvsge (x!53276 lt!258991) #b00000000000000000000000000000000) (bvsge (x!53276 lt!258991) #b00000000000000000000000000000000)))))

(assert (=> b!568450 (=> (not res!358608) (not e!327111))))

(assert (= (and d!84545 c!65273) b!568446))

(assert (= (and d!84545 (not c!65273)) b!568449))

(assert (= (and b!568449 c!65271) b!568448))

(assert (= (and b!568449 (not c!65271)) b!568442))

(assert (= (and d!84545 c!65272) b!568443))

(assert (= (and d!84545 (not c!65272)) b!568450))

(assert (= (and b!568450 res!358608) b!568447))

(assert (= (and b!568447 (not res!358609)) b!568444))

(assert (= (and b!568444 (not res!358607)) b!568445))

(declare-fun m!547163 () Bool)

(assert (=> b!568444 m!547163))

(assert (=> b!568447 m!547163))

(declare-fun m!547165 () Bool)

(assert (=> d!84545 m!547165))

(assert (=> d!84545 m!546915))

(declare-fun m!547167 () Bool)

(assert (=> b!568442 m!547167))

(assert (=> b!568442 m!547167))

(assert (=> b!568442 m!546933))

(declare-fun m!547169 () Bool)

(assert (=> b!568442 m!547169))

(assert (=> b!568445 m!547163))

(assert (=> b!568194 d!84545))

(declare-fun b!568451 () Bool)

(declare-fun e!327114 () SeekEntryResult!5506)

(assert (=> b!568451 (= e!327114 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258877 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (arr!17101 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!568452 () Bool)

(declare-fun e!327112 () Bool)

(declare-fun lt!258993 () SeekEntryResult!5506)

(assert (=> b!568452 (= e!327112 (bvsge (x!53276 lt!258993) #b01111111111111111111111111111110))))

(declare-fun b!568453 () Bool)

(assert (=> b!568453 (and (bvsge (index!24253 lt!258993) #b00000000000000000000000000000000) (bvslt (index!24253 lt!258993) (size!17465 a!3118)))))

(declare-fun res!358610 () Bool)

(assert (=> b!568453 (= res!358610 (= (select (arr!17101 a!3118) (index!24253 lt!258993)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!327113 () Bool)

(assert (=> b!568453 (=> res!358610 e!327113)))

(declare-fun d!84563 () Bool)

(assert (=> d!84563 e!327112))

(declare-fun c!65275 () Bool)

(assert (=> d!84563 (= c!65275 (and ((_ is Intermediate!5506) lt!258993) (undefined!6318 lt!258993)))))

(declare-fun e!327115 () SeekEntryResult!5506)

(assert (=> d!84563 (= lt!258993 e!327115)))

(declare-fun c!65276 () Bool)

(assert (=> d!84563 (= c!65276 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!258992 () (_ BitVec 64))

(assert (=> d!84563 (= lt!258992 (select (arr!17101 a!3118) lt!258877))))

(assert (=> d!84563 (validMask!0 mask!3119)))

(assert (=> d!84563 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258877 (select (arr!17101 a!3118) j!142) a!3118 mask!3119) lt!258993)))

(declare-fun b!568454 () Bool)

(assert (=> b!568454 (and (bvsge (index!24253 lt!258993) #b00000000000000000000000000000000) (bvslt (index!24253 lt!258993) (size!17465 a!3118)))))

(assert (=> b!568454 (= e!327113 (= (select (arr!17101 a!3118) (index!24253 lt!258993)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!568455 () Bool)

(assert (=> b!568455 (= e!327115 (Intermediate!5506 true lt!258877 #b00000000000000000000000000000000))))

(declare-fun b!568456 () Bool)

(assert (=> b!568456 (and (bvsge (index!24253 lt!258993) #b00000000000000000000000000000000) (bvslt (index!24253 lt!258993) (size!17465 a!3118)))))

(declare-fun res!358612 () Bool)

(assert (=> b!568456 (= res!358612 (= (select (arr!17101 a!3118) (index!24253 lt!258993)) (select (arr!17101 a!3118) j!142)))))

(assert (=> b!568456 (=> res!358612 e!327113)))

(declare-fun e!327116 () Bool)

(assert (=> b!568456 (= e!327116 e!327113)))

(declare-fun b!568457 () Bool)

(assert (=> b!568457 (= e!327114 (Intermediate!5506 false lt!258877 #b00000000000000000000000000000000))))

(declare-fun b!568458 () Bool)

(assert (=> b!568458 (= e!327115 e!327114)))

(declare-fun c!65274 () Bool)

(assert (=> b!568458 (= c!65274 (or (= lt!258992 (select (arr!17101 a!3118) j!142)) (= (bvadd lt!258992 lt!258992) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!568459 () Bool)

(assert (=> b!568459 (= e!327112 e!327116)))

(declare-fun res!358611 () Bool)

(assert (=> b!568459 (= res!358611 (and ((_ is Intermediate!5506) lt!258993) (not (undefined!6318 lt!258993)) (bvslt (x!53276 lt!258993) #b01111111111111111111111111111110) (bvsge (x!53276 lt!258993) #b00000000000000000000000000000000) (bvsge (x!53276 lt!258993) #b00000000000000000000000000000000)))))

(assert (=> b!568459 (=> (not res!358611) (not e!327116))))

(assert (= (and d!84563 c!65276) b!568455))

(assert (= (and d!84563 (not c!65276)) b!568458))

(assert (= (and b!568458 c!65274) b!568457))

(assert (= (and b!568458 (not c!65274)) b!568451))

(assert (= (and d!84563 c!65275) b!568452))

(assert (= (and d!84563 (not c!65275)) b!568459))

(assert (= (and b!568459 res!358611) b!568456))

(assert (= (and b!568456 (not res!358612)) b!568453))

(assert (= (and b!568453 (not res!358610)) b!568454))

(declare-fun m!547171 () Bool)

(assert (=> b!568453 m!547171))

(assert (=> b!568456 m!547171))

(declare-fun m!547173 () Bool)

(assert (=> d!84563 m!547173))

(assert (=> d!84563 m!546915))

(declare-fun m!547175 () Bool)

(assert (=> b!568451 m!547175))

(assert (=> b!568451 m!547175))

(assert (=> b!568451 m!546921))

(declare-fun m!547177 () Bool)

(assert (=> b!568451 m!547177))

(assert (=> b!568454 m!547171))

(assert (=> b!568194 d!84563))

(declare-fun d!84565 () Bool)

(declare-fun lt!259003 () (_ BitVec 32))

(declare-fun lt!259002 () (_ BitVec 32))

(assert (=> d!84565 (= lt!259003 (bvmul (bvxor lt!259002 (bvlshr lt!259002 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84565 (= lt!259002 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17101 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17101 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84565 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358613 (let ((h!12105 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17101 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17101 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53281 (bvmul (bvxor h!12105 (bvlshr h!12105 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53281 (bvlshr x!53281 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358613 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358613 #b00000000000000000000000000000000))))))

(assert (=> d!84565 (= (toIndex!0 (select (store (arr!17101 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!259003 (bvlshr lt!259003 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!568194 d!84565))

(declare-fun d!84567 () Bool)

(declare-fun lt!259007 () (_ BitVec 32))

(declare-fun lt!259006 () (_ BitVec 32))

(assert (=> d!84567 (= lt!259007 (bvmul (bvxor lt!259006 (bvlshr lt!259006 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84567 (= lt!259006 ((_ extract 31 0) (bvand (bvxor (select (arr!17101 a!3118) j!142) (bvlshr (select (arr!17101 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84567 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358613 (let ((h!12105 ((_ extract 31 0) (bvand (bvxor (select (arr!17101 a!3118) j!142) (bvlshr (select (arr!17101 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53281 (bvmul (bvxor h!12105 (bvlshr h!12105 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53281 (bvlshr x!53281 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358613 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358613 #b00000000000000000000000000000000))))))

(assert (=> d!84567 (= (toIndex!0 (select (arr!17101 a!3118) j!142) mask!3119) (bvand (bvxor lt!259007 (bvlshr lt!259007 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!568194 d!84567))

(declare-fun b!568491 () Bool)

(declare-fun e!327134 () SeekEntryResult!5506)

(declare-fun lt!259012 () SeekEntryResult!5506)

(assert (=> b!568491 (= e!327134 (Found!5506 (index!24253 lt!259012)))))

(declare-fun b!568492 () Bool)

(declare-fun e!327135 () SeekEntryResult!5506)

(assert (=> b!568492 (= e!327135 e!327134)))

(declare-fun lt!259013 () (_ BitVec 64))

(assert (=> b!568492 (= lt!259013 (select (arr!17101 a!3118) (index!24253 lt!259012)))))

(declare-fun c!65289 () Bool)

(assert (=> b!568492 (= c!65289 (= lt!259013 k0!1914))))

(declare-fun b!568493 () Bool)

(declare-fun e!327136 () SeekEntryResult!5506)

(assert (=> b!568493 (= e!327136 (MissingZero!5506 (index!24253 lt!259012)))))

(declare-fun b!568494 () Bool)

(assert (=> b!568494 (= e!327135 Undefined!5506)))

(declare-fun b!568495 () Bool)

(assert (=> b!568495 (= e!327136 (seekKeyOrZeroReturnVacant!0 (x!53276 lt!259012) (index!24253 lt!259012) (index!24253 lt!259012) k0!1914 a!3118 mask!3119))))

(declare-fun d!84569 () Bool)

(declare-fun lt!259014 () SeekEntryResult!5506)

(assert (=> d!84569 (and (or ((_ is Undefined!5506) lt!259014) (not ((_ is Found!5506) lt!259014)) (and (bvsge (index!24252 lt!259014) #b00000000000000000000000000000000) (bvslt (index!24252 lt!259014) (size!17465 a!3118)))) (or ((_ is Undefined!5506) lt!259014) ((_ is Found!5506) lt!259014) (not ((_ is MissingZero!5506) lt!259014)) (and (bvsge (index!24251 lt!259014) #b00000000000000000000000000000000) (bvslt (index!24251 lt!259014) (size!17465 a!3118)))) (or ((_ is Undefined!5506) lt!259014) ((_ is Found!5506) lt!259014) ((_ is MissingZero!5506) lt!259014) (not ((_ is MissingVacant!5506) lt!259014)) (and (bvsge (index!24254 lt!259014) #b00000000000000000000000000000000) (bvslt (index!24254 lt!259014) (size!17465 a!3118)))) (or ((_ is Undefined!5506) lt!259014) (ite ((_ is Found!5506) lt!259014) (= (select (arr!17101 a!3118) (index!24252 lt!259014)) k0!1914) (ite ((_ is MissingZero!5506) lt!259014) (= (select (arr!17101 a!3118) (index!24251 lt!259014)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5506) lt!259014) (= (select (arr!17101 a!3118) (index!24254 lt!259014)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84569 (= lt!259014 e!327135)))

(declare-fun c!65288 () Bool)

(assert (=> d!84569 (= c!65288 (and ((_ is Intermediate!5506) lt!259012) (undefined!6318 lt!259012)))))

(assert (=> d!84569 (= lt!259012 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84569 (validMask!0 mask!3119)))

(assert (=> d!84569 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!259014)))

(declare-fun b!568496 () Bool)

(declare-fun c!65290 () Bool)

(assert (=> b!568496 (= c!65290 (= lt!259013 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!568496 (= e!327134 e!327136)))

(assert (= (and d!84569 c!65288) b!568494))

(assert (= (and d!84569 (not c!65288)) b!568492))

(assert (= (and b!568492 c!65289) b!568491))

(assert (= (and b!568492 (not c!65289)) b!568496))

(assert (= (and b!568496 c!65290) b!568493))

(assert (= (and b!568496 (not c!65290)) b!568495))

(declare-fun m!547187 () Bool)

(assert (=> b!568492 m!547187))

(declare-fun m!547189 () Bool)

(assert (=> b!568495 m!547189))

(declare-fun m!547191 () Bool)

(assert (=> d!84569 m!547191))

(declare-fun m!547193 () Bool)

(assert (=> d!84569 m!547193))

(declare-fun m!547195 () Bool)

(assert (=> d!84569 m!547195))

(assert (=> d!84569 m!546915))

(declare-fun m!547197 () Bool)

(assert (=> d!84569 m!547197))

(assert (=> d!84569 m!547193))

(declare-fun m!547199 () Bool)

(assert (=> d!84569 m!547199))

(assert (=> b!568193 d!84569))

(check-sat (not b!568342) (not d!84523) (not b!568451) (not d!84501) (not b!568367) (not bm!32555) (not b!568295) (not d!84569) (not b!568377) (not b!568442) (not b!568495) (not bm!32554) (not b!568375) (not d!84563) (not b!568270) (not bm!32544) (not b!568368) (not b!568272) (not d!84545) (not b!568370))
(check-sat)
