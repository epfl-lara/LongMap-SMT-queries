; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51092 () Bool)

(assert start!51092)

(declare-fun b!558315 () Bool)

(declare-fun res!350330 () Bool)

(declare-fun e!321604 () Bool)

(assert (=> b!558315 (=> (not res!350330) (not e!321604))))

(declare-datatypes ((array!35155 0))(
  ( (array!35156 (arr!16883 (Array (_ BitVec 32) (_ BitVec 64))) (size!17248 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35155)

(declare-datatypes ((List!11002 0))(
  ( (Nil!10999) (Cons!10998 (h!11992 (_ BitVec 64)) (t!17221 List!11002)) )
))
(declare-fun arrayNoDuplicates!0 (array!35155 (_ BitVec 32) List!11002) Bool)

(assert (=> b!558315 (= res!350330 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10999))))

(declare-fun b!558316 () Bool)

(declare-fun res!350327 () Bool)

(assert (=> b!558316 (=> (not res!350327) (not e!321604))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35155 (_ BitVec 32)) Bool)

(assert (=> b!558316 (= res!350327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!558317 () Bool)

(declare-fun res!350321 () Bool)

(declare-fun e!321609 () Bool)

(assert (=> b!558317 (=> (not res!350321) (not e!321609))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558317 (= res!350321 (validKeyInArray!0 k0!1914))))

(declare-fun b!558318 () Bool)

(declare-fun e!321606 () Bool)

(assert (=> b!558318 (= e!321604 e!321606)))

(declare-fun res!350328 () Bool)

(assert (=> b!558318 (=> (not res!350328) (not e!321606))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!253622 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5329 0))(
  ( (MissingZero!5329 (index!23543 (_ BitVec 32))) (Found!5329 (index!23544 (_ BitVec 32))) (Intermediate!5329 (undefined!6141 Bool) (index!23545 (_ BitVec 32)) (x!52448 (_ BitVec 32))) (Undefined!5329) (MissingVacant!5329 (index!23546 (_ BitVec 32))) )
))
(declare-fun lt!253626 () SeekEntryResult!5329)

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35155 (_ BitVec 32)) SeekEntryResult!5329)

(assert (=> b!558318 (= res!350328 (= lt!253626 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253622 (select (store (arr!16883 a!3118) i!1132 k0!1914) j!142) (array!35156 (store (arr!16883 a!3118) i!1132 k0!1914) (size!17248 a!3118)) mask!3119)))))

(declare-fun lt!253623 () (_ BitVec 32))

(assert (=> b!558318 (= lt!253626 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253623 (select (arr!16883 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558318 (= lt!253622 (toIndex!0 (select (store (arr!16883 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!558318 (= lt!253623 (toIndex!0 (select (arr!16883 a!3118) j!142) mask!3119))))

(declare-fun b!558320 () Bool)

(declare-fun e!321607 () Bool)

(declare-fun e!321608 () Bool)

(assert (=> b!558320 (= e!321607 e!321608)))

(declare-fun res!350324 () Bool)

(assert (=> b!558320 (=> res!350324 e!321608)))

(get-info :version)

(assert (=> b!558320 (= res!350324 (or (undefined!6141 lt!253626) (not ((_ is Intermediate!5329) lt!253626)) (= (select (arr!16883 a!3118) (index!23545 lt!253626)) (select (arr!16883 a!3118) j!142)) (= (select (arr!16883 a!3118) (index!23545 lt!253626)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558321 () Bool)

(assert (=> b!558321 (= e!321606 (not (or (undefined!6141 lt!253626) (not ((_ is Intermediate!5329) lt!253626)) (= (select (arr!16883 a!3118) (index!23545 lt!253626)) (select (arr!16883 a!3118) j!142)) (= (select (arr!16883 a!3118) (index!23545 lt!253626)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (and (bvsge (index!23545 lt!253626) #b00000000000000000000000000000000) (bvslt (index!23545 lt!253626) (bvadd #b00000000000000000000000000000001 mask!3119))))))))

(assert (=> b!558321 e!321607))

(declare-fun res!350320 () Bool)

(assert (=> b!558321 (=> (not res!350320) (not e!321607))))

(declare-fun lt!253625 () SeekEntryResult!5329)

(assert (=> b!558321 (= res!350320 (= lt!253625 (Found!5329 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35155 (_ BitVec 32)) SeekEntryResult!5329)

(assert (=> b!558321 (= lt!253625 (seekEntryOrOpen!0 (select (arr!16883 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!558321 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17418 0))(
  ( (Unit!17419) )
))
(declare-fun lt!253624 () Unit!17418)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35155 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17418)

(assert (=> b!558321 (= lt!253624 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558322 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35155 (_ BitVec 32)) SeekEntryResult!5329)

(assert (=> b!558322 (= e!321608 (= lt!253625 (seekKeyOrZeroReturnVacant!0 (x!52448 lt!253626) (index!23545 lt!253626) (index!23545 lt!253626) (select (arr!16883 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558323 () Bool)

(declare-fun res!350322 () Bool)

(assert (=> b!558323 (=> (not res!350322) (not e!321609))))

(declare-fun arrayContainsKey!0 (array!35155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558323 (= res!350322 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!350326 () Bool)

(assert (=> start!51092 (=> (not res!350326) (not e!321609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51092 (= res!350326 (validMask!0 mask!3119))))

(assert (=> start!51092 e!321609))

(assert (=> start!51092 true))

(declare-fun array_inv!12766 (array!35155) Bool)

(assert (=> start!51092 (array_inv!12766 a!3118)))

(declare-fun b!558319 () Bool)

(declare-fun res!350323 () Bool)

(assert (=> b!558319 (=> (not res!350323) (not e!321609))))

(assert (=> b!558319 (= res!350323 (and (= (size!17248 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17248 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17248 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558324 () Bool)

(assert (=> b!558324 (= e!321609 e!321604)))

(declare-fun res!350329 () Bool)

(assert (=> b!558324 (=> (not res!350329) (not e!321604))))

(declare-fun lt!253627 () SeekEntryResult!5329)

(assert (=> b!558324 (= res!350329 (or (= lt!253627 (MissingZero!5329 i!1132)) (= lt!253627 (MissingVacant!5329 i!1132))))))

(assert (=> b!558324 (= lt!253627 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!558325 () Bool)

(declare-fun res!350325 () Bool)

(assert (=> b!558325 (=> (not res!350325) (not e!321609))))

(assert (=> b!558325 (= res!350325 (validKeyInArray!0 (select (arr!16883 a!3118) j!142)))))

(assert (= (and start!51092 res!350326) b!558319))

(assert (= (and b!558319 res!350323) b!558325))

(assert (= (and b!558325 res!350325) b!558317))

(assert (= (and b!558317 res!350321) b!558323))

(assert (= (and b!558323 res!350322) b!558324))

(assert (= (and b!558324 res!350329) b!558316))

(assert (= (and b!558316 res!350327) b!558315))

(assert (= (and b!558315 res!350330) b!558318))

(assert (= (and b!558318 res!350328) b!558321))

(assert (= (and b!558321 res!350320) b!558320))

(assert (= (and b!558320 (not res!350324)) b!558322))

(declare-fun m!535823 () Bool)

(assert (=> b!558316 m!535823))

(declare-fun m!535825 () Bool)

(assert (=> b!558320 m!535825))

(declare-fun m!535827 () Bool)

(assert (=> b!558320 m!535827))

(declare-fun m!535829 () Bool)

(assert (=> b!558323 m!535829))

(assert (=> b!558322 m!535827))

(assert (=> b!558322 m!535827))

(declare-fun m!535831 () Bool)

(assert (=> b!558322 m!535831))

(assert (=> b!558321 m!535825))

(assert (=> b!558321 m!535827))

(declare-fun m!535833 () Bool)

(assert (=> b!558321 m!535833))

(declare-fun m!535835 () Bool)

(assert (=> b!558321 m!535835))

(assert (=> b!558321 m!535827))

(declare-fun m!535837 () Bool)

(assert (=> b!558321 m!535837))

(declare-fun m!535839 () Bool)

(assert (=> b!558315 m!535839))

(declare-fun m!535841 () Bool)

(assert (=> b!558324 m!535841))

(declare-fun m!535843 () Bool)

(assert (=> start!51092 m!535843))

(declare-fun m!535845 () Bool)

(assert (=> start!51092 m!535845))

(assert (=> b!558318 m!535827))

(assert (=> b!558318 m!535827))

(declare-fun m!535847 () Bool)

(assert (=> b!558318 m!535847))

(declare-fun m!535849 () Bool)

(assert (=> b!558318 m!535849))

(declare-fun m!535851 () Bool)

(assert (=> b!558318 m!535851))

(assert (=> b!558318 m!535849))

(declare-fun m!535853 () Bool)

(assert (=> b!558318 m!535853))

(assert (=> b!558318 m!535827))

(declare-fun m!535855 () Bool)

(assert (=> b!558318 m!535855))

(assert (=> b!558318 m!535849))

(declare-fun m!535857 () Bool)

(assert (=> b!558318 m!535857))

(assert (=> b!558325 m!535827))

(assert (=> b!558325 m!535827))

(declare-fun m!535859 () Bool)

(assert (=> b!558325 m!535859))

(declare-fun m!535861 () Bool)

(assert (=> b!558317 m!535861))

(check-sat (not start!51092) (not b!558325) (not b!558323) (not b!558316) (not b!558324) (not b!558315) (not b!558322) (not b!558321) (not b!558317) (not b!558318))
(check-sat)
(get-model)

(declare-fun b!558419 () Bool)

(declare-fun e!321664 () SeekEntryResult!5329)

(declare-fun lt!253672 () SeekEntryResult!5329)

(assert (=> b!558419 (= e!321664 (MissingZero!5329 (index!23545 lt!253672)))))

(declare-fun b!558420 () Bool)

(declare-fun e!321665 () SeekEntryResult!5329)

(declare-fun e!321666 () SeekEntryResult!5329)

(assert (=> b!558420 (= e!321665 e!321666)))

(declare-fun lt!253671 () (_ BitVec 64))

(assert (=> b!558420 (= lt!253671 (select (arr!16883 a!3118) (index!23545 lt!253672)))))

(declare-fun c!64350 () Bool)

(assert (=> b!558420 (= c!64350 (= lt!253671 k0!1914))))

(declare-fun b!558421 () Bool)

(assert (=> b!558421 (= e!321666 (Found!5329 (index!23545 lt!253672)))))

(declare-fun b!558422 () Bool)

(assert (=> b!558422 (= e!321664 (seekKeyOrZeroReturnVacant!0 (x!52448 lt!253672) (index!23545 lt!253672) (index!23545 lt!253672) k0!1914 a!3118 mask!3119))))

(declare-fun b!558423 () Bool)

(declare-fun c!64349 () Bool)

(assert (=> b!558423 (= c!64349 (= lt!253671 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!558423 (= e!321666 e!321664)))

(declare-fun d!83373 () Bool)

(declare-fun lt!253670 () SeekEntryResult!5329)

(assert (=> d!83373 (and (or ((_ is Undefined!5329) lt!253670) (not ((_ is Found!5329) lt!253670)) (and (bvsge (index!23544 lt!253670) #b00000000000000000000000000000000) (bvslt (index!23544 lt!253670) (size!17248 a!3118)))) (or ((_ is Undefined!5329) lt!253670) ((_ is Found!5329) lt!253670) (not ((_ is MissingZero!5329) lt!253670)) (and (bvsge (index!23543 lt!253670) #b00000000000000000000000000000000) (bvslt (index!23543 lt!253670) (size!17248 a!3118)))) (or ((_ is Undefined!5329) lt!253670) ((_ is Found!5329) lt!253670) ((_ is MissingZero!5329) lt!253670) (not ((_ is MissingVacant!5329) lt!253670)) (and (bvsge (index!23546 lt!253670) #b00000000000000000000000000000000) (bvslt (index!23546 lt!253670) (size!17248 a!3118)))) (or ((_ is Undefined!5329) lt!253670) (ite ((_ is Found!5329) lt!253670) (= (select (arr!16883 a!3118) (index!23544 lt!253670)) k0!1914) (ite ((_ is MissingZero!5329) lt!253670) (= (select (arr!16883 a!3118) (index!23543 lt!253670)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5329) lt!253670) (= (select (arr!16883 a!3118) (index!23546 lt!253670)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83373 (= lt!253670 e!321665)))

(declare-fun c!64348 () Bool)

(assert (=> d!83373 (= c!64348 (and ((_ is Intermediate!5329) lt!253672) (undefined!6141 lt!253672)))))

(assert (=> d!83373 (= lt!253672 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!83373 (validMask!0 mask!3119)))

(assert (=> d!83373 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!253670)))

(declare-fun b!558424 () Bool)

(assert (=> b!558424 (= e!321665 Undefined!5329)))

(assert (= (and d!83373 c!64348) b!558424))

(assert (= (and d!83373 (not c!64348)) b!558420))

(assert (= (and b!558420 c!64350) b!558421))

(assert (= (and b!558420 (not c!64350)) b!558423))

(assert (= (and b!558423 c!64349) b!558419))

(assert (= (and b!558423 (not c!64349)) b!558422))

(declare-fun m!535951 () Bool)

(assert (=> b!558420 m!535951))

(declare-fun m!535953 () Bool)

(assert (=> b!558422 m!535953))

(declare-fun m!535955 () Bool)

(assert (=> d!83373 m!535955))

(assert (=> d!83373 m!535843))

(declare-fun m!535957 () Bool)

(assert (=> d!83373 m!535957))

(declare-fun m!535959 () Bool)

(assert (=> d!83373 m!535959))

(declare-fun m!535961 () Bool)

(assert (=> d!83373 m!535961))

(assert (=> d!83373 m!535957))

(declare-fun m!535963 () Bool)

(assert (=> d!83373 m!535963))

(assert (=> b!558324 d!83373))

(declare-fun d!83385 () Bool)

(assert (=> d!83385 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51092 d!83385))

(declare-fun d!83389 () Bool)

(assert (=> d!83389 (= (array_inv!12766 a!3118) (bvsge (size!17248 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51092 d!83389))

(declare-fun d!83391 () Bool)

(assert (=> d!83391 (= (validKeyInArray!0 (select (arr!16883 a!3118) j!142)) (and (not (= (select (arr!16883 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16883 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!558325 d!83391))

(declare-fun b!558471 () Bool)

(declare-fun e!321695 () Bool)

(declare-fun contains!2834 (List!11002 (_ BitVec 64)) Bool)

(assert (=> b!558471 (= e!321695 (contains!2834 Nil!10999 (select (arr!16883 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!83393 () Bool)

(declare-fun res!350425 () Bool)

(declare-fun e!321696 () Bool)

(assert (=> d!83393 (=> res!350425 e!321696)))

(assert (=> d!83393 (= res!350425 (bvsge #b00000000000000000000000000000000 (size!17248 a!3118)))))

(assert (=> d!83393 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10999) e!321696)))

(declare-fun bm!32371 () Bool)

(declare-fun call!32374 () Bool)

(declare-fun c!64365 () Bool)

(assert (=> bm!32371 (= call!32374 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64365 (Cons!10998 (select (arr!16883 a!3118) #b00000000000000000000000000000000) Nil!10999) Nil!10999)))))

(declare-fun b!558472 () Bool)

(declare-fun e!321698 () Bool)

(declare-fun e!321697 () Bool)

(assert (=> b!558472 (= e!321698 e!321697)))

(assert (=> b!558472 (= c!64365 (validKeyInArray!0 (select (arr!16883 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!558473 () Bool)

(assert (=> b!558473 (= e!321696 e!321698)))

(declare-fun res!350426 () Bool)

(assert (=> b!558473 (=> (not res!350426) (not e!321698))))

(assert (=> b!558473 (= res!350426 (not e!321695))))

(declare-fun res!350427 () Bool)

(assert (=> b!558473 (=> (not res!350427) (not e!321695))))

(assert (=> b!558473 (= res!350427 (validKeyInArray!0 (select (arr!16883 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!558474 () Bool)

(assert (=> b!558474 (= e!321697 call!32374)))

(declare-fun b!558475 () Bool)

(assert (=> b!558475 (= e!321697 call!32374)))

(assert (= (and d!83393 (not res!350425)) b!558473))

(assert (= (and b!558473 res!350427) b!558471))

(assert (= (and b!558473 res!350426) b!558472))

(assert (= (and b!558472 c!64365) b!558475))

(assert (= (and b!558472 (not c!64365)) b!558474))

(assert (= (or b!558475 b!558474) bm!32371))

(declare-fun m!535981 () Bool)

(assert (=> b!558471 m!535981))

(assert (=> b!558471 m!535981))

(declare-fun m!535983 () Bool)

(assert (=> b!558471 m!535983))

(assert (=> bm!32371 m!535981))

(declare-fun m!535985 () Bool)

(assert (=> bm!32371 m!535985))

(assert (=> b!558472 m!535981))

(assert (=> b!558472 m!535981))

(declare-fun m!535987 () Bool)

(assert (=> b!558472 m!535987))

(assert (=> b!558473 m!535981))

(assert (=> b!558473 m!535981))

(assert (=> b!558473 m!535987))

(assert (=> b!558315 d!83393))

(declare-fun b!558476 () Bool)

(declare-fun e!321699 () SeekEntryResult!5329)

(declare-fun lt!253687 () SeekEntryResult!5329)

(assert (=> b!558476 (= e!321699 (MissingZero!5329 (index!23545 lt!253687)))))

(declare-fun b!558477 () Bool)

(declare-fun e!321700 () SeekEntryResult!5329)

(declare-fun e!321701 () SeekEntryResult!5329)

(assert (=> b!558477 (= e!321700 e!321701)))

(declare-fun lt!253686 () (_ BitVec 64))

(assert (=> b!558477 (= lt!253686 (select (arr!16883 a!3118) (index!23545 lt!253687)))))

(declare-fun c!64368 () Bool)

(assert (=> b!558477 (= c!64368 (= lt!253686 (select (arr!16883 a!3118) j!142)))))

(declare-fun b!558478 () Bool)

(assert (=> b!558478 (= e!321701 (Found!5329 (index!23545 lt!253687)))))

(declare-fun b!558479 () Bool)

(assert (=> b!558479 (= e!321699 (seekKeyOrZeroReturnVacant!0 (x!52448 lt!253687) (index!23545 lt!253687) (index!23545 lt!253687) (select (arr!16883 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!558480 () Bool)

(declare-fun c!64367 () Bool)

(assert (=> b!558480 (= c!64367 (= lt!253686 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!558480 (= e!321701 e!321699)))

(declare-fun d!83399 () Bool)

(declare-fun lt!253685 () SeekEntryResult!5329)

(assert (=> d!83399 (and (or ((_ is Undefined!5329) lt!253685) (not ((_ is Found!5329) lt!253685)) (and (bvsge (index!23544 lt!253685) #b00000000000000000000000000000000) (bvslt (index!23544 lt!253685) (size!17248 a!3118)))) (or ((_ is Undefined!5329) lt!253685) ((_ is Found!5329) lt!253685) (not ((_ is MissingZero!5329) lt!253685)) (and (bvsge (index!23543 lt!253685) #b00000000000000000000000000000000) (bvslt (index!23543 lt!253685) (size!17248 a!3118)))) (or ((_ is Undefined!5329) lt!253685) ((_ is Found!5329) lt!253685) ((_ is MissingZero!5329) lt!253685) (not ((_ is MissingVacant!5329) lt!253685)) (and (bvsge (index!23546 lt!253685) #b00000000000000000000000000000000) (bvslt (index!23546 lt!253685) (size!17248 a!3118)))) (or ((_ is Undefined!5329) lt!253685) (ite ((_ is Found!5329) lt!253685) (= (select (arr!16883 a!3118) (index!23544 lt!253685)) (select (arr!16883 a!3118) j!142)) (ite ((_ is MissingZero!5329) lt!253685) (= (select (arr!16883 a!3118) (index!23543 lt!253685)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5329) lt!253685) (= (select (arr!16883 a!3118) (index!23546 lt!253685)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83399 (= lt!253685 e!321700)))

(declare-fun c!64366 () Bool)

(assert (=> d!83399 (= c!64366 (and ((_ is Intermediate!5329) lt!253687) (undefined!6141 lt!253687)))))

(assert (=> d!83399 (= lt!253687 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16883 a!3118) j!142) mask!3119) (select (arr!16883 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83399 (validMask!0 mask!3119)))

(assert (=> d!83399 (= (seekEntryOrOpen!0 (select (arr!16883 a!3118) j!142) a!3118 mask!3119) lt!253685)))

(declare-fun b!558481 () Bool)

(assert (=> b!558481 (= e!321700 Undefined!5329)))

(assert (= (and d!83399 c!64366) b!558481))

(assert (= (and d!83399 (not c!64366)) b!558477))

(assert (= (and b!558477 c!64368) b!558478))

(assert (= (and b!558477 (not c!64368)) b!558480))

(assert (= (and b!558480 c!64367) b!558476))

(assert (= (and b!558480 (not c!64367)) b!558479))

(declare-fun m!535989 () Bool)

(assert (=> b!558477 m!535989))

(assert (=> b!558479 m!535827))

(declare-fun m!535991 () Bool)

(assert (=> b!558479 m!535991))

(declare-fun m!535993 () Bool)

(assert (=> d!83399 m!535993))

(assert (=> d!83399 m!535843))

(assert (=> d!83399 m!535827))

(assert (=> d!83399 m!535855))

(declare-fun m!535995 () Bool)

(assert (=> d!83399 m!535995))

(declare-fun m!535997 () Bool)

(assert (=> d!83399 m!535997))

(assert (=> d!83399 m!535855))

(assert (=> d!83399 m!535827))

(declare-fun m!535999 () Bool)

(assert (=> d!83399 m!535999))

(assert (=> b!558321 d!83399))

(declare-fun b!558502 () Bool)

(declare-fun e!321714 () Bool)

(declare-fun e!321716 () Bool)

(assert (=> b!558502 (= e!321714 e!321716)))

(declare-fun lt!253704 () (_ BitVec 64))

(assert (=> b!558502 (= lt!253704 (select (arr!16883 a!3118) j!142))))

(declare-fun lt!253705 () Unit!17418)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35155 (_ BitVec 64) (_ BitVec 32)) Unit!17418)

(assert (=> b!558502 (= lt!253705 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253704 j!142))))

(assert (=> b!558502 (arrayContainsKey!0 a!3118 lt!253704 #b00000000000000000000000000000000)))

(declare-fun lt!253706 () Unit!17418)

(assert (=> b!558502 (= lt!253706 lt!253705)))

(declare-fun res!350432 () Bool)

(assert (=> b!558502 (= res!350432 (= (seekEntryOrOpen!0 (select (arr!16883 a!3118) j!142) a!3118 mask!3119) (Found!5329 j!142)))))

(assert (=> b!558502 (=> (not res!350432) (not e!321716))))

(declare-fun bm!32374 () Bool)

(declare-fun call!32377 () Bool)

(assert (=> bm!32374 (= call!32377 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!83407 () Bool)

(declare-fun res!350433 () Bool)

(declare-fun e!321715 () Bool)

(assert (=> d!83407 (=> res!350433 e!321715)))

(assert (=> d!83407 (= res!350433 (bvsge j!142 (size!17248 a!3118)))))

(assert (=> d!83407 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!321715)))

(declare-fun b!558503 () Bool)

(assert (=> b!558503 (= e!321715 e!321714)))

(declare-fun c!64377 () Bool)

(assert (=> b!558503 (= c!64377 (validKeyInArray!0 (select (arr!16883 a!3118) j!142)))))

(declare-fun b!558504 () Bool)

(assert (=> b!558504 (= e!321716 call!32377)))

(declare-fun b!558505 () Bool)

(assert (=> b!558505 (= e!321714 call!32377)))

(assert (= (and d!83407 (not res!350433)) b!558503))

(assert (= (and b!558503 c!64377) b!558502))

(assert (= (and b!558503 (not c!64377)) b!558505))

(assert (= (and b!558502 res!350432) b!558504))

(assert (= (or b!558504 b!558505) bm!32374))

(assert (=> b!558502 m!535827))

(declare-fun m!536001 () Bool)

(assert (=> b!558502 m!536001))

(declare-fun m!536003 () Bool)

(assert (=> b!558502 m!536003))

(assert (=> b!558502 m!535827))

(assert (=> b!558502 m!535837))

(declare-fun m!536005 () Bool)

(assert (=> bm!32374 m!536005))

(assert (=> b!558503 m!535827))

(assert (=> b!558503 m!535827))

(assert (=> b!558503 m!535859))

(assert (=> b!558321 d!83407))

(declare-fun d!83409 () Bool)

(assert (=> d!83409 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!253712 () Unit!17418)

(declare-fun choose!38 (array!35155 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17418)

(assert (=> d!83409 (= lt!253712 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83409 (validMask!0 mask!3119)))

(assert (=> d!83409 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!253712)))

(declare-fun bs!17356 () Bool)

(assert (= bs!17356 d!83409))

(assert (=> bs!17356 m!535833))

(declare-fun m!536021 () Bool)

(assert (=> bs!17356 m!536021))

(assert (=> bs!17356 m!535843))

(assert (=> b!558321 d!83409))

(declare-fun b!558512 () Bool)

(declare-fun e!321720 () Bool)

(declare-fun e!321722 () Bool)

(assert (=> b!558512 (= e!321720 e!321722)))

(declare-fun lt!253713 () (_ BitVec 64))

(assert (=> b!558512 (= lt!253713 (select (arr!16883 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!253714 () Unit!17418)

(assert (=> b!558512 (= lt!253714 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253713 #b00000000000000000000000000000000))))

(assert (=> b!558512 (arrayContainsKey!0 a!3118 lt!253713 #b00000000000000000000000000000000)))

(declare-fun lt!253715 () Unit!17418)

(assert (=> b!558512 (= lt!253715 lt!253714)))

(declare-fun res!350434 () Bool)

(assert (=> b!558512 (= res!350434 (= (seekEntryOrOpen!0 (select (arr!16883 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5329 #b00000000000000000000000000000000)))))

(assert (=> b!558512 (=> (not res!350434) (not e!321722))))

(declare-fun bm!32375 () Bool)

(declare-fun call!32378 () Bool)

(assert (=> bm!32375 (= call!32378 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!83415 () Bool)

(declare-fun res!350435 () Bool)

(declare-fun e!321721 () Bool)

(assert (=> d!83415 (=> res!350435 e!321721)))

(assert (=> d!83415 (= res!350435 (bvsge #b00000000000000000000000000000000 (size!17248 a!3118)))))

(assert (=> d!83415 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!321721)))

(declare-fun b!558513 () Bool)

(assert (=> b!558513 (= e!321721 e!321720)))

(declare-fun c!64381 () Bool)

(assert (=> b!558513 (= c!64381 (validKeyInArray!0 (select (arr!16883 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!558514 () Bool)

(assert (=> b!558514 (= e!321722 call!32378)))

(declare-fun b!558515 () Bool)

(assert (=> b!558515 (= e!321720 call!32378)))

(assert (= (and d!83415 (not res!350435)) b!558513))

(assert (= (and b!558513 c!64381) b!558512))

(assert (= (and b!558513 (not c!64381)) b!558515))

(assert (= (and b!558512 res!350434) b!558514))

(assert (= (or b!558514 b!558515) bm!32375))

(assert (=> b!558512 m!535981))

(declare-fun m!536023 () Bool)

(assert (=> b!558512 m!536023))

(declare-fun m!536025 () Bool)

(assert (=> b!558512 m!536025))

(assert (=> b!558512 m!535981))

(declare-fun m!536027 () Bool)

(assert (=> b!558512 m!536027))

(declare-fun m!536029 () Bool)

(assert (=> bm!32375 m!536029))

(assert (=> b!558513 m!535981))

(assert (=> b!558513 m!535981))

(assert (=> b!558513 m!535987))

(assert (=> b!558316 d!83415))

(declare-fun b!558585 () Bool)

(declare-fun e!321770 () SeekEntryResult!5329)

(assert (=> b!558585 (= e!321770 (MissingVacant!5329 (index!23545 lt!253626)))))

(declare-fun b!558586 () Bool)

(declare-fun e!321768 () SeekEntryResult!5329)

(assert (=> b!558586 (= e!321768 (Found!5329 (index!23545 lt!253626)))))

(declare-fun d!83417 () Bool)

(declare-fun lt!253748 () SeekEntryResult!5329)

(assert (=> d!83417 (and (or ((_ is Undefined!5329) lt!253748) (not ((_ is Found!5329) lt!253748)) (and (bvsge (index!23544 lt!253748) #b00000000000000000000000000000000) (bvslt (index!23544 lt!253748) (size!17248 a!3118)))) (or ((_ is Undefined!5329) lt!253748) ((_ is Found!5329) lt!253748) (not ((_ is MissingVacant!5329) lt!253748)) (not (= (index!23546 lt!253748) (index!23545 lt!253626))) (and (bvsge (index!23546 lt!253748) #b00000000000000000000000000000000) (bvslt (index!23546 lt!253748) (size!17248 a!3118)))) (or ((_ is Undefined!5329) lt!253748) (ite ((_ is Found!5329) lt!253748) (= (select (arr!16883 a!3118) (index!23544 lt!253748)) (select (arr!16883 a!3118) j!142)) (and ((_ is MissingVacant!5329) lt!253748) (= (index!23546 lt!253748) (index!23545 lt!253626)) (= (select (arr!16883 a!3118) (index!23546 lt!253748)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!321769 () SeekEntryResult!5329)

(assert (=> d!83417 (= lt!253748 e!321769)))

(declare-fun c!64407 () Bool)

(assert (=> d!83417 (= c!64407 (bvsge (x!52448 lt!253626) #b01111111111111111111111111111110))))

(declare-fun lt!253747 () (_ BitVec 64))

(assert (=> d!83417 (= lt!253747 (select (arr!16883 a!3118) (index!23545 lt!253626)))))

(assert (=> d!83417 (validMask!0 mask!3119)))

(assert (=> d!83417 (= (seekKeyOrZeroReturnVacant!0 (x!52448 lt!253626) (index!23545 lt!253626) (index!23545 lt!253626) (select (arr!16883 a!3118) j!142) a!3118 mask!3119) lt!253748)))

(declare-fun b!558587 () Bool)

(assert (=> b!558587 (= e!321769 e!321768)))

(declare-fun c!64408 () Bool)

(assert (=> b!558587 (= c!64408 (= lt!253747 (select (arr!16883 a!3118) j!142)))))

(declare-fun b!558588 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558588 (= e!321770 (seekKeyOrZeroReturnVacant!0 (bvadd (x!52448 lt!253626) #b00000000000000000000000000000001) (nextIndex!0 (index!23545 lt!253626) (x!52448 lt!253626) mask!3119) (index!23545 lt!253626) (select (arr!16883 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!558589 () Bool)

(declare-fun c!64406 () Bool)

(assert (=> b!558589 (= c!64406 (= lt!253747 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!558589 (= e!321768 e!321770)))

(declare-fun b!558590 () Bool)

(assert (=> b!558590 (= e!321769 Undefined!5329)))

(assert (= (and d!83417 c!64407) b!558590))

(assert (= (and d!83417 (not c!64407)) b!558587))

(assert (= (and b!558587 c!64408) b!558586))

(assert (= (and b!558587 (not c!64408)) b!558589))

(assert (= (and b!558589 c!64406) b!558585))

(assert (= (and b!558589 (not c!64406)) b!558588))

(declare-fun m!536069 () Bool)

(assert (=> d!83417 m!536069))

(declare-fun m!536071 () Bool)

(assert (=> d!83417 m!536071))

(assert (=> d!83417 m!535825))

(assert (=> d!83417 m!535843))

(declare-fun m!536073 () Bool)

(assert (=> b!558588 m!536073))

(assert (=> b!558588 m!536073))

(assert (=> b!558588 m!535827))

(declare-fun m!536075 () Bool)

(assert (=> b!558588 m!536075))

(assert (=> b!558322 d!83417))

(declare-fun d!83429 () Bool)

(assert (=> d!83429 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!558317 d!83429))

(declare-fun d!83431 () Bool)

(declare-fun res!350461 () Bool)

(declare-fun e!321775 () Bool)

(assert (=> d!83431 (=> res!350461 e!321775)))

(assert (=> d!83431 (= res!350461 (= (select (arr!16883 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!83431 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!321775)))

(declare-fun b!558595 () Bool)

(declare-fun e!321776 () Bool)

(assert (=> b!558595 (= e!321775 e!321776)))

(declare-fun res!350462 () Bool)

(assert (=> b!558595 (=> (not res!350462) (not e!321776))))

(assert (=> b!558595 (= res!350462 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17248 a!3118)))))

(declare-fun b!558596 () Bool)

(assert (=> b!558596 (= e!321776 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83431 (not res!350461)) b!558595))

(assert (= (and b!558595 res!350462) b!558596))

(assert (=> d!83431 m!535981))

(declare-fun m!536077 () Bool)

(assert (=> b!558596 m!536077))

(assert (=> b!558323 d!83431))

(declare-fun d!83433 () Bool)

(declare-fun e!321828 () Bool)

(assert (=> d!83433 e!321828))

(declare-fun c!64442 () Bool)

(declare-fun lt!253777 () SeekEntryResult!5329)

(assert (=> d!83433 (= c!64442 (and ((_ is Intermediate!5329) lt!253777) (undefined!6141 lt!253777)))))

(declare-fun e!321827 () SeekEntryResult!5329)

(assert (=> d!83433 (= lt!253777 e!321827)))

(declare-fun c!64441 () Bool)

(assert (=> d!83433 (= c!64441 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!253776 () (_ BitVec 64))

(assert (=> d!83433 (= lt!253776 (select (arr!16883 (array!35156 (store (arr!16883 a!3118) i!1132 k0!1914) (size!17248 a!3118))) lt!253622))))

(assert (=> d!83433 (validMask!0 mask!3119)))

(assert (=> d!83433 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253622 (select (store (arr!16883 a!3118) i!1132 k0!1914) j!142) (array!35156 (store (arr!16883 a!3118) i!1132 k0!1914) (size!17248 a!3118)) mask!3119) lt!253777)))

(declare-fun b!558683 () Bool)

(assert (=> b!558683 (and (bvsge (index!23545 lt!253777) #b00000000000000000000000000000000) (bvslt (index!23545 lt!253777) (size!17248 (array!35156 (store (arr!16883 a!3118) i!1132 k0!1914) (size!17248 a!3118)))))))

(declare-fun res!350488 () Bool)

(assert (=> b!558683 (= res!350488 (= (select (arr!16883 (array!35156 (store (arr!16883 a!3118) i!1132 k0!1914) (size!17248 a!3118))) (index!23545 lt!253777)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!321829 () Bool)

(assert (=> b!558683 (=> res!350488 e!321829)))

(declare-fun b!558684 () Bool)

(assert (=> b!558684 (= e!321828 (bvsge (x!52448 lt!253777) #b01111111111111111111111111111110))))

(declare-fun b!558685 () Bool)

(assert (=> b!558685 (= e!321827 (Intermediate!5329 true lt!253622 #b00000000000000000000000000000000))))

(declare-fun b!558686 () Bool)

(assert (=> b!558686 (and (bvsge (index!23545 lt!253777) #b00000000000000000000000000000000) (bvslt (index!23545 lt!253777) (size!17248 (array!35156 (store (arr!16883 a!3118) i!1132 k0!1914) (size!17248 a!3118)))))))

(assert (=> b!558686 (= e!321829 (= (select (arr!16883 (array!35156 (store (arr!16883 a!3118) i!1132 k0!1914) (size!17248 a!3118))) (index!23545 lt!253777)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!321830 () SeekEntryResult!5329)

(declare-fun b!558687 () Bool)

(assert (=> b!558687 (= e!321830 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253622 #b00000000000000000000000000000000 mask!3119) (select (store (arr!16883 a!3118) i!1132 k0!1914) j!142) (array!35156 (store (arr!16883 a!3118) i!1132 k0!1914) (size!17248 a!3118)) mask!3119))))

(declare-fun b!558688 () Bool)

(declare-fun e!321826 () Bool)

(assert (=> b!558688 (= e!321828 e!321826)))

(declare-fun res!350489 () Bool)

(assert (=> b!558688 (= res!350489 (and ((_ is Intermediate!5329) lt!253777) (not (undefined!6141 lt!253777)) (bvslt (x!52448 lt!253777) #b01111111111111111111111111111110) (bvsge (x!52448 lt!253777) #b00000000000000000000000000000000) (bvsge (x!52448 lt!253777) #b00000000000000000000000000000000)))))

(assert (=> b!558688 (=> (not res!350489) (not e!321826))))

(declare-fun b!558689 () Bool)

(assert (=> b!558689 (and (bvsge (index!23545 lt!253777) #b00000000000000000000000000000000) (bvslt (index!23545 lt!253777) (size!17248 (array!35156 (store (arr!16883 a!3118) i!1132 k0!1914) (size!17248 a!3118)))))))

(declare-fun res!350490 () Bool)

(assert (=> b!558689 (= res!350490 (= (select (arr!16883 (array!35156 (store (arr!16883 a!3118) i!1132 k0!1914) (size!17248 a!3118))) (index!23545 lt!253777)) (select (store (arr!16883 a!3118) i!1132 k0!1914) j!142)))))

(assert (=> b!558689 (=> res!350490 e!321829)))

(assert (=> b!558689 (= e!321826 e!321829)))

(declare-fun b!558690 () Bool)

(assert (=> b!558690 (= e!321827 e!321830)))

(declare-fun c!64440 () Bool)

(assert (=> b!558690 (= c!64440 (or (= lt!253776 (select (store (arr!16883 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!253776 lt!253776) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558691 () Bool)

(assert (=> b!558691 (= e!321830 (Intermediate!5329 false lt!253622 #b00000000000000000000000000000000))))

(assert (= (and d!83433 c!64441) b!558685))

(assert (= (and d!83433 (not c!64441)) b!558690))

(assert (= (and b!558690 c!64440) b!558691))

(assert (= (and b!558690 (not c!64440)) b!558687))

(assert (= (and d!83433 c!64442) b!558684))

(assert (= (and d!83433 (not c!64442)) b!558688))

(assert (= (and b!558688 res!350489) b!558689))

(assert (= (and b!558689 (not res!350490)) b!558683))

(assert (= (and b!558683 (not res!350488)) b!558686))

(declare-fun m!536123 () Bool)

(assert (=> b!558687 m!536123))

(assert (=> b!558687 m!536123))

(assert (=> b!558687 m!535849))

(declare-fun m!536127 () Bool)

(assert (=> b!558687 m!536127))

(declare-fun m!536129 () Bool)

(assert (=> b!558689 m!536129))

(declare-fun m!536131 () Bool)

(assert (=> d!83433 m!536131))

(assert (=> d!83433 m!535843))

(assert (=> b!558683 m!536129))

(assert (=> b!558686 m!536129))

(assert (=> b!558318 d!83433))

(declare-fun d!83447 () Bool)

(declare-fun e!321835 () Bool)

(assert (=> d!83447 e!321835))

(declare-fun c!64445 () Bool)

(declare-fun lt!253787 () SeekEntryResult!5329)

(assert (=> d!83447 (= c!64445 (and ((_ is Intermediate!5329) lt!253787) (undefined!6141 lt!253787)))))

(declare-fun e!321834 () SeekEntryResult!5329)

(assert (=> d!83447 (= lt!253787 e!321834)))

(declare-fun c!64444 () Bool)

(assert (=> d!83447 (= c!64444 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!253786 () (_ BitVec 64))

(assert (=> d!83447 (= lt!253786 (select (arr!16883 a!3118) lt!253623))))

(assert (=> d!83447 (validMask!0 mask!3119)))

(assert (=> d!83447 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253623 (select (arr!16883 a!3118) j!142) a!3118 mask!3119) lt!253787)))

(declare-fun b!558694 () Bool)

(assert (=> b!558694 (and (bvsge (index!23545 lt!253787) #b00000000000000000000000000000000) (bvslt (index!23545 lt!253787) (size!17248 a!3118)))))

(declare-fun res!350493 () Bool)

(assert (=> b!558694 (= res!350493 (= (select (arr!16883 a!3118) (index!23545 lt!253787)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!321836 () Bool)

(assert (=> b!558694 (=> res!350493 e!321836)))

(declare-fun b!558695 () Bool)

(assert (=> b!558695 (= e!321835 (bvsge (x!52448 lt!253787) #b01111111111111111111111111111110))))

(declare-fun b!558696 () Bool)

(assert (=> b!558696 (= e!321834 (Intermediate!5329 true lt!253623 #b00000000000000000000000000000000))))

(declare-fun b!558697 () Bool)

(assert (=> b!558697 (and (bvsge (index!23545 lt!253787) #b00000000000000000000000000000000) (bvslt (index!23545 lt!253787) (size!17248 a!3118)))))

(assert (=> b!558697 (= e!321836 (= (select (arr!16883 a!3118) (index!23545 lt!253787)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!558698 () Bool)

(declare-fun e!321837 () SeekEntryResult!5329)

(assert (=> b!558698 (= e!321837 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253623 #b00000000000000000000000000000000 mask!3119) (select (arr!16883 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!558699 () Bool)

(declare-fun e!321833 () Bool)

(assert (=> b!558699 (= e!321835 e!321833)))

(declare-fun res!350494 () Bool)

(assert (=> b!558699 (= res!350494 (and ((_ is Intermediate!5329) lt!253787) (not (undefined!6141 lt!253787)) (bvslt (x!52448 lt!253787) #b01111111111111111111111111111110) (bvsge (x!52448 lt!253787) #b00000000000000000000000000000000) (bvsge (x!52448 lt!253787) #b00000000000000000000000000000000)))))

(assert (=> b!558699 (=> (not res!350494) (not e!321833))))

(declare-fun b!558700 () Bool)

(assert (=> b!558700 (and (bvsge (index!23545 lt!253787) #b00000000000000000000000000000000) (bvslt (index!23545 lt!253787) (size!17248 a!3118)))))

(declare-fun res!350495 () Bool)

(assert (=> b!558700 (= res!350495 (= (select (arr!16883 a!3118) (index!23545 lt!253787)) (select (arr!16883 a!3118) j!142)))))

(assert (=> b!558700 (=> res!350495 e!321836)))

(assert (=> b!558700 (= e!321833 e!321836)))

(declare-fun b!558701 () Bool)

(assert (=> b!558701 (= e!321834 e!321837)))

(declare-fun c!64443 () Bool)

(assert (=> b!558701 (= c!64443 (or (= lt!253786 (select (arr!16883 a!3118) j!142)) (= (bvadd lt!253786 lt!253786) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558702 () Bool)

(assert (=> b!558702 (= e!321837 (Intermediate!5329 false lt!253623 #b00000000000000000000000000000000))))

(assert (= (and d!83447 c!64444) b!558696))

(assert (= (and d!83447 (not c!64444)) b!558701))

(assert (= (and b!558701 c!64443) b!558702))

(assert (= (and b!558701 (not c!64443)) b!558698))

(assert (= (and d!83447 c!64445) b!558695))

(assert (= (and d!83447 (not c!64445)) b!558699))

(assert (= (and b!558699 res!350494) b!558700))

(assert (= (and b!558700 (not res!350495)) b!558694))

(assert (= (and b!558694 (not res!350493)) b!558697))

(declare-fun m!536133 () Bool)

(assert (=> b!558698 m!536133))

(assert (=> b!558698 m!536133))

(assert (=> b!558698 m!535827))

(declare-fun m!536135 () Bool)

(assert (=> b!558698 m!536135))

(declare-fun m!536137 () Bool)

(assert (=> b!558700 m!536137))

(declare-fun m!536139 () Bool)

(assert (=> d!83447 m!536139))

(assert (=> d!83447 m!535843))

(assert (=> b!558694 m!536137))

(assert (=> b!558697 m!536137))

(assert (=> b!558318 d!83447))

(declare-fun d!83453 () Bool)

(declare-fun lt!253793 () (_ BitVec 32))

(declare-fun lt!253792 () (_ BitVec 32))

(assert (=> d!83453 (= lt!253793 (bvmul (bvxor lt!253792 (bvlshr lt!253792 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83453 (= lt!253792 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16883 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16883 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83453 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!350496 (let ((h!11997 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16883 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16883 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52458 (bvmul (bvxor h!11997 (bvlshr h!11997 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52458 (bvlshr x!52458 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!350496 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!350496 #b00000000000000000000000000000000))))))

(assert (=> d!83453 (= (toIndex!0 (select (store (arr!16883 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!253793 (bvlshr lt!253793 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!558318 d!83453))

(declare-fun d!83455 () Bool)

(declare-fun lt!253795 () (_ BitVec 32))

(declare-fun lt!253794 () (_ BitVec 32))

(assert (=> d!83455 (= lt!253795 (bvmul (bvxor lt!253794 (bvlshr lt!253794 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83455 (= lt!253794 ((_ extract 31 0) (bvand (bvxor (select (arr!16883 a!3118) j!142) (bvlshr (select (arr!16883 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83455 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!350496 (let ((h!11997 ((_ extract 31 0) (bvand (bvxor (select (arr!16883 a!3118) j!142) (bvlshr (select (arr!16883 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52458 (bvmul (bvxor h!11997 (bvlshr h!11997 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52458 (bvlshr x!52458 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!350496 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!350496 #b00000000000000000000000000000000))))))

(assert (=> d!83455 (= (toIndex!0 (select (arr!16883 a!3118) j!142) mask!3119) (bvand (bvxor lt!253795 (bvlshr lt!253795 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!558318 d!83455))

(check-sat (not b!558422) (not bm!32371) (not d!83447) (not b!558471) (not b!558588) (not d!83417) (not b!558503) (not b!558479) (not b!558473) (not b!558502) (not b!558513) (not bm!32375) (not d!83373) (not bm!32374) (not d!83399) (not d!83409) (not b!558512) (not b!558472) (not b!558687) (not b!558596) (not d!83433) (not b!558698))
(check-sat)
