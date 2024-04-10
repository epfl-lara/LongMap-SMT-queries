; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32536 () Bool)

(assert start!32536)

(declare-fun b!325493 () Bool)

(declare-fun e!200596 () Bool)

(declare-fun e!200594 () Bool)

(assert (=> b!325493 (= e!200596 e!200594)))

(declare-fun res!178826 () Bool)

(assert (=> b!325493 (=> (not res!178826) (not e!200594))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3026 0))(
  ( (MissingZero!3026 (index!14280 (_ BitVec 32))) (Found!3026 (index!14281 (_ BitVec 32))) (Intermediate!3026 (undefined!3838 Bool) (index!14282 (_ BitVec 32)) (x!32518 (_ BitVec 32))) (Undefined!3026) (MissingVacant!3026 (index!14283 (_ BitVec 32))) )
))
(declare-fun lt!157013 () SeekEntryResult!3026)

(declare-datatypes ((array!16675 0))(
  ( (array!16676 (arr!7895 (Array (_ BitVec 32) (_ BitVec 64))) (size!8247 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16675)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16675 (_ BitVec 32)) SeekEntryResult!3026)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325493 (= res!178826 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157013))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!325493 (= lt!157013 (Intermediate!3026 false resIndex!58 resX!58))))

(declare-fun b!325494 () Bool)

(declare-fun res!178832 () Bool)

(assert (=> b!325494 (=> (not res!178832) (not e!200596))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16675 (_ BitVec 32)) SeekEntryResult!3026)

(assert (=> b!325494 (= res!178832 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3026 i!1250)))))

(declare-fun b!325495 () Bool)

(declare-fun res!178829 () Bool)

(assert (=> b!325495 (=> (not res!178829) (not e!200596))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325495 (= res!178829 (validKeyInArray!0 k!2497))))

(declare-fun res!178828 () Bool)

