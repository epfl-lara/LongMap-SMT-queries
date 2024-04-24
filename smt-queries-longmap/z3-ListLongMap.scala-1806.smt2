; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32522 () Bool)

(assert start!32522)

(declare-fun b!325440 () Bool)

(declare-fun e!200560 () Bool)

(declare-fun e!200561 () Bool)

(assert (=> b!325440 (= e!200560 e!200561)))

(declare-fun res!178826 () Bool)

(assert (=> b!325440 (=> (not res!178826) (not e!200561))))

(declare-datatypes ((array!16674 0))(
  ( (array!16675 (arr!7894 (Array (_ BitVec 32) (_ BitVec 64))) (size!8246 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16674)

(declare-datatypes ((SeekEntryResult!2990 0))(
  ( (MissingZero!2990 (index!14136 (_ BitVec 32))) (Found!2990 (index!14137 (_ BitVec 32))) (Intermediate!2990 (undefined!3802 Bool) (index!14138 (_ BitVec 32)) (x!32479 (_ BitVec 32))) (Undefined!2990) (MissingVacant!2990 (index!14139 (_ BitVec 32))) )
))
(declare-fun lt!157031 () SeekEntryResult!2990)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16674 (_ BitVec 32)) SeekEntryResult!2990)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325440 (= res!178826 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157031))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!325440 (= lt!157031 (Intermediate!2990 false resIndex!58 resX!58))))

(declare-fun b!325441 () Bool)

(declare-fun res!178827 () Bool)

