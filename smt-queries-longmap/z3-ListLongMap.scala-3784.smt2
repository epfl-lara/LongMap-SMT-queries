; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51760 () Bool)

(assert start!51760)

(declare-fun b!566393 () Bool)

(declare-fun res!357367 () Bool)

(declare-fun e!325948 () Bool)

(assert (=> b!566393 (=> (not res!357367) (not e!325948))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566393 (= res!357367 (validKeyInArray!0 k0!1914))))

(declare-fun b!566394 () Bool)

(declare-fun res!357365 () Bool)

(declare-fun e!325946 () Bool)

(assert (=> b!566394 (=> (not res!357365) (not e!325946))))

(declare-datatypes ((array!35568 0))(
  ( (array!35569 (arr!17083 (Array (_ BitVec 32) (_ BitVec 64))) (size!17447 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35568)

(declare-datatypes ((List!11163 0))(
  ( (Nil!11160) (Cons!11159 (h!12165 (_ BitVec 64)) (t!17391 List!11163)) )
))
(declare-fun arrayNoDuplicates!0 (array!35568 (_ BitVec 32) List!11163) Bool)

(assert (=> b!566394 (= res!357365 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11160))))

(declare-fun b!566395 () Bool)

(assert (=> b!566395 (= e!325948 e!325946)))

(declare-fun res!357363 () Bool)

(assert (=> b!566395 (=> (not res!357363) (not e!325946))))

(declare-datatypes ((SeekEntryResult!5532 0))(
  ( (MissingZero!5532 (index!24355 (_ BitVec 32))) (Found!5532 (index!24356 (_ BitVec 32))) (Intermediate!5532 (undefined!6344 Bool) (index!24357 (_ BitVec 32)) (x!53217 (_ BitVec 32))) (Undefined!5532) (MissingVacant!5532 (index!24358 (_ BitVec 32))) )
))
(declare-fun lt!258112 () SeekEntryResult!5532)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!566395 (= res!357363 (or (= lt!258112 (MissingZero!5532 i!1132)) (= lt!258112 (MissingVacant!5532 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35568 (_ BitVec 32)) SeekEntryResult!5532)

(assert (=> b!566395 (= lt!258112 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!566396 () Bool)

(declare-fun e!325950 () Bool)

(assert (=> b!566396 (= e!325946 e!325950)))

(declare-fun res!357364 () Bool)

(assert (=> b!566396 (=> (not res!357364) (not e!325950))))

(declare-fun lt!258111 () (_ BitVec 64))

(declare-fun lt!258109 () array!35568)

(declare-fun lt!258110 () SeekEntryResult!5532)

(declare-fun lt!258108 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35568 (_ BitVec 32)) SeekEntryResult!5532)

(assert (=> b!566396 (= res!357364 (= lt!258110 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258108 lt!258111 lt!258109 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!258115 () (_ BitVec 32))

(assert (=> b!566396 (= lt!258110 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258115 (select (arr!17083 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566396 (= lt!258108 (toIndex!0 lt!258111 mask!3119))))

(assert (=> b!566396 (= lt!258111 (select (store (arr!17083 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!566396 (= lt!258115 (toIndex!0 (select (arr!17083 a!3118) j!142) mask!3119))))

(assert (=> b!566396 (= lt!258109 (array!35569 (store (arr!17083 a!3118) i!1132 k0!1914) (size!17447 a!3118)))))

(declare-fun b!566397 () Bool)

(declare-fun res!357362 () Bool)

(assert (=> b!566397 (=> (not res!357362) (not e!325948))))

(assert (=> b!566397 (= res!357362 (validKeyInArray!0 (select (arr!17083 a!3118) j!142)))))

(declare-fun res!357366 () Bool)

(assert (=> start!51760 (=> (not res!357366) (not e!325948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51760 (= res!357366 (validMask!0 mask!3119))))

(assert (=> start!51760 e!325948))

(assert (=> start!51760 true))

(declare-fun array_inv!12879 (array!35568) Bool)

(assert (=> start!51760 (array_inv!12879 a!3118)))

(declare-fun b!566398 () Bool)

(declare-fun res!357371 () Bool)

(assert (=> b!566398 (=> (not res!357371) (not e!325948))))

(declare-fun arrayContainsKey!0 (array!35568 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566398 (= res!357371 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!566399 () Bool)

(declare-fun res!357368 () Bool)

(assert (=> b!566399 (=> (not res!357368) (not e!325948))))

(assert (=> b!566399 (= res!357368 (and (= (size!17447 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17447 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17447 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!566400 () Bool)

(declare-fun e!325947 () Bool)

(assert (=> b!566400 (= e!325950 (not e!325947))))

(declare-fun res!357370 () Bool)

(assert (=> b!566400 (=> res!357370 e!325947)))

(get-info :version)

(assert (=> b!566400 (= res!357370 (or (not ((_ is Intermediate!5532) lt!258110)) (not (undefined!6344 lt!258110))))))

(declare-fun lt!258114 () SeekEntryResult!5532)

(assert (=> b!566400 (= lt!258114 (Found!5532 j!142))))

(assert (=> b!566400 (= lt!258114 (seekEntryOrOpen!0 (select (arr!17083 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35568 (_ BitVec 32)) Bool)

(assert (=> b!566400 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17766 0))(
  ( (Unit!17767) )
))
(declare-fun lt!258113 () Unit!17766)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17766)

(assert (=> b!566400 (= lt!258113 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566401 () Bool)

(declare-fun res!357369 () Bool)

(assert (=> b!566401 (=> (not res!357369) (not e!325946))))

(assert (=> b!566401 (= res!357369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!566402 () Bool)

(assert (=> b!566402 (= e!325947 (= lt!258114 (seekEntryOrOpen!0 lt!258111 lt!258109 mask!3119)))))

(assert (= (and start!51760 res!357366) b!566399))

(assert (= (and b!566399 res!357368) b!566397))

(assert (= (and b!566397 res!357362) b!566393))

(assert (= (and b!566393 res!357367) b!566398))

(assert (= (and b!566398 res!357371) b!566395))

(assert (= (and b!566395 res!357363) b!566401))

(assert (= (and b!566401 res!357369) b!566394))

(assert (= (and b!566394 res!357365) b!566396))

(assert (= (and b!566396 res!357364) b!566400))

(assert (= (and b!566400 (not res!357370)) b!566402))

(declare-fun m!545045 () Bool)

(assert (=> b!566401 m!545045))

(declare-fun m!545047 () Bool)

(assert (=> b!566398 m!545047))

(declare-fun m!545049 () Bool)

(assert (=> b!566393 m!545049))

(declare-fun m!545051 () Bool)

(assert (=> b!566396 m!545051))

(declare-fun m!545053 () Bool)

(assert (=> b!566396 m!545053))

(declare-fun m!545055 () Bool)

(assert (=> b!566396 m!545055))

(assert (=> b!566396 m!545053))

(declare-fun m!545057 () Bool)

(assert (=> b!566396 m!545057))

(assert (=> b!566396 m!545053))

(declare-fun m!545059 () Bool)

(assert (=> b!566396 m!545059))

(declare-fun m!545061 () Bool)

(assert (=> b!566396 m!545061))

(declare-fun m!545063 () Bool)

(assert (=> b!566396 m!545063))

(declare-fun m!545065 () Bool)

(assert (=> start!51760 m!545065))

(declare-fun m!545067 () Bool)

(assert (=> start!51760 m!545067))

(declare-fun m!545069 () Bool)

(assert (=> b!566395 m!545069))

(declare-fun m!545071 () Bool)

(assert (=> b!566394 m!545071))

(declare-fun m!545073 () Bool)

(assert (=> b!566402 m!545073))

(assert (=> b!566400 m!545053))

(assert (=> b!566400 m!545053))

(declare-fun m!545075 () Bool)

(assert (=> b!566400 m!545075))

(declare-fun m!545077 () Bool)

(assert (=> b!566400 m!545077))

(declare-fun m!545079 () Bool)

(assert (=> b!566400 m!545079))

(assert (=> b!566397 m!545053))

(assert (=> b!566397 m!545053))

(declare-fun m!545081 () Bool)

(assert (=> b!566397 m!545081))

(check-sat (not b!566402) (not b!566401) (not b!566393) (not b!566400) (not b!566397) (not b!566394) (not b!566398) (not b!566396) (not b!566395) (not start!51760))
(check-sat)
(get-model)

(declare-fun b!566441 () Bool)

(declare-fun e!325972 () Bool)

(declare-fun e!325974 () Bool)

(assert (=> b!566441 (= e!325972 e!325974)))

(declare-fun lt!258148 () (_ BitVec 64))

(assert (=> b!566441 (= lt!258148 (select (arr!17083 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!258147 () Unit!17766)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35568 (_ BitVec 64) (_ BitVec 32)) Unit!17766)

(assert (=> b!566441 (= lt!258147 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258148 #b00000000000000000000000000000000))))

(assert (=> b!566441 (arrayContainsKey!0 a!3118 lt!258148 #b00000000000000000000000000000000)))

(declare-fun lt!258146 () Unit!17766)

(assert (=> b!566441 (= lt!258146 lt!258147)))

(declare-fun res!357407 () Bool)

(assert (=> b!566441 (= res!357407 (= (seekEntryOrOpen!0 (select (arr!17083 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5532 #b00000000000000000000000000000000)))))

(assert (=> b!566441 (=> (not res!357407) (not e!325974))))

(declare-fun b!566442 () Bool)

(declare-fun e!325973 () Bool)

(assert (=> b!566442 (= e!325973 e!325972)))

(declare-fun c!64865 () Bool)

(assert (=> b!566442 (= c!64865 (validKeyInArray!0 (select (arr!17083 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!566443 () Bool)

(declare-fun call!32480 () Bool)

(assert (=> b!566443 (= e!325972 call!32480)))

(declare-fun d!84091 () Bool)

(declare-fun res!357406 () Bool)

(assert (=> d!84091 (=> res!357406 e!325973)))

(assert (=> d!84091 (= res!357406 (bvsge #b00000000000000000000000000000000 (size!17447 a!3118)))))

(assert (=> d!84091 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!325973)))

(declare-fun b!566444 () Bool)

(assert (=> b!566444 (= e!325974 call!32480)))

(declare-fun bm!32477 () Bool)

(assert (=> bm!32477 (= call!32480 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!84091 (not res!357406)) b!566442))

(assert (= (and b!566442 c!64865) b!566441))

(assert (= (and b!566442 (not c!64865)) b!566443))

(assert (= (and b!566441 res!357407) b!566444))

(assert (= (or b!566444 b!566443) bm!32477))

(declare-fun m!545121 () Bool)

(assert (=> b!566441 m!545121))

(declare-fun m!545123 () Bool)

(assert (=> b!566441 m!545123))

(declare-fun m!545125 () Bool)

(assert (=> b!566441 m!545125))

(assert (=> b!566441 m!545121))

(declare-fun m!545127 () Bool)

(assert (=> b!566441 m!545127))

(assert (=> b!566442 m!545121))

(assert (=> b!566442 m!545121))

(declare-fun m!545129 () Bool)

(assert (=> b!566442 m!545129))

(declare-fun m!545131 () Bool)

(assert (=> bm!32477 m!545131))

(assert (=> b!566401 d!84091))

(declare-fun b!566477 () Bool)

(declare-fun e!325995 () SeekEntryResult!5532)

(declare-fun lt!258169 () SeekEntryResult!5532)

(assert (=> b!566477 (= e!325995 (MissingZero!5532 (index!24357 lt!258169)))))

(declare-fun b!566478 () Bool)

(declare-fun e!325994 () SeekEntryResult!5532)

(assert (=> b!566478 (= e!325994 Undefined!5532)))

(declare-fun b!566479 () Bool)

(declare-fun e!325993 () SeekEntryResult!5532)

(assert (=> b!566479 (= e!325994 e!325993)))

(declare-fun lt!258167 () (_ BitVec 64))

(assert (=> b!566479 (= lt!258167 (select (arr!17083 a!3118) (index!24357 lt!258169)))))

(declare-fun c!64882 () Bool)

(assert (=> b!566479 (= c!64882 (= lt!258167 (select (arr!17083 a!3118) j!142)))))

(declare-fun b!566480 () Bool)

(assert (=> b!566480 (= e!325993 (Found!5532 (index!24357 lt!258169)))))

(declare-fun d!84093 () Bool)

(declare-fun lt!258168 () SeekEntryResult!5532)

(assert (=> d!84093 (and (or ((_ is Undefined!5532) lt!258168) (not ((_ is Found!5532) lt!258168)) (and (bvsge (index!24356 lt!258168) #b00000000000000000000000000000000) (bvslt (index!24356 lt!258168) (size!17447 a!3118)))) (or ((_ is Undefined!5532) lt!258168) ((_ is Found!5532) lt!258168) (not ((_ is MissingZero!5532) lt!258168)) (and (bvsge (index!24355 lt!258168) #b00000000000000000000000000000000) (bvslt (index!24355 lt!258168) (size!17447 a!3118)))) (or ((_ is Undefined!5532) lt!258168) ((_ is Found!5532) lt!258168) ((_ is MissingZero!5532) lt!258168) (not ((_ is MissingVacant!5532) lt!258168)) (and (bvsge (index!24358 lt!258168) #b00000000000000000000000000000000) (bvslt (index!24358 lt!258168) (size!17447 a!3118)))) (or ((_ is Undefined!5532) lt!258168) (ite ((_ is Found!5532) lt!258168) (= (select (arr!17083 a!3118) (index!24356 lt!258168)) (select (arr!17083 a!3118) j!142)) (ite ((_ is MissingZero!5532) lt!258168) (= (select (arr!17083 a!3118) (index!24355 lt!258168)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5532) lt!258168) (= (select (arr!17083 a!3118) (index!24358 lt!258168)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84093 (= lt!258168 e!325994)))

(declare-fun c!64880 () Bool)

(assert (=> d!84093 (= c!64880 (and ((_ is Intermediate!5532) lt!258169) (undefined!6344 lt!258169)))))

(assert (=> d!84093 (= lt!258169 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17083 a!3118) j!142) mask!3119) (select (arr!17083 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84093 (validMask!0 mask!3119)))

(assert (=> d!84093 (= (seekEntryOrOpen!0 (select (arr!17083 a!3118) j!142) a!3118 mask!3119) lt!258168)))

(declare-fun b!566481 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35568 (_ BitVec 32)) SeekEntryResult!5532)

(assert (=> b!566481 (= e!325995 (seekKeyOrZeroReturnVacant!0 (x!53217 lt!258169) (index!24357 lt!258169) (index!24357 lt!258169) (select (arr!17083 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!566482 () Bool)

(declare-fun c!64881 () Bool)

(assert (=> b!566482 (= c!64881 (= lt!258167 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!566482 (= e!325993 e!325995)))

(assert (= (and d!84093 c!64880) b!566478))

(assert (= (and d!84093 (not c!64880)) b!566479))

(assert (= (and b!566479 c!64882) b!566480))

(assert (= (and b!566479 (not c!64882)) b!566482))

(assert (= (and b!566482 c!64881) b!566477))

(assert (= (and b!566482 (not c!64881)) b!566481))

(declare-fun m!545133 () Bool)

(assert (=> b!566479 m!545133))

(assert (=> d!84093 m!545065))

(assert (=> d!84093 m!545055))

(assert (=> d!84093 m!545053))

(declare-fun m!545135 () Bool)

(assert (=> d!84093 m!545135))

(assert (=> d!84093 m!545053))

(assert (=> d!84093 m!545055))

(declare-fun m!545137 () Bool)

(assert (=> d!84093 m!545137))

(declare-fun m!545139 () Bool)

(assert (=> d!84093 m!545139))

(declare-fun m!545141 () Bool)

(assert (=> d!84093 m!545141))

(assert (=> b!566481 m!545053))

(declare-fun m!545143 () Bool)

(assert (=> b!566481 m!545143))

(assert (=> b!566400 d!84093))

(declare-fun b!566483 () Bool)

(declare-fun e!325996 () Bool)

(declare-fun e!325998 () Bool)

(assert (=> b!566483 (= e!325996 e!325998)))

(declare-fun lt!258172 () (_ BitVec 64))

(assert (=> b!566483 (= lt!258172 (select (arr!17083 a!3118) j!142))))

(declare-fun lt!258171 () Unit!17766)

(assert (=> b!566483 (= lt!258171 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258172 j!142))))

(assert (=> b!566483 (arrayContainsKey!0 a!3118 lt!258172 #b00000000000000000000000000000000)))

(declare-fun lt!258170 () Unit!17766)

(assert (=> b!566483 (= lt!258170 lt!258171)))

(declare-fun res!357413 () Bool)

(assert (=> b!566483 (= res!357413 (= (seekEntryOrOpen!0 (select (arr!17083 a!3118) j!142) a!3118 mask!3119) (Found!5532 j!142)))))

(assert (=> b!566483 (=> (not res!357413) (not e!325998))))

(declare-fun b!566484 () Bool)

(declare-fun e!325997 () Bool)

(assert (=> b!566484 (= e!325997 e!325996)))

(declare-fun c!64883 () Bool)

(assert (=> b!566484 (= c!64883 (validKeyInArray!0 (select (arr!17083 a!3118) j!142)))))

(declare-fun b!566485 () Bool)

(declare-fun call!32483 () Bool)

(assert (=> b!566485 (= e!325996 call!32483)))

(declare-fun d!84099 () Bool)

(declare-fun res!357412 () Bool)

(assert (=> d!84099 (=> res!357412 e!325997)))

(assert (=> d!84099 (= res!357412 (bvsge j!142 (size!17447 a!3118)))))

(assert (=> d!84099 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!325997)))

(declare-fun b!566486 () Bool)

(assert (=> b!566486 (= e!325998 call!32483)))

(declare-fun bm!32480 () Bool)

(assert (=> bm!32480 (= call!32483 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!84099 (not res!357412)) b!566484))

(assert (= (and b!566484 c!64883) b!566483))

(assert (= (and b!566484 (not c!64883)) b!566485))

(assert (= (and b!566483 res!357413) b!566486))

(assert (= (or b!566486 b!566485) bm!32480))

(assert (=> b!566483 m!545053))

(declare-fun m!545145 () Bool)

(assert (=> b!566483 m!545145))

(declare-fun m!545147 () Bool)

(assert (=> b!566483 m!545147))

(assert (=> b!566483 m!545053))

(assert (=> b!566483 m!545075))

(assert (=> b!566484 m!545053))

(assert (=> b!566484 m!545053))

(assert (=> b!566484 m!545081))

(declare-fun m!545149 () Bool)

(assert (=> bm!32480 m!545149))

(assert (=> b!566400 d!84099))

(declare-fun d!84101 () Bool)

(assert (=> d!84101 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!258181 () Unit!17766)

(declare-fun choose!38 (array!35568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17766)

(assert (=> d!84101 (= lt!258181 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84101 (validMask!0 mask!3119)))

(assert (=> d!84101 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!258181)))

(declare-fun bs!17596 () Bool)

(assert (= bs!17596 d!84101))

(assert (=> bs!17596 m!545077))

(declare-fun m!545175 () Bool)

(assert (=> bs!17596 m!545175))

(assert (=> bs!17596 m!545065))

(assert (=> b!566400 d!84101))

(declare-fun b!566501 () Bool)

(declare-fun e!326011 () SeekEntryResult!5532)

(declare-fun lt!258184 () SeekEntryResult!5532)

(assert (=> b!566501 (= e!326011 (MissingZero!5532 (index!24357 lt!258184)))))

(declare-fun b!566502 () Bool)

(declare-fun e!326010 () SeekEntryResult!5532)

(assert (=> b!566502 (= e!326010 Undefined!5532)))

(declare-fun b!566503 () Bool)

(declare-fun e!326009 () SeekEntryResult!5532)

(assert (=> b!566503 (= e!326010 e!326009)))

(declare-fun lt!258182 () (_ BitVec 64))

(assert (=> b!566503 (= lt!258182 (select (arr!17083 a!3118) (index!24357 lt!258184)))))

(declare-fun c!64890 () Bool)

(assert (=> b!566503 (= c!64890 (= lt!258182 k0!1914))))

(declare-fun b!566504 () Bool)

(assert (=> b!566504 (= e!326009 (Found!5532 (index!24357 lt!258184)))))

(declare-fun d!84107 () Bool)

(declare-fun lt!258183 () SeekEntryResult!5532)

(assert (=> d!84107 (and (or ((_ is Undefined!5532) lt!258183) (not ((_ is Found!5532) lt!258183)) (and (bvsge (index!24356 lt!258183) #b00000000000000000000000000000000) (bvslt (index!24356 lt!258183) (size!17447 a!3118)))) (or ((_ is Undefined!5532) lt!258183) ((_ is Found!5532) lt!258183) (not ((_ is MissingZero!5532) lt!258183)) (and (bvsge (index!24355 lt!258183) #b00000000000000000000000000000000) (bvslt (index!24355 lt!258183) (size!17447 a!3118)))) (or ((_ is Undefined!5532) lt!258183) ((_ is Found!5532) lt!258183) ((_ is MissingZero!5532) lt!258183) (not ((_ is MissingVacant!5532) lt!258183)) (and (bvsge (index!24358 lt!258183) #b00000000000000000000000000000000) (bvslt (index!24358 lt!258183) (size!17447 a!3118)))) (or ((_ is Undefined!5532) lt!258183) (ite ((_ is Found!5532) lt!258183) (= (select (arr!17083 a!3118) (index!24356 lt!258183)) k0!1914) (ite ((_ is MissingZero!5532) lt!258183) (= (select (arr!17083 a!3118) (index!24355 lt!258183)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5532) lt!258183) (= (select (arr!17083 a!3118) (index!24358 lt!258183)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84107 (= lt!258183 e!326010)))

(declare-fun c!64888 () Bool)

(assert (=> d!84107 (= c!64888 (and ((_ is Intermediate!5532) lt!258184) (undefined!6344 lt!258184)))))

(assert (=> d!84107 (= lt!258184 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84107 (validMask!0 mask!3119)))

(assert (=> d!84107 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!258183)))

(declare-fun b!566505 () Bool)

(assert (=> b!566505 (= e!326011 (seekKeyOrZeroReturnVacant!0 (x!53217 lt!258184) (index!24357 lt!258184) (index!24357 lt!258184) k0!1914 a!3118 mask!3119))))

(declare-fun b!566506 () Bool)

(declare-fun c!64889 () Bool)

(assert (=> b!566506 (= c!64889 (= lt!258182 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!566506 (= e!326009 e!326011)))

(assert (= (and d!84107 c!64888) b!566502))

(assert (= (and d!84107 (not c!64888)) b!566503))

(assert (= (and b!566503 c!64890) b!566504))

(assert (= (and b!566503 (not c!64890)) b!566506))

(assert (= (and b!566506 c!64889) b!566501))

(assert (= (and b!566506 (not c!64889)) b!566505))

(declare-fun m!545177 () Bool)

(assert (=> b!566503 m!545177))

(assert (=> d!84107 m!545065))

(declare-fun m!545179 () Bool)

(assert (=> d!84107 m!545179))

(declare-fun m!545181 () Bool)

(assert (=> d!84107 m!545181))

(assert (=> d!84107 m!545179))

(declare-fun m!545183 () Bool)

(assert (=> d!84107 m!545183))

(declare-fun m!545185 () Bool)

(assert (=> d!84107 m!545185))

(declare-fun m!545187 () Bool)

(assert (=> d!84107 m!545187))

(declare-fun m!545189 () Bool)

(assert (=> b!566505 m!545189))

(assert (=> b!566395 d!84107))

(declare-fun b!566509 () Bool)

(declare-fun e!326016 () SeekEntryResult!5532)

(declare-fun lt!258187 () SeekEntryResult!5532)

(assert (=> b!566509 (= e!326016 (MissingZero!5532 (index!24357 lt!258187)))))

(declare-fun b!566510 () Bool)

(declare-fun e!326015 () SeekEntryResult!5532)

(assert (=> b!566510 (= e!326015 Undefined!5532)))

(declare-fun b!566511 () Bool)

(declare-fun e!326014 () SeekEntryResult!5532)

(assert (=> b!566511 (= e!326015 e!326014)))

(declare-fun lt!258185 () (_ BitVec 64))

(assert (=> b!566511 (= lt!258185 (select (arr!17083 lt!258109) (index!24357 lt!258187)))))

(declare-fun c!64893 () Bool)

(assert (=> b!566511 (= c!64893 (= lt!258185 lt!258111))))

(declare-fun b!566512 () Bool)

(assert (=> b!566512 (= e!326014 (Found!5532 (index!24357 lt!258187)))))

(declare-fun d!84109 () Bool)

(declare-fun lt!258186 () SeekEntryResult!5532)

(assert (=> d!84109 (and (or ((_ is Undefined!5532) lt!258186) (not ((_ is Found!5532) lt!258186)) (and (bvsge (index!24356 lt!258186) #b00000000000000000000000000000000) (bvslt (index!24356 lt!258186) (size!17447 lt!258109)))) (or ((_ is Undefined!5532) lt!258186) ((_ is Found!5532) lt!258186) (not ((_ is MissingZero!5532) lt!258186)) (and (bvsge (index!24355 lt!258186) #b00000000000000000000000000000000) (bvslt (index!24355 lt!258186) (size!17447 lt!258109)))) (or ((_ is Undefined!5532) lt!258186) ((_ is Found!5532) lt!258186) ((_ is MissingZero!5532) lt!258186) (not ((_ is MissingVacant!5532) lt!258186)) (and (bvsge (index!24358 lt!258186) #b00000000000000000000000000000000) (bvslt (index!24358 lt!258186) (size!17447 lt!258109)))) (or ((_ is Undefined!5532) lt!258186) (ite ((_ is Found!5532) lt!258186) (= (select (arr!17083 lt!258109) (index!24356 lt!258186)) lt!258111) (ite ((_ is MissingZero!5532) lt!258186) (= (select (arr!17083 lt!258109) (index!24355 lt!258186)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5532) lt!258186) (= (select (arr!17083 lt!258109) (index!24358 lt!258186)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84109 (= lt!258186 e!326015)))

(declare-fun c!64891 () Bool)

(assert (=> d!84109 (= c!64891 (and ((_ is Intermediate!5532) lt!258187) (undefined!6344 lt!258187)))))

(assert (=> d!84109 (= lt!258187 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!258111 mask!3119) lt!258111 lt!258109 mask!3119))))

(assert (=> d!84109 (validMask!0 mask!3119)))

(assert (=> d!84109 (= (seekEntryOrOpen!0 lt!258111 lt!258109 mask!3119) lt!258186)))

(declare-fun b!566513 () Bool)

(assert (=> b!566513 (= e!326016 (seekKeyOrZeroReturnVacant!0 (x!53217 lt!258187) (index!24357 lt!258187) (index!24357 lt!258187) lt!258111 lt!258109 mask!3119))))

(declare-fun b!566514 () Bool)

(declare-fun c!64892 () Bool)

(assert (=> b!566514 (= c!64892 (= lt!258185 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!566514 (= e!326014 e!326016)))

(assert (= (and d!84109 c!64891) b!566510))

(assert (= (and d!84109 (not c!64891)) b!566511))

(assert (= (and b!566511 c!64893) b!566512))

(assert (= (and b!566511 (not c!64893)) b!566514))

(assert (= (and b!566514 c!64892) b!566509))

(assert (= (and b!566514 (not c!64892)) b!566513))

(declare-fun m!545195 () Bool)

(assert (=> b!566511 m!545195))

(assert (=> d!84109 m!545065))

(assert (=> d!84109 m!545061))

(declare-fun m!545197 () Bool)

(assert (=> d!84109 m!545197))

(assert (=> d!84109 m!545061))

(declare-fun m!545199 () Bool)

(assert (=> d!84109 m!545199))

(declare-fun m!545201 () Bool)

(assert (=> d!84109 m!545201))

(declare-fun m!545203 () Bool)

(assert (=> d!84109 m!545203))

(declare-fun m!545205 () Bool)

(assert (=> b!566513 m!545205))

(assert (=> b!566402 d!84109))

(declare-fun d!84113 () Bool)

(assert (=> d!84113 (= (validKeyInArray!0 (select (arr!17083 a!3118) j!142)) (and (not (= (select (arr!17083 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17083 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!566397 d!84113))

(declare-fun b!566587 () Bool)

(declare-fun e!326062 () SeekEntryResult!5532)

(declare-fun e!326060 () SeekEntryResult!5532)

(assert (=> b!566587 (= e!326062 e!326060)))

(declare-fun c!64920 () Bool)

(declare-fun lt!258223 () (_ BitVec 64))

(assert (=> b!566587 (= c!64920 (or (= lt!258223 lt!258111) (= (bvadd lt!258223 lt!258223) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!84117 () Bool)

(declare-fun e!326061 () Bool)

(assert (=> d!84117 e!326061))

(declare-fun c!64919 () Bool)

(declare-fun lt!258224 () SeekEntryResult!5532)

(assert (=> d!84117 (= c!64919 (and ((_ is Intermediate!5532) lt!258224) (undefined!6344 lt!258224)))))

(assert (=> d!84117 (= lt!258224 e!326062)))

(declare-fun c!64918 () Bool)

(assert (=> d!84117 (= c!64918 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84117 (= lt!258223 (select (arr!17083 lt!258109) lt!258108))))

(assert (=> d!84117 (validMask!0 mask!3119)))

(assert (=> d!84117 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258108 lt!258111 lt!258109 mask!3119) lt!258224)))

(declare-fun b!566588 () Bool)

(assert (=> b!566588 (and (bvsge (index!24357 lt!258224) #b00000000000000000000000000000000) (bvslt (index!24357 lt!258224) (size!17447 lt!258109)))))

(declare-fun res!357447 () Bool)

(assert (=> b!566588 (= res!357447 (= (select (arr!17083 lt!258109) (index!24357 lt!258224)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326059 () Bool)

(assert (=> b!566588 (=> res!357447 e!326059)))

(declare-fun b!566589 () Bool)

(assert (=> b!566589 (= e!326062 (Intermediate!5532 true lt!258108 #b00000000000000000000000000000000))))

(declare-fun b!566590 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566590 (= e!326060 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258108 #b00000000000000000000000000000000 mask!3119) lt!258111 lt!258109 mask!3119))))

(declare-fun b!566591 () Bool)

(declare-fun e!326063 () Bool)

(assert (=> b!566591 (= e!326061 e!326063)))

(declare-fun res!357449 () Bool)

(assert (=> b!566591 (= res!357449 (and ((_ is Intermediate!5532) lt!258224) (not (undefined!6344 lt!258224)) (bvslt (x!53217 lt!258224) #b01111111111111111111111111111110) (bvsge (x!53217 lt!258224) #b00000000000000000000000000000000) (bvsge (x!53217 lt!258224) #b00000000000000000000000000000000)))))

(assert (=> b!566591 (=> (not res!357449) (not e!326063))))

(declare-fun b!566592 () Bool)

(assert (=> b!566592 (= e!326060 (Intermediate!5532 false lt!258108 #b00000000000000000000000000000000))))

(declare-fun b!566593 () Bool)

(assert (=> b!566593 (= e!326061 (bvsge (x!53217 lt!258224) #b01111111111111111111111111111110))))

(declare-fun b!566594 () Bool)

(assert (=> b!566594 (and (bvsge (index!24357 lt!258224) #b00000000000000000000000000000000) (bvslt (index!24357 lt!258224) (size!17447 lt!258109)))))

(declare-fun res!357448 () Bool)

(assert (=> b!566594 (= res!357448 (= (select (arr!17083 lt!258109) (index!24357 lt!258224)) lt!258111))))

(assert (=> b!566594 (=> res!357448 e!326059)))

(assert (=> b!566594 (= e!326063 e!326059)))

(declare-fun b!566595 () Bool)

(assert (=> b!566595 (and (bvsge (index!24357 lt!258224) #b00000000000000000000000000000000) (bvslt (index!24357 lt!258224) (size!17447 lt!258109)))))

(assert (=> b!566595 (= e!326059 (= (select (arr!17083 lt!258109) (index!24357 lt!258224)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!84117 c!64918) b!566589))

(assert (= (and d!84117 (not c!64918)) b!566587))

(assert (= (and b!566587 c!64920) b!566592))

(assert (= (and b!566587 (not c!64920)) b!566590))

(assert (= (and d!84117 c!64919) b!566593))

(assert (= (and d!84117 (not c!64919)) b!566591))

(assert (= (and b!566591 res!357449) b!566594))

(assert (= (and b!566594 (not res!357448)) b!566588))

(assert (= (and b!566588 (not res!357447)) b!566595))

(declare-fun m!545243 () Bool)

(assert (=> b!566590 m!545243))

(assert (=> b!566590 m!545243))

(declare-fun m!545245 () Bool)

(assert (=> b!566590 m!545245))

(declare-fun m!545247 () Bool)

(assert (=> b!566588 m!545247))

(assert (=> b!566594 m!545247))

(assert (=> b!566595 m!545247))

(declare-fun m!545249 () Bool)

(assert (=> d!84117 m!545249))

(assert (=> d!84117 m!545065))

(assert (=> b!566396 d!84117))

(declare-fun b!566596 () Bool)

(declare-fun e!326067 () SeekEntryResult!5532)

(declare-fun e!326065 () SeekEntryResult!5532)

(assert (=> b!566596 (= e!326067 e!326065)))

(declare-fun c!64923 () Bool)

(declare-fun lt!258225 () (_ BitVec 64))

(assert (=> b!566596 (= c!64923 (or (= lt!258225 (select (arr!17083 a!3118) j!142)) (= (bvadd lt!258225 lt!258225) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!84131 () Bool)

(declare-fun e!326066 () Bool)

(assert (=> d!84131 e!326066))

(declare-fun c!64922 () Bool)

(declare-fun lt!258226 () SeekEntryResult!5532)

(assert (=> d!84131 (= c!64922 (and ((_ is Intermediate!5532) lt!258226) (undefined!6344 lt!258226)))))

(assert (=> d!84131 (= lt!258226 e!326067)))

(declare-fun c!64921 () Bool)

(assert (=> d!84131 (= c!64921 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84131 (= lt!258225 (select (arr!17083 a!3118) lt!258115))))

(assert (=> d!84131 (validMask!0 mask!3119)))

(assert (=> d!84131 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258115 (select (arr!17083 a!3118) j!142) a!3118 mask!3119) lt!258226)))

(declare-fun b!566597 () Bool)

(assert (=> b!566597 (and (bvsge (index!24357 lt!258226) #b00000000000000000000000000000000) (bvslt (index!24357 lt!258226) (size!17447 a!3118)))))

(declare-fun res!357450 () Bool)

(assert (=> b!566597 (= res!357450 (= (select (arr!17083 a!3118) (index!24357 lt!258226)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326064 () Bool)

(assert (=> b!566597 (=> res!357450 e!326064)))

(declare-fun b!566598 () Bool)

(assert (=> b!566598 (= e!326067 (Intermediate!5532 true lt!258115 #b00000000000000000000000000000000))))

(declare-fun b!566599 () Bool)

(assert (=> b!566599 (= e!326065 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258115 #b00000000000000000000000000000000 mask!3119) (select (arr!17083 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!566600 () Bool)

(declare-fun e!326068 () Bool)

(assert (=> b!566600 (= e!326066 e!326068)))

(declare-fun res!357452 () Bool)

(assert (=> b!566600 (= res!357452 (and ((_ is Intermediate!5532) lt!258226) (not (undefined!6344 lt!258226)) (bvslt (x!53217 lt!258226) #b01111111111111111111111111111110) (bvsge (x!53217 lt!258226) #b00000000000000000000000000000000) (bvsge (x!53217 lt!258226) #b00000000000000000000000000000000)))))

(assert (=> b!566600 (=> (not res!357452) (not e!326068))))

(declare-fun b!566601 () Bool)

(assert (=> b!566601 (= e!326065 (Intermediate!5532 false lt!258115 #b00000000000000000000000000000000))))

(declare-fun b!566602 () Bool)

(assert (=> b!566602 (= e!326066 (bvsge (x!53217 lt!258226) #b01111111111111111111111111111110))))

(declare-fun b!566603 () Bool)

(assert (=> b!566603 (and (bvsge (index!24357 lt!258226) #b00000000000000000000000000000000) (bvslt (index!24357 lt!258226) (size!17447 a!3118)))))

(declare-fun res!357451 () Bool)

(assert (=> b!566603 (= res!357451 (= (select (arr!17083 a!3118) (index!24357 lt!258226)) (select (arr!17083 a!3118) j!142)))))

(assert (=> b!566603 (=> res!357451 e!326064)))

(assert (=> b!566603 (= e!326068 e!326064)))

(declare-fun b!566604 () Bool)

(assert (=> b!566604 (and (bvsge (index!24357 lt!258226) #b00000000000000000000000000000000) (bvslt (index!24357 lt!258226) (size!17447 a!3118)))))

(assert (=> b!566604 (= e!326064 (= (select (arr!17083 a!3118) (index!24357 lt!258226)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!84131 c!64921) b!566598))

(assert (= (and d!84131 (not c!64921)) b!566596))

(assert (= (and b!566596 c!64923) b!566601))

(assert (= (and b!566596 (not c!64923)) b!566599))

(assert (= (and d!84131 c!64922) b!566602))

(assert (= (and d!84131 (not c!64922)) b!566600))

(assert (= (and b!566600 res!357452) b!566603))

(assert (= (and b!566603 (not res!357451)) b!566597))

(assert (= (and b!566597 (not res!357450)) b!566604))

(declare-fun m!545251 () Bool)

(assert (=> b!566599 m!545251))

(assert (=> b!566599 m!545251))

(assert (=> b!566599 m!545053))

(declare-fun m!545253 () Bool)

(assert (=> b!566599 m!545253))

(declare-fun m!545255 () Bool)

(assert (=> b!566597 m!545255))

(assert (=> b!566603 m!545255))

(assert (=> b!566604 m!545255))

(declare-fun m!545257 () Bool)

(assert (=> d!84131 m!545257))

(assert (=> d!84131 m!545065))

(assert (=> b!566396 d!84131))

(declare-fun d!84133 () Bool)

(declare-fun lt!258238 () (_ BitVec 32))

(declare-fun lt!258237 () (_ BitVec 32))

(assert (=> d!84133 (= lt!258238 (bvmul (bvxor lt!258237 (bvlshr lt!258237 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84133 (= lt!258237 ((_ extract 31 0) (bvand (bvxor lt!258111 (bvlshr lt!258111 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84133 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!357453 (let ((h!12168 ((_ extract 31 0) (bvand (bvxor lt!258111 (bvlshr lt!258111 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53222 (bvmul (bvxor h!12168 (bvlshr h!12168 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53222 (bvlshr x!53222 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!357453 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!357453 #b00000000000000000000000000000000))))))

(assert (=> d!84133 (= (toIndex!0 lt!258111 mask!3119) (bvand (bvxor lt!258238 (bvlshr lt!258238 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!566396 d!84133))

(declare-fun d!84147 () Bool)

(declare-fun lt!258240 () (_ BitVec 32))

(declare-fun lt!258239 () (_ BitVec 32))

(assert (=> d!84147 (= lt!258240 (bvmul (bvxor lt!258239 (bvlshr lt!258239 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84147 (= lt!258239 ((_ extract 31 0) (bvand (bvxor (select (arr!17083 a!3118) j!142) (bvlshr (select (arr!17083 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84147 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!357453 (let ((h!12168 ((_ extract 31 0) (bvand (bvxor (select (arr!17083 a!3118) j!142) (bvlshr (select (arr!17083 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53222 (bvmul (bvxor h!12168 (bvlshr h!12168 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53222 (bvlshr x!53222 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!357453 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!357453 #b00000000000000000000000000000000))))))

(assert (=> d!84147 (= (toIndex!0 (select (arr!17083 a!3118) j!142) mask!3119) (bvand (bvxor lt!258240 (bvlshr lt!258240 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!566396 d!84147))

(declare-fun d!84149 () Bool)

(declare-fun res!357466 () Bool)

(declare-fun e!326087 () Bool)

(assert (=> d!84149 (=> res!357466 e!326087)))

(assert (=> d!84149 (= res!357466 (= (select (arr!17083 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84149 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!326087)))

(declare-fun b!566629 () Bool)

(declare-fun e!326088 () Bool)

(assert (=> b!566629 (= e!326087 e!326088)))

(declare-fun res!357467 () Bool)

(assert (=> b!566629 (=> (not res!357467) (not e!326088))))

(assert (=> b!566629 (= res!357467 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17447 a!3118)))))

(declare-fun b!566630 () Bool)

(assert (=> b!566630 (= e!326088 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84149 (not res!357466)) b!566629))

(assert (= (and b!566629 res!357467) b!566630))

(assert (=> d!84149 m!545121))

(declare-fun m!545283 () Bool)

(assert (=> b!566630 m!545283))

(assert (=> b!566398 d!84149))

(declare-fun d!84151 () Bool)

(assert (=> d!84151 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!566393 d!84151))

(declare-fun b!566658 () Bool)

(declare-fun e!326107 () Bool)

(declare-fun e!326109 () Bool)

(assert (=> b!566658 (= e!326107 e!326109)))

(declare-fun c!64939 () Bool)

(assert (=> b!566658 (= c!64939 (validKeyInArray!0 (select (arr!17083 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32491 () Bool)

(declare-fun call!32494 () Bool)

(assert (=> bm!32491 (= call!32494 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64939 (Cons!11159 (select (arr!17083 a!3118) #b00000000000000000000000000000000) Nil!11160) Nil!11160)))))

(declare-fun b!566659 () Bool)

(assert (=> b!566659 (= e!326109 call!32494)))

(declare-fun b!566660 () Bool)

(declare-fun e!326110 () Bool)

(declare-fun contains!2866 (List!11163 (_ BitVec 64)) Bool)

(assert (=> b!566660 (= e!326110 (contains!2866 Nil!11160 (select (arr!17083 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!566661 () Bool)

(declare-fun e!326108 () Bool)

(assert (=> b!566661 (= e!326108 e!326107)))

(declare-fun res!357479 () Bool)

(assert (=> b!566661 (=> (not res!357479) (not e!326107))))

(assert (=> b!566661 (= res!357479 (not e!326110))))

(declare-fun res!357478 () Bool)

(assert (=> b!566661 (=> (not res!357478) (not e!326110))))

(assert (=> b!566661 (= res!357478 (validKeyInArray!0 (select (arr!17083 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!566662 () Bool)

(assert (=> b!566662 (= e!326109 call!32494)))

(declare-fun d!84153 () Bool)

(declare-fun res!357477 () Bool)

(assert (=> d!84153 (=> res!357477 e!326108)))

(assert (=> d!84153 (= res!357477 (bvsge #b00000000000000000000000000000000 (size!17447 a!3118)))))

(assert (=> d!84153 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11160) e!326108)))

(assert (= (and d!84153 (not res!357477)) b!566661))

(assert (= (and b!566661 res!357478) b!566660))

(assert (= (and b!566661 res!357479) b!566658))

(assert (= (and b!566658 c!64939) b!566662))

(assert (= (and b!566658 (not c!64939)) b!566659))

(assert (= (or b!566662 b!566659) bm!32491))

(assert (=> b!566658 m!545121))

(assert (=> b!566658 m!545121))

(assert (=> b!566658 m!545129))

(assert (=> bm!32491 m!545121))

(declare-fun m!545289 () Bool)

(assert (=> bm!32491 m!545289))

(assert (=> b!566660 m!545121))

(assert (=> b!566660 m!545121))

(declare-fun m!545291 () Bool)

(assert (=> b!566660 m!545291))

(assert (=> b!566661 m!545121))

(assert (=> b!566661 m!545121))

(assert (=> b!566661 m!545129))

(assert (=> b!566394 d!84153))

(declare-fun d!84157 () Bool)

(assert (=> d!84157 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51760 d!84157))

(declare-fun d!84161 () Bool)

(assert (=> d!84161 (= (array_inv!12879 a!3118) (bvsge (size!17447 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51760 d!84161))

(check-sat (not bm!32491) (not d!84101) (not b!566590) (not d!84107) (not bm!32477) (not b!566484) (not bm!32480) (not b!566442) (not d!84109) (not d!84117) (not b!566658) (not b!566630) (not b!566441) (not b!566483) (not b!566513) (not b!566660) (not b!566599) (not d!84093) (not b!566481) (not d!84131) (not b!566661) (not b!566505))
(check-sat)
