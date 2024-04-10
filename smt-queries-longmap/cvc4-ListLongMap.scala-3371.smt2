; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46282 () Bool)

(assert start!46282)

(declare-fun b!512711 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((array!32936 0))(
  ( (array!32937 (arr!15845 (Array (_ BitVec 32) (_ BitVec 64))) (size!16209 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32936)

(declare-fun e!299387 () Bool)

(declare-datatypes ((SeekEntryResult!4312 0))(
  ( (MissingZero!4312 (index!19436 (_ BitVec 32))) (Found!4312 (index!19437 (_ BitVec 32))) (Intermediate!4312 (undefined!5124 Bool) (index!19438 (_ BitVec 32)) (x!48375 (_ BitVec 32))) (Undefined!4312) (MissingVacant!4312 (index!19439 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32936 (_ BitVec 32)) SeekEntryResult!4312)

(assert (=> b!512711 (= e!299387 (= (seekEntryOrOpen!0 (select (arr!15845 a!3235) j!176) a!3235 mask!3524) (Found!4312 j!176)))))

(declare-fun b!512712 () Bool)

(declare-fun res!313378 () Bool)

(declare-fun e!299385 () Bool)

(assert (=> b!512712 (=> (not res!313378) (not e!299385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32936 (_ BitVec 32)) Bool)

(assert (=> b!512712 (= res!313378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!313381 () Bool)

(declare-fun e!299388 () Bool)

(assert (=> start!46282 (=> (not res!313381) (not e!299388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46282 (= res!313381 (validMask!0 mask!3524))))

(assert (=> start!46282 e!299388))

(assert (=> start!46282 true))

(declare-fun array_inv!11641 (array!32936) Bool)

(assert (=> start!46282 (array_inv!11641 a!3235)))

(declare-fun b!512713 () Bool)

(declare-fun res!313374 () Bool)

(assert (=> b!512713 (=> (not res!313374) (not e!299388))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32936 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512713 (= res!313374 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512714 () Bool)

(declare-fun res!313382 () Bool)

(assert (=> b!512714 (=> (not res!313382) (not e!299385))))

(declare-datatypes ((List!10003 0))(
  ( (Nil!10000) (Cons!9999 (h!10879 (_ BitVec 64)) (t!16231 List!10003)) )
))
(declare-fun arrayNoDuplicates!0 (array!32936 (_ BitVec 32) List!10003) Bool)

(assert (=> b!512714 (= res!313382 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10000))))

(declare-fun b!512715 () Bool)

(assert (=> b!512715 (= e!299388 e!299385)))

(declare-fun res!313375 () Bool)

(assert (=> b!512715 (=> (not res!313375) (not e!299385))))

(declare-fun lt!234743 () SeekEntryResult!4312)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!512715 (= res!313375 (or (= lt!234743 (MissingZero!4312 i!1204)) (= lt!234743 (MissingVacant!4312 i!1204))))))

(assert (=> b!512715 (= lt!234743 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!512716 () Bool)

(declare-fun e!299386 () Bool)

(assert (=> b!512716 (= e!299385 (not e!299386))))

(declare-fun res!313373 () Bool)

(assert (=> b!512716 (=> res!313373 e!299386)))

(declare-fun lt!234745 () SeekEntryResult!4312)

(declare-fun lt!234741 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32936 (_ BitVec 32)) SeekEntryResult!4312)

(assert (=> b!512716 (= res!313373 (= lt!234745 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234741 (select (store (arr!15845 a!3235) i!1204 k!2280) j!176) (array!32937 (store (arr!15845 a!3235) i!1204 k!2280) (size!16209 a!3235)) mask!3524)))))

(declare-fun lt!234744 () (_ BitVec 32))

(assert (=> b!512716 (= lt!234745 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234744 (select (arr!15845 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512716 (= lt!234741 (toIndex!0 (select (store (arr!15845 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!512716 (= lt!234744 (toIndex!0 (select (arr!15845 a!3235) j!176) mask!3524))))

(assert (=> b!512716 e!299387))

(declare-fun res!313379 () Bool)

(assert (=> b!512716 (=> (not res!313379) (not e!299387))))

(assert (=> b!512716 (= res!313379 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15882 0))(
  ( (Unit!15883) )
))
(declare-fun lt!234742 () Unit!15882)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32936 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15882)

(assert (=> b!512716 (= lt!234742 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512717 () Bool)

(assert (=> b!512717 (= e!299386 (or (not (is-Intermediate!4312 lt!234745)) (undefined!5124 lt!234745) (bvslt (x!48375 lt!234745) #b01111111111111111111111111111110)))))

(declare-fun b!512718 () Bool)

(declare-fun res!313376 () Bool)

(assert (=> b!512718 (=> (not res!313376) (not e!299388))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512718 (= res!313376 (validKeyInArray!0 (select (arr!15845 a!3235) j!176)))))

(declare-fun b!512719 () Bool)

(declare-fun res!313377 () Bool)

(assert (=> b!512719 (=> (not res!313377) (not e!299388))))

(assert (=> b!512719 (= res!313377 (and (= (size!16209 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16209 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16209 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512720 () Bool)

(declare-fun res!313380 () Bool)

(assert (=> b!512720 (=> (not res!313380) (not e!299388))))

(assert (=> b!512720 (= res!313380 (validKeyInArray!0 k!2280))))

(assert (= (and start!46282 res!313381) b!512719))

(assert (= (and b!512719 res!313377) b!512718))

(assert (= (and b!512718 res!313376) b!512720))

(assert (= (and b!512720 res!313380) b!512713))

(assert (= (and b!512713 res!313374) b!512715))

(assert (= (and b!512715 res!313375) b!512712))

(assert (= (and b!512712 res!313378) b!512714))

(assert (= (and b!512714 res!313382) b!512716))

(assert (= (and b!512716 res!313379) b!512711))

(assert (= (and b!512716 (not res!313373)) b!512717))

(declare-fun m!494433 () Bool)

(assert (=> start!46282 m!494433))

(declare-fun m!494435 () Bool)

(assert (=> start!46282 m!494435))

(declare-fun m!494437 () Bool)

(assert (=> b!512714 m!494437))

(declare-fun m!494439 () Bool)

(assert (=> b!512711 m!494439))

(assert (=> b!512711 m!494439))

(declare-fun m!494441 () Bool)

(assert (=> b!512711 m!494441))

(declare-fun m!494443 () Bool)

(assert (=> b!512720 m!494443))

(declare-fun m!494445 () Bool)

(assert (=> b!512715 m!494445))

(declare-fun m!494447 () Bool)

(assert (=> b!512716 m!494447))

(declare-fun m!494449 () Bool)

(assert (=> b!512716 m!494449))

(assert (=> b!512716 m!494439))

(declare-fun m!494451 () Bool)

(assert (=> b!512716 m!494451))

(assert (=> b!512716 m!494439))

(declare-fun m!494453 () Bool)

(assert (=> b!512716 m!494453))

(assert (=> b!512716 m!494439))

(declare-fun m!494455 () Bool)

(assert (=> b!512716 m!494455))

(declare-fun m!494457 () Bool)

(assert (=> b!512716 m!494457))

(declare-fun m!494459 () Bool)

(assert (=> b!512716 m!494459))

(assert (=> b!512716 m!494457))

(declare-fun m!494461 () Bool)

(assert (=> b!512716 m!494461))

(assert (=> b!512716 m!494457))

(declare-fun m!494463 () Bool)

(assert (=> b!512713 m!494463))

(declare-fun m!494465 () Bool)

(assert (=> b!512712 m!494465))

(assert (=> b!512718 m!494439))

(assert (=> b!512718 m!494439))

(declare-fun m!494467 () Bool)

(assert (=> b!512718 m!494467))

(push 1)

(assert (not b!512713))

(assert (not b!512711))

(assert (not b!512720))

(assert (not b!512712))

(assert (not b!512716))

(assert (not b!512718))

(assert (not start!46282))

(assert (not b!512714))

(assert (not b!512715))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78997 () Bool)

(assert (=> d!78997 (= (validKeyInArray!0 (select (arr!15845 a!3235) j!176)) (and (not (= (select (arr!15845 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15845 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!512718 d!78997))

(declare-fun d!78999 () Bool)

(declare-fun res!313393 () Bool)

(declare-fun e!299402 () Bool)

(assert (=> d!78999 (=> res!313393 e!299402)))

(assert (=> d!78999 (= res!313393 (= (select (arr!15845 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!78999 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!299402)))

(declare-fun b!512737 () Bool)

(declare-fun e!299403 () Bool)

(assert (=> b!512737 (= e!299402 e!299403)))

(declare-fun res!313394 () Bool)

(assert (=> b!512737 (=> (not res!313394) (not e!299403))))

(assert (=> b!512737 (= res!313394 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16209 a!3235)))))

(declare-fun b!512738 () Bool)

(assert (=> b!512738 (= e!299403 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78999 (not res!313393)) b!512737))

(assert (= (and b!512737 res!313394) b!512738))

(declare-fun m!494481 () Bool)

(assert (=> d!78999 m!494481))

(declare-fun m!494483 () Bool)

(assert (=> b!512738 m!494483))

(assert (=> b!512713 d!78999))

(declare-fun d!79001 () Bool)

(declare-fun res!313402 () Bool)

(declare-fun e!299415 () Bool)

(assert (=> d!79001 (=> res!313402 e!299415)))

(assert (=> d!79001 (= res!313402 (bvsge #b00000000000000000000000000000000 (size!16209 a!3235)))))

(assert (=> d!79001 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10000) e!299415)))

(declare-fun b!512749 () Bool)

(declare-fun e!299413 () Bool)

(declare-fun contains!2725 (List!10003 (_ BitVec 64)) Bool)

(assert (=> b!512749 (= e!299413 (contains!2725 Nil!10000 (select (arr!15845 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!512750 () Bool)

(declare-fun e!299414 () Bool)

(declare-fun call!31520 () Bool)

(assert (=> b!512750 (= e!299414 call!31520)))

(declare-fun b!512751 () Bool)

(assert (=> b!512751 (= e!299414 call!31520)))

(declare-fun b!512752 () Bool)

(declare-fun e!299412 () Bool)

(assert (=> b!512752 (= e!299412 e!299414)))

(declare-fun c!59954 () Bool)

(assert (=> b!512752 (= c!59954 (validKeyInArray!0 (select (arr!15845 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31517 () Bool)

(assert (=> bm!31517 (= call!31520 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!59954 (Cons!9999 (select (arr!15845 a!3235) #b00000000000000000000000000000000) Nil!10000) Nil!10000)))))

(declare-fun b!512753 () Bool)

(assert (=> b!512753 (= e!299415 e!299412)))

(declare-fun res!313401 () Bool)

(assert (=> b!512753 (=> (not res!313401) (not e!299412))))

(assert (=> b!512753 (= res!313401 (not e!299413))))

(declare-fun res!313403 () Bool)

(assert (=> b!512753 (=> (not res!313403) (not e!299413))))

(assert (=> b!512753 (= res!313403 (validKeyInArray!0 (select (arr!15845 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79001 (not res!313402)) b!512753))

(assert (= (and b!512753 res!313403) b!512749))

(assert (= (and b!512753 res!313401) b!512752))

(assert (= (and b!512752 c!59954) b!512751))

(assert (= (and b!512752 (not c!59954)) b!512750))

(assert (= (or b!512751 b!512750) bm!31517))

(assert (=> b!512749 m!494481))

(assert (=> b!512749 m!494481))

(declare-fun m!494485 () Bool)

(assert (=> b!512749 m!494485))

(assert (=> b!512752 m!494481))

(assert (=> b!512752 m!494481))

(declare-fun m!494487 () Bool)

(assert (=> b!512752 m!494487))

(assert (=> bm!31517 m!494481))

(declare-fun m!494489 () Bool)

(assert (=> bm!31517 m!494489))

(assert (=> b!512753 m!494481))

(assert (=> b!512753 m!494481))

(assert (=> b!512753 m!494487))

(assert (=> b!512714 d!79001))

(declare-fun d!79005 () Bool)

(assert (=> d!79005 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!512720 d!79005))

(declare-fun b!512806 () Bool)

(declare-fun e!299446 () SeekEntryResult!4312)

(declare-fun lt!234785 () SeekEntryResult!4312)

(assert (=> b!512806 (= e!299446 (MissingZero!4312 (index!19438 lt!234785)))))

(declare-fun b!512807 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32936 (_ BitVec 32)) SeekEntryResult!4312)

(assert (=> b!512807 (= e!299446 (seekKeyOrZeroReturnVacant!0 (x!48375 lt!234785) (index!19438 lt!234785) (index!19438 lt!234785) k!2280 a!3235 mask!3524))))

(declare-fun b!512808 () Bool)

(declare-fun c!59979 () Bool)

(declare-fun lt!234787 () (_ BitVec 64))

(assert (=> b!512808 (= c!59979 (= lt!234787 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!299447 () SeekEntryResult!4312)

(assert (=> b!512808 (= e!299447 e!299446)))

(declare-fun d!79007 () Bool)

(declare-fun lt!234786 () SeekEntryResult!4312)

(assert (=> d!79007 (and (or (is-Undefined!4312 lt!234786) (not (is-Found!4312 lt!234786)) (and (bvsge (index!19437 lt!234786) #b00000000000000000000000000000000) (bvslt (index!19437 lt!234786) (size!16209 a!3235)))) (or (is-Undefined!4312 lt!234786) (is-Found!4312 lt!234786) (not (is-MissingZero!4312 lt!234786)) (and (bvsge (index!19436 lt!234786) #b00000000000000000000000000000000) (bvslt (index!19436 lt!234786) (size!16209 a!3235)))) (or (is-Undefined!4312 lt!234786) (is-Found!4312 lt!234786) (is-MissingZero!4312 lt!234786) (not (is-MissingVacant!4312 lt!234786)) (and (bvsge (index!19439 lt!234786) #b00000000000000000000000000000000) (bvslt (index!19439 lt!234786) (size!16209 a!3235)))) (or (is-Undefined!4312 lt!234786) (ite (is-Found!4312 lt!234786) (= (select (arr!15845 a!3235) (index!19437 lt!234786)) k!2280) (ite (is-MissingZero!4312 lt!234786) (= (select (arr!15845 a!3235) (index!19436 lt!234786)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4312 lt!234786) (= (select (arr!15845 a!3235) (index!19439 lt!234786)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!299448 () SeekEntryResult!4312)

(assert (=> d!79007 (= lt!234786 e!299448)))

(declare-fun c!59981 () Bool)

(assert (=> d!79007 (= c!59981 (and (is-Intermediate!4312 lt!234785) (undefined!5124 lt!234785)))))

(assert (=> d!79007 (= lt!234785 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!79007 (validMask!0 mask!3524)))

(assert (=> d!79007 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!234786)))

(declare-fun b!512809 () Bool)

(assert (=> b!512809 (= e!299448 Undefined!4312)))

(declare-fun b!512810 () Bool)

(assert (=> b!512810 (= e!299447 (Found!4312 (index!19438 lt!234785)))))

(declare-fun b!512811 () Bool)

(assert (=> b!512811 (= e!299448 e!299447)))

(assert (=> b!512811 (= lt!234787 (select (arr!15845 a!3235) (index!19438 lt!234785)))))

(declare-fun c!59980 () Bool)

(assert (=> b!512811 (= c!59980 (= lt!234787 k!2280))))

(assert (= (and d!79007 c!59981) b!512809))

(assert (= (and d!79007 (not c!59981)) b!512811))

(assert (= (and b!512811 c!59980) b!512810))

(assert (= (and b!512811 (not c!59980)) b!512808))

(assert (= (and b!512808 c!59979) b!512806))

(assert (= (and b!512808 (not c!59979)) b!512807))

(declare-fun m!494517 () Bool)

(assert (=> b!512807 m!494517))

(declare-fun m!494519 () Bool)

(assert (=> d!79007 m!494519))

(declare-fun m!494521 () Bool)

(assert (=> d!79007 m!494521))

(declare-fun m!494523 () Bool)

(assert (=> d!79007 m!494523))

(assert (=> d!79007 m!494521))

(assert (=> d!79007 m!494433))

(declare-fun m!494525 () Bool)

(assert (=> d!79007 m!494525))

(declare-fun m!494527 () Bool)

(assert (=> d!79007 m!494527))

(declare-fun m!494529 () Bool)

(assert (=> b!512811 m!494529))

(assert (=> b!512715 d!79007))

(declare-fun d!79019 () Bool)

(assert (=> d!79019 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46282 d!79019))

(declare-fun d!79025 () Bool)

(assert (=> d!79025 (= (array_inv!11641 a!3235) (bvsge (size!16209 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46282 d!79025))

(declare-fun b!512920 () Bool)

(declare-fun e!299519 () SeekEntryResult!4312)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512920 (= e!299519 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!234741 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15845 a!3235) i!1204 k!2280) j!176) (array!32937 (store (arr!15845 a!3235) i!1204 k!2280) (size!16209 a!3235)) mask!3524))))

(declare-fun b!512921 () Bool)

(declare-fun e!299518 () Bool)

(declare-fun e!299520 () Bool)

(assert (=> b!512921 (= e!299518 e!299520)))

(declare-fun res!313457 () Bool)

(declare-fun lt!234821 () SeekEntryResult!4312)

(assert (=> b!512921 (= res!313457 (and (is-Intermediate!4312 lt!234821) (not (undefined!5124 lt!234821)) (bvslt (x!48375 lt!234821) #b01111111111111111111111111111110) (bvsge (x!48375 lt!234821) #b00000000000000000000000000000000) (bvsge (x!48375 lt!234821) #b00000000000000000000000000000000)))))

(assert (=> b!512921 (=> (not res!313457) (not e!299520))))

(declare-fun b!512922 () Bool)

(assert (=> b!512922 (= e!299519 (Intermediate!4312 false lt!234741 #b00000000000000000000000000000000))))

(declare-fun b!512923 () Bool)

(declare-fun e!299521 () SeekEntryResult!4312)

(assert (=> b!512923 (= e!299521 (Intermediate!4312 true lt!234741 #b00000000000000000000000000000000))))

(declare-fun b!512924 () Bool)

(assert (=> b!512924 (and (bvsge (index!19438 lt!234821) #b00000000000000000000000000000000) (bvslt (index!19438 lt!234821) (size!16209 (array!32937 (store (arr!15845 a!3235) i!1204 k!2280) (size!16209 a!3235)))))))

(declare-fun res!313456 () Bool)

(assert (=> b!512924 (= res!313456 (= (select (arr!15845 (array!32937 (store (arr!15845 a!3235) i!1204 k!2280) (size!16209 a!3235))) (index!19438 lt!234821)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!299522 () Bool)

(assert (=> b!512924 (=> res!313456 e!299522)))

(declare-fun b!512925 () Bool)

(assert (=> b!512925 (and (bvsge (index!19438 lt!234821) #b00000000000000000000000000000000) (bvslt (index!19438 lt!234821) (size!16209 (array!32937 (store (arr!15845 a!3235) i!1204 k!2280) (size!16209 a!3235)))))))

(assert (=> b!512925 (= e!299522 (= (select (arr!15845 (array!32937 (store (arr!15845 a!3235) i!1204 k!2280) (size!16209 a!3235))) (index!19438 lt!234821)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!512926 () Bool)

(assert (=> b!512926 (= e!299518 (bvsge (x!48375 lt!234821) #b01111111111111111111111111111110))))

(declare-fun d!79027 () Bool)

(assert (=> d!79027 e!299518))

(declare-fun c!60014 () Bool)

(assert (=> d!79027 (= c!60014 (and (is-Intermediate!4312 lt!234821) (undefined!5124 lt!234821)))))

(assert (=> d!79027 (= lt!234821 e!299521)))

(declare-fun c!60013 () Bool)

(assert (=> d!79027 (= c!60013 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!234820 () (_ BitVec 64))

(assert (=> d!79027 (= lt!234820 (select (arr!15845 (array!32937 (store (arr!15845 a!3235) i!1204 k!2280) (size!16209 a!3235))) lt!234741))))

(assert (=> d!79027 (validMask!0 mask!3524)))

(assert (=> d!79027 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234741 (select (store (arr!15845 a!3235) i!1204 k!2280) j!176) (array!32937 (store (arr!15845 a!3235) i!1204 k!2280) (size!16209 a!3235)) mask!3524) lt!234821)))

(declare-fun b!512927 () Bool)

(assert (=> b!512927 (and (bvsge (index!19438 lt!234821) #b00000000000000000000000000000000) (bvslt (index!19438 lt!234821) (size!16209 (array!32937 (store (arr!15845 a!3235) i!1204 k!2280) (size!16209 a!3235)))))))

(declare-fun res!313458 () Bool)

(assert (=> b!512927 (= res!313458 (= (select (arr!15845 (array!32937 (store (arr!15845 a!3235) i!1204 k!2280) (size!16209 a!3235))) (index!19438 lt!234821)) (select (store (arr!15845 a!3235) i!1204 k!2280) j!176)))))

(assert (=> b!512927 (=> res!313458 e!299522)))

(assert (=> b!512927 (= e!299520 e!299522)))

(declare-fun b!512928 () Bool)

(assert (=> b!512928 (= e!299521 e!299519)))

(declare-fun c!60015 () Bool)

(assert (=> b!512928 (= c!60015 (or (= lt!234820 (select (store (arr!15845 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!234820 lt!234820) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!79027 c!60013) b!512923))

(assert (= (and d!79027 (not c!60013)) b!512928))

(assert (= (and b!512928 c!60015) b!512922))

(assert (= (and b!512928 (not c!60015)) b!512920))

(assert (= (and d!79027 c!60014) b!512926))

(assert (= (and d!79027 (not c!60014)) b!512921))

(assert (= (and b!512921 res!313457) b!512927))

(assert (= (and b!512927 (not res!313458)) b!512924))

(assert (= (and b!512924 (not res!313456)) b!512925))

(declare-fun m!494597 () Bool)

(assert (=> d!79027 m!494597))

(assert (=> d!79027 m!494433))

(declare-fun m!494599 () Bool)

(assert (=> b!512927 m!494599))

(assert (=> b!512925 m!494599))

(declare-fun m!494601 () Bool)

(assert (=> b!512920 m!494601))

(assert (=> b!512920 m!494601))

(assert (=> b!512920 m!494457))

(declare-fun m!494603 () Bool)

(assert (=> b!512920 m!494603))

(assert (=> b!512924 m!494599))

(assert (=> b!512716 d!79027))

(declare-fun d!79055 () Bool)

(declare-fun lt!234827 () (_ BitVec 32))

(declare-fun lt!234826 () (_ BitVec 32))

(assert (=> d!79055 (= lt!234827 (bvmul (bvxor lt!234826 (bvlshr lt!234826 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79055 (= lt!234826 ((_ extract 31 0) (bvand (bvxor (select (arr!15845 a!3235) j!176) (bvlshr (select (arr!15845 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79055 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313459 (let ((h!10882 ((_ extract 31 0) (bvand (bvxor (select (arr!15845 a!3235) j!176) (bvlshr (select (arr!15845 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48380 (bvmul (bvxor h!10882 (bvlshr h!10882 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48380 (bvlshr x!48380 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313459 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313459 #b00000000000000000000000000000000))))))

(assert (=> d!79055 (= (toIndex!0 (select (arr!15845 a!3235) j!176) mask!3524) (bvand (bvxor lt!234827 (bvlshr lt!234827 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!512716 d!79055))

(declare-fun bm!31527 () Bool)

(declare-fun call!31530 () Bool)

(assert (=> bm!31527 (= call!31530 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!512964 () Bool)

(declare-fun e!299545 () Bool)

(assert (=> b!512964 (= e!299545 call!31530)))

(declare-fun b!512965 () Bool)

(declare-fun e!299546 () Bool)

(assert (=> b!512965 (= e!299546 call!31530)))

(declare-fun d!79057 () Bool)

(declare-fun res!313474 () Bool)

(declare-fun e!299544 () Bool)

(assert (=> d!79057 (=> res!313474 e!299544)))

(assert (=> d!79057 (= res!313474 (bvsge j!176 (size!16209 a!3235)))))

(assert (=> d!79057 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!299544)))

(declare-fun b!512966 () Bool)

(assert (=> b!512966 (= e!299544 e!299545)))

(declare-fun c!60027 () Bool)

(assert (=> b!512966 (= c!60027 (validKeyInArray!0 (select (arr!15845 a!3235) j!176)))))

(declare-fun b!512967 () Bool)

(assert (=> b!512967 (= e!299545 e!299546)))

(declare-fun lt!234840 () (_ BitVec 64))

(assert (=> b!512967 (= lt!234840 (select (arr!15845 a!3235) j!176))))

(declare-fun lt!234841 () Unit!15882)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32936 (_ BitVec 64) (_ BitVec 32)) Unit!15882)

(assert (=> b!512967 (= lt!234841 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!234840 j!176))))

(assert (=> b!512967 (arrayContainsKey!0 a!3235 lt!234840 #b00000000000000000000000000000000)))

(declare-fun lt!234842 () Unit!15882)

(assert (=> b!512967 (= lt!234842 lt!234841)))

(declare-fun res!313473 () Bool)

(assert (=> b!512967 (= res!313473 (= (seekEntryOrOpen!0 (select (arr!15845 a!3235) j!176) a!3235 mask!3524) (Found!4312 j!176)))))

(assert (=> b!512967 (=> (not res!313473) (not e!299546))))

(assert (= (and d!79057 (not res!313474)) b!512966))

(assert (= (and b!512966 c!60027) b!512967))

(assert (= (and b!512966 (not c!60027)) b!512964))

(assert (= (and b!512967 res!313473) b!512965))

(assert (= (or b!512965 b!512964) bm!31527))

(declare-fun m!494605 () Bool)

(assert (=> bm!31527 m!494605))

(assert (=> b!512966 m!494439))

(assert (=> b!512966 m!494439))

(assert (=> b!512966 m!494467))

(assert (=> b!512967 m!494439))

(declare-fun m!494607 () Bool)

(assert (=> b!512967 m!494607))

(declare-fun m!494609 () Bool)

(assert (=> b!512967 m!494609))

(assert (=> b!512967 m!494439))

(assert (=> b!512967 m!494441))

(assert (=> b!512716 d!79057))

(declare-fun e!299548 () SeekEntryResult!4312)

(declare-fun b!512968 () Bool)

(assert (=> b!512968 (= e!299548 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!234744 #b00000000000000000000000000000000 mask!3524) (select (arr!15845 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!512969 () Bool)

(declare-fun e!299547 () Bool)

(declare-fun e!299549 () Bool)

(assert (=> b!512969 (= e!299547 e!299549)))

(declare-fun res!313476 () Bool)

(declare-fun lt!234844 () SeekEntryResult!4312)

(assert (=> b!512969 (= res!313476 (and (is-Intermediate!4312 lt!234844) (not (undefined!5124 lt!234844)) (bvslt (x!48375 lt!234844) #b01111111111111111111111111111110) (bvsge (x!48375 lt!234844) #b00000000000000000000000000000000) (bvsge (x!48375 lt!234844) #b00000000000000000000000000000000)))))

(assert (=> b!512969 (=> (not res!313476) (not e!299549))))

(declare-fun b!512970 () Bool)

(assert (=> b!512970 (= e!299548 (Intermediate!4312 false lt!234744 #b00000000000000000000000000000000))))

(declare-fun b!512971 () Bool)

(declare-fun e!299550 () SeekEntryResult!4312)

(assert (=> b!512971 (= e!299550 (Intermediate!4312 true lt!234744 #b00000000000000000000000000000000))))

(declare-fun b!512972 () Bool)

(assert (=> b!512972 (and (bvsge (index!19438 lt!234844) #b00000000000000000000000000000000) (bvslt (index!19438 lt!234844) (size!16209 a!3235)))))

(declare-fun res!313475 () Bool)

(assert (=> b!512972 (= res!313475 (= (select (arr!15845 a!3235) (index!19438 lt!234844)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!299551 () Bool)

(assert (=> b!512972 (=> res!313475 e!299551)))

(declare-fun b!512973 () Bool)

(assert (=> b!512973 (and (bvsge (index!19438 lt!234844) #b00000000000000000000000000000000) (bvslt (index!19438 lt!234844) (size!16209 a!3235)))))

(assert (=> b!512973 (= e!299551 (= (select (arr!15845 a!3235) (index!19438 lt!234844)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!512974 () Bool)

(assert (=> b!512974 (= e!299547 (bvsge (x!48375 lt!234844) #b01111111111111111111111111111110))))

(declare-fun d!79059 () Bool)

(assert (=> d!79059 e!299547))

(declare-fun c!60029 () Bool)

(assert (=> d!79059 (= c!60029 (and (is-Intermediate!4312 lt!234844) (undefined!5124 lt!234844)))))

(assert (=> d!79059 (= lt!234844 e!299550)))

(declare-fun c!60028 () Bool)

(assert (=> d!79059 (= c!60028 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!234843 () (_ BitVec 64))

(assert (=> d!79059 (= lt!234843 (select (arr!15845 a!3235) lt!234744))))

(assert (=> d!79059 (validMask!0 mask!3524)))

(assert (=> d!79059 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234744 (select (arr!15845 a!3235) j!176) a!3235 mask!3524) lt!234844)))

(declare-fun b!512975 () Bool)

(assert (=> b!512975 (and (bvsge (index!19438 lt!234844) #b00000000000000000000000000000000) (bvslt (index!19438 lt!234844) (size!16209 a!3235)))))

(declare-fun res!313477 () Bool)

(assert (=> b!512975 (= res!313477 (= (select (arr!15845 a!3235) (index!19438 lt!234844)) (select (arr!15845 a!3235) j!176)))))

(assert (=> b!512975 (=> res!313477 e!299551)))

(assert (=> b!512975 (= e!299549 e!299551)))

(declare-fun b!512976 () Bool)

(assert (=> b!512976 (= e!299550 e!299548)))

(declare-fun c!60030 () Bool)

(assert (=> b!512976 (= c!60030 (or (= lt!234843 (select (arr!15845 a!3235) j!176)) (= (bvadd lt!234843 lt!234843) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!79059 c!60028) b!512971))

(assert (= (and d!79059 (not c!60028)) b!512976))

(assert (= (and b!512976 c!60030) b!512970))

(assert (= (and b!512976 (not c!60030)) b!512968))

(assert (= (and d!79059 c!60029) b!512974))

(assert (= (and d!79059 (not c!60029)) b!512969))

(assert (= (and b!512969 res!313476) b!512975))

(assert (= (and b!512975 (not res!313477)) b!512972))

(assert (= (and b!512972 (not res!313475)) b!512973))

(declare-fun m!494619 () Bool)

(assert (=> d!79059 m!494619))

(assert (=> d!79059 m!494433))

(declare-fun m!494621 () Bool)

(assert (=> b!512975 m!494621))

(assert (=> b!512973 m!494621))

(declare-fun m!494623 () Bool)

(assert (=> b!512968 m!494623))

(assert (=> b!512968 m!494623))

(assert (=> b!512968 m!494439))

(declare-fun m!494625 () Bool)

(assert (=> b!512968 m!494625))

(assert (=> b!512972 m!494621))

(assert (=> b!512716 d!79059))

(declare-fun d!79063 () Bool)

(assert (=> d!79063 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!234847 () Unit!15882)

(declare-fun choose!38 (array!32936 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15882)

(assert (=> d!79063 (= lt!234847 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79063 (validMask!0 mask!3524)))

(assert (=> d!79063 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!234847)))

(declare-fun bs!16241 () Bool)

(assert (= bs!16241 d!79063))

(assert (=> bs!16241 m!494455))

(declare-fun m!494627 () Bool)

(assert (=> bs!16241 m!494627))

(assert (=> bs!16241 m!494433))

(assert (=> b!512716 d!79063))

(declare-fun d!79065 () Bool)

(declare-fun lt!234849 () (_ BitVec 32))

(declare-fun lt!234848 () (_ BitVec 32))

(assert (=> d!79065 (= lt!234849 (bvmul (bvxor lt!234848 (bvlshr lt!234848 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79065 (= lt!234848 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15845 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15845 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79065 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313459 (let ((h!10882 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15845 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15845 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48380 (bvmul (bvxor h!10882 (bvlshr h!10882 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48380 (bvlshr x!48380 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313459 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313459 #b00000000000000000000000000000000))))))

(assert (=> d!79065 (= (toIndex!0 (select (store (arr!15845 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!234849 (bvlshr lt!234849 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!512716 d!79065))

(declare-fun b!512977 () Bool)

(declare-fun e!299552 () SeekEntryResult!4312)

(declare-fun lt!234850 () SeekEntryResult!4312)

(assert (=> b!512977 (= e!299552 (MissingZero!4312 (index!19438 lt!234850)))))

(declare-fun b!512978 () Bool)

(assert (=> b!512978 (= e!299552 (seekKeyOrZeroReturnVacant!0 (x!48375 lt!234850) (index!19438 lt!234850) (index!19438 lt!234850) (select (arr!15845 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!512979 () Bool)

(declare-fun c!60031 () Bool)

(declare-fun lt!234852 () (_ BitVec 64))

(assert (=> b!512979 (= c!60031 (= lt!234852 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!299553 () SeekEntryResult!4312)

(assert (=> b!512979 (= e!299553 e!299552)))

(declare-fun d!79067 () Bool)

(declare-fun lt!234851 () SeekEntryResult!4312)

(assert (=> d!79067 (and (or (is-Undefined!4312 lt!234851) (not (is-Found!4312 lt!234851)) (and (bvsge (index!19437 lt!234851) #b00000000000000000000000000000000) (bvslt (index!19437 lt!234851) (size!16209 a!3235)))) (or (is-Undefined!4312 lt!234851) (is-Found!4312 lt!234851) (not (is-MissingZero!4312 lt!234851)) (and (bvsge (index!19436 lt!234851) #b00000000000000000000000000000000) (bvslt (index!19436 lt!234851) (size!16209 a!3235)))) (or (is-Undefined!4312 lt!234851) (is-Found!4312 lt!234851) (is-MissingZero!4312 lt!234851) (not (is-MissingVacant!4312 lt!234851)) (and (bvsge (index!19439 lt!234851) #b00000000000000000000000000000000) (bvslt (index!19439 lt!234851) (size!16209 a!3235)))) (or (is-Undefined!4312 lt!234851) (ite (is-Found!4312 lt!234851) (= (select (arr!15845 a!3235) (index!19437 lt!234851)) (select (arr!15845 a!3235) j!176)) (ite (is-MissingZero!4312 lt!234851) (= (select (arr!15845 a!3235) (index!19436 lt!234851)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4312 lt!234851) (= (select (arr!15845 a!3235) (index!19439 lt!234851)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!299554 () SeekEntryResult!4312)

(assert (=> d!79067 (= lt!234851 e!299554)))

(declare-fun c!60033 () Bool)

(assert (=> d!79067 (= c!60033 (and (is-Intermediate!4312 lt!234850) (undefined!5124 lt!234850)))))

(assert (=> d!79067 (= lt!234850 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15845 a!3235) j!176) mask!3524) (select (arr!15845 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79067 (validMask!0 mask!3524)))

(assert (=> d!79067 (= (seekEntryOrOpen!0 (select (arr!15845 a!3235) j!176) a!3235 mask!3524) lt!234851)))

(declare-fun b!512980 () Bool)

(assert (=> b!512980 (= e!299554 Undefined!4312)))

(declare-fun b!512981 () Bool)

(assert (=> b!512981 (= e!299553 (Found!4312 (index!19438 lt!234850)))))

(declare-fun b!512982 () Bool)

(assert (=> b!512982 (= e!299554 e!299553)))

(assert (=> b!512982 (= lt!234852 (select (arr!15845 a!3235) (index!19438 lt!234850)))))

(declare-fun c!60032 () Bool)

(assert (=> b!512982 (= c!60032 (= lt!234852 (select (arr!15845 a!3235) j!176)))))

(assert (= (and d!79067 c!60033) b!512980))

(assert (= (and d!79067 (not c!60033)) b!512982))

(assert (= (and b!512982 c!60032) b!512981))

(assert (= (and b!512982 (not c!60032)) b!512979))

(assert (= (and b!512979 c!60031) b!512977))

(assert (= (and b!512979 (not c!60031)) b!512978))

(assert (=> b!512978 m!494439))

(declare-fun m!494629 () Bool)

(assert (=> b!512978 m!494629))

(declare-fun m!494631 () Bool)

(assert (=> d!79067 m!494631))

(assert (=> d!79067 m!494453))

(assert (=> d!79067 m!494439))

(declare-fun m!494633 () Bool)

(assert (=> d!79067 m!494633))

(assert (=> d!79067 m!494439))

(assert (=> d!79067 m!494453))

(assert (=> d!79067 m!494433))

(declare-fun m!494635 () Bool)

(assert (=> d!79067 m!494635))

(declare-fun m!494637 () Bool)

(assert (=> d!79067 m!494637))

(declare-fun m!494639 () Bool)

(assert (=> b!512982 m!494639))

(assert (=> b!512711 d!79067))

(declare-fun bm!31528 () Bool)

(declare-fun call!31531 () Bool)

(assert (=> bm!31528 (= call!31531 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!512983 () Bool)

(declare-fun e!299556 () Bool)

(assert (=> b!512983 (= e!299556 call!31531)))

(declare-fun b!512984 () Bool)

(declare-fun e!299557 () Bool)

(assert (=> b!512984 (= e!299557 call!31531)))

(declare-fun d!79069 () Bool)

(declare-fun res!313479 () Bool)

(declare-fun e!299555 () Bool)

(assert (=> d!79069 (=> res!313479 e!299555)))

(assert (=> d!79069 (= res!313479 (bvsge #b00000000000000000000000000000000 (size!16209 a!3235)))))

(assert (=> d!79069 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!299555)))

(declare-fun b!512985 () Bool)

(assert (=> b!512985 (= e!299555 e!299556)))

(declare-fun c!60034 () Bool)

(assert (=> b!512985 (= c!60034 (validKeyInArray!0 (select (arr!15845 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!512986 () Bool)

(assert (=> b!512986 (= e!299556 e!299557)))

(declare-fun lt!234853 () (_ BitVec 64))

(assert (=> b!512986 (= lt!234853 (select (arr!15845 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!234854 () Unit!15882)

(assert (=> b!512986 (= lt!234854 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!234853 #b00000000000000000000000000000000))))

(assert (=> b!512986 (arrayContainsKey!0 a!3235 lt!234853 #b00000000000000000000000000000000)))

(declare-fun lt!234855 () Unit!15882)

(assert (=> b!512986 (= lt!234855 lt!234854)))

(declare-fun res!313478 () Bool)

(assert (=> b!512986 (= res!313478 (= (seekEntryOrOpen!0 (select (arr!15845 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4312 #b00000000000000000000000000000000)))))

(assert (=> b!512986 (=> (not res!313478) (not e!299557))))

(assert (= (and d!79069 (not res!313479)) b!512985))

(assert (= (and b!512985 c!60034) b!512986))

(assert (= (and b!512985 (not c!60034)) b!512983))

(assert (= (and b!512986 res!313478) b!512984))

(assert (= (or b!512984 b!512983) bm!31528))

(declare-fun m!494641 () Bool)

(assert (=> bm!31528 m!494641))

(assert (=> b!512985 m!494481))

(assert (=> b!512985 m!494481))

(assert (=> b!512985 m!494487))

(assert (=> b!512986 m!494481))

(declare-fun m!494643 () Bool)

(assert (=> b!512986 m!494643))

(declare-fun m!494645 () Bool)

(assert (=> b!512986 m!494645))

(assert (=> b!512986 m!494481))

(declare-fun m!494647 () Bool)

(assert (=> b!512986 m!494647))

(assert (=> b!512712 d!79069))

(push 1)

