; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50994 () Bool)

(assert start!50994)

(declare-fun b!557471 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!321154 () Bool)

(declare-datatypes ((array!35105 0))(
  ( (array!35106 (arr!16859 (Array (_ BitVec 32) (_ BitVec 64))) (size!17223 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35105)

(declare-datatypes ((SeekEntryResult!5308 0))(
  ( (MissingZero!5308 (index!23459 (_ BitVec 32))) (Found!5308 (index!23460 (_ BitVec 32))) (Intermediate!5308 (undefined!6120 Bool) (index!23461 (_ BitVec 32)) (x!52354 (_ BitVec 32))) (Undefined!5308) (MissingVacant!5308 (index!23462 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35105 (_ BitVec 32)) SeekEntryResult!5308)

(assert (=> b!557471 (= e!321154 (= (seekEntryOrOpen!0 (select (arr!16859 a!3118) j!142) a!3118 mask!3119) (Found!5308 j!142)))))

(declare-fun b!557472 () Bool)

(declare-fun res!349521 () Bool)

(declare-fun e!321152 () Bool)

(assert (=> b!557472 (=> (not res!349521) (not e!321152))))

(declare-datatypes ((List!10939 0))(
  ( (Nil!10936) (Cons!10935 (h!11926 (_ BitVec 64)) (t!17167 List!10939)) )
))
(declare-fun arrayNoDuplicates!0 (array!35105 (_ BitVec 32) List!10939) Bool)

(assert (=> b!557472 (= res!349521 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10936))))

(declare-fun res!349520 () Bool)

(declare-fun e!321156 () Bool)

(assert (=> start!50994 (=> (not res!349520) (not e!321156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50994 (= res!349520 (validMask!0 mask!3119))))

(assert (=> start!50994 e!321156))

(assert (=> start!50994 true))

(declare-fun array_inv!12655 (array!35105) Bool)

(assert (=> start!50994 (array_inv!12655 a!3118)))

(declare-fun b!557473 () Bool)

(assert (=> b!557473 (= e!321156 e!321152)))

(declare-fun res!349522 () Bool)

(assert (=> b!557473 (=> (not res!349522) (not e!321152))))

(declare-fun lt!253318 () SeekEntryResult!5308)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!557473 (= res!349522 (or (= lt!253318 (MissingZero!5308 i!1132)) (= lt!253318 (MissingVacant!5308 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!557473 (= lt!253318 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!557474 () Bool)

(declare-fun e!321153 () Bool)

(assert (=> b!557474 (= e!321152 e!321153)))

(declare-fun res!349524 () Bool)

(assert (=> b!557474 (=> (not res!349524) (not e!321153))))

(declare-fun lt!253315 () (_ BitVec 32))

(declare-fun lt!253314 () SeekEntryResult!5308)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35105 (_ BitVec 32)) SeekEntryResult!5308)

(assert (=> b!557474 (= res!349524 (= lt!253314 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253315 (select (store (arr!16859 a!3118) i!1132 k!1914) j!142) (array!35106 (store (arr!16859 a!3118) i!1132 k!1914) (size!17223 a!3118)) mask!3119)))))

(declare-fun lt!253316 () (_ BitVec 32))

(assert (=> b!557474 (= lt!253314 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253316 (select (arr!16859 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557474 (= lt!253315 (toIndex!0 (select (store (arr!16859 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!557474 (= lt!253316 (toIndex!0 (select (arr!16859 a!3118) j!142) mask!3119))))

(declare-fun b!557475 () Bool)

(declare-fun res!349517 () Bool)

(assert (=> b!557475 (=> (not res!349517) (not e!321156))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!557475 (= res!349517 (validKeyInArray!0 k!1914))))

(declare-fun b!557476 () Bool)

(declare-fun res!349526 () Bool)

(assert (=> b!557476 (=> (not res!349526) (not e!321156))))

(assert (=> b!557476 (= res!349526 (and (= (size!17223 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17223 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17223 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!557477 () Bool)

(declare-fun res!349525 () Bool)

(assert (=> b!557477 (=> (not res!349525) (not e!321156))))

(assert (=> b!557477 (= res!349525 (validKeyInArray!0 (select (arr!16859 a!3118) j!142)))))

(declare-fun b!557478 () Bool)

(declare-fun res!349519 () Bool)

(assert (=> b!557478 (=> (not res!349519) (not e!321152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35105 (_ BitVec 32)) Bool)

(assert (=> b!557478 (= res!349519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!557479 () Bool)

(assert (=> b!557479 (= e!321153 (not (or (not (is-Intermediate!5308 lt!253314)) (undefined!6120 lt!253314) (= (select (arr!16859 a!3118) (index!23461 lt!253314)) (select (arr!16859 a!3118) j!142)) (= (select (arr!16859 a!3118) (index!23461 lt!253314)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt (index!23461 lt!253314) #b00000000000000000000000000000000) (bvsge (index!23461 lt!253314) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52354 lt!253314) #b01111111111111111111111111111110) (bvslt (x!52354 lt!253314) #b00000000000000000000000000000000) (= (select (arr!16859 a!3118) (index!23461 lt!253314)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!557479 e!321154))

(declare-fun res!349518 () Bool)

(assert (=> b!557479 (=> (not res!349518) (not e!321154))))

(assert (=> b!557479 (= res!349518 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17390 0))(
  ( (Unit!17391) )
))
(declare-fun lt!253317 () Unit!17390)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35105 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17390)

(assert (=> b!557479 (= lt!253317 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!557480 () Bool)

(declare-fun res!349523 () Bool)

(assert (=> b!557480 (=> (not res!349523) (not e!321156))))

(declare-fun arrayContainsKey!0 (array!35105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!557480 (= res!349523 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50994 res!349520) b!557476))

(assert (= (and b!557476 res!349526) b!557477))

(assert (= (and b!557477 res!349525) b!557475))

(assert (= (and b!557475 res!349517) b!557480))

(assert (= (and b!557480 res!349523) b!557473))

(assert (= (and b!557473 res!349522) b!557478))

(assert (= (and b!557478 res!349519) b!557472))

(assert (= (and b!557472 res!349521) b!557474))

(assert (= (and b!557474 res!349524) b!557479))

(assert (= (and b!557479 res!349518) b!557471))

(declare-fun m!535399 () Bool)

(assert (=> b!557472 m!535399))

(declare-fun m!535401 () Bool)

(assert (=> b!557477 m!535401))

(assert (=> b!557477 m!535401))

(declare-fun m!535403 () Bool)

(assert (=> b!557477 m!535403))

(declare-fun m!535405 () Bool)

(assert (=> start!50994 m!535405))

(declare-fun m!535407 () Bool)

(assert (=> start!50994 m!535407))

(assert (=> b!557471 m!535401))

(assert (=> b!557471 m!535401))

(declare-fun m!535409 () Bool)

(assert (=> b!557471 m!535409))

(declare-fun m!535411 () Bool)

(assert (=> b!557480 m!535411))

(declare-fun m!535413 () Bool)

(assert (=> b!557478 m!535413))

(assert (=> b!557474 m!535401))

(declare-fun m!535415 () Bool)

(assert (=> b!557474 m!535415))

(assert (=> b!557474 m!535401))

(declare-fun m!535417 () Bool)

(assert (=> b!557474 m!535417))

(assert (=> b!557474 m!535401))

(declare-fun m!535419 () Bool)

(assert (=> b!557474 m!535419))

(assert (=> b!557474 m!535417))

(declare-fun m!535421 () Bool)

(assert (=> b!557474 m!535421))

(assert (=> b!557474 m!535417))

(declare-fun m!535423 () Bool)

(assert (=> b!557474 m!535423))

(declare-fun m!535425 () Bool)

(assert (=> b!557474 m!535425))

(declare-fun m!535427 () Bool)

(assert (=> b!557475 m!535427))

(declare-fun m!535429 () Bool)

(assert (=> b!557479 m!535429))

(assert (=> b!557479 m!535401))

(declare-fun m!535431 () Bool)

(assert (=> b!557479 m!535431))

(declare-fun m!535433 () Bool)

(assert (=> b!557479 m!535433))

(declare-fun m!535435 () Bool)

(assert (=> b!557473 m!535435))

(push 1)

(assert (not b!557479))

(assert (not b!557478))

(assert (not b!557475))

(assert (not b!557474))

(assert (not b!557477))

(assert (not b!557471))

(assert (not b!557472))

(assert (not b!557480))

(assert (not b!557473))

(assert (not start!50994))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!557558 () Bool)

(declare-fun e!321209 () Bool)

(declare-fun call!32381 () Bool)

(assert (=> b!557558 (= e!321209 call!32381)))

(declare-fun bm!32378 () Bool)

(assert (=> bm!32378 (= call!32381 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!557559 () Bool)

(declare-fun e!321207 () Bool)

(assert (=> b!557559 (= e!321207 call!32381)))

(declare-fun d!83489 () Bool)

(declare-fun res!349561 () Bool)

(declare-fun e!321210 () Bool)

(assert (=> d!83489 (=> res!349561 e!321210)))

(assert (=> d!83489 (= res!349561 (bvsge #b00000000000000000000000000000000 (size!17223 a!3118)))))

(assert (=> d!83489 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!321210)))

(declare-fun b!557560 () Bool)

(assert (=> b!557560 (= e!321210 e!321209)))

(declare-fun c!64339 () Bool)

(assert (=> b!557560 (= c!64339 (validKeyInArray!0 (select (arr!16859 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!557561 () Bool)

(assert (=> b!557561 (= e!321209 e!321207)))

(declare-fun lt!253354 () (_ BitVec 64))

(assert (=> b!557561 (= lt!253354 (select (arr!16859 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!253353 () Unit!17390)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35105 (_ BitVec 64) (_ BitVec 32)) Unit!17390)

(assert (=> b!557561 (= lt!253353 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253354 #b00000000000000000000000000000000))))

(assert (=> b!557561 (arrayContainsKey!0 a!3118 lt!253354 #b00000000000000000000000000000000)))

(declare-fun lt!253355 () Unit!17390)

(assert (=> b!557561 (= lt!253355 lt!253353)))

(declare-fun res!349562 () Bool)

(assert (=> b!557561 (= res!349562 (= (seekEntryOrOpen!0 (select (arr!16859 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5308 #b00000000000000000000000000000000)))))

(assert (=> b!557561 (=> (not res!349562) (not e!321207))))

(assert (= (and d!83489 (not res!349561)) b!557560))

(assert (= (and b!557560 c!64339) b!557561))

(assert (= (and b!557560 (not c!64339)) b!557558))

(assert (= (and b!557561 res!349562) b!557559))

(assert (= (or b!557559 b!557558) bm!32378))

(declare-fun m!535469 () Bool)

(assert (=> bm!32378 m!535469))

(declare-fun m!535471 () Bool)

(assert (=> b!557560 m!535471))

(assert (=> b!557560 m!535471))

(declare-fun m!535473 () Bool)

(assert (=> b!557560 m!535473))

(assert (=> b!557561 m!535471))

(declare-fun m!535475 () Bool)

(assert (=> b!557561 m!535475))

(declare-fun m!535477 () Bool)

(assert (=> b!557561 m!535477))

(assert (=> b!557561 m!535471))

(declare-fun m!535479 () Bool)

(assert (=> b!557561 m!535479))

(assert (=> b!557478 d!83489))

(declare-fun b!557602 () Bool)

(declare-fun e!321234 () SeekEntryResult!5308)

(declare-fun e!321236 () SeekEntryResult!5308)

(assert (=> b!557602 (= e!321234 e!321236)))

(declare-fun lt!253385 () (_ BitVec 64))

(declare-fun lt!253383 () SeekEntryResult!5308)

(assert (=> b!557602 (= lt!253385 (select (arr!16859 a!3118) (index!23461 lt!253383)))))

(declare-fun c!64357 () Bool)

(assert (=> b!557602 (= c!64357 (= lt!253385 k!1914))))

(declare-fun b!557603 () Bool)

(assert (=> b!557603 (= e!321234 Undefined!5308)))

(declare-fun d!83495 () Bool)

(declare-fun lt!253384 () SeekEntryResult!5308)

(assert (=> d!83495 (and (or (is-Undefined!5308 lt!253384) (not (is-Found!5308 lt!253384)) (and (bvsge (index!23460 lt!253384) #b00000000000000000000000000000000) (bvslt (index!23460 lt!253384) (size!17223 a!3118)))) (or (is-Undefined!5308 lt!253384) (is-Found!5308 lt!253384) (not (is-MissingZero!5308 lt!253384)) (and (bvsge (index!23459 lt!253384) #b00000000000000000000000000000000) (bvslt (index!23459 lt!253384) (size!17223 a!3118)))) (or (is-Undefined!5308 lt!253384) (is-Found!5308 lt!253384) (is-MissingZero!5308 lt!253384) (not (is-MissingVacant!5308 lt!253384)) (and (bvsge (index!23462 lt!253384) #b00000000000000000000000000000000) (bvslt (index!23462 lt!253384) (size!17223 a!3118)))) (or (is-Undefined!5308 lt!253384) (ite (is-Found!5308 lt!253384) (= (select (arr!16859 a!3118) (index!23460 lt!253384)) k!1914) (ite (is-MissingZero!5308 lt!253384) (= (select (arr!16859 a!3118) (index!23459 lt!253384)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5308 lt!253384) (= (select (arr!16859 a!3118) (index!23462 lt!253384)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83495 (= lt!253384 e!321234)))

(declare-fun c!64358 () Bool)

(assert (=> d!83495 (= c!64358 (and (is-Intermediate!5308 lt!253383) (undefined!6120 lt!253383)))))

(assert (=> d!83495 (= lt!253383 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!83495 (validMask!0 mask!3119)))

(assert (=> d!83495 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!253384)))

(declare-fun b!557604 () Bool)

(declare-fun e!321235 () SeekEntryResult!5308)

(assert (=> b!557604 (= e!321235 (MissingZero!5308 (index!23461 lt!253383)))))

(declare-fun b!557605 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35105 (_ BitVec 32)) SeekEntryResult!5308)

(assert (=> b!557605 (= e!321235 (seekKeyOrZeroReturnVacant!0 (x!52354 lt!253383) (index!23461 lt!253383) (index!23461 lt!253383) k!1914 a!3118 mask!3119))))

(declare-fun b!557606 () Bool)

(declare-fun c!64359 () Bool)

(assert (=> b!557606 (= c!64359 (= lt!253385 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!557606 (= e!321236 e!321235)))

(declare-fun b!557607 () Bool)

(assert (=> b!557607 (= e!321236 (Found!5308 (index!23461 lt!253383)))))

(assert (= (and d!83495 c!64358) b!557603))

(assert (= (and d!83495 (not c!64358)) b!557602))

(assert (= (and b!557602 c!64357) b!557607))

(assert (= (and b!557602 (not c!64357)) b!557606))

(assert (= (and b!557606 c!64359) b!557604))

(assert (= (and b!557606 (not c!64359)) b!557605))

(declare-fun m!535513 () Bool)

(assert (=> b!557602 m!535513))

(assert (=> d!83495 m!535405))

(declare-fun m!535515 () Bool)

(assert (=> d!83495 m!535515))

(declare-fun m!535517 () Bool)

(assert (=> d!83495 m!535517))

(declare-fun m!535519 () Bool)

(assert (=> d!83495 m!535519))

(assert (=> d!83495 m!535517))

(declare-fun m!535521 () Bool)

(assert (=> d!83495 m!535521))

(declare-fun m!535523 () Bool)

(assert (=> d!83495 m!535523))

(declare-fun m!535525 () Bool)

(assert (=> b!557605 m!535525))

(assert (=> b!557473 d!83495))

(declare-fun b!557608 () Bool)

(declare-fun e!321237 () SeekEntryResult!5308)

(declare-fun e!321239 () SeekEntryResult!5308)

(assert (=> b!557608 (= e!321237 e!321239)))

(declare-fun lt!253388 () (_ BitVec 64))

(declare-fun lt!253386 () SeekEntryResult!5308)

(assert (=> b!557608 (= lt!253388 (select (arr!16859 a!3118) (index!23461 lt!253386)))))

(declare-fun c!64360 () Bool)

(assert (=> b!557608 (= c!64360 (= lt!253388 (select (arr!16859 a!3118) j!142)))))

(declare-fun b!557609 () Bool)

(assert (=> b!557609 (= e!321237 Undefined!5308)))

(declare-fun d!83513 () Bool)

(declare-fun lt!253387 () SeekEntryResult!5308)

(assert (=> d!83513 (and (or (is-Undefined!5308 lt!253387) (not (is-Found!5308 lt!253387)) (and (bvsge (index!23460 lt!253387) #b00000000000000000000000000000000) (bvslt (index!23460 lt!253387) (size!17223 a!3118)))) (or (is-Undefined!5308 lt!253387) (is-Found!5308 lt!253387) (not (is-MissingZero!5308 lt!253387)) (and (bvsge (index!23459 lt!253387) #b00000000000000000000000000000000) (bvslt (index!23459 lt!253387) (size!17223 a!3118)))) (or (is-Undefined!5308 lt!253387) (is-Found!5308 lt!253387) (is-MissingZero!5308 lt!253387) (not (is-MissingVacant!5308 lt!253387)) (and (bvsge (index!23462 lt!253387) #b00000000000000000000000000000000) (bvslt (index!23462 lt!253387) (size!17223 a!3118)))) (or (is-Undefined!5308 lt!253387) (ite (is-Found!5308 lt!253387) (= (select (arr!16859 a!3118) (index!23460 lt!253387)) (select (arr!16859 a!3118) j!142)) (ite (is-MissingZero!5308 lt!253387) (= (select (arr!16859 a!3118) (index!23459 lt!253387)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5308 lt!253387) (= (select (arr!16859 a!3118) (index!23462 lt!253387)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83513 (= lt!253387 e!321237)))

(declare-fun c!64361 () Bool)

(assert (=> d!83513 (= c!64361 (and (is-Intermediate!5308 lt!253386) (undefined!6120 lt!253386)))))

(assert (=> d!83513 (= lt!253386 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16859 a!3118) j!142) mask!3119) (select (arr!16859 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83513 (validMask!0 mask!3119)))

(assert (=> d!83513 (= (seekEntryOrOpen!0 (select (arr!16859 a!3118) j!142) a!3118 mask!3119) lt!253387)))

(declare-fun b!557610 () Bool)

(declare-fun e!321238 () SeekEntryResult!5308)

(assert (=> b!557610 (= e!321238 (MissingZero!5308 (index!23461 lt!253386)))))

(declare-fun b!557611 () Bool)

(assert (=> b!557611 (= e!321238 (seekKeyOrZeroReturnVacant!0 (x!52354 lt!253386) (index!23461 lt!253386) (index!23461 lt!253386) (select (arr!16859 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!557612 () Bool)

(declare-fun c!64362 () Bool)

(assert (=> b!557612 (= c!64362 (= lt!253388 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!557612 (= e!321239 e!321238)))

(declare-fun b!557613 () Bool)

(assert (=> b!557613 (= e!321239 (Found!5308 (index!23461 lt!253386)))))

(assert (= (and d!83513 c!64361) b!557609))

(assert (= (and d!83513 (not c!64361)) b!557608))

(assert (= (and b!557608 c!64360) b!557613))

(assert (= (and b!557608 (not c!64360)) b!557612))

(assert (= (and b!557612 c!64362) b!557610))

(assert (= (and b!557612 (not c!64362)) b!557611))

(declare-fun m!535527 () Bool)

(assert (=> b!557608 m!535527))

(assert (=> d!83513 m!535405))

(declare-fun m!535529 () Bool)

(assert (=> d!83513 m!535529))

(assert (=> d!83513 m!535415))

(assert (=> d!83513 m!535401))

(declare-fun m!535531 () Bool)

(assert (=> d!83513 m!535531))

(assert (=> d!83513 m!535401))

(assert (=> d!83513 m!535415))

(declare-fun m!535533 () Bool)

(assert (=> d!83513 m!535533))

(declare-fun m!535535 () Bool)

(assert (=> d!83513 m!535535))

(assert (=> b!557611 m!535401))

(declare-fun m!535537 () Bool)

(assert (=> b!557611 m!535537))

(assert (=> b!557471 d!83513))

(declare-fun b!557630 () Bool)

(declare-fun e!321254 () Bool)

(declare-fun call!32388 () Bool)

(assert (=> b!557630 (= e!321254 call!32388)))

(declare-fun b!557631 () Bool)

(declare-fun e!321255 () Bool)

(declare-fun contains!2852 (List!10939 (_ BitVec 64)) Bool)

(assert (=> b!557631 (= e!321255 (contains!2852 Nil!10936 (select (arr!16859 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!557632 () Bool)

(declare-fun e!321256 () Bool)

(assert (=> b!557632 (= e!321256 e!321254)))

(declare-fun c!64365 () Bool)

(assert (=> b!557632 (= c!64365 (validKeyInArray!0 (select (arr!16859 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32385 () Bool)

(assert (=> bm!32385 (= call!32388 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64365 (Cons!10935 (select (arr!16859 a!3118) #b00000000000000000000000000000000) Nil!10936) Nil!10936)))))

(declare-fun b!557633 () Bool)

(declare-fun e!321257 () Bool)

(assert (=> b!557633 (= e!321257 e!321256)))

(declare-fun res!349581 () Bool)

(assert (=> b!557633 (=> (not res!349581) (not e!321256))))

(assert (=> b!557633 (= res!349581 (not e!321255))))

(declare-fun res!349582 () Bool)

(assert (=> b!557633 (=> (not res!349582) (not e!321255))))

(assert (=> b!557633 (= res!349582 (validKeyInArray!0 (select (arr!16859 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!557634 () Bool)

(assert (=> b!557634 (= e!321254 call!32388)))

(declare-fun d!83515 () Bool)

(declare-fun res!349583 () Bool)

(assert (=> d!83515 (=> res!349583 e!321257)))

(assert (=> d!83515 (= res!349583 (bvsge #b00000000000000000000000000000000 (size!17223 a!3118)))))

(assert (=> d!83515 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10936) e!321257)))

(assert (= (and d!83515 (not res!349583)) b!557633))

(assert (= (and b!557633 res!349582) b!557631))

(assert (= (and b!557633 res!349581) b!557632))

(assert (= (and b!557632 c!64365) b!557634))

(assert (= (and b!557632 (not c!64365)) b!557630))

(assert (= (or b!557634 b!557630) bm!32385))

(assert (=> b!557631 m!535471))

(assert (=> b!557631 m!535471))

(declare-fun m!535541 () Bool)

(assert (=> b!557631 m!535541))

(assert (=> b!557632 m!535471))

(assert (=> b!557632 m!535471))

(assert (=> b!557632 m!535473))

(assert (=> bm!32385 m!535471))

(declare-fun m!535543 () Bool)

(assert (=> bm!32385 m!535543))

(assert (=> b!557633 m!535471))

(assert (=> b!557633 m!535471))

(assert (=> b!557633 m!535473))

(assert (=> b!557472 d!83515))

(declare-fun d!83521 () Bool)

(assert (=> d!83521 (= (validKeyInArray!0 (select (arr!16859 a!3118) j!142)) (and (not (= (select (arr!16859 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16859 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!557477 d!83521))

(declare-fun d!83523 () Bool)

(assert (=> d!83523 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50994 d!83523))

(declare-fun d!83529 () Bool)

(assert (=> d!83529 (= (array_inv!12655 a!3118) (bvsge (size!17223 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50994 d!83529))

(declare-fun d!83533 () Bool)

(assert (=> d!83533 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!557475 d!83533))

(declare-fun b!557733 () Bool)

(declare-fun lt!253427 () SeekEntryResult!5308)

(assert (=> b!557733 (and (bvsge (index!23461 lt!253427) #b00000000000000000000000000000000) (bvslt (index!23461 lt!253427) (size!17223 (array!35106 (store (arr!16859 a!3118) i!1132 k!1914) (size!17223 a!3118)))))))

(declare-fun res!349619 () Bool)

(assert (=> b!557733 (= res!349619 (= (select (arr!16859 (array!35106 (store (arr!16859 a!3118) i!1132 k!1914) (size!17223 a!3118))) (index!23461 lt!253427)) (select (store (arr!16859 a!3118) i!1132 k!1914) j!142)))))

(declare-fun e!321317 () Bool)

(assert (=> b!557733 (=> res!349619 e!321317)))

(declare-fun e!321320 () Bool)

(assert (=> b!557733 (= e!321320 e!321317)))

(declare-fun b!557735 () Bool)

(assert (=> b!557735 (and (bvsge (index!23461 lt!253427) #b00000000000000000000000000000000) (bvslt (index!23461 lt!253427) (size!17223 (array!35106 (store (arr!16859 a!3118) i!1132 k!1914) (size!17223 a!3118)))))))

(declare-fun res!349618 () Bool)

(assert (=> b!557735 (= res!349618 (= (select (arr!16859 (array!35106 (store (arr!16859 a!3118) i!1132 k!1914) (size!17223 a!3118))) (index!23461 lt!253427)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!557735 (=> res!349618 e!321317)))

(declare-fun b!557736 () Bool)

(declare-fun e!321319 () Bool)

(assert (=> b!557736 (= e!321319 e!321320)))

(declare-fun res!349617 () Bool)

(assert (=> b!557736 (= res!349617 (and (is-Intermediate!5308 lt!253427) (not (undefined!6120 lt!253427)) (bvslt (x!52354 lt!253427) #b01111111111111111111111111111110) (bvsge (x!52354 lt!253427) #b00000000000000000000000000000000) (bvsge (x!52354 lt!253427) #b00000000000000000000000000000000)))))

(assert (=> b!557736 (=> (not res!349617) (not e!321320))))

(declare-fun b!557737 () Bool)

(declare-fun e!321321 () SeekEntryResult!5308)

(assert (=> b!557737 (= e!321321 (Intermediate!5308 false lt!253315 #b00000000000000000000000000000000))))

(declare-fun b!557738 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557738 (= e!321321 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253315 #b00000000000000000000000000000000 mask!3119) (select (store (arr!16859 a!3118) i!1132 k!1914) j!142) (array!35106 (store (arr!16859 a!3118) i!1132 k!1914) (size!17223 a!3118)) mask!3119))))

(declare-fun b!557739 () Bool)

(declare-fun e!321318 () SeekEntryResult!5308)

(assert (=> b!557739 (= e!321318 e!321321)))

(declare-fun c!64401 () Bool)

(declare-fun lt!253428 () (_ BitVec 64))

(assert (=> b!557739 (= c!64401 (or (= lt!253428 (select (store (arr!16859 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!253428 lt!253428) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!557740 () Bool)

(assert (=> b!557740 (and (bvsge (index!23461 lt!253427) #b00000000000000000000000000000000) (bvslt (index!23461 lt!253427) (size!17223 (array!35106 (store (arr!16859 a!3118) i!1132 k!1914) (size!17223 a!3118)))))))

(assert (=> b!557740 (= e!321317 (= (select (arr!16859 (array!35106 (store (arr!16859 a!3118) i!1132 k!1914) (size!17223 a!3118))) (index!23461 lt!253427)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!557741 () Bool)

(assert (=> b!557741 (= e!321318 (Intermediate!5308 true lt!253315 #b00000000000000000000000000000000))))

(declare-fun b!557734 () Bool)

(assert (=> b!557734 (= e!321319 (bvsge (x!52354 lt!253427) #b01111111111111111111111111111110))))

(declare-fun d!83535 () Bool)

(assert (=> d!83535 e!321319))

(declare-fun c!64400 () Bool)

(assert (=> d!83535 (= c!64400 (and (is-Intermediate!5308 lt!253427) (undefined!6120 lt!253427)))))

(assert (=> d!83535 (= lt!253427 e!321318)))

(declare-fun c!64399 () Bool)

(assert (=> d!83535 (= c!64399 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83535 (= lt!253428 (select (arr!16859 (array!35106 (store (arr!16859 a!3118) i!1132 k!1914) (size!17223 a!3118))) lt!253315))))

(assert (=> d!83535 (validMask!0 mask!3119)))

(assert (=> d!83535 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253315 (select (store (arr!16859 a!3118) i!1132 k!1914) j!142) (array!35106 (store (arr!16859 a!3118) i!1132 k!1914) (size!17223 a!3118)) mask!3119) lt!253427)))

(assert (= (and d!83535 c!64399) b!557741))

(assert (= (and d!83535 (not c!64399)) b!557739))

(assert (= (and b!557739 c!64401) b!557737))

(assert (= (and b!557739 (not c!64401)) b!557738))

(assert (= (and d!83535 c!64400) b!557734))

(assert (= (and d!83535 (not c!64400)) b!557736))

(assert (= (and b!557736 res!349617) b!557733))

(assert (= (and b!557733 (not res!349619)) b!557735))

(assert (= (and b!557735 (not res!349618)) b!557740))

(declare-fun m!535597 () Bool)

(assert (=> b!557735 m!535597))

(assert (=> b!557733 m!535597))

(declare-fun m!535599 () Bool)

(assert (=> d!83535 m!535599))

(assert (=> d!83535 m!535405))

(declare-fun m!535601 () Bool)

(assert (=> b!557738 m!535601))

(assert (=> b!557738 m!535601))

(assert (=> b!557738 m!535417))

(declare-fun m!535603 () Bool)

(assert (=> b!557738 m!535603))

(assert (=> b!557740 m!535597))

(assert (=> b!557474 d!83535))

(declare-fun b!557742 () Bool)

(declare-fun lt!253429 () SeekEntryResult!5308)

(assert (=> b!557742 (and (bvsge (index!23461 lt!253429) #b00000000000000000000000000000000) (bvslt (index!23461 lt!253429) (size!17223 a!3118)))))

(declare-fun res!349622 () Bool)

(assert (=> b!557742 (= res!349622 (= (select (arr!16859 a!3118) (index!23461 lt!253429)) (select (arr!16859 a!3118) j!142)))))

(declare-fun e!321322 () Bool)

(assert (=> b!557742 (=> res!349622 e!321322)))

(declare-fun e!321325 () Bool)

(assert (=> b!557742 (= e!321325 e!321322)))

(declare-fun b!557744 () Bool)

(assert (=> b!557744 (and (bvsge (index!23461 lt!253429) #b00000000000000000000000000000000) (bvslt (index!23461 lt!253429) (size!17223 a!3118)))))

(declare-fun res!349621 () Bool)

(assert (=> b!557744 (= res!349621 (= (select (arr!16859 a!3118) (index!23461 lt!253429)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!557744 (=> res!349621 e!321322)))

(declare-fun b!557745 () Bool)

(declare-fun e!321324 () Bool)

(assert (=> b!557745 (= e!321324 e!321325)))

(declare-fun res!349620 () Bool)

(assert (=> b!557745 (= res!349620 (and (is-Intermediate!5308 lt!253429) (not (undefined!6120 lt!253429)) (bvslt (x!52354 lt!253429) #b01111111111111111111111111111110) (bvsge (x!52354 lt!253429) #b00000000000000000000000000000000) (bvsge (x!52354 lt!253429) #b00000000000000000000000000000000)))))

(assert (=> b!557745 (=> (not res!349620) (not e!321325))))

(declare-fun b!557746 () Bool)

(declare-fun e!321326 () SeekEntryResult!5308)

(assert (=> b!557746 (= e!321326 (Intermediate!5308 false lt!253316 #b00000000000000000000000000000000))))

(declare-fun b!557747 () Bool)

(assert (=> b!557747 (= e!321326 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253316 #b00000000000000000000000000000000 mask!3119) (select (arr!16859 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!557748 () Bool)

(declare-fun e!321323 () SeekEntryResult!5308)

(assert (=> b!557748 (= e!321323 e!321326)))

(declare-fun lt!253430 () (_ BitVec 64))

(declare-fun c!64404 () Bool)

(assert (=> b!557748 (= c!64404 (or (= lt!253430 (select (arr!16859 a!3118) j!142)) (= (bvadd lt!253430 lt!253430) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!557749 () Bool)

(assert (=> b!557749 (and (bvsge (index!23461 lt!253429) #b00000000000000000000000000000000) (bvslt (index!23461 lt!253429) (size!17223 a!3118)))))

(assert (=> b!557749 (= e!321322 (= (select (arr!16859 a!3118) (index!23461 lt!253429)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!557750 () Bool)

(assert (=> b!557750 (= e!321323 (Intermediate!5308 true lt!253316 #b00000000000000000000000000000000))))

(declare-fun b!557743 () Bool)

(assert (=> b!557743 (= e!321324 (bvsge (x!52354 lt!253429) #b01111111111111111111111111111110))))

(declare-fun d!83547 () Bool)

(assert (=> d!83547 e!321324))

(declare-fun c!64403 () Bool)

(assert (=> d!83547 (= c!64403 (and (is-Intermediate!5308 lt!253429) (undefined!6120 lt!253429)))))

(assert (=> d!83547 (= lt!253429 e!321323)))

(declare-fun c!64402 () Bool)

(assert (=> d!83547 (= c!64402 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83547 (= lt!253430 (select (arr!16859 a!3118) lt!253316))))

(assert (=> d!83547 (validMask!0 mask!3119)))

(assert (=> d!83547 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253316 (select (arr!16859 a!3118) j!142) a!3118 mask!3119) lt!253429)))

(assert (= (and d!83547 c!64402) b!557750))

(assert (= (and d!83547 (not c!64402)) b!557748))

(assert (= (and b!557748 c!64404) b!557746))

