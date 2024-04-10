; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47300 () Bool)

(assert start!47300)

(declare-fun b!520327 () Bool)

(declare-fun res!318443 () Bool)

(declare-fun e!303618 () Bool)

(assert (=> b!520327 (=> (not res!318443) (not e!303618))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!520327 (= res!318443 (validKeyInArray!0 k0!2280))))

(declare-fun res!318445 () Bool)

(assert (=> start!47300 (=> (not res!318445) (not e!303618))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47300 (= res!318445 (validMask!0 mask!3524))))

(assert (=> start!47300 e!303618))

(assert (=> start!47300 true))

(declare-datatypes ((array!33189 0))(
  ( (array!33190 (arr!15952 (Array (_ BitVec 32) (_ BitVec 64))) (size!16316 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33189)

(declare-fun array_inv!11748 (array!33189) Bool)

(assert (=> start!47300 (array_inv!11748 a!3235)))

(declare-fun b!520328 () Bool)

(declare-datatypes ((Unit!16128 0))(
  ( (Unit!16129) )
))
(declare-fun e!303617 () Unit!16128)

(declare-fun Unit!16130 () Unit!16128)

(assert (=> b!520328 (= e!303617 Unit!16130)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4419 0))(
  ( (MissingZero!4419 (index!19876 (_ BitVec 32))) (Found!4419 (index!19877 (_ BitVec 32))) (Intermediate!4419 (undefined!5231 Bool) (index!19878 (_ BitVec 32)) (x!48860 (_ BitVec 32))) (Undefined!4419) (MissingVacant!4419 (index!19879 (_ BitVec 32))) )
))
(declare-fun lt!238317 () SeekEntryResult!4419)

(declare-fun lt!238315 () (_ BitVec 32))

(declare-fun lt!238310 () Unit!16128)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33189 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16128)

(assert (=> b!520328 (= lt!238310 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238315 #b00000000000000000000000000000000 (index!19878 lt!238317) (x!48860 lt!238317) mask!3524))))

(declare-fun lt!238318 () array!33189)

(declare-fun lt!238312 () (_ BitVec 64))

(declare-fun res!318447 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33189 (_ BitVec 32)) SeekEntryResult!4419)

(assert (=> b!520328 (= res!318447 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238315 lt!238312 lt!238318 mask!3524) (Intermediate!4419 false (index!19878 lt!238317) (x!48860 lt!238317))))))

(declare-fun e!303612 () Bool)

(assert (=> b!520328 (=> (not res!318447) (not e!303612))))

(assert (=> b!520328 e!303612))

(declare-fun b!520329 () Bool)

(declare-fun e!303615 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33189 (_ BitVec 32)) SeekEntryResult!4419)

(assert (=> b!520329 (= e!303615 (= (seekEntryOrOpen!0 (select (arr!15952 a!3235) j!176) a!3235 mask!3524) (Found!4419 j!176)))))

(declare-fun b!520330 () Bool)

(assert (=> b!520330 (= e!303612 false)))

(declare-fun b!520331 () Bool)

(declare-fun res!318442 () Bool)

(assert (=> b!520331 (=> (not res!318442) (not e!303618))))

(assert (=> b!520331 (= res!318442 (and (= (size!16316 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16316 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16316 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!520332 () Bool)

(declare-fun res!318446 () Bool)

(assert (=> b!520332 (=> (not res!318446) (not e!303618))))

(assert (=> b!520332 (= res!318446 (validKeyInArray!0 (select (arr!15952 a!3235) j!176)))))

(declare-fun b!520333 () Bool)

(declare-fun res!318439 () Bool)

(declare-fun e!303614 () Bool)

(assert (=> b!520333 (=> (not res!318439) (not e!303614))))

(declare-datatypes ((List!10110 0))(
  ( (Nil!10107) (Cons!10106 (h!11025 (_ BitVec 64)) (t!16338 List!10110)) )
))
(declare-fun arrayNoDuplicates!0 (array!33189 (_ BitVec 32) List!10110) Bool)

(assert (=> b!520333 (= res!318439 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10107))))

(declare-fun b!520334 () Bool)

(declare-fun e!303613 () Bool)

(assert (=> b!520334 (= e!303614 (not e!303613))))

(declare-fun res!318438 () Bool)

(assert (=> b!520334 (=> res!318438 e!303613)))

(declare-fun lt!238316 () (_ BitVec 32))

(assert (=> b!520334 (= res!318438 (= lt!238317 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238316 lt!238312 lt!238318 mask!3524)))))

(assert (=> b!520334 (= lt!238317 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238315 (select (arr!15952 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520334 (= lt!238316 (toIndex!0 lt!238312 mask!3524))))

(assert (=> b!520334 (= lt!238312 (select (store (arr!15952 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!520334 (= lt!238315 (toIndex!0 (select (arr!15952 a!3235) j!176) mask!3524))))

(assert (=> b!520334 (= lt!238318 (array!33190 (store (arr!15952 a!3235) i!1204 k0!2280) (size!16316 a!3235)))))

(assert (=> b!520334 e!303615))

(declare-fun res!318449 () Bool)

(assert (=> b!520334 (=> (not res!318449) (not e!303615))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33189 (_ BitVec 32)) Bool)

(assert (=> b!520334 (= res!318449 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238314 () Unit!16128)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33189 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16128)

(assert (=> b!520334 (= lt!238314 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!520335 () Bool)

(assert (=> b!520335 (= e!303618 e!303614)))

(declare-fun res!318440 () Bool)

(assert (=> b!520335 (=> (not res!318440) (not e!303614))))

(declare-fun lt!238313 () SeekEntryResult!4419)

(assert (=> b!520335 (= res!318440 (or (= lt!238313 (MissingZero!4419 i!1204)) (= lt!238313 (MissingVacant!4419 i!1204))))))

(assert (=> b!520335 (= lt!238313 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!520336 () Bool)

(assert (=> b!520336 (= e!303613 (and (bvsge (index!19878 lt!238317) #b00000000000000000000000000000000) (bvslt (index!19878 lt!238317) (size!16316 a!3235))))))

(assert (=> b!520336 (and (or (= (select (arr!15952 a!3235) (index!19878 lt!238317)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15952 a!3235) (index!19878 lt!238317)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15952 a!3235) (index!19878 lt!238317)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!238311 () Unit!16128)

(assert (=> b!520336 (= lt!238311 e!303617)))

(declare-fun c!61244 () Bool)

(assert (=> b!520336 (= c!61244 (= (select (arr!15952 a!3235) (index!19878 lt!238317)) (select (arr!15952 a!3235) j!176)))))

(assert (=> b!520336 (and (bvslt (x!48860 lt!238317) #b01111111111111111111111111111110) (or (= (select (arr!15952 a!3235) (index!19878 lt!238317)) (select (arr!15952 a!3235) j!176)) (= (select (arr!15952 a!3235) (index!19878 lt!238317)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15952 a!3235) (index!19878 lt!238317)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520337 () Bool)

(declare-fun res!318448 () Bool)

(assert (=> b!520337 (=> (not res!318448) (not e!303618))))

(declare-fun arrayContainsKey!0 (array!33189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!520337 (= res!318448 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!520338 () Bool)

(declare-fun res!318441 () Bool)

(assert (=> b!520338 (=> (not res!318441) (not e!303614))))

(assert (=> b!520338 (= res!318441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!520339 () Bool)

(declare-fun Unit!16131 () Unit!16128)

(assert (=> b!520339 (= e!303617 Unit!16131)))

(declare-fun b!520340 () Bool)

(declare-fun res!318444 () Bool)

(assert (=> b!520340 (=> res!318444 e!303613)))

(get-info :version)

(assert (=> b!520340 (= res!318444 (or (undefined!5231 lt!238317) (not ((_ is Intermediate!4419) lt!238317))))))

(assert (= (and start!47300 res!318445) b!520331))

(assert (= (and b!520331 res!318442) b!520332))

(assert (= (and b!520332 res!318446) b!520327))

(assert (= (and b!520327 res!318443) b!520337))

(assert (= (and b!520337 res!318448) b!520335))

(assert (= (and b!520335 res!318440) b!520338))

(assert (= (and b!520338 res!318441) b!520333))

(assert (= (and b!520333 res!318439) b!520334))

(assert (= (and b!520334 res!318449) b!520329))

(assert (= (and b!520334 (not res!318438)) b!520340))

(assert (= (and b!520340 (not res!318444)) b!520336))

(assert (= (and b!520336 c!61244) b!520328))

(assert (= (and b!520336 (not c!61244)) b!520339))

(assert (= (and b!520328 res!318447) b!520330))

(declare-fun m!501333 () Bool)

(assert (=> b!520328 m!501333))

(declare-fun m!501335 () Bool)

(assert (=> b!520328 m!501335))

(declare-fun m!501337 () Bool)

(assert (=> b!520334 m!501337))

(declare-fun m!501339 () Bool)

(assert (=> b!520334 m!501339))

(declare-fun m!501341 () Bool)

(assert (=> b!520334 m!501341))

(declare-fun m!501343 () Bool)

(assert (=> b!520334 m!501343))

(assert (=> b!520334 m!501339))

(declare-fun m!501345 () Bool)

(assert (=> b!520334 m!501345))

(declare-fun m!501347 () Bool)

(assert (=> b!520334 m!501347))

(declare-fun m!501349 () Bool)

(assert (=> b!520334 m!501349))

(declare-fun m!501351 () Bool)

(assert (=> b!520334 m!501351))

(assert (=> b!520334 m!501339))

(declare-fun m!501353 () Bool)

(assert (=> b!520334 m!501353))

(declare-fun m!501355 () Bool)

(assert (=> b!520333 m!501355))

(declare-fun m!501357 () Bool)

(assert (=> start!47300 m!501357))

(declare-fun m!501359 () Bool)

(assert (=> start!47300 m!501359))

(assert (=> b!520332 m!501339))

(assert (=> b!520332 m!501339))

(declare-fun m!501361 () Bool)

(assert (=> b!520332 m!501361))

(declare-fun m!501363 () Bool)

(assert (=> b!520335 m!501363))

(declare-fun m!501365 () Bool)

(assert (=> b!520336 m!501365))

(assert (=> b!520336 m!501339))

(declare-fun m!501367 () Bool)

(assert (=> b!520337 m!501367))

(declare-fun m!501369 () Bool)

(assert (=> b!520327 m!501369))

(declare-fun m!501371 () Bool)

(assert (=> b!520338 m!501371))

(assert (=> b!520329 m!501339))

(assert (=> b!520329 m!501339))

(declare-fun m!501373 () Bool)

(assert (=> b!520329 m!501373))

(check-sat (not b!520328) (not b!520329) (not b!520333) (not b!520327) (not b!520334) (not b!520338) (not b!520335) (not start!47300) (not b!520332) (not b!520337))
(check-sat)
(get-model)

(declare-fun d!80279 () Bool)

(assert (=> d!80279 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47300 d!80279))

(declare-fun d!80281 () Bool)

(assert (=> d!80281 (= (array_inv!11748 a!3235) (bvsge (size!16316 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47300 d!80281))

(declare-fun d!80283 () Bool)

(declare-fun lt!238351 () (_ BitVec 32))

(declare-fun lt!238350 () (_ BitVec 32))

(assert (=> d!80283 (= lt!238351 (bvmul (bvxor lt!238350 (bvlshr lt!238350 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80283 (= lt!238350 ((_ extract 31 0) (bvand (bvxor (select (arr!15952 a!3235) j!176) (bvlshr (select (arr!15952 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80283 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!318486 (let ((h!11027 ((_ extract 31 0) (bvand (bvxor (select (arr!15952 a!3235) j!176) (bvlshr (select (arr!15952 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48862 (bvmul (bvxor h!11027 (bvlshr h!11027 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48862 (bvlshr x!48862 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!318486 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!318486 #b00000000000000000000000000000000))))))

(assert (=> d!80283 (= (toIndex!0 (select (arr!15952 a!3235) j!176) mask!3524) (bvand (bvxor lt!238351 (bvlshr lt!238351 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!520334 d!80283))

(declare-fun d!80285 () Bool)

(declare-fun lt!238353 () (_ BitVec 32))

(declare-fun lt!238352 () (_ BitVec 32))

(assert (=> d!80285 (= lt!238353 (bvmul (bvxor lt!238352 (bvlshr lt!238352 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80285 (= lt!238352 ((_ extract 31 0) (bvand (bvxor lt!238312 (bvlshr lt!238312 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80285 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!318486 (let ((h!11027 ((_ extract 31 0) (bvand (bvxor lt!238312 (bvlshr lt!238312 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48862 (bvmul (bvxor h!11027 (bvlshr h!11027 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48862 (bvlshr x!48862 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!318486 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!318486 #b00000000000000000000000000000000))))))

(assert (=> d!80285 (= (toIndex!0 lt!238312 mask!3524) (bvand (bvxor lt!238353 (bvlshr lt!238353 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!520334 d!80285))

(declare-fun b!520391 () Bool)

(declare-fun e!303646 () Bool)

(declare-fun call!31790 () Bool)

(assert (=> b!520391 (= e!303646 call!31790)))

(declare-fun b!520392 () Bool)

(declare-fun e!303648 () Bool)

(assert (=> b!520392 (= e!303648 e!303646)))

(declare-fun lt!238360 () (_ BitVec 64))

(assert (=> b!520392 (= lt!238360 (select (arr!15952 a!3235) j!176))))

(declare-fun lt!238361 () Unit!16128)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33189 (_ BitVec 64) (_ BitVec 32)) Unit!16128)

(assert (=> b!520392 (= lt!238361 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!238360 j!176))))

(assert (=> b!520392 (arrayContainsKey!0 a!3235 lt!238360 #b00000000000000000000000000000000)))

(declare-fun lt!238362 () Unit!16128)

(assert (=> b!520392 (= lt!238362 lt!238361)))

(declare-fun res!318491 () Bool)

(assert (=> b!520392 (= res!318491 (= (seekEntryOrOpen!0 (select (arr!15952 a!3235) j!176) a!3235 mask!3524) (Found!4419 j!176)))))

(assert (=> b!520392 (=> (not res!318491) (not e!303646))))

(declare-fun b!520393 () Bool)

(declare-fun e!303647 () Bool)

(assert (=> b!520393 (= e!303647 e!303648)))

(declare-fun c!61250 () Bool)

(assert (=> b!520393 (= c!61250 (validKeyInArray!0 (select (arr!15952 a!3235) j!176)))))

(declare-fun d!80287 () Bool)

(declare-fun res!318492 () Bool)

(assert (=> d!80287 (=> res!318492 e!303647)))

(assert (=> d!80287 (= res!318492 (bvsge j!176 (size!16316 a!3235)))))

(assert (=> d!80287 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!303647)))

(declare-fun bm!31787 () Bool)

(assert (=> bm!31787 (= call!31790 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!520394 () Bool)

(assert (=> b!520394 (= e!303648 call!31790)))

(assert (= (and d!80287 (not res!318492)) b!520393))

(assert (= (and b!520393 c!61250) b!520392))

(assert (= (and b!520393 (not c!61250)) b!520394))

(assert (= (and b!520392 res!318491) b!520391))

(assert (= (or b!520391 b!520394) bm!31787))

(assert (=> b!520392 m!501339))

(declare-fun m!501417 () Bool)

(assert (=> b!520392 m!501417))

(declare-fun m!501419 () Bool)

(assert (=> b!520392 m!501419))

(assert (=> b!520392 m!501339))

(assert (=> b!520392 m!501373))

(assert (=> b!520393 m!501339))

(assert (=> b!520393 m!501339))

(assert (=> b!520393 m!501361))

(declare-fun m!501421 () Bool)

(assert (=> bm!31787 m!501421))

(assert (=> b!520334 d!80287))

(declare-fun b!520428 () Bool)

(declare-fun e!303673 () SeekEntryResult!4419)

(assert (=> b!520428 (= e!303673 (Intermediate!4419 false lt!238316 #b00000000000000000000000000000000))))

(declare-fun b!520429 () Bool)

(declare-fun e!303674 () Bool)

(declare-fun e!303671 () Bool)

(assert (=> b!520429 (= e!303674 e!303671)))

(declare-fun res!318510 () Bool)

(declare-fun lt!238367 () SeekEntryResult!4419)

(assert (=> b!520429 (= res!318510 (and ((_ is Intermediate!4419) lt!238367) (not (undefined!5231 lt!238367)) (bvslt (x!48860 lt!238367) #b01111111111111111111111111111110) (bvsge (x!48860 lt!238367) #b00000000000000000000000000000000) (bvsge (x!48860 lt!238367) #b00000000000000000000000000000000)))))

(assert (=> b!520429 (=> (not res!318510) (not e!303671))))

(declare-fun b!520430 () Bool)

(assert (=> b!520430 (and (bvsge (index!19878 lt!238367) #b00000000000000000000000000000000) (bvslt (index!19878 lt!238367) (size!16316 lt!238318)))))

(declare-fun e!303675 () Bool)

(assert (=> b!520430 (= e!303675 (= (select (arr!15952 lt!238318) (index!19878 lt!238367)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!520431 () Bool)

(assert (=> b!520431 (and (bvsge (index!19878 lt!238367) #b00000000000000000000000000000000) (bvslt (index!19878 lt!238367) (size!16316 lt!238318)))))

(declare-fun res!318509 () Bool)

(assert (=> b!520431 (= res!318509 (= (select (arr!15952 lt!238318) (index!19878 lt!238367)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!520431 (=> res!318509 e!303675)))

(declare-fun b!520432 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520432 (= e!303673 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!238316 #b00000000000000000000000000000000 mask!3524) lt!238312 lt!238318 mask!3524))))

(declare-fun b!520433 () Bool)

(declare-fun e!303672 () SeekEntryResult!4419)

(assert (=> b!520433 (= e!303672 (Intermediate!4419 true lt!238316 #b00000000000000000000000000000000))))

(declare-fun b!520434 () Bool)

(assert (=> b!520434 (and (bvsge (index!19878 lt!238367) #b00000000000000000000000000000000) (bvslt (index!19878 lt!238367) (size!16316 lt!238318)))))

(declare-fun res!318508 () Bool)

(assert (=> b!520434 (= res!318508 (= (select (arr!15952 lt!238318) (index!19878 lt!238367)) lt!238312))))

(assert (=> b!520434 (=> res!318508 e!303675)))

(assert (=> b!520434 (= e!303671 e!303675)))

(declare-fun d!80289 () Bool)

(assert (=> d!80289 e!303674))

(declare-fun c!61261 () Bool)

(assert (=> d!80289 (= c!61261 (and ((_ is Intermediate!4419) lt!238367) (undefined!5231 lt!238367)))))

(assert (=> d!80289 (= lt!238367 e!303672)))

(declare-fun c!61260 () Bool)

(assert (=> d!80289 (= c!61260 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!238368 () (_ BitVec 64))

(assert (=> d!80289 (= lt!238368 (select (arr!15952 lt!238318) lt!238316))))

(assert (=> d!80289 (validMask!0 mask!3524)))

(assert (=> d!80289 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238316 lt!238312 lt!238318 mask!3524) lt!238367)))

(declare-fun b!520435 () Bool)

(assert (=> b!520435 (= e!303672 e!303673)))

(declare-fun c!61262 () Bool)

(assert (=> b!520435 (= c!61262 (or (= lt!238368 lt!238312) (= (bvadd lt!238368 lt!238368) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520436 () Bool)

(assert (=> b!520436 (= e!303674 (bvsge (x!48860 lt!238367) #b01111111111111111111111111111110))))

(assert (= (and d!80289 c!61260) b!520433))

(assert (= (and d!80289 (not c!61260)) b!520435))

(assert (= (and b!520435 c!61262) b!520428))

(assert (= (and b!520435 (not c!61262)) b!520432))

(assert (= (and d!80289 c!61261) b!520436))

(assert (= (and d!80289 (not c!61261)) b!520429))

(assert (= (and b!520429 res!318510) b!520434))

(assert (= (and b!520434 (not res!318508)) b!520431))

(assert (= (and b!520431 (not res!318509)) b!520430))

(declare-fun m!501431 () Bool)

(assert (=> b!520430 m!501431))

(assert (=> b!520434 m!501431))

(declare-fun m!501433 () Bool)

(assert (=> d!80289 m!501433))

(assert (=> d!80289 m!501357))

(assert (=> b!520431 m!501431))

(declare-fun m!501435 () Bool)

(assert (=> b!520432 m!501435))

(assert (=> b!520432 m!501435))

(declare-fun m!501437 () Bool)

(assert (=> b!520432 m!501437))

(assert (=> b!520334 d!80289))

(declare-fun b!520437 () Bool)

(declare-fun e!303678 () SeekEntryResult!4419)

(assert (=> b!520437 (= e!303678 (Intermediate!4419 false lt!238315 #b00000000000000000000000000000000))))

(declare-fun b!520438 () Bool)

(declare-fun e!303679 () Bool)

(declare-fun e!303676 () Bool)

(assert (=> b!520438 (= e!303679 e!303676)))

(declare-fun res!318513 () Bool)

(declare-fun lt!238369 () SeekEntryResult!4419)

(assert (=> b!520438 (= res!318513 (and ((_ is Intermediate!4419) lt!238369) (not (undefined!5231 lt!238369)) (bvslt (x!48860 lt!238369) #b01111111111111111111111111111110) (bvsge (x!48860 lt!238369) #b00000000000000000000000000000000) (bvsge (x!48860 lt!238369) #b00000000000000000000000000000000)))))

(assert (=> b!520438 (=> (not res!318513) (not e!303676))))

(declare-fun b!520439 () Bool)

(assert (=> b!520439 (and (bvsge (index!19878 lt!238369) #b00000000000000000000000000000000) (bvslt (index!19878 lt!238369) (size!16316 a!3235)))))

(declare-fun e!303680 () Bool)

(assert (=> b!520439 (= e!303680 (= (select (arr!15952 a!3235) (index!19878 lt!238369)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!520440 () Bool)

(assert (=> b!520440 (and (bvsge (index!19878 lt!238369) #b00000000000000000000000000000000) (bvslt (index!19878 lt!238369) (size!16316 a!3235)))))

(declare-fun res!318512 () Bool)

(assert (=> b!520440 (= res!318512 (= (select (arr!15952 a!3235) (index!19878 lt!238369)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!520440 (=> res!318512 e!303680)))

(declare-fun b!520441 () Bool)

(assert (=> b!520441 (= e!303678 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!238315 #b00000000000000000000000000000000 mask!3524) (select (arr!15952 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!520442 () Bool)

(declare-fun e!303677 () SeekEntryResult!4419)

(assert (=> b!520442 (= e!303677 (Intermediate!4419 true lt!238315 #b00000000000000000000000000000000))))

(declare-fun b!520443 () Bool)

(assert (=> b!520443 (and (bvsge (index!19878 lt!238369) #b00000000000000000000000000000000) (bvslt (index!19878 lt!238369) (size!16316 a!3235)))))

(declare-fun res!318511 () Bool)

(assert (=> b!520443 (= res!318511 (= (select (arr!15952 a!3235) (index!19878 lt!238369)) (select (arr!15952 a!3235) j!176)))))

(assert (=> b!520443 (=> res!318511 e!303680)))

(assert (=> b!520443 (= e!303676 e!303680)))

(declare-fun d!80301 () Bool)

(assert (=> d!80301 e!303679))

(declare-fun c!61264 () Bool)

(assert (=> d!80301 (= c!61264 (and ((_ is Intermediate!4419) lt!238369) (undefined!5231 lt!238369)))))

(assert (=> d!80301 (= lt!238369 e!303677)))

(declare-fun c!61263 () Bool)

(assert (=> d!80301 (= c!61263 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!238370 () (_ BitVec 64))

(assert (=> d!80301 (= lt!238370 (select (arr!15952 a!3235) lt!238315))))

(assert (=> d!80301 (validMask!0 mask!3524)))

(assert (=> d!80301 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238315 (select (arr!15952 a!3235) j!176) a!3235 mask!3524) lt!238369)))

(declare-fun b!520444 () Bool)

(assert (=> b!520444 (= e!303677 e!303678)))

(declare-fun c!61265 () Bool)

(assert (=> b!520444 (= c!61265 (or (= lt!238370 (select (arr!15952 a!3235) j!176)) (= (bvadd lt!238370 lt!238370) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520445 () Bool)

(assert (=> b!520445 (= e!303679 (bvsge (x!48860 lt!238369) #b01111111111111111111111111111110))))

(assert (= (and d!80301 c!61263) b!520442))

(assert (= (and d!80301 (not c!61263)) b!520444))

(assert (= (and b!520444 c!61265) b!520437))

(assert (= (and b!520444 (not c!61265)) b!520441))

(assert (= (and d!80301 c!61264) b!520445))

(assert (= (and d!80301 (not c!61264)) b!520438))

(assert (= (and b!520438 res!318513) b!520443))

(assert (= (and b!520443 (not res!318511)) b!520440))

(assert (= (and b!520440 (not res!318512)) b!520439))

(declare-fun m!501439 () Bool)

(assert (=> b!520439 m!501439))

(assert (=> b!520443 m!501439))

(declare-fun m!501441 () Bool)

(assert (=> d!80301 m!501441))

(assert (=> d!80301 m!501357))

(assert (=> b!520440 m!501439))

(declare-fun m!501443 () Bool)

(assert (=> b!520441 m!501443))

(assert (=> b!520441 m!501443))

(assert (=> b!520441 m!501339))

(declare-fun m!501445 () Bool)

(assert (=> b!520441 m!501445))

(assert (=> b!520334 d!80301))

(declare-fun d!80303 () Bool)

(assert (=> d!80303 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!238373 () Unit!16128)

(declare-fun choose!38 (array!33189 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16128)

(assert (=> d!80303 (= lt!238373 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80303 (validMask!0 mask!3524)))

(assert (=> d!80303 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!238373)))

(declare-fun bs!16387 () Bool)

(assert (= bs!16387 d!80303))

(assert (=> bs!16387 m!501345))

(declare-fun m!501447 () Bool)

(assert (=> bs!16387 m!501447))

(assert (=> bs!16387 m!501357))

(assert (=> b!520334 d!80303))

(declare-fun bm!31793 () Bool)

(declare-fun call!31796 () Bool)

(declare-fun c!61280 () Bool)

(assert (=> bm!31793 (= call!31796 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61280 (Cons!10106 (select (arr!15952 a!3235) #b00000000000000000000000000000000) Nil!10107) Nil!10107)))))

(declare-fun b!520480 () Bool)

(declare-fun e!303702 () Bool)

(declare-fun contains!2761 (List!10110 (_ BitVec 64)) Bool)

(assert (=> b!520480 (= e!303702 (contains!2761 Nil!10107 (select (arr!15952 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!520481 () Bool)

(declare-fun e!303703 () Bool)

(declare-fun e!303704 () Bool)

(assert (=> b!520481 (= e!303703 e!303704)))

(declare-fun res!318522 () Bool)

(assert (=> b!520481 (=> (not res!318522) (not e!303704))))

(assert (=> b!520481 (= res!318522 (not e!303702))))

(declare-fun res!318520 () Bool)

(assert (=> b!520481 (=> (not res!318520) (not e!303702))))

(assert (=> b!520481 (= res!318520 (validKeyInArray!0 (select (arr!15952 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80305 () Bool)

(declare-fun res!318521 () Bool)

(assert (=> d!80305 (=> res!318521 e!303703)))

(assert (=> d!80305 (= res!318521 (bvsge #b00000000000000000000000000000000 (size!16316 a!3235)))))

(assert (=> d!80305 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10107) e!303703)))

(declare-fun b!520482 () Bool)

(declare-fun e!303701 () Bool)

(assert (=> b!520482 (= e!303701 call!31796)))

(declare-fun b!520483 () Bool)

(assert (=> b!520483 (= e!303704 e!303701)))

(assert (=> b!520483 (= c!61280 (validKeyInArray!0 (select (arr!15952 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!520484 () Bool)

(assert (=> b!520484 (= e!303701 call!31796)))

(assert (= (and d!80305 (not res!318521)) b!520481))

(assert (= (and b!520481 res!318520) b!520480))

(assert (= (and b!520481 res!318522) b!520483))

(assert (= (and b!520483 c!61280) b!520482))

(assert (= (and b!520483 (not c!61280)) b!520484))

(assert (= (or b!520482 b!520484) bm!31793))

(declare-fun m!501449 () Bool)

(assert (=> bm!31793 m!501449))

(declare-fun m!501451 () Bool)

(assert (=> bm!31793 m!501451))

(assert (=> b!520480 m!501449))

(assert (=> b!520480 m!501449))

(declare-fun m!501453 () Bool)

(assert (=> b!520480 m!501453))

(assert (=> b!520481 m!501449))

(assert (=> b!520481 m!501449))

(declare-fun m!501455 () Bool)

(assert (=> b!520481 m!501455))

(assert (=> b!520483 m!501449))

(assert (=> b!520483 m!501449))

(assert (=> b!520483 m!501455))

(assert (=> b!520333 d!80305))

(declare-fun d!80307 () Bool)

(declare-fun e!303722 () Bool)

(assert (=> d!80307 e!303722))

(declare-fun res!318530 () Bool)

(assert (=> d!80307 (=> (not res!318530) (not e!303722))))

(assert (=> d!80307 (= res!318530 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16316 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16316 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16316 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16316 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16316 a!3235))))))

(declare-fun lt!238411 () Unit!16128)

(declare-fun choose!47 (array!33189 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16128)

(assert (=> d!80307 (= lt!238411 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!238315 #b00000000000000000000000000000000 (index!19878 lt!238317) (x!48860 lt!238317) mask!3524))))

(assert (=> d!80307 (validMask!0 mask!3524)))

(assert (=> d!80307 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238315 #b00000000000000000000000000000000 (index!19878 lt!238317) (x!48860 lt!238317) mask!3524) lt!238411)))

(declare-fun b!520513 () Bool)

(assert (=> b!520513 (= e!303722 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238315 (select (store (arr!15952 a!3235) i!1204 k0!2280) j!176) (array!33190 (store (arr!15952 a!3235) i!1204 k0!2280) (size!16316 a!3235)) mask!3524) (Intermediate!4419 false (index!19878 lt!238317) (x!48860 lt!238317))))))

(assert (= (and d!80307 res!318530) b!520513))

(declare-fun m!501495 () Bool)

(assert (=> d!80307 m!501495))

(assert (=> d!80307 m!501357))

(assert (=> b!520513 m!501337))

(assert (=> b!520513 m!501343))

(assert (=> b!520513 m!501343))

(declare-fun m!501497 () Bool)

(assert (=> b!520513 m!501497))

(assert (=> b!520328 d!80307))

(declare-fun b!520514 () Bool)

(declare-fun e!303725 () SeekEntryResult!4419)

(assert (=> b!520514 (= e!303725 (Intermediate!4419 false lt!238315 #b00000000000000000000000000000000))))

(declare-fun b!520515 () Bool)

(declare-fun e!303726 () Bool)

(declare-fun e!303723 () Bool)

(assert (=> b!520515 (= e!303726 e!303723)))

(declare-fun res!318533 () Bool)

(declare-fun lt!238412 () SeekEntryResult!4419)

(assert (=> b!520515 (= res!318533 (and ((_ is Intermediate!4419) lt!238412) (not (undefined!5231 lt!238412)) (bvslt (x!48860 lt!238412) #b01111111111111111111111111111110) (bvsge (x!48860 lt!238412) #b00000000000000000000000000000000) (bvsge (x!48860 lt!238412) #b00000000000000000000000000000000)))))

(assert (=> b!520515 (=> (not res!318533) (not e!303723))))

(declare-fun b!520516 () Bool)

(assert (=> b!520516 (and (bvsge (index!19878 lt!238412) #b00000000000000000000000000000000) (bvslt (index!19878 lt!238412) (size!16316 lt!238318)))))

(declare-fun e!303727 () Bool)

(assert (=> b!520516 (= e!303727 (= (select (arr!15952 lt!238318) (index!19878 lt!238412)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!520517 () Bool)

(assert (=> b!520517 (and (bvsge (index!19878 lt!238412) #b00000000000000000000000000000000) (bvslt (index!19878 lt!238412) (size!16316 lt!238318)))))

(declare-fun res!318532 () Bool)

(assert (=> b!520517 (= res!318532 (= (select (arr!15952 lt!238318) (index!19878 lt!238412)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!520517 (=> res!318532 e!303727)))

(declare-fun b!520518 () Bool)

(assert (=> b!520518 (= e!303725 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!238315 #b00000000000000000000000000000000 mask!3524) lt!238312 lt!238318 mask!3524))))

(declare-fun b!520519 () Bool)

(declare-fun e!303724 () SeekEntryResult!4419)

(assert (=> b!520519 (= e!303724 (Intermediate!4419 true lt!238315 #b00000000000000000000000000000000))))

(declare-fun b!520520 () Bool)

(assert (=> b!520520 (and (bvsge (index!19878 lt!238412) #b00000000000000000000000000000000) (bvslt (index!19878 lt!238412) (size!16316 lt!238318)))))

(declare-fun res!318531 () Bool)

(assert (=> b!520520 (= res!318531 (= (select (arr!15952 lt!238318) (index!19878 lt!238412)) lt!238312))))

(assert (=> b!520520 (=> res!318531 e!303727)))

(assert (=> b!520520 (= e!303723 e!303727)))

(declare-fun d!80319 () Bool)

(assert (=> d!80319 e!303726))

(declare-fun c!61293 () Bool)

(assert (=> d!80319 (= c!61293 (and ((_ is Intermediate!4419) lt!238412) (undefined!5231 lt!238412)))))

(assert (=> d!80319 (= lt!238412 e!303724)))

(declare-fun c!61292 () Bool)

(assert (=> d!80319 (= c!61292 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!238413 () (_ BitVec 64))

(assert (=> d!80319 (= lt!238413 (select (arr!15952 lt!238318) lt!238315))))

(assert (=> d!80319 (validMask!0 mask!3524)))

(assert (=> d!80319 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238315 lt!238312 lt!238318 mask!3524) lt!238412)))

(declare-fun b!520521 () Bool)

(assert (=> b!520521 (= e!303724 e!303725)))

(declare-fun c!61294 () Bool)

(assert (=> b!520521 (= c!61294 (or (= lt!238413 lt!238312) (= (bvadd lt!238413 lt!238413) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520522 () Bool)

(assert (=> b!520522 (= e!303726 (bvsge (x!48860 lt!238412) #b01111111111111111111111111111110))))

(assert (= (and d!80319 c!61292) b!520519))

(assert (= (and d!80319 (not c!61292)) b!520521))

(assert (= (and b!520521 c!61294) b!520514))

(assert (= (and b!520521 (not c!61294)) b!520518))

(assert (= (and d!80319 c!61293) b!520522))

(assert (= (and d!80319 (not c!61293)) b!520515))

(assert (= (and b!520515 res!318533) b!520520))

(assert (= (and b!520520 (not res!318531)) b!520517))

(assert (= (and b!520517 (not res!318532)) b!520516))

(declare-fun m!501499 () Bool)

(assert (=> b!520516 m!501499))

(assert (=> b!520520 m!501499))

(declare-fun m!501501 () Bool)

(assert (=> d!80319 m!501501))

(assert (=> d!80319 m!501357))

(assert (=> b!520517 m!501499))

(assert (=> b!520518 m!501443))

(assert (=> b!520518 m!501443))

(declare-fun m!501503 () Bool)

(assert (=> b!520518 m!501503))

(assert (=> b!520328 d!80319))

(declare-fun b!520589 () Bool)

(declare-fun c!61318 () Bool)

(declare-fun lt!238453 () (_ BitVec 64))

(assert (=> b!520589 (= c!61318 (= lt!238453 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303767 () SeekEntryResult!4419)

(declare-fun e!303769 () SeekEntryResult!4419)

(assert (=> b!520589 (= e!303767 e!303769)))

(declare-fun lt!238452 () SeekEntryResult!4419)

(declare-fun b!520590 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33189 (_ BitVec 32)) SeekEntryResult!4419)

(assert (=> b!520590 (= e!303769 (seekKeyOrZeroReturnVacant!0 (x!48860 lt!238452) (index!19878 lt!238452) (index!19878 lt!238452) k0!2280 a!3235 mask!3524))))

(declare-fun b!520591 () Bool)

(assert (=> b!520591 (= e!303769 (MissingZero!4419 (index!19878 lt!238452)))))

(declare-fun b!520588 () Bool)

(assert (=> b!520588 (= e!303767 (Found!4419 (index!19878 lt!238452)))))

(declare-fun d!80321 () Bool)

(declare-fun lt!238454 () SeekEntryResult!4419)

(assert (=> d!80321 (and (or ((_ is Undefined!4419) lt!238454) (not ((_ is Found!4419) lt!238454)) (and (bvsge (index!19877 lt!238454) #b00000000000000000000000000000000) (bvslt (index!19877 lt!238454) (size!16316 a!3235)))) (or ((_ is Undefined!4419) lt!238454) ((_ is Found!4419) lt!238454) (not ((_ is MissingZero!4419) lt!238454)) (and (bvsge (index!19876 lt!238454) #b00000000000000000000000000000000) (bvslt (index!19876 lt!238454) (size!16316 a!3235)))) (or ((_ is Undefined!4419) lt!238454) ((_ is Found!4419) lt!238454) ((_ is MissingZero!4419) lt!238454) (not ((_ is MissingVacant!4419) lt!238454)) (and (bvsge (index!19879 lt!238454) #b00000000000000000000000000000000) (bvslt (index!19879 lt!238454) (size!16316 a!3235)))) (or ((_ is Undefined!4419) lt!238454) (ite ((_ is Found!4419) lt!238454) (= (select (arr!15952 a!3235) (index!19877 lt!238454)) k0!2280) (ite ((_ is MissingZero!4419) lt!238454) (= (select (arr!15952 a!3235) (index!19876 lt!238454)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4419) lt!238454) (= (select (arr!15952 a!3235) (index!19879 lt!238454)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!303768 () SeekEntryResult!4419)

(assert (=> d!80321 (= lt!238454 e!303768)))

(declare-fun c!61319 () Bool)

(assert (=> d!80321 (= c!61319 (and ((_ is Intermediate!4419) lt!238452) (undefined!5231 lt!238452)))))

(assert (=> d!80321 (= lt!238452 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!80321 (validMask!0 mask!3524)))

(assert (=> d!80321 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!238454)))

(declare-fun b!520592 () Bool)

(assert (=> b!520592 (= e!303768 Undefined!4419)))

(declare-fun b!520593 () Bool)

(assert (=> b!520593 (= e!303768 e!303767)))

(assert (=> b!520593 (= lt!238453 (select (arr!15952 a!3235) (index!19878 lt!238452)))))

(declare-fun c!61320 () Bool)

(assert (=> b!520593 (= c!61320 (= lt!238453 k0!2280))))

(assert (= (and d!80321 c!61319) b!520592))

(assert (= (and d!80321 (not c!61319)) b!520593))

(assert (= (and b!520593 c!61320) b!520588))

(assert (= (and b!520593 (not c!61320)) b!520589))

(assert (= (and b!520589 c!61318) b!520591))

(assert (= (and b!520589 (not c!61318)) b!520590))

(declare-fun m!501547 () Bool)

(assert (=> b!520590 m!501547))

(declare-fun m!501549 () Bool)

(assert (=> d!80321 m!501549))

(declare-fun m!501551 () Bool)

(assert (=> d!80321 m!501551))

(declare-fun m!501553 () Bool)

(assert (=> d!80321 m!501553))

(assert (=> d!80321 m!501357))

(declare-fun m!501555 () Bool)

(assert (=> d!80321 m!501555))

(assert (=> d!80321 m!501549))

(declare-fun m!501557 () Bool)

(assert (=> d!80321 m!501557))

(declare-fun m!501559 () Bool)

(assert (=> b!520593 m!501559))

(assert (=> b!520335 d!80321))

(declare-fun b!520595 () Bool)

(declare-fun c!61321 () Bool)

(declare-fun lt!238456 () (_ BitVec 64))

(assert (=> b!520595 (= c!61321 (= lt!238456 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303770 () SeekEntryResult!4419)

(declare-fun e!303772 () SeekEntryResult!4419)

(assert (=> b!520595 (= e!303770 e!303772)))

(declare-fun lt!238455 () SeekEntryResult!4419)

(declare-fun b!520596 () Bool)

(assert (=> b!520596 (= e!303772 (seekKeyOrZeroReturnVacant!0 (x!48860 lt!238455) (index!19878 lt!238455) (index!19878 lt!238455) (select (arr!15952 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!520597 () Bool)

(assert (=> b!520597 (= e!303772 (MissingZero!4419 (index!19878 lt!238455)))))

(declare-fun b!520594 () Bool)

(assert (=> b!520594 (= e!303770 (Found!4419 (index!19878 lt!238455)))))

(declare-fun d!80337 () Bool)

(declare-fun lt!238457 () SeekEntryResult!4419)

(assert (=> d!80337 (and (or ((_ is Undefined!4419) lt!238457) (not ((_ is Found!4419) lt!238457)) (and (bvsge (index!19877 lt!238457) #b00000000000000000000000000000000) (bvslt (index!19877 lt!238457) (size!16316 a!3235)))) (or ((_ is Undefined!4419) lt!238457) ((_ is Found!4419) lt!238457) (not ((_ is MissingZero!4419) lt!238457)) (and (bvsge (index!19876 lt!238457) #b00000000000000000000000000000000) (bvslt (index!19876 lt!238457) (size!16316 a!3235)))) (or ((_ is Undefined!4419) lt!238457) ((_ is Found!4419) lt!238457) ((_ is MissingZero!4419) lt!238457) (not ((_ is MissingVacant!4419) lt!238457)) (and (bvsge (index!19879 lt!238457) #b00000000000000000000000000000000) (bvslt (index!19879 lt!238457) (size!16316 a!3235)))) (or ((_ is Undefined!4419) lt!238457) (ite ((_ is Found!4419) lt!238457) (= (select (arr!15952 a!3235) (index!19877 lt!238457)) (select (arr!15952 a!3235) j!176)) (ite ((_ is MissingZero!4419) lt!238457) (= (select (arr!15952 a!3235) (index!19876 lt!238457)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4419) lt!238457) (= (select (arr!15952 a!3235) (index!19879 lt!238457)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!303771 () SeekEntryResult!4419)

(assert (=> d!80337 (= lt!238457 e!303771)))

(declare-fun c!61322 () Bool)

(assert (=> d!80337 (= c!61322 (and ((_ is Intermediate!4419) lt!238455) (undefined!5231 lt!238455)))))

(assert (=> d!80337 (= lt!238455 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15952 a!3235) j!176) mask!3524) (select (arr!15952 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80337 (validMask!0 mask!3524)))

(assert (=> d!80337 (= (seekEntryOrOpen!0 (select (arr!15952 a!3235) j!176) a!3235 mask!3524) lt!238457)))

(declare-fun b!520598 () Bool)

(assert (=> b!520598 (= e!303771 Undefined!4419)))

(declare-fun b!520599 () Bool)

(assert (=> b!520599 (= e!303771 e!303770)))

(assert (=> b!520599 (= lt!238456 (select (arr!15952 a!3235) (index!19878 lt!238455)))))

(declare-fun c!61323 () Bool)

(assert (=> b!520599 (= c!61323 (= lt!238456 (select (arr!15952 a!3235) j!176)))))

(assert (= (and d!80337 c!61322) b!520598))

(assert (= (and d!80337 (not c!61322)) b!520599))

(assert (= (and b!520599 c!61323) b!520594))

(assert (= (and b!520599 (not c!61323)) b!520595))

(assert (= (and b!520595 c!61321) b!520597))

(assert (= (and b!520595 (not c!61321)) b!520596))

(assert (=> b!520596 m!501339))

(declare-fun m!501561 () Bool)

(assert (=> b!520596 m!501561))

(assert (=> d!80337 m!501339))

(assert (=> d!80337 m!501353))

(declare-fun m!501563 () Bool)

(assert (=> d!80337 m!501563))

(declare-fun m!501565 () Bool)

(assert (=> d!80337 m!501565))

(assert (=> d!80337 m!501357))

(declare-fun m!501567 () Bool)

(assert (=> d!80337 m!501567))

(assert (=> d!80337 m!501353))

(assert (=> d!80337 m!501339))

(declare-fun m!501569 () Bool)

(assert (=> d!80337 m!501569))

(declare-fun m!501571 () Bool)

(assert (=> b!520599 m!501571))

(assert (=> b!520329 d!80337))

(declare-fun d!80339 () Bool)

(assert (=> d!80339 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!520327 d!80339))

(declare-fun b!520608 () Bool)

(declare-fun e!303777 () Bool)

(declare-fun call!31804 () Bool)

(assert (=> b!520608 (= e!303777 call!31804)))

(declare-fun b!520609 () Bool)

(declare-fun e!303779 () Bool)

(assert (=> b!520609 (= e!303779 e!303777)))

(declare-fun lt!238462 () (_ BitVec 64))

(assert (=> b!520609 (= lt!238462 (select (arr!15952 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!238463 () Unit!16128)

(assert (=> b!520609 (= lt!238463 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!238462 #b00000000000000000000000000000000))))

(assert (=> b!520609 (arrayContainsKey!0 a!3235 lt!238462 #b00000000000000000000000000000000)))

(declare-fun lt!238464 () Unit!16128)

(assert (=> b!520609 (= lt!238464 lt!238463)))

(declare-fun res!318554 () Bool)

(assert (=> b!520609 (= res!318554 (= (seekEntryOrOpen!0 (select (arr!15952 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4419 #b00000000000000000000000000000000)))))

(assert (=> b!520609 (=> (not res!318554) (not e!303777))))

(declare-fun b!520610 () Bool)

(declare-fun e!303778 () Bool)

(assert (=> b!520610 (= e!303778 e!303779)))

(declare-fun c!61328 () Bool)

(assert (=> b!520610 (= c!61328 (validKeyInArray!0 (select (arr!15952 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80341 () Bool)

(declare-fun res!318555 () Bool)

(assert (=> d!80341 (=> res!318555 e!303778)))

(assert (=> d!80341 (= res!318555 (bvsge #b00000000000000000000000000000000 (size!16316 a!3235)))))

(assert (=> d!80341 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!303778)))

(declare-fun bm!31801 () Bool)

(assert (=> bm!31801 (= call!31804 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!520611 () Bool)

(assert (=> b!520611 (= e!303779 call!31804)))

(assert (= (and d!80341 (not res!318555)) b!520610))

(assert (= (and b!520610 c!61328) b!520609))

(assert (= (and b!520610 (not c!61328)) b!520611))

(assert (= (and b!520609 res!318554) b!520608))

(assert (= (or b!520608 b!520611) bm!31801))

(assert (=> b!520609 m!501449))

(declare-fun m!501573 () Bool)

(assert (=> b!520609 m!501573))

(declare-fun m!501575 () Bool)

(assert (=> b!520609 m!501575))

(assert (=> b!520609 m!501449))

(declare-fun m!501579 () Bool)

(assert (=> b!520609 m!501579))

(assert (=> b!520610 m!501449))

(assert (=> b!520610 m!501449))

(assert (=> b!520610 m!501455))

(declare-fun m!501581 () Bool)

(assert (=> bm!31801 m!501581))

(assert (=> b!520338 d!80341))

(declare-fun d!80345 () Bool)

(declare-fun res!318569 () Bool)

(declare-fun e!303795 () Bool)

(assert (=> d!80345 (=> res!318569 e!303795)))

(assert (=> d!80345 (= res!318569 (= (select (arr!15952 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!80345 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!303795)))

(declare-fun b!520635 () Bool)

(declare-fun e!303796 () Bool)

(assert (=> b!520635 (= e!303795 e!303796)))

(declare-fun res!318570 () Bool)

(assert (=> b!520635 (=> (not res!318570) (not e!303796))))

(assert (=> b!520635 (= res!318570 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16316 a!3235)))))

(declare-fun b!520636 () Bool)

(assert (=> b!520636 (= e!303796 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80345 (not res!318569)) b!520635))

(assert (= (and b!520635 res!318570) b!520636))

(assert (=> d!80345 m!501449))

(declare-fun m!501591 () Bool)

(assert (=> b!520636 m!501591))

(assert (=> b!520337 d!80345))

(declare-fun d!80349 () Bool)

(assert (=> d!80349 (= (validKeyInArray!0 (select (arr!15952 a!3235) j!176)) (and (not (= (select (arr!15952 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15952 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!520332 d!80349))

(check-sat (not d!80307) (not b!520609) (not b!520481) (not b!520441) (not d!80303) (not b!520483) (not b!520480) (not b!520432) (not d!80289) (not b!520590) (not d!80321) (not b!520636) (not b!520518) (not bm!31787) (not b!520596) (not b!520610) (not b!520393) (not d!80319) (not d!80301) (not bm!31801) (not b!520513) (not d!80337) (not b!520392) (not bm!31793))
(check-sat)
