; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46280 () Bool)

(assert start!46280)

(declare-fun b!512681 () Bool)

(declare-fun res!313350 () Bool)

(declare-fun e!299372 () Bool)

(assert (=> b!512681 (=> (not res!313350) (not e!299372))))

(declare-datatypes ((array!32934 0))(
  ( (array!32935 (arr!15844 (Array (_ BitVec 32) (_ BitVec 64))) (size!16208 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32934)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32934 (_ BitVec 32)) Bool)

(assert (=> b!512681 (= res!313350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512682 () Bool)

(declare-fun res!313351 () Bool)

(declare-fun e!299369 () Bool)

(assert (=> b!512682 (=> (not res!313351) (not e!299369))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!512682 (= res!313351 (and (= (size!16208 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16208 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16208 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512683 () Bool)

(declare-fun e!299370 () Bool)

(declare-datatypes ((SeekEntryResult!4311 0))(
  ( (MissingZero!4311 (index!19432 (_ BitVec 32))) (Found!4311 (index!19433 (_ BitVec 32))) (Intermediate!4311 (undefined!5123 Bool) (index!19434 (_ BitVec 32)) (x!48374 (_ BitVec 32))) (Undefined!4311) (MissingVacant!4311 (index!19435 (_ BitVec 32))) )
))
(declare-fun lt!234728 () SeekEntryResult!4311)

(get-info :version)

(assert (=> b!512683 (= e!299370 (or (not ((_ is Intermediate!4311) lt!234728)) (undefined!5123 lt!234728) (bvslt (x!48374 lt!234728) #b01111111111111111111111111111110)))))

(declare-fun b!512684 () Bool)

(declare-fun res!313347 () Bool)

(assert (=> b!512684 (=> (not res!313347) (not e!299369))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512684 (= res!313347 (validKeyInArray!0 k0!2280))))

(declare-fun b!512685 () Bool)

(declare-fun res!313343 () Bool)

(assert (=> b!512685 (=> (not res!313343) (not e!299369))))

(declare-fun arrayContainsKey!0 (array!32934 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512685 (= res!313343 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512686 () Bool)

(assert (=> b!512686 (= e!299369 e!299372)))

(declare-fun res!313346 () Bool)

(assert (=> b!512686 (=> (not res!313346) (not e!299372))))

(declare-fun lt!234729 () SeekEntryResult!4311)

(assert (=> b!512686 (= res!313346 (or (= lt!234729 (MissingZero!4311 i!1204)) (= lt!234729 (MissingVacant!4311 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32934 (_ BitVec 32)) SeekEntryResult!4311)

(assert (=> b!512686 (= lt!234729 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!512687 () Bool)

(assert (=> b!512687 (= e!299372 (not e!299370))))

(declare-fun res!313348 () Bool)

(assert (=> b!512687 (=> res!313348 e!299370)))

(declare-fun lt!234727 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32934 (_ BitVec 32)) SeekEntryResult!4311)

(assert (=> b!512687 (= res!313348 (= lt!234728 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234727 (select (store (arr!15844 a!3235) i!1204 k0!2280) j!176) (array!32935 (store (arr!15844 a!3235) i!1204 k0!2280) (size!16208 a!3235)) mask!3524)))))

(declare-fun lt!234730 () (_ BitVec 32))

(assert (=> b!512687 (= lt!234728 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234730 (select (arr!15844 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512687 (= lt!234727 (toIndex!0 (select (store (arr!15844 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!512687 (= lt!234730 (toIndex!0 (select (arr!15844 a!3235) j!176) mask!3524))))

(declare-fun e!299373 () Bool)

(assert (=> b!512687 e!299373))

(declare-fun res!313345 () Bool)

(assert (=> b!512687 (=> (not res!313345) (not e!299373))))

(assert (=> b!512687 (= res!313345 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15880 0))(
  ( (Unit!15881) )
))
(declare-fun lt!234726 () Unit!15880)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32934 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15880)

(assert (=> b!512687 (= lt!234726 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!313349 () Bool)

(assert (=> start!46280 (=> (not res!313349) (not e!299369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46280 (= res!313349 (validMask!0 mask!3524))))

(assert (=> start!46280 e!299369))

(assert (=> start!46280 true))

(declare-fun array_inv!11640 (array!32934) Bool)

(assert (=> start!46280 (array_inv!11640 a!3235)))

(declare-fun b!512688 () Bool)

(declare-fun res!313352 () Bool)

(assert (=> b!512688 (=> (not res!313352) (not e!299369))))

(assert (=> b!512688 (= res!313352 (validKeyInArray!0 (select (arr!15844 a!3235) j!176)))))

(declare-fun b!512689 () Bool)

(assert (=> b!512689 (= e!299373 (= (seekEntryOrOpen!0 (select (arr!15844 a!3235) j!176) a!3235 mask!3524) (Found!4311 j!176)))))

(declare-fun b!512690 () Bool)

(declare-fun res!313344 () Bool)

(assert (=> b!512690 (=> (not res!313344) (not e!299372))))

(declare-datatypes ((List!10002 0))(
  ( (Nil!9999) (Cons!9998 (h!10878 (_ BitVec 64)) (t!16230 List!10002)) )
))
(declare-fun arrayNoDuplicates!0 (array!32934 (_ BitVec 32) List!10002) Bool)

(assert (=> b!512690 (= res!313344 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9999))))

(assert (= (and start!46280 res!313349) b!512682))

(assert (= (and b!512682 res!313351) b!512688))

(assert (= (and b!512688 res!313352) b!512684))

(assert (= (and b!512684 res!313347) b!512685))

(assert (= (and b!512685 res!313343) b!512686))

(assert (= (and b!512686 res!313346) b!512681))

(assert (= (and b!512681 res!313350) b!512690))

(assert (= (and b!512690 res!313344) b!512687))

(assert (= (and b!512687 res!313345) b!512689))

(assert (= (and b!512687 (not res!313348)) b!512683))

(declare-fun m!494397 () Bool)

(assert (=> b!512681 m!494397))

(declare-fun m!494399 () Bool)

(assert (=> b!512687 m!494399))

(declare-fun m!494401 () Bool)

(assert (=> b!512687 m!494401))

(declare-fun m!494403 () Bool)

(assert (=> b!512687 m!494403))

(declare-fun m!494405 () Bool)

(assert (=> b!512687 m!494405))

(declare-fun m!494407 () Bool)

(assert (=> b!512687 m!494407))

(assert (=> b!512687 m!494403))

(declare-fun m!494409 () Bool)

(assert (=> b!512687 m!494409))

(declare-fun m!494411 () Bool)

(assert (=> b!512687 m!494411))

(assert (=> b!512687 m!494403))

(declare-fun m!494413 () Bool)

(assert (=> b!512687 m!494413))

(assert (=> b!512687 m!494405))

(declare-fun m!494415 () Bool)

(assert (=> b!512687 m!494415))

(assert (=> b!512687 m!494405))

(declare-fun m!494417 () Bool)

(assert (=> b!512690 m!494417))

(declare-fun m!494419 () Bool)

(assert (=> b!512684 m!494419))

(declare-fun m!494421 () Bool)

(assert (=> start!46280 m!494421))

(declare-fun m!494423 () Bool)

(assert (=> start!46280 m!494423))

(assert (=> b!512688 m!494405))

(assert (=> b!512688 m!494405))

(declare-fun m!494425 () Bool)

(assert (=> b!512688 m!494425))

(declare-fun m!494427 () Bool)

(assert (=> b!512686 m!494427))

(declare-fun m!494429 () Bool)

(assert (=> b!512685 m!494429))

(assert (=> b!512689 m!494405))

(assert (=> b!512689 m!494405))

(declare-fun m!494431 () Bool)

(assert (=> b!512689 m!494431))

(check-sat (not b!512685) (not b!512687) (not b!512681) (not b!512686) (not b!512688) (not b!512689) (not b!512690) (not b!512684) (not start!46280))
(check-sat)
(get-model)

(declare-fun d!78989 () Bool)

(assert (=> d!78989 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46280 d!78989))

(declare-fun d!78991 () Bool)

(assert (=> d!78991 (= (array_inv!11640 a!3235) (bvsge (size!16208 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46280 d!78991))

(declare-fun d!78993 () Bool)

(declare-fun res!313388 () Bool)

(declare-fun e!299396 () Bool)

(assert (=> d!78993 (=> res!313388 e!299396)))

(assert (=> d!78993 (= res!313388 (bvsge #b00000000000000000000000000000000 (size!16208 a!3235)))))

(assert (=> d!78993 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!299396)))

(declare-fun b!512729 () Bool)

(declare-fun e!299395 () Bool)

(declare-fun call!31517 () Bool)

(assert (=> b!512729 (= e!299395 call!31517)))

(declare-fun b!512730 () Bool)

(declare-fun e!299397 () Bool)

(assert (=> b!512730 (= e!299397 call!31517)))

(declare-fun bm!31514 () Bool)

(assert (=> bm!31514 (= call!31517 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!512731 () Bool)

(assert (=> b!512731 (= e!299396 e!299397)))

(declare-fun c!59951 () Bool)

(assert (=> b!512731 (= c!59951 (validKeyInArray!0 (select (arr!15844 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!512732 () Bool)

(assert (=> b!512732 (= e!299397 e!299395)))

(declare-fun lt!234754 () (_ BitVec 64))

(assert (=> b!512732 (= lt!234754 (select (arr!15844 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!234752 () Unit!15880)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32934 (_ BitVec 64) (_ BitVec 32)) Unit!15880)

(assert (=> b!512732 (= lt!234752 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!234754 #b00000000000000000000000000000000))))

(assert (=> b!512732 (arrayContainsKey!0 a!3235 lt!234754 #b00000000000000000000000000000000)))

(declare-fun lt!234753 () Unit!15880)

(assert (=> b!512732 (= lt!234753 lt!234752)))

(declare-fun res!313387 () Bool)

(assert (=> b!512732 (= res!313387 (= (seekEntryOrOpen!0 (select (arr!15844 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4311 #b00000000000000000000000000000000)))))

(assert (=> b!512732 (=> (not res!313387) (not e!299395))))

(assert (= (and d!78993 (not res!313388)) b!512731))

(assert (= (and b!512731 c!59951) b!512732))

(assert (= (and b!512731 (not c!59951)) b!512730))

(assert (= (and b!512732 res!313387) b!512729))

(assert (= (or b!512729 b!512730) bm!31514))

(declare-fun m!494469 () Bool)

(assert (=> bm!31514 m!494469))

(declare-fun m!494471 () Bool)

(assert (=> b!512731 m!494471))

(assert (=> b!512731 m!494471))

(declare-fun m!494473 () Bool)

(assert (=> b!512731 m!494473))

(assert (=> b!512732 m!494471))

(declare-fun m!494475 () Bool)

(assert (=> b!512732 m!494475))

(declare-fun m!494477 () Bool)

(assert (=> b!512732 m!494477))

(assert (=> b!512732 m!494471))

(declare-fun m!494479 () Bool)

(assert (=> b!512732 m!494479))

(assert (=> b!512681 d!78993))

(declare-fun e!299424 () SeekEntryResult!4311)

(declare-fun lt!234763 () SeekEntryResult!4311)

(declare-fun b!512766 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32934 (_ BitVec 32)) SeekEntryResult!4311)

(assert (=> b!512766 (= e!299424 (seekKeyOrZeroReturnVacant!0 (x!48374 lt!234763) (index!19434 lt!234763) (index!19434 lt!234763) k0!2280 a!3235 mask!3524))))

(declare-fun b!512767 () Bool)

(declare-fun e!299423 () SeekEntryResult!4311)

(assert (=> b!512767 (= e!299423 Undefined!4311)))

(declare-fun b!512768 () Bool)

(declare-fun e!299422 () SeekEntryResult!4311)

(assert (=> b!512768 (= e!299422 (Found!4311 (index!19434 lt!234763)))))

(declare-fun b!512769 () Bool)

(declare-fun c!59961 () Bool)

(declare-fun lt!234761 () (_ BitVec 64))

(assert (=> b!512769 (= c!59961 (= lt!234761 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!512769 (= e!299422 e!299424)))

(declare-fun b!512770 () Bool)

(assert (=> b!512770 (= e!299423 e!299422)))

(assert (=> b!512770 (= lt!234761 (select (arr!15844 a!3235) (index!19434 lt!234763)))))

(declare-fun c!59962 () Bool)

(assert (=> b!512770 (= c!59962 (= lt!234761 k0!2280))))

(declare-fun d!78995 () Bool)

(declare-fun lt!234762 () SeekEntryResult!4311)

(assert (=> d!78995 (and (or ((_ is Undefined!4311) lt!234762) (not ((_ is Found!4311) lt!234762)) (and (bvsge (index!19433 lt!234762) #b00000000000000000000000000000000) (bvslt (index!19433 lt!234762) (size!16208 a!3235)))) (or ((_ is Undefined!4311) lt!234762) ((_ is Found!4311) lt!234762) (not ((_ is MissingZero!4311) lt!234762)) (and (bvsge (index!19432 lt!234762) #b00000000000000000000000000000000) (bvslt (index!19432 lt!234762) (size!16208 a!3235)))) (or ((_ is Undefined!4311) lt!234762) ((_ is Found!4311) lt!234762) ((_ is MissingZero!4311) lt!234762) (not ((_ is MissingVacant!4311) lt!234762)) (and (bvsge (index!19435 lt!234762) #b00000000000000000000000000000000) (bvslt (index!19435 lt!234762) (size!16208 a!3235)))) (or ((_ is Undefined!4311) lt!234762) (ite ((_ is Found!4311) lt!234762) (= (select (arr!15844 a!3235) (index!19433 lt!234762)) k0!2280) (ite ((_ is MissingZero!4311) lt!234762) (= (select (arr!15844 a!3235) (index!19432 lt!234762)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4311) lt!234762) (= (select (arr!15844 a!3235) (index!19435 lt!234762)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78995 (= lt!234762 e!299423)))

(declare-fun c!59963 () Bool)

(assert (=> d!78995 (= c!59963 (and ((_ is Intermediate!4311) lt!234763) (undefined!5123 lt!234763)))))

(assert (=> d!78995 (= lt!234763 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!78995 (validMask!0 mask!3524)))

(assert (=> d!78995 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!234762)))

(declare-fun b!512771 () Bool)

(assert (=> b!512771 (= e!299424 (MissingZero!4311 (index!19434 lt!234763)))))

(assert (= (and d!78995 c!59963) b!512767))

(assert (= (and d!78995 (not c!59963)) b!512770))

(assert (= (and b!512770 c!59962) b!512768))

(assert (= (and b!512770 (not c!59962)) b!512769))

(assert (= (and b!512769 c!59961) b!512771))

(assert (= (and b!512769 (not c!59961)) b!512766))

(declare-fun m!494491 () Bool)

(assert (=> b!512766 m!494491))

(declare-fun m!494493 () Bool)

(assert (=> b!512770 m!494493))

(declare-fun m!494495 () Bool)

(assert (=> d!78995 m!494495))

(declare-fun m!494497 () Bool)

(assert (=> d!78995 m!494497))

(assert (=> d!78995 m!494421))

(declare-fun m!494499 () Bool)

(assert (=> d!78995 m!494499))

(declare-fun m!494501 () Bool)

(assert (=> d!78995 m!494501))

(assert (=> d!78995 m!494497))

(declare-fun m!494503 () Bool)

(assert (=> d!78995 m!494503))

(assert (=> b!512686 d!78995))

(declare-fun d!79009 () Bool)

(declare-fun lt!234775 () (_ BitVec 32))

(declare-fun lt!234774 () (_ BitVec 32))

(assert (=> d!79009 (= lt!234775 (bvmul (bvxor lt!234774 (bvlshr lt!234774 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79009 (= lt!234774 ((_ extract 31 0) (bvand (bvxor (select (arr!15844 a!3235) j!176) (bvlshr (select (arr!15844 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79009 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313404 (let ((h!10880 ((_ extract 31 0) (bvand (bvxor (select (arr!15844 a!3235) j!176) (bvlshr (select (arr!15844 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48376 (bvmul (bvxor h!10880 (bvlshr h!10880 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48376 (bvlshr x!48376 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313404 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313404 #b00000000000000000000000000000000))))))

(assert (=> d!79009 (= (toIndex!0 (select (arr!15844 a!3235) j!176) mask!3524) (bvand (bvxor lt!234775 (bvlshr lt!234775 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!512687 d!79009))

(declare-fun d!79011 () Bool)

(declare-fun e!299468 () Bool)

(assert (=> d!79011 e!299468))

(declare-fun c!59996 () Bool)

(declare-fun lt!234795 () SeekEntryResult!4311)

(assert (=> d!79011 (= c!59996 (and ((_ is Intermediate!4311) lt!234795) (undefined!5123 lt!234795)))))

(declare-fun e!299469 () SeekEntryResult!4311)

(assert (=> d!79011 (= lt!234795 e!299469)))

(declare-fun c!59994 () Bool)

(assert (=> d!79011 (= c!59994 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!234796 () (_ BitVec 64))

(assert (=> d!79011 (= lt!234796 (select (arr!15844 a!3235) lt!234730))))

(assert (=> d!79011 (validMask!0 mask!3524)))

(assert (=> d!79011 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234730 (select (arr!15844 a!3235) j!176) a!3235 mask!3524) lt!234795)))

(declare-fun b!512847 () Bool)

(assert (=> b!512847 (and (bvsge (index!19434 lt!234795) #b00000000000000000000000000000000) (bvslt (index!19434 lt!234795) (size!16208 a!3235)))))

(declare-fun res!313422 () Bool)

(assert (=> b!512847 (= res!313422 (= (select (arr!15844 a!3235) (index!19434 lt!234795)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!299470 () Bool)

(assert (=> b!512847 (=> res!313422 e!299470)))

(declare-fun b!512848 () Bool)

(declare-fun e!299471 () Bool)

(assert (=> b!512848 (= e!299468 e!299471)))

(declare-fun res!313421 () Bool)

(assert (=> b!512848 (= res!313421 (and ((_ is Intermediate!4311) lt!234795) (not (undefined!5123 lt!234795)) (bvslt (x!48374 lt!234795) #b01111111111111111111111111111110) (bvsge (x!48374 lt!234795) #b00000000000000000000000000000000) (bvsge (x!48374 lt!234795) #b00000000000000000000000000000000)))))

(assert (=> b!512848 (=> (not res!313421) (not e!299471))))

(declare-fun b!512849 () Bool)

(assert (=> b!512849 (and (bvsge (index!19434 lt!234795) #b00000000000000000000000000000000) (bvslt (index!19434 lt!234795) (size!16208 a!3235)))))

(declare-fun res!313420 () Bool)

(assert (=> b!512849 (= res!313420 (= (select (arr!15844 a!3235) (index!19434 lt!234795)) (select (arr!15844 a!3235) j!176)))))

(assert (=> b!512849 (=> res!313420 e!299470)))

(assert (=> b!512849 (= e!299471 e!299470)))

(declare-fun e!299472 () SeekEntryResult!4311)

(declare-fun b!512850 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512850 (= e!299472 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!234730 #b00000000000000000000000000000000 mask!3524) (select (arr!15844 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!512851 () Bool)

(assert (=> b!512851 (= e!299469 (Intermediate!4311 true lt!234730 #b00000000000000000000000000000000))))

(declare-fun b!512852 () Bool)

(assert (=> b!512852 (= e!299468 (bvsge (x!48374 lt!234795) #b01111111111111111111111111111110))))

(declare-fun b!512853 () Bool)

(assert (=> b!512853 (= e!299472 (Intermediate!4311 false lt!234730 #b00000000000000000000000000000000))))

(declare-fun b!512854 () Bool)

(assert (=> b!512854 (and (bvsge (index!19434 lt!234795) #b00000000000000000000000000000000) (bvslt (index!19434 lt!234795) (size!16208 a!3235)))))

(assert (=> b!512854 (= e!299470 (= (select (arr!15844 a!3235) (index!19434 lt!234795)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!512855 () Bool)

(assert (=> b!512855 (= e!299469 e!299472)))

(declare-fun c!59995 () Bool)

(assert (=> b!512855 (= c!59995 (or (= lt!234796 (select (arr!15844 a!3235) j!176)) (= (bvadd lt!234796 lt!234796) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!79011 c!59994) b!512851))

(assert (= (and d!79011 (not c!59994)) b!512855))

(assert (= (and b!512855 c!59995) b!512853))

(assert (= (and b!512855 (not c!59995)) b!512850))

(assert (= (and d!79011 c!59996) b!512852))

(assert (= (and d!79011 (not c!59996)) b!512848))

(assert (= (and b!512848 res!313421) b!512849))

(assert (= (and b!512849 (not res!313420)) b!512847))

(assert (= (and b!512847 (not res!313422)) b!512854))

(declare-fun m!494553 () Bool)

(assert (=> b!512854 m!494553))

(assert (=> b!512847 m!494553))

(assert (=> b!512849 m!494553))

(declare-fun m!494555 () Bool)

(assert (=> b!512850 m!494555))

(assert (=> b!512850 m!494555))

(assert (=> b!512850 m!494405))

(declare-fun m!494557 () Bool)

(assert (=> b!512850 m!494557))

(declare-fun m!494559 () Bool)

(assert (=> d!79011 m!494559))

(assert (=> d!79011 m!494421))

(assert (=> b!512687 d!79011))

(declare-fun d!79029 () Bool)

(declare-fun res!313424 () Bool)

(declare-fun e!299474 () Bool)

(assert (=> d!79029 (=> res!313424 e!299474)))

(assert (=> d!79029 (= res!313424 (bvsge j!176 (size!16208 a!3235)))))

(assert (=> d!79029 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!299474)))

(declare-fun b!512856 () Bool)

(declare-fun e!299473 () Bool)

(declare-fun call!31524 () Bool)

(assert (=> b!512856 (= e!299473 call!31524)))

(declare-fun b!512857 () Bool)

(declare-fun e!299475 () Bool)

(assert (=> b!512857 (= e!299475 call!31524)))

(declare-fun bm!31521 () Bool)

(assert (=> bm!31521 (= call!31524 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!512858 () Bool)

(assert (=> b!512858 (= e!299474 e!299475)))

(declare-fun c!59997 () Bool)

(assert (=> b!512858 (= c!59997 (validKeyInArray!0 (select (arr!15844 a!3235) j!176)))))

(declare-fun b!512859 () Bool)

(assert (=> b!512859 (= e!299475 e!299473)))

(declare-fun lt!234799 () (_ BitVec 64))

(assert (=> b!512859 (= lt!234799 (select (arr!15844 a!3235) j!176))))

(declare-fun lt!234797 () Unit!15880)

(assert (=> b!512859 (= lt!234797 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!234799 j!176))))

(assert (=> b!512859 (arrayContainsKey!0 a!3235 lt!234799 #b00000000000000000000000000000000)))

(declare-fun lt!234798 () Unit!15880)

(assert (=> b!512859 (= lt!234798 lt!234797)))

(declare-fun res!313423 () Bool)

(assert (=> b!512859 (= res!313423 (= (seekEntryOrOpen!0 (select (arr!15844 a!3235) j!176) a!3235 mask!3524) (Found!4311 j!176)))))

(assert (=> b!512859 (=> (not res!313423) (not e!299473))))

(assert (= (and d!79029 (not res!313424)) b!512858))

(assert (= (and b!512858 c!59997) b!512859))

(assert (= (and b!512858 (not c!59997)) b!512857))

(assert (= (and b!512859 res!313423) b!512856))

(assert (= (or b!512856 b!512857) bm!31521))

(declare-fun m!494561 () Bool)

(assert (=> bm!31521 m!494561))

(assert (=> b!512858 m!494405))

(assert (=> b!512858 m!494405))

(assert (=> b!512858 m!494425))

(assert (=> b!512859 m!494405))

(declare-fun m!494563 () Bool)

(assert (=> b!512859 m!494563))

(declare-fun m!494565 () Bool)

(assert (=> b!512859 m!494565))

(assert (=> b!512859 m!494405))

(assert (=> b!512859 m!494431))

(assert (=> b!512687 d!79029))

(declare-fun d!79031 () Bool)

(declare-fun e!299476 () Bool)

(assert (=> d!79031 e!299476))

(declare-fun c!60000 () Bool)

(declare-fun lt!234800 () SeekEntryResult!4311)

(assert (=> d!79031 (= c!60000 (and ((_ is Intermediate!4311) lt!234800) (undefined!5123 lt!234800)))))

(declare-fun e!299477 () SeekEntryResult!4311)

(assert (=> d!79031 (= lt!234800 e!299477)))

(declare-fun c!59998 () Bool)

(assert (=> d!79031 (= c!59998 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!234801 () (_ BitVec 64))

(assert (=> d!79031 (= lt!234801 (select (arr!15844 (array!32935 (store (arr!15844 a!3235) i!1204 k0!2280) (size!16208 a!3235))) lt!234727))))

(assert (=> d!79031 (validMask!0 mask!3524)))

(assert (=> d!79031 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234727 (select (store (arr!15844 a!3235) i!1204 k0!2280) j!176) (array!32935 (store (arr!15844 a!3235) i!1204 k0!2280) (size!16208 a!3235)) mask!3524) lt!234800)))

(declare-fun b!512860 () Bool)

(assert (=> b!512860 (and (bvsge (index!19434 lt!234800) #b00000000000000000000000000000000) (bvslt (index!19434 lt!234800) (size!16208 (array!32935 (store (arr!15844 a!3235) i!1204 k0!2280) (size!16208 a!3235)))))))

(declare-fun res!313427 () Bool)

(assert (=> b!512860 (= res!313427 (= (select (arr!15844 (array!32935 (store (arr!15844 a!3235) i!1204 k0!2280) (size!16208 a!3235))) (index!19434 lt!234800)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!299478 () Bool)

(assert (=> b!512860 (=> res!313427 e!299478)))

(declare-fun b!512861 () Bool)

(declare-fun e!299479 () Bool)

(assert (=> b!512861 (= e!299476 e!299479)))

(declare-fun res!313426 () Bool)

(assert (=> b!512861 (= res!313426 (and ((_ is Intermediate!4311) lt!234800) (not (undefined!5123 lt!234800)) (bvslt (x!48374 lt!234800) #b01111111111111111111111111111110) (bvsge (x!48374 lt!234800) #b00000000000000000000000000000000) (bvsge (x!48374 lt!234800) #b00000000000000000000000000000000)))))

(assert (=> b!512861 (=> (not res!313426) (not e!299479))))

(declare-fun b!512862 () Bool)

(assert (=> b!512862 (and (bvsge (index!19434 lt!234800) #b00000000000000000000000000000000) (bvslt (index!19434 lt!234800) (size!16208 (array!32935 (store (arr!15844 a!3235) i!1204 k0!2280) (size!16208 a!3235)))))))

(declare-fun res!313425 () Bool)

(assert (=> b!512862 (= res!313425 (= (select (arr!15844 (array!32935 (store (arr!15844 a!3235) i!1204 k0!2280) (size!16208 a!3235))) (index!19434 lt!234800)) (select (store (arr!15844 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!512862 (=> res!313425 e!299478)))

(assert (=> b!512862 (= e!299479 e!299478)))

(declare-fun b!512863 () Bool)

(declare-fun e!299480 () SeekEntryResult!4311)

(assert (=> b!512863 (= e!299480 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!234727 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15844 a!3235) i!1204 k0!2280) j!176) (array!32935 (store (arr!15844 a!3235) i!1204 k0!2280) (size!16208 a!3235)) mask!3524))))

(declare-fun b!512864 () Bool)

(assert (=> b!512864 (= e!299477 (Intermediate!4311 true lt!234727 #b00000000000000000000000000000000))))

(declare-fun b!512865 () Bool)

(assert (=> b!512865 (= e!299476 (bvsge (x!48374 lt!234800) #b01111111111111111111111111111110))))

(declare-fun b!512866 () Bool)

(assert (=> b!512866 (= e!299480 (Intermediate!4311 false lt!234727 #b00000000000000000000000000000000))))

(declare-fun b!512867 () Bool)

(assert (=> b!512867 (and (bvsge (index!19434 lt!234800) #b00000000000000000000000000000000) (bvslt (index!19434 lt!234800) (size!16208 (array!32935 (store (arr!15844 a!3235) i!1204 k0!2280) (size!16208 a!3235)))))))

(assert (=> b!512867 (= e!299478 (= (select (arr!15844 (array!32935 (store (arr!15844 a!3235) i!1204 k0!2280) (size!16208 a!3235))) (index!19434 lt!234800)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!512868 () Bool)

(assert (=> b!512868 (= e!299477 e!299480)))

(declare-fun c!59999 () Bool)

(assert (=> b!512868 (= c!59999 (or (= lt!234801 (select (store (arr!15844 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!234801 lt!234801) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!79031 c!59998) b!512864))

(assert (= (and d!79031 (not c!59998)) b!512868))

(assert (= (and b!512868 c!59999) b!512866))

(assert (= (and b!512868 (not c!59999)) b!512863))

(assert (= (and d!79031 c!60000) b!512865))

(assert (= (and d!79031 (not c!60000)) b!512861))

(assert (= (and b!512861 res!313426) b!512862))

(assert (= (and b!512862 (not res!313425)) b!512860))

(assert (= (and b!512860 (not res!313427)) b!512867))

(declare-fun m!494567 () Bool)

(assert (=> b!512867 m!494567))

(assert (=> b!512860 m!494567))

(assert (=> b!512862 m!494567))

(declare-fun m!494569 () Bool)

(assert (=> b!512863 m!494569))

(assert (=> b!512863 m!494569))

(assert (=> b!512863 m!494403))

(declare-fun m!494571 () Bool)

(assert (=> b!512863 m!494571))

(declare-fun m!494573 () Bool)

(assert (=> d!79031 m!494573))

(assert (=> d!79031 m!494421))

(assert (=> b!512687 d!79031))

(declare-fun d!79033 () Bool)

(assert (=> d!79033 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!234804 () Unit!15880)

(declare-fun choose!38 (array!32934 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15880)

(assert (=> d!79033 (= lt!234804 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79033 (validMask!0 mask!3524)))

(assert (=> d!79033 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!234804)))

(declare-fun bs!16240 () Bool)

(assert (= bs!16240 d!79033))

(assert (=> bs!16240 m!494411))

(declare-fun m!494577 () Bool)

(assert (=> bs!16240 m!494577))

(assert (=> bs!16240 m!494421))

(assert (=> b!512687 d!79033))

(declare-fun d!79041 () Bool)

(declare-fun lt!234806 () (_ BitVec 32))

(declare-fun lt!234805 () (_ BitVec 32))

(assert (=> d!79041 (= lt!234806 (bvmul (bvxor lt!234805 (bvlshr lt!234805 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79041 (= lt!234805 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15844 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15844 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79041 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313404 (let ((h!10880 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15844 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15844 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48376 (bvmul (bvxor h!10880 (bvlshr h!10880 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48376 (bvlshr x!48376 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313404 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313404 #b00000000000000000000000000000000))))))

(assert (=> d!79041 (= (toIndex!0 (select (store (arr!15844 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!234806 (bvlshr lt!234806 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!512687 d!79041))

(declare-fun d!79043 () Bool)

(assert (=> d!79043 (= (validKeyInArray!0 (select (arr!15844 a!3235) j!176)) (and (not (= (select (arr!15844 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15844 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!512688 d!79043))

(declare-fun lt!234809 () SeekEntryResult!4311)

(declare-fun b!512875 () Bool)

(declare-fun e!299489 () SeekEntryResult!4311)

(assert (=> b!512875 (= e!299489 (seekKeyOrZeroReturnVacant!0 (x!48374 lt!234809) (index!19434 lt!234809) (index!19434 lt!234809) (select (arr!15844 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!512876 () Bool)

(declare-fun e!299488 () SeekEntryResult!4311)

(assert (=> b!512876 (= e!299488 Undefined!4311)))

(declare-fun b!512877 () Bool)

(declare-fun e!299487 () SeekEntryResult!4311)

(assert (=> b!512877 (= e!299487 (Found!4311 (index!19434 lt!234809)))))

(declare-fun b!512878 () Bool)

(declare-fun c!60001 () Bool)

(declare-fun lt!234807 () (_ BitVec 64))

(assert (=> b!512878 (= c!60001 (= lt!234807 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!512878 (= e!299487 e!299489)))

(declare-fun b!512879 () Bool)

(assert (=> b!512879 (= e!299488 e!299487)))

(assert (=> b!512879 (= lt!234807 (select (arr!15844 a!3235) (index!19434 lt!234809)))))

(declare-fun c!60002 () Bool)

(assert (=> b!512879 (= c!60002 (= lt!234807 (select (arr!15844 a!3235) j!176)))))

(declare-fun d!79045 () Bool)

(declare-fun lt!234808 () SeekEntryResult!4311)

(assert (=> d!79045 (and (or ((_ is Undefined!4311) lt!234808) (not ((_ is Found!4311) lt!234808)) (and (bvsge (index!19433 lt!234808) #b00000000000000000000000000000000) (bvslt (index!19433 lt!234808) (size!16208 a!3235)))) (or ((_ is Undefined!4311) lt!234808) ((_ is Found!4311) lt!234808) (not ((_ is MissingZero!4311) lt!234808)) (and (bvsge (index!19432 lt!234808) #b00000000000000000000000000000000) (bvslt (index!19432 lt!234808) (size!16208 a!3235)))) (or ((_ is Undefined!4311) lt!234808) ((_ is Found!4311) lt!234808) ((_ is MissingZero!4311) lt!234808) (not ((_ is MissingVacant!4311) lt!234808)) (and (bvsge (index!19435 lt!234808) #b00000000000000000000000000000000) (bvslt (index!19435 lt!234808) (size!16208 a!3235)))) (or ((_ is Undefined!4311) lt!234808) (ite ((_ is Found!4311) lt!234808) (= (select (arr!15844 a!3235) (index!19433 lt!234808)) (select (arr!15844 a!3235) j!176)) (ite ((_ is MissingZero!4311) lt!234808) (= (select (arr!15844 a!3235) (index!19432 lt!234808)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4311) lt!234808) (= (select (arr!15844 a!3235) (index!19435 lt!234808)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79045 (= lt!234808 e!299488)))

(declare-fun c!60003 () Bool)

(assert (=> d!79045 (= c!60003 (and ((_ is Intermediate!4311) lt!234809) (undefined!5123 lt!234809)))))

(assert (=> d!79045 (= lt!234809 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15844 a!3235) j!176) mask!3524) (select (arr!15844 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79045 (validMask!0 mask!3524)))

(assert (=> d!79045 (= (seekEntryOrOpen!0 (select (arr!15844 a!3235) j!176) a!3235 mask!3524) lt!234808)))

(declare-fun b!512880 () Bool)

(assert (=> b!512880 (= e!299489 (MissingZero!4311 (index!19434 lt!234809)))))

(assert (= (and d!79045 c!60003) b!512876))

(assert (= (and d!79045 (not c!60003)) b!512879))

(assert (= (and b!512879 c!60002) b!512877))

(assert (= (and b!512879 (not c!60002)) b!512878))

(assert (= (and b!512878 c!60001) b!512880))

(assert (= (and b!512878 (not c!60001)) b!512875))

(assert (=> b!512875 m!494405))

(declare-fun m!494579 () Bool)

(assert (=> b!512875 m!494579))

(declare-fun m!494581 () Bool)

(assert (=> b!512879 m!494581))

(declare-fun m!494583 () Bool)

(assert (=> d!79045 m!494583))

(assert (=> d!79045 m!494405))

(assert (=> d!79045 m!494407))

(assert (=> d!79045 m!494421))

(declare-fun m!494585 () Bool)

(assert (=> d!79045 m!494585))

(declare-fun m!494587 () Bool)

(assert (=> d!79045 m!494587))

(assert (=> d!79045 m!494407))

(assert (=> d!79045 m!494405))

(declare-fun m!494589 () Bool)

(assert (=> d!79045 m!494589))

(assert (=> b!512689 d!79045))

(declare-fun d!79047 () Bool)

(assert (=> d!79047 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!512684 d!79047))

(declare-fun d!79049 () Bool)

(declare-fun res!313439 () Bool)

(declare-fun e!299494 () Bool)

(assert (=> d!79049 (=> res!313439 e!299494)))

(assert (=> d!79049 (= res!313439 (= (select (arr!15844 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79049 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!299494)))

(declare-fun b!512885 () Bool)

(declare-fun e!299495 () Bool)

(assert (=> b!512885 (= e!299494 e!299495)))

(declare-fun res!313440 () Bool)

(assert (=> b!512885 (=> (not res!313440) (not e!299495))))

(assert (=> b!512885 (= res!313440 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16208 a!3235)))))

(declare-fun b!512886 () Bool)

(assert (=> b!512886 (= e!299495 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79049 (not res!313439)) b!512885))

(assert (= (and b!512885 res!313440) b!512886))

(assert (=> d!79049 m!494471))

(declare-fun m!494591 () Bool)

(assert (=> b!512886 m!494591))

(assert (=> b!512685 d!79049))

(declare-fun b!512915 () Bool)

(declare-fun e!299517 () Bool)

(declare-fun call!31527 () Bool)

(assert (=> b!512915 (= e!299517 call!31527)))

(declare-fun b!512916 () Bool)

(assert (=> b!512916 (= e!299517 call!31527)))

(declare-fun bm!31524 () Bool)

(declare-fun c!60012 () Bool)

(assert (=> bm!31524 (= call!31527 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60012 (Cons!9998 (select (arr!15844 a!3235) #b00000000000000000000000000000000) Nil!9999) Nil!9999)))))

(declare-fun b!512917 () Bool)

(declare-fun e!299515 () Bool)

(assert (=> b!512917 (= e!299515 e!299517)))

(assert (=> b!512917 (= c!60012 (validKeyInArray!0 (select (arr!15844 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!512919 () Bool)

(declare-fun e!299514 () Bool)

(declare-fun contains!2727 (List!10002 (_ BitVec 64)) Bool)

(assert (=> b!512919 (= e!299514 (contains!2727 Nil!9999 (select (arr!15844 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!512918 () Bool)

(declare-fun e!299516 () Bool)

(assert (=> b!512918 (= e!299516 e!299515)))

(declare-fun res!313454 () Bool)

(assert (=> b!512918 (=> (not res!313454) (not e!299515))))

(assert (=> b!512918 (= res!313454 (not e!299514))))

(declare-fun res!313453 () Bool)

(assert (=> b!512918 (=> (not res!313453) (not e!299514))))

(assert (=> b!512918 (= res!313453 (validKeyInArray!0 (select (arr!15844 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79053 () Bool)

(declare-fun res!313455 () Bool)

(assert (=> d!79053 (=> res!313455 e!299516)))

(assert (=> d!79053 (= res!313455 (bvsge #b00000000000000000000000000000000 (size!16208 a!3235)))))

(assert (=> d!79053 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9999) e!299516)))

(assert (= (and d!79053 (not res!313455)) b!512918))

(assert (= (and b!512918 res!313453) b!512919))

(assert (= (and b!512918 res!313454) b!512917))

(assert (= (and b!512917 c!60012) b!512916))

(assert (= (and b!512917 (not c!60012)) b!512915))

(assert (= (or b!512916 b!512915) bm!31524))

(assert (=> bm!31524 m!494471))

(declare-fun m!494593 () Bool)

(assert (=> bm!31524 m!494593))

(assert (=> b!512917 m!494471))

(assert (=> b!512917 m!494471))

(assert (=> b!512917 m!494473))

(assert (=> b!512919 m!494471))

(assert (=> b!512919 m!494471))

(declare-fun m!494595 () Bool)

(assert (=> b!512919 m!494595))

(assert (=> b!512918 m!494471))

(assert (=> b!512918 m!494471))

(assert (=> b!512918 m!494473))

(assert (=> b!512690 d!79053))

(check-sat (not d!79011) (not d!79031) (not b!512859) (not b!512863) (not d!78995) (not b!512731) (not b!512919) (not bm!31524) (not b!512918) (not b!512732) (not d!79045) (not b!512875) (not b!512766) (not d!79033) (not b!512917) (not bm!31514) (not b!512858) (not b!512850) (not b!512886) (not bm!31521))
(check-sat)