(assert (=> start!32536 (=> (not res!178828) (not e!200596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32536 (= res!178828 (validMask!0 mask!3777))))

(assert (=> start!32536 e!200596))

(declare-fun array_inv!5858 (array!16675) Bool)

(assert (=> start!32536 (array_inv!5858 a!3305)))

(assert (=> start!32536 true))

(declare-fun b!325496 () Bool)

(declare-fun lt!157014 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!325496 (= e!200594 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1490) resX!58) (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b00000000000000000000000000000000) (or (bvslt lt!157014 #b00000000000000000000000000000000) (bvsge lt!157014 (size!8247 a!3305)))))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325496 (= lt!157014 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!325497 () Bool)

(declare-fun res!178833 () Bool)

(assert (=> b!325497 (=> (not res!178833) (not e!200594))))

(assert (=> b!325497 (= res!178833 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157013))))

(declare-fun b!325498 () Bool)

(declare-fun res!178831 () Bool)

(assert (=> b!325498 (=> (not res!178831) (not e!200594))))

(assert (=> b!325498 (= res!178831 (and (= (select (arr!7895 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8247 a!3305))))))

(declare-fun b!325499 () Bool)

(declare-fun res!178825 () Bool)

(assert (=> b!325499 (=> (not res!178825) (not e!200596))))

(assert (=> b!325499 (= res!178825 (and (= (size!8247 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8247 a!3305))))))

(declare-fun b!325500 () Bool)

(declare-fun res!178830 () Bool)

(assert (=> b!325500 (=> (not res!178830) (not e!200596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16675 (_ BitVec 32)) Bool)

(assert (=> b!325500 (= res!178830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325501 () Bool)

(declare-fun res!178827 () Bool)

(assert (=> b!325501 (=> (not res!178827) (not e!200594))))

(assert (=> b!325501 (= res!178827 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7895 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325502 () Bool)

(declare-fun res!178824 () Bool)

(assert (=> b!325502 (=> (not res!178824) (not e!200596))))

(declare-fun arrayContainsKey!0 (array!16675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325502 (= res!178824 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!32536 res!178828) b!325499))

(assert (= (and b!325499 res!178825) b!325495))

(assert (= (and b!325495 res!178829) b!325502))

(assert (= (and b!325502 res!178824) b!325494))

(assert (= (and b!325494 res!178832) b!325500))

(assert (= (and b!325500 res!178830) b!325493))

(assert (= (and b!325493 res!178826) b!325498))

(assert (= (and b!325498 res!178831) b!325497))

(assert (= (and b!325497 res!178833) b!325501))

(assert (= (and b!325501 res!178827) b!325496))

(declare-fun m!332327 () Bool)

(assert (=> b!325502 m!332327))

(declare-fun m!332329 () Bool)

(assert (=> b!325500 m!332329))

(declare-fun m!332331 () Bool)

(assert (=> b!325501 m!332331))

(declare-fun m!332333 () Bool)

(assert (=> b!325494 m!332333))

(declare-fun m!332335 () Bool)

(assert (=> start!32536 m!332335))

(declare-fun m!332337 () Bool)

(assert (=> start!32536 m!332337))

(declare-fun m!332339 () Bool)

(assert (=> b!325495 m!332339))

(declare-fun m!332341 () Bool)

(assert (=> b!325498 m!332341))

(declare-fun m!332343 () Bool)

(assert (=> b!325493 m!332343))

(assert (=> b!325493 m!332343))

(declare-fun m!332345 () Bool)

(assert (=> b!325493 m!332345))

(declare-fun m!332347 () Bool)

(assert (=> b!325497 m!332347))

(declare-fun m!332349 () Bool)

(assert (=> b!325496 m!332349))

(push 1)

(assert (not b!325497))

(assert (not start!32536))

(assert (not b!325496))

(assert (not b!325495))

(assert (not b!325493))

(assert (not b!325494))

(assert (not b!325500))

(assert (not b!325502))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!325593 () Bool)

(declare-fun e!200637 () Bool)

(declare-fun lt!157041 () SeekEntryResult!3026)

(assert (=> b!325593 (= e!200637 (bvsge (x!32518 lt!157041) #b01111111111111111111111111111110))))

(declare-fun b!325594 () Bool)

(declare-fun e!200634 () SeekEntryResult!3026)

(declare-fun e!200635 () SeekEntryResult!3026)

(assert (=> b!325594 (= e!200634 e!200635)))

(declare-fun c!50972 () Bool)

(declare-fun lt!157040 () (_ BitVec 64))

(assert (=> b!325594 (= c!50972 (or (= lt!157040 k!2497) (= (bvadd lt!157040 lt!157040) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!325595 () Bool)

(declare-fun e!200638 () Bool)

(assert (=> b!325595 (= e!200637 e!200638)))

(declare-fun res!178907 () Bool)

(assert (=> b!325595 (= res!178907 (and (is-Intermediate!3026 lt!157041) (not (undefined!3838 lt!157041)) (bvslt (x!32518 lt!157041) #b01111111111111111111111111111110) (bvsge (x!32518 lt!157041) #b00000000000000000000000000000000) (bvsge (x!32518 lt!157041) x!1490)))))

(assert (=> b!325595 (=> (not res!178907) (not e!200638))))

(declare-fun b!325596 () Bool)

(assert (=> b!325596 (and (bvsge (index!14282 lt!157041) #b00000000000000000000000000000000) (bvslt (index!14282 lt!157041) (size!8247 a!3305)))))

(declare-fun e!200636 () Bool)

(assert (=> b!325596 (= e!200636 (= (select (arr!7895 a!3305) (index!14282 lt!157041)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!325597 () Bool)

(assert (=> b!325597 (and (bvsge (index!14282 lt!157041) #b00000000000000000000000000000000) (bvslt (index!14282 lt!157041) (size!8247 a!3305)))))

(declare-fun res!178908 () Bool)

(assert (=> b!325597 (= res!178908 (= (select (arr!7895 a!3305) (index!14282 lt!157041)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325597 (=> res!178908 e!200636)))

(declare-fun b!325598 () Bool)

(assert (=> b!325598 (and (bvsge (index!14282 lt!157041) #b00000000000000000000000000000000) (bvslt (index!14282 lt!157041) (size!8247 a!3305)))))

(declare-fun res!178906 () Bool)

(assert (=> b!325598 (= res!178906 (= (select (arr!7895 a!3305) (index!14282 lt!157041)) k!2497))))

(assert (=> b!325598 (=> res!178906 e!200636)))

(assert (=> b!325598 (= e!200638 e!200636)))

(declare-fun b!325599 () Bool)

(assert (=> b!325599 (= e!200635 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!325600 () Bool)

(assert (=> b!325600 (= e!200634 (Intermediate!3026 true index!1840 x!1490))))

(declare-fun d!69651 () Bool)

(assert (=> d!69651 e!200637))

(declare-fun c!50973 () Bool)

(assert (=> d!69651 (= c!50973 (and (is-Intermediate!3026 lt!157041) (undefined!3838 lt!157041)))))

(assert (=> d!69651 (= lt!157041 e!200634)))

(declare-fun c!50971 () Bool)

(assert (=> d!69651 (= c!50971 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!69651 (= lt!157040 (select (arr!7895 a!3305) index!1840))))

(assert (=> d!69651 (validMask!0 mask!3777)))

(assert (=> d!69651 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157041)))

(declare-fun b!325601 () Bool)

(assert (=> b!325601 (= e!200635 (Intermediate!3026 false index!1840 x!1490))))

(assert (= (and d!69651 c!50971) b!325600))

(assert (= (and d!69651 (not c!50971)) b!325594))

(assert (= (and b!325594 c!50972) b!325601))

(assert (= (and b!325594 (not c!50972)) b!325599))

(assert (= (and d!69651 c!50973) b!325593))

(assert (= (and d!69651 (not c!50973)) b!325595))

(assert (= (and b!325595 res!178907) b!325598))

(assert (= (and b!325598 (not res!178906)) b!325597))

(assert (= (and b!325597 (not res!178908)) b!325596))

(assert (=> b!325599 m!332349))

(assert (=> b!325599 m!332349))

(declare-fun m!332411 () Bool)

(assert (=> b!325599 m!332411))

(assert (=> d!69651 m!332331))

(assert (=> d!69651 m!332335))

(declare-fun m!332413 () Bool)

(assert (=> b!325597 m!332413))

(assert (=> b!325598 m!332413))

(assert (=> b!325596 m!332413))

(assert (=> b!325497 d!69651))

(declare-fun d!69657 () Bool)

(assert (=> d!69657 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32536 d!69657))

(declare-fun d!69665 () Bool)

(assert (=> d!69665 (= (array_inv!5858 a!3305) (bvsge (size!8247 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32536 d!69665))

(declare-fun d!69667 () Bool)

(declare-fun res!178919 () Bool)

(declare-fun e!200658 () Bool)

(assert (=> d!69667 (=> res!178919 e!200658)))

(assert (=> d!69667 (= res!178919 (= (select (arr!7895 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!69667 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!200658)))

(declare-fun b!325630 () Bool)

(declare-fun e!200659 () Bool)

(assert (=> b!325630 (= e!200658 e!200659)))

(declare-fun res!178920 () Bool)

(assert (=> b!325630 (=> (not res!178920) (not e!200659))))

(assert (=> b!325630 (= res!178920 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8247 a!3305)))))

(declare-fun b!325631 () Bool)

(assert (=> b!325631 (= e!200659 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69667 (not res!178919)) b!325630))

(assert (= (and b!325630 res!178920) b!325631))

(declare-fun m!332427 () Bool)

(assert (=> d!69667 m!332427))

(declare-fun m!332429 () Bool)

(assert (=> b!325631 m!332429))

(assert (=> b!325502 d!69667))

(declare-fun d!69669 () Bool)

(declare-fun lt!157053 () (_ BitVec 32))

(assert (=> d!69669 (and (bvsge lt!157053 #b00000000000000000000000000000000) (bvslt lt!157053 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69669 (= lt!157053 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!69669 (validMask!0 mask!3777)))

(assert (=> d!69669 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!157053)))

(declare-fun bs!11327 () Bool)

(assert (= bs!11327 d!69669))

(declare-fun m!332431 () Bool)

(assert (=> bs!11327 m!332431))

(assert (=> bs!11327 m!332335))

(assert (=> b!325496 d!69669))

(declare-fun d!69671 () Bool)

(assert (=> d!69671 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!325495 d!69671))

(declare-fun d!69673 () Bool)

(declare-fun res!178931 () Bool)

(declare-fun e!200678 () Bool)

(assert (=> d!69673 (=> res!178931 e!200678)))

(assert (=> d!69673 (= res!178931 (bvsge #b00000000000000000000000000000000 (size!8247 a!3305)))))

(assert (=> d!69673 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!200678)))

(declare-fun b!325658 () Bool)

(declare-fun e!200676 () Bool)

(declare-fun call!26077 () Bool)

(assert (=> b!325658 (= e!200676 call!26077)))

(declare-fun bm!26074 () Bool)

(assert (=> bm!26074 (= call!26077 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!325659 () Bool)

(declare-fun e!200677 () Bool)

(assert (=> b!325659 (= e!200677 call!26077)))

(declare-fun b!325660 () Bool)

(assert (=> b!325660 (= e!200678 e!200676)))

(declare-fun c!50991 () Bool)

(assert (=> b!325660 (= c!50991 (validKeyInArray!0 (select (arr!7895 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!325661 () Bool)

(assert (=> b!325661 (= e!200676 e!200677)))

(declare-fun lt!157066 () (_ BitVec 64))

(assert (=> b!325661 (= lt!157066 (select (arr!7895 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10090 0))(
  ( (Unit!10091) )
))
(declare-fun lt!157064 () Unit!10090)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16675 (_ BitVec 64) (_ BitVec 32)) Unit!10090)

(assert (=> b!325661 (= lt!157064 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157066 #b00000000000000000000000000000000))))

(assert (=> b!325661 (arrayContainsKey!0 a!3305 lt!157066 #b00000000000000000000000000000000)))

(declare-fun lt!157065 () Unit!10090)

(assert (=> b!325661 (= lt!157065 lt!157064)))

(declare-fun res!178932 () Bool)

(assert (=> b!325661 (= res!178932 (= (seekEntryOrOpen!0 (select (arr!7895 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3026 #b00000000000000000000000000000000)))))

(assert (=> b!325661 (=> (not res!178932) (not e!200677))))

(assert (= (and d!69673 (not res!178931)) b!325660))

(assert (= (and b!325660 c!50991) b!325661))

(assert (= (and b!325660 (not c!50991)) b!325658))

(assert (= (and b!325661 res!178932) b!325659))

(assert (= (or b!325659 b!325658) bm!26074))

(declare-fun m!332433 () Bool)

(assert (=> bm!26074 m!332433))

(assert (=> b!325660 m!332427))

(assert (=> b!325660 m!332427))

(declare-fun m!332435 () Bool)

(assert (=> b!325660 m!332435))

(assert (=> b!325661 m!332427))

(declare-fun m!332437 () Bool)

(assert (=> b!325661 m!332437))

(declare-fun m!332439 () Bool)

(assert (=> b!325661 m!332439))

(assert (=> b!325661 m!332427))

(declare-fun m!332441 () Bool)

(assert (=> b!325661 m!332441))

(assert (=> b!325500 d!69673))

(declare-fun b!325719 () Bool)

(declare-fun e!200710 () SeekEntryResult!3026)

(declare-fun lt!157092 () SeekEntryResult!3026)

(assert (=> b!325719 (= e!200710 (MissingZero!3026 (index!14282 lt!157092)))))

(declare-fun b!325720 () Bool)

(declare-fun e!200711 () SeekEntryResult!3026)

(assert (=> b!325720 (= e!200711 Undefined!3026)))

(declare-fun b!325721 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16675 (_ BitVec 32)) SeekEntryResult!3026)

(assert (=> b!325721 (= e!200710 (seekKeyOrZeroReturnVacant!0 (x!32518 lt!157092) (index!14282 lt!157092) (index!14282 lt!157092) k!2497 a!3305 mask!3777))))

(declare-fun d!69681 () Bool)

(declare-fun lt!157093 () SeekEntryResult!3026)

(assert (=> d!69681 (and (or (is-Undefined!3026 lt!157093) (not (is-Found!3026 lt!157093)) (and (bvsge (index!14281 lt!157093) #b00000000000000000000000000000000) (bvslt (index!14281 lt!157093) (size!8247 a!3305)))) (or (is-Undefined!3026 lt!157093) (is-Found!3026 lt!157093) (not (is-MissingZero!3026 lt!157093)) (and (bvsge (index!14280 lt!157093) #b00000000000000000000000000000000) (bvslt (index!14280 lt!157093) (size!8247 a!3305)))) (or (is-Undefined!3026 lt!157093) (is-Found!3026 lt!157093) (is-MissingZero!3026 lt!157093) (not (is-MissingVacant!3026 lt!157093)) (and (bvsge (index!14283 lt!157093) #b00000000000000000000000000000000) (bvslt (index!14283 lt!157093) (size!8247 a!3305)))) (or (is-Undefined!3026 lt!157093) (ite (is-Found!3026 lt!157093) (= (select (arr!7895 a!3305) (index!14281 lt!157093)) k!2497) (ite (is-MissingZero!3026 lt!157093) (= (select (arr!7895 a!3305) (index!14280 lt!157093)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3026 lt!157093) (= (select (arr!7895 a!3305) (index!14283 lt!157093)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69681 (= lt!157093 e!200711)))

(declare-fun c!51013 () Bool)

(assert (=> d!69681 (= c!51013 (and (is-Intermediate!3026 lt!157092) (undefined!3838 lt!157092)))))

(assert (=> d!69681 (= lt!157092 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!69681 (validMask!0 mask!3777)))

(assert (=> d!69681 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!157093)))

(declare-fun b!325722 () Bool)

(declare-fun e!200712 () SeekEntryResult!3026)

(assert (=> b!325722 (= e!200712 (Found!3026 (index!14282 lt!157092)))))

(declare-fun b!325723 () Bool)

(assert (=> b!325723 (= e!200711 e!200712)))

(declare-fun lt!157094 () (_ BitVec 64))

(assert (=> b!325723 (= lt!157094 (select (arr!7895 a!3305) (index!14282 lt!157092)))))

(declare-fun c!51014 () Bool)

(assert (=> b!325723 (= c!51014 (= lt!157094 k!2497))))

(declare-fun b!325724 () Bool)

(declare-fun c!51015 () Bool)

(assert (=> b!325724 (= c!51015 (= lt!157094 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325724 (= e!200712 e!200710)))

(assert (= (and d!69681 c!51013) b!325720))

(assert (= (and d!69681 (not c!51013)) b!325723))

(assert (= (and b!325723 c!51014) b!325722))

(assert (= (and b!325723 (not c!51014)) b!325724))

(assert (= (and b!325724 c!51015) b!325719))

(assert (= (and b!325724 (not c!51015)) b!325721))

(declare-fun m!332465 () Bool)

(assert (=> b!325721 m!332465))

(assert (=> d!69681 m!332335))

(assert (=> d!69681 m!332343))

(assert (=> d!69681 m!332345))

(declare-fun m!332467 () Bool)

(assert (=> d!69681 m!332467))

(declare-fun m!332469 () Bool)

(assert (=> d!69681 m!332469))

(declare-fun m!332471 () Bool)

(assert (=> d!69681 m!332471))

(assert (=> d!69681 m!332343))

(declare-fun m!332473 () Bool)

(assert (=> b!325723 m!332473))

(assert (=> b!325494 d!69681))

(declare-fun b!325725 () Bool)

(declare-fun e!200716 () Bool)

(declare-fun lt!157096 () SeekEntryResult!3026)

(assert (=> b!325725 (= e!200716 (bvsge (x!32518 lt!157096) #b01111111111111111111111111111110))))

(declare-fun b!325726 () Bool)

(declare-fun e!200713 () SeekEntryResult!3026)

(declare-fun e!200714 () SeekEntryResult!3026)

(assert (=> b!325726 (= e!200713 e!200714)))

(declare-fun c!51017 () Bool)

(declare-fun lt!157095 () (_ BitVec 64))

(assert (=> b!325726 (= c!51017 (or (= lt!157095 k!2497) (= (bvadd lt!157095 lt!157095) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!325727 () Bool)

(declare-fun e!200717 () Bool)

(assert (=> b!325727 (= e!200716 e!200717)))

(declare-fun res!178951 () Bool)

(assert (=> b!325727 (= res!178951 (and (is-Intermediate!3026 lt!157096) (not (undefined!3838 lt!157096)) (bvslt (x!32518 lt!157096) #b01111111111111111111111111111110) (bvsge (x!32518 lt!157096) #b00000000000000000000000000000000) (bvsge (x!32518 lt!157096) #b00000000000000000000000000000000)))))

(assert (=> b!325727 (=> (not res!178951) (not e!200717))))

(declare-fun b!325728 () Bool)

(assert (=> b!325728 (and (bvsge (index!14282 lt!157096) #b00000000000000000000000000000000) (bvslt (index!14282 lt!157096) (size!8247 a!3305)))))

(declare-fun e!200715 () Bool)

(assert (=> b!325728 (= e!200715 (= (select (arr!7895 a!3305) (index!14282 lt!157096)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!325729 () Bool)

(assert (=> b!325729 (and (bvsge (index!14282 lt!157096) #b00000000000000000000000000000000) (bvslt (index!14282 lt!157096) (size!8247 a!3305)))))

(declare-fun res!178952 () Bool)

(assert (=> b!325729 (= res!178952 (= (select (arr!7895 a!3305) (index!14282 lt!157096)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325729 (=> res!178952 e!200715)))

(declare-fun b!325730 () Bool)

(assert (=> b!325730 (and (bvsge (index!14282 lt!157096) #b00000000000000000000000000000000) (bvslt (index!14282 lt!157096) (size!8247 a!3305)))))

(declare-fun res!178950 () Bool)

(assert (=> b!325730 (= res!178950 (= (select (arr!7895 a!3305) (index!14282 lt!157096)) k!2497))))

(assert (=> b!325730 (=> res!178950 e!200715)))

(assert (=> b!325730 (= e!200717 e!200715)))

(declare-fun b!325731 () Bool)

(assert (=> b!325731 (= e!200714 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!325732 () Bool)

(assert (=> b!325732 (= e!200713 (Intermediate!3026 true (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun d!69693 () Bool)

(assert (=> d!69693 e!200716))

(declare-fun c!51018 () Bool)

(assert (=> d!69693 (= c!51018 (and (is-Intermediate!3026 lt!157096) (undefined!3838 lt!157096)))))

(assert (=> d!69693 (= lt!157096 e!200713)))

(declare-fun c!51016 () Bool)

(assert (=> d!69693 (= c!51016 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!69693 (= lt!157095 (select (arr!7895 a!3305) (toIndex!0 k!2497 mask!3777)))))

(assert (=> d!69693 (validMask!0 mask!3777)))

(assert (=> d!69693 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157096)))

(declare-fun b!325733 () Bool)

(assert (=> b!325733 (= e!200714 (Intermediate!3026 false (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(assert (= (and d!69693 c!51016) b!325732))

(assert (= (and d!69693 (not c!51016)) b!325726))

(assert (= (and b!325726 c!51017) b!325733))

(assert (= (and b!325726 (not c!51017)) b!325731))

(assert (= (and d!69693 c!51018) b!325725))

(assert (= (and d!69693 (not c!51018)) b!325727))

(assert (= (and b!325727 res!178951) b!325730))

(assert (= (and b!325730 (not res!178950)) b!325729))

(assert (= (and b!325729 (not res!178952)) b!325728))

(assert (=> b!325731 m!332343))

(declare-fun m!332475 () Bool)

(assert (=> b!325731 m!332475))

(assert (=> b!325731 m!332475))

(declare-fun m!332477 () Bool)

(assert (=> b!325731 m!332477))

(assert (=> d!69693 m!332343))

(declare-fun m!332479 () Bool)

(assert (=> d!69693 m!332479))

(assert (=> d!69693 m!332335))

(declare-fun m!332481 () Bool)

(assert (=> b!325729 m!332481))

(assert (=> b!325730 m!332481))

(assert (=> b!325728 m!332481))

(assert (=> b!325493 d!69693))

(declare-fun d!69695 () Bool)

(declare-fun lt!157110 () (_ BitVec 32))

(declare-fun lt!157109 () (_ BitVec 32))

(assert (=> d!69695 (= lt!157110 (bvmul (bvxor lt!157109 (bvlshr lt!157109 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69695 (= lt!157109 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69695 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!178953 (let ((h!5393 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32528 (bvmul (bvxor h!5393 (bvlshr h!5393 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32528 (bvlshr x!32528 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!178953 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!178953 #b00000000000000000000000000000000))))))

(assert (=> d!69695 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!157110 (bvlshr lt!157110 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!325493 d!69695))

(push 1)

(assert (not d!69693))

(assert (not d!69651))

(assert (not b!325631))

(assert (not b!325660))

(assert (not b!325661))

(assert (not b!325721))

(assert (not bm!26074))

(assert (not d!69669))

(assert (not b!325731))

(assert (not b!325599))

(assert (not d!69681))

(check-sat)

(pop 1)

(push 1)

(check-sat)