(assert (=> b!325441 (=> (not res!178827) (not e!200561))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!325441 (= res!178827 (and (= (select (arr!7894 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8246 a!3305))))))

(declare-fun lt!157032 () (_ BitVec 32))

(declare-fun b!325442 () Bool)

(assert (=> b!325442 (= e!200561 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1490) resX!58) (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b00000000000000000000000000000000) (or (bvslt lt!157032 #b00000000000000000000000000000000) (bvsge lt!157032 (size!8246 a!3305)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325442 (= lt!157032 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(declare-fun b!325443 () Bool)

(declare-fun res!178821 () Bool)

(assert (=> b!325443 (=> (not res!178821) (not e!200560))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325443 (= res!178821 (validKeyInArray!0 k0!2497))))

(declare-fun b!325444 () Bool)

(declare-fun res!178828 () Bool)

(assert (=> b!325444 (=> (not res!178828) (not e!200561))))

(assert (=> b!325444 (= res!178828 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7894 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325445 () Bool)

(declare-fun res!178825 () Bool)

(assert (=> b!325445 (=> (not res!178825) (not e!200560))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16674 (_ BitVec 32)) SeekEntryResult!2990)

(assert (=> b!325445 (= res!178825 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2990 i!1250)))))

(declare-fun b!325446 () Bool)

(declare-fun res!178823 () Bool)

(assert (=> b!325446 (=> (not res!178823) (not e!200560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16674 (_ BitVec 32)) Bool)

(assert (=> b!325446 (= res!178823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325447 () Bool)

(declare-fun res!178830 () Bool)

(assert (=> b!325447 (=> (not res!178830) (not e!200560))))

(declare-fun arrayContainsKey!0 (array!16674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325447 (= res!178830 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun res!178822 () Bool)

(assert (=> start!32522 (=> (not res!178822) (not e!200560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32522 (= res!178822 (validMask!0 mask!3777))))

(assert (=> start!32522 e!200560))

(declare-fun array_inv!5844 (array!16674) Bool)

(assert (=> start!32522 (array_inv!5844 a!3305)))

(assert (=> start!32522 true))

(declare-fun b!325448 () Bool)

(declare-fun res!178829 () Bool)

(assert (=> b!325448 (=> (not res!178829) (not e!200560))))

(assert (=> b!325448 (= res!178829 (and (= (size!8246 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8246 a!3305))))))

(declare-fun b!325449 () Bool)

(declare-fun res!178824 () Bool)

(assert (=> b!325449 (=> (not res!178824) (not e!200561))))

(assert (=> b!325449 (= res!178824 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157031))))

(assert (= (and start!32522 res!178822) b!325448))

(assert (= (and b!325448 res!178829) b!325443))

(assert (= (and b!325443 res!178821) b!325447))

(assert (= (and b!325447 res!178830) b!325445))

(assert (= (and b!325445 res!178825) b!325446))

(assert (= (and b!325446 res!178823) b!325440))

(assert (= (and b!325440 res!178826) b!325441))

(assert (= (and b!325441 res!178827) b!325449))

(assert (= (and b!325449 res!178824) b!325444))

(assert (= (and b!325444 res!178828) b!325442))

(declare-fun m!332509 () Bool)

(assert (=> b!325444 m!332509))

(declare-fun m!332511 () Bool)

(assert (=> b!325441 m!332511))

(declare-fun m!332513 () Bool)

(assert (=> b!325447 m!332513))

(declare-fun m!332515 () Bool)

(assert (=> b!325443 m!332515))

(declare-fun m!332517 () Bool)

(assert (=> b!325449 m!332517))

(declare-fun m!332519 () Bool)

(assert (=> b!325440 m!332519))

(assert (=> b!325440 m!332519))

(declare-fun m!332521 () Bool)

(assert (=> b!325440 m!332521))

(declare-fun m!332523 () Bool)

(assert (=> b!325446 m!332523))

(declare-fun m!332525 () Bool)

(assert (=> b!325445 m!332525))

(declare-fun m!332527 () Bool)

(assert (=> start!32522 m!332527))

(declare-fun m!332529 () Bool)

(assert (=> start!32522 m!332529))

(declare-fun m!332531 () Bool)

(assert (=> b!325442 m!332531))

(check-sat (not b!325440) (not b!325449) (not b!325443) (not b!325447) (not b!325446) (not start!32522) (not b!325442) (not b!325445))
(check-sat)
(get-model)

(declare-fun bm!26057 () Bool)

(declare-fun call!26060 () Bool)

(assert (=> bm!26057 (= call!26060 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!325519 () Bool)

(declare-fun e!200589 () Bool)

(declare-fun e!200588 () Bool)

(assert (=> b!325519 (= e!200589 e!200588)))

(declare-fun lt!157053 () (_ BitVec 64))

(assert (=> b!325519 (= lt!157053 (select (arr!7894 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10050 0))(
  ( (Unit!10051) )
))
(declare-fun lt!157051 () Unit!10050)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16674 (_ BitVec 64) (_ BitVec 32)) Unit!10050)

(assert (=> b!325519 (= lt!157051 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157053 #b00000000000000000000000000000000))))

(assert (=> b!325519 (arrayContainsKey!0 a!3305 lt!157053 #b00000000000000000000000000000000)))

(declare-fun lt!157052 () Unit!10050)

(assert (=> b!325519 (= lt!157052 lt!157051)))

(declare-fun res!178896 () Bool)

(assert (=> b!325519 (= res!178896 (= (seekEntryOrOpen!0 (select (arr!7894 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!2990 #b00000000000000000000000000000000)))))

(assert (=> b!325519 (=> (not res!178896) (not e!200588))))

(declare-fun b!325520 () Bool)

(assert (=> b!325520 (= e!200589 call!26060)))

(declare-fun b!325521 () Bool)

(assert (=> b!325521 (= e!200588 call!26060)))

(declare-fun d!69675 () Bool)

(declare-fun res!178895 () Bool)

(declare-fun e!200587 () Bool)

(assert (=> d!69675 (=> res!178895 e!200587)))

(assert (=> d!69675 (= res!178895 (bvsge #b00000000000000000000000000000000 (size!8246 a!3305)))))

(assert (=> d!69675 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!200587)))

(declare-fun b!325518 () Bool)

(assert (=> b!325518 (= e!200587 e!200589)))

(declare-fun c!50939 () Bool)

(assert (=> b!325518 (= c!50939 (validKeyInArray!0 (select (arr!7894 a!3305) #b00000000000000000000000000000000)))))

(assert (= (and d!69675 (not res!178895)) b!325518))

(assert (= (and b!325518 c!50939) b!325519))

(assert (= (and b!325518 (not c!50939)) b!325520))

(assert (= (and b!325519 res!178896) b!325521))

(assert (= (or b!325521 b!325520) bm!26057))

(declare-fun m!332581 () Bool)

(assert (=> bm!26057 m!332581))

(declare-fun m!332583 () Bool)

(assert (=> b!325519 m!332583))

(declare-fun m!332585 () Bool)

(assert (=> b!325519 m!332585))

(declare-fun m!332587 () Bool)

(assert (=> b!325519 m!332587))

(assert (=> b!325519 m!332583))

(declare-fun m!332589 () Bool)

(assert (=> b!325519 m!332589))

(assert (=> b!325518 m!332583))

(assert (=> b!325518 m!332583))

(declare-fun m!332591 () Bool)

(assert (=> b!325518 m!332591))

(assert (=> b!325446 d!69675))

(declare-fun d!69677 () Bool)

(declare-fun e!200626 () Bool)

(assert (=> d!69677 e!200626))

(declare-fun c!50962 () Bool)

(declare-fun lt!157069 () SeekEntryResult!2990)

(get-info :version)

(assert (=> d!69677 (= c!50962 (and ((_ is Intermediate!2990) lt!157069) (undefined!3802 lt!157069)))))

(declare-fun e!200629 () SeekEntryResult!2990)

(assert (=> d!69677 (= lt!157069 e!200629)))

(declare-fun c!50961 () Bool)

(assert (=> d!69677 (= c!50961 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!157068 () (_ BitVec 64))

(assert (=> d!69677 (= lt!157068 (select (arr!7894 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!69677 (validMask!0 mask!3777)))

(assert (=> d!69677 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157069)))

(declare-fun e!200625 () SeekEntryResult!2990)

(declare-fun b!325585 () Bool)

(assert (=> b!325585 (= e!200625 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!325586 () Bool)

(declare-fun e!200627 () Bool)

(assert (=> b!325586 (= e!200626 e!200627)))

(declare-fun res!178919 () Bool)

(assert (=> b!325586 (= res!178919 (and ((_ is Intermediate!2990) lt!157069) (not (undefined!3802 lt!157069)) (bvslt (x!32479 lt!157069) #b01111111111111111111111111111110) (bvsge (x!32479 lt!157069) #b00000000000000000000000000000000) (bvsge (x!32479 lt!157069) #b00000000000000000000000000000000)))))

(assert (=> b!325586 (=> (not res!178919) (not e!200627))))

(declare-fun b!325587 () Bool)

(assert (=> b!325587 (= e!200629 (Intermediate!2990 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!325588 () Bool)

(assert (=> b!325588 (and (bvsge (index!14138 lt!157069) #b00000000000000000000000000000000) (bvslt (index!14138 lt!157069) (size!8246 a!3305)))))

(declare-fun res!178920 () Bool)

(assert (=> b!325588 (= res!178920 (= (select (arr!7894 a!3305) (index!14138 lt!157069)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!200628 () Bool)

(assert (=> b!325588 (=> res!178920 e!200628)))

(declare-fun b!325589 () Bool)

(assert (=> b!325589 (and (bvsge (index!14138 lt!157069) #b00000000000000000000000000000000) (bvslt (index!14138 lt!157069) (size!8246 a!3305)))))

(declare-fun res!178921 () Bool)

(assert (=> b!325589 (= res!178921 (= (select (arr!7894 a!3305) (index!14138 lt!157069)) k0!2497))))

(assert (=> b!325589 (=> res!178921 e!200628)))

(assert (=> b!325589 (= e!200627 e!200628)))

(declare-fun b!325590 () Bool)

(assert (=> b!325590 (= e!200626 (bvsge (x!32479 lt!157069) #b01111111111111111111111111111110))))

(declare-fun b!325591 () Bool)

(assert (=> b!325591 (= e!200625 (Intermediate!2990 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!325592 () Bool)

(assert (=> b!325592 (= e!200629 e!200625)))

(declare-fun c!50963 () Bool)

(assert (=> b!325592 (= c!50963 (or (= lt!157068 k0!2497) (= (bvadd lt!157068 lt!157068) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!325593 () Bool)

(assert (=> b!325593 (and (bvsge (index!14138 lt!157069) #b00000000000000000000000000000000) (bvslt (index!14138 lt!157069) (size!8246 a!3305)))))

(assert (=> b!325593 (= e!200628 (= (select (arr!7894 a!3305) (index!14138 lt!157069)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!69677 c!50961) b!325587))

(assert (= (and d!69677 (not c!50961)) b!325592))

(assert (= (and b!325592 c!50963) b!325591))

(assert (= (and b!325592 (not c!50963)) b!325585))

(assert (= (and d!69677 c!50962) b!325590))

(assert (= (and d!69677 (not c!50962)) b!325586))

(assert (= (and b!325586 res!178919) b!325589))

(assert (= (and b!325589 (not res!178921)) b!325588))

(assert (= (and b!325588 (not res!178920)) b!325593))

(declare-fun m!332601 () Bool)

(assert (=> b!325588 m!332601))

(assert (=> b!325585 m!332519))

(declare-fun m!332603 () Bool)

(assert (=> b!325585 m!332603))

(assert (=> b!325585 m!332603))

(declare-fun m!332605 () Bool)

(assert (=> b!325585 m!332605))

(assert (=> b!325589 m!332601))

(assert (=> d!69677 m!332519))

(declare-fun m!332609 () Bool)

(assert (=> d!69677 m!332609))

(assert (=> d!69677 m!332527))

(assert (=> b!325593 m!332601))

(assert (=> b!325440 d!69677))

(declare-fun d!69685 () Bool)

(declare-fun lt!157090 () (_ BitVec 32))

(declare-fun lt!157088 () (_ BitVec 32))

(assert (=> d!69685 (= lt!157090 (bvmul (bvxor lt!157088 (bvlshr lt!157088 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69685 (= lt!157088 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69685 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!178925 (let ((h!5304 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32486 (bvmul (bvxor h!5304 (bvlshr h!5304 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32486 (bvlshr x!32486 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!178925 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!178925 #b00000000000000000000000000000000))))))

(assert (=> d!69685 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!157090 (bvlshr lt!157090 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!325440 d!69685))

(declare-fun d!69695 () Bool)

(declare-fun lt!157113 () SeekEntryResult!2990)

(assert (=> d!69695 (and (or ((_ is Undefined!2990) lt!157113) (not ((_ is Found!2990) lt!157113)) (and (bvsge (index!14137 lt!157113) #b00000000000000000000000000000000) (bvslt (index!14137 lt!157113) (size!8246 a!3305)))) (or ((_ is Undefined!2990) lt!157113) ((_ is Found!2990) lt!157113) (not ((_ is MissingZero!2990) lt!157113)) (and (bvsge (index!14136 lt!157113) #b00000000000000000000000000000000) (bvslt (index!14136 lt!157113) (size!8246 a!3305)))) (or ((_ is Undefined!2990) lt!157113) ((_ is Found!2990) lt!157113) ((_ is MissingZero!2990) lt!157113) (not ((_ is MissingVacant!2990) lt!157113)) (and (bvsge (index!14139 lt!157113) #b00000000000000000000000000000000) (bvslt (index!14139 lt!157113) (size!8246 a!3305)))) (or ((_ is Undefined!2990) lt!157113) (ite ((_ is Found!2990) lt!157113) (= (select (arr!7894 a!3305) (index!14137 lt!157113)) k0!2497) (ite ((_ is MissingZero!2990) lt!157113) (= (select (arr!7894 a!3305) (index!14136 lt!157113)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2990) lt!157113) (= (select (arr!7894 a!3305) (index!14139 lt!157113)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!200673 () SeekEntryResult!2990)

(assert (=> d!69695 (= lt!157113 e!200673)))

(declare-fun c!50989 () Bool)

(declare-fun lt!157115 () SeekEntryResult!2990)

(assert (=> d!69695 (= c!50989 (and ((_ is Intermediate!2990) lt!157115) (undefined!3802 lt!157115)))))

(assert (=> d!69695 (= lt!157115 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69695 (validMask!0 mask!3777)))

(assert (=> d!69695 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!157113)))

(declare-fun b!325662 () Bool)

(declare-fun c!50987 () Bool)

(declare-fun lt!157114 () (_ BitVec 64))

(assert (=> b!325662 (= c!50987 (= lt!157114 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!200674 () SeekEntryResult!2990)

(declare-fun e!200675 () SeekEntryResult!2990)

(assert (=> b!325662 (= e!200674 e!200675)))

(declare-fun b!325663 () Bool)

(assert (=> b!325663 (= e!200673 e!200674)))

(assert (=> b!325663 (= lt!157114 (select (arr!7894 a!3305) (index!14138 lt!157115)))))

(declare-fun c!50988 () Bool)

(assert (=> b!325663 (= c!50988 (= lt!157114 k0!2497))))

(declare-fun b!325664 () Bool)

(assert (=> b!325664 (= e!200673 Undefined!2990)))

(declare-fun b!325665 () Bool)

(assert (=> b!325665 (= e!200674 (Found!2990 (index!14138 lt!157115)))))

(declare-fun b!325666 () Bool)

(assert (=> b!325666 (= e!200675 (MissingZero!2990 (index!14138 lt!157115)))))

(declare-fun b!325667 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16674 (_ BitVec 32)) SeekEntryResult!2990)

(assert (=> b!325667 (= e!200675 (seekKeyOrZeroReturnVacant!0 (x!32479 lt!157115) (index!14138 lt!157115) (index!14138 lt!157115) k0!2497 a!3305 mask!3777))))

(assert (= (and d!69695 c!50989) b!325664))

(assert (= (and d!69695 (not c!50989)) b!325663))

(assert (= (and b!325663 c!50988) b!325665))

(assert (= (and b!325663 (not c!50988)) b!325662))

(assert (= (and b!325662 c!50987) b!325666))

(assert (= (and b!325662 (not c!50987)) b!325667))

(assert (=> d!69695 m!332519))

(assert (=> d!69695 m!332521))

(declare-fun m!332641 () Bool)

(assert (=> d!69695 m!332641))

(assert (=> d!69695 m!332519))

(assert (=> d!69695 m!332527))

(declare-fun m!332643 () Bool)

(assert (=> d!69695 m!332643))

(declare-fun m!332645 () Bool)

(assert (=> d!69695 m!332645))

(declare-fun m!332647 () Bool)

(assert (=> b!325663 m!332647))

(declare-fun m!332649 () Bool)

(assert (=> b!325667 m!332649))

(assert (=> b!325445 d!69695))

(declare-fun d!69711 () Bool)

(declare-fun e!200677 () Bool)

(assert (=> d!69711 e!200677))

(declare-fun c!50991 () Bool)

(declare-fun lt!157117 () SeekEntryResult!2990)

(assert (=> d!69711 (= c!50991 (and ((_ is Intermediate!2990) lt!157117) (undefined!3802 lt!157117)))))

(declare-fun e!200680 () SeekEntryResult!2990)

(assert (=> d!69711 (= lt!157117 e!200680)))

(declare-fun c!50990 () Bool)

(assert (=> d!69711 (= c!50990 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!157116 () (_ BitVec 64))

(assert (=> d!69711 (= lt!157116 (select (arr!7894 a!3305) index!1840))))

(assert (=> d!69711 (validMask!0 mask!3777)))

(assert (=> d!69711 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157117)))

(declare-fun e!200676 () SeekEntryResult!2990)

(declare-fun b!325668 () Bool)

(assert (=> b!325668 (= e!200676 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 (bvadd x!1490 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!325669 () Bool)

(declare-fun e!200678 () Bool)

(assert (=> b!325669 (= e!200677 e!200678)))

(declare-fun res!178946 () Bool)

(assert (=> b!325669 (= res!178946 (and ((_ is Intermediate!2990) lt!157117) (not (undefined!3802 lt!157117)) (bvslt (x!32479 lt!157117) #b01111111111111111111111111111110) (bvsge (x!32479 lt!157117) #b00000000000000000000000000000000) (bvsge (x!32479 lt!157117) x!1490)))))

(assert (=> b!325669 (=> (not res!178946) (not e!200678))))

(declare-fun b!325670 () Bool)

(assert (=> b!325670 (= e!200680 (Intermediate!2990 true index!1840 x!1490))))

(declare-fun b!325671 () Bool)

(assert (=> b!325671 (and (bvsge (index!14138 lt!157117) #b00000000000000000000000000000000) (bvslt (index!14138 lt!157117) (size!8246 a!3305)))))

(declare-fun res!178947 () Bool)

(assert (=> b!325671 (= res!178947 (= (select (arr!7894 a!3305) (index!14138 lt!157117)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!200679 () Bool)

(assert (=> b!325671 (=> res!178947 e!200679)))

(declare-fun b!325672 () Bool)

(assert (=> b!325672 (and (bvsge (index!14138 lt!157117) #b00000000000000000000000000000000) (bvslt (index!14138 lt!157117) (size!8246 a!3305)))))

(declare-fun res!178948 () Bool)

(assert (=> b!325672 (= res!178948 (= (select (arr!7894 a!3305) (index!14138 lt!157117)) k0!2497))))

(assert (=> b!325672 (=> res!178948 e!200679)))

(assert (=> b!325672 (= e!200678 e!200679)))

(declare-fun b!325673 () Bool)

(assert (=> b!325673 (= e!200677 (bvsge (x!32479 lt!157117) #b01111111111111111111111111111110))))

(declare-fun b!325674 () Bool)

(assert (=> b!325674 (= e!200676 (Intermediate!2990 false index!1840 x!1490))))

(declare-fun b!325675 () Bool)

(assert (=> b!325675 (= e!200680 e!200676)))

(declare-fun c!50992 () Bool)

(assert (=> b!325675 (= c!50992 (or (= lt!157116 k0!2497) (= (bvadd lt!157116 lt!157116) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!325676 () Bool)

(assert (=> b!325676 (and (bvsge (index!14138 lt!157117) #b00000000000000000000000000000000) (bvslt (index!14138 lt!157117) (size!8246 a!3305)))))

(assert (=> b!325676 (= e!200679 (= (select (arr!7894 a!3305) (index!14138 lt!157117)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!69711 c!50990) b!325670))

(assert (= (and d!69711 (not c!50990)) b!325675))

(assert (= (and b!325675 c!50992) b!325674))

(assert (= (and b!325675 (not c!50992)) b!325668))

(assert (= (and d!69711 c!50991) b!325673))

(assert (= (and d!69711 (not c!50991)) b!325669))

(assert (= (and b!325669 res!178946) b!325672))

(assert (= (and b!325672 (not res!178948)) b!325671))

(assert (= (and b!325671 (not res!178947)) b!325676))

(declare-fun m!332651 () Bool)

(assert (=> b!325671 m!332651))

(declare-fun m!332653 () Bool)

(assert (=> b!325668 m!332653))

(assert (=> b!325668 m!332653))

(declare-fun m!332655 () Bool)

(assert (=> b!325668 m!332655))

(assert (=> b!325672 m!332651))

(assert (=> d!69711 m!332509))

(assert (=> d!69711 m!332527))

(assert (=> b!325676 m!332651))

(assert (=> b!325449 d!69711))

(declare-fun d!69713 () Bool)

(assert (=> d!69713 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32522 d!69713))

(declare-fun d!69725 () Bool)

(assert (=> d!69725 (= (array_inv!5844 a!3305) (bvsge (size!8246 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32522 d!69725))

(declare-fun d!69727 () Bool)

(assert (=> d!69727 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!325443 d!69727))

(declare-fun d!69729 () Bool)

(declare-fun lt!157138 () (_ BitVec 32))

(assert (=> d!69729 (and (bvsge lt!157138 #b00000000000000000000000000000000) (bvslt lt!157138 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69729 (= lt!157138 (choose!52 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(assert (=> d!69729 (validMask!0 mask!3777)))

(assert (=> d!69729 (= (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) lt!157138)))

(declare-fun bs!11345 () Bool)

(assert (= bs!11345 d!69729))

(declare-fun m!332681 () Bool)

(assert (=> bs!11345 m!332681))

(assert (=> bs!11345 m!332527))

(assert (=> b!325442 d!69729))

(declare-fun d!69731 () Bool)

(declare-fun res!178961 () Bool)

(declare-fun e!200697 () Bool)

(assert (=> d!69731 (=> res!178961 e!200697)))

(assert (=> d!69731 (= res!178961 (= (select (arr!7894 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69731 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!200697)))

(declare-fun b!325697 () Bool)

(declare-fun e!200698 () Bool)

(assert (=> b!325697 (= e!200697 e!200698)))

(declare-fun res!178962 () Bool)

(assert (=> b!325697 (=> (not res!178962) (not e!200698))))

(assert (=> b!325697 (= res!178962 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8246 a!3305)))))

(declare-fun b!325698 () Bool)

(assert (=> b!325698 (= e!200698 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69731 (not res!178961)) b!325697))

(assert (= (and b!325697 res!178962) b!325698))

(assert (=> d!69731 m!332583))

(declare-fun m!332683 () Bool)

(assert (=> b!325698 m!332683))

(assert (=> b!325447 d!69731))

(check-sat (not bm!26057) (not b!325668) (not b!325519) (not d!69695) (not b!325518) (not b!325585) (not d!69677) (not d!69711) (not b!325698) (not b!325667) (not d!69729))
(check-sat)
