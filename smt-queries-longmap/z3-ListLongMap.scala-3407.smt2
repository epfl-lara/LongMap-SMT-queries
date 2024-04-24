; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47288 () Bool)

(assert start!47288)

(declare-fun b!520224 () Bool)

(declare-fun res!318396 () Bool)

(declare-fun e!303556 () Bool)

(assert (=> b!520224 (=> (not res!318396) (not e!303556))))

(declare-datatypes ((array!33178 0))(
  ( (array!33179 (arr!15946 (Array (_ BitVec 32) (_ BitVec 64))) (size!16310 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33178)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33178 (_ BitVec 32)) Bool)

(assert (=> b!520224 (= res!318396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!520225 () Bool)

(declare-fun e!303554 () Bool)

(assert (=> b!520225 (= e!303554 e!303556)))

(declare-fun res!318399 () Bool)

(assert (=> b!520225 (=> (not res!318399) (not e!303556))))

(declare-datatypes ((SeekEntryResult!4369 0))(
  ( (MissingZero!4369 (index!19676 (_ BitVec 32))) (Found!4369 (index!19677 (_ BitVec 32))) (Intermediate!4369 (undefined!5181 Bool) (index!19678 (_ BitVec 32)) (x!48807 (_ BitVec 32))) (Undefined!4369) (MissingVacant!4369 (index!19679 (_ BitVec 32))) )
))
(declare-fun lt!238301 () SeekEntryResult!4369)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!520225 (= res!318399 (or (= lt!238301 (MissingZero!4369 i!1204)) (= lt!238301 (MissingVacant!4369 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33178 (_ BitVec 32)) SeekEntryResult!4369)

(assert (=> b!520225 (= lt!238301 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!520226 () Bool)

(declare-fun res!318395 () Bool)

(assert (=> b!520226 (=> (not res!318395) (not e!303554))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!520226 (= res!318395 (validKeyInArray!0 (select (arr!15946 a!3235) j!176)))))

(declare-fun b!520227 () Bool)

(declare-fun e!303558 () Bool)

(assert (=> b!520227 (= e!303556 (not e!303558))))

(declare-fun res!318403 () Bool)

(assert (=> b!520227 (=> res!318403 e!303558)))

(declare-fun lt!238300 () array!33178)

(declare-fun lt!238299 () (_ BitVec 32))

(declare-fun lt!238295 () SeekEntryResult!4369)

(declare-fun lt!238298 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33178 (_ BitVec 32)) SeekEntryResult!4369)

(assert (=> b!520227 (= res!318403 (= lt!238295 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238299 lt!238298 lt!238300 mask!3524)))))

(declare-fun lt!238302 () (_ BitVec 32))

(assert (=> b!520227 (= lt!238295 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238302 (select (arr!15946 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520227 (= lt!238299 (toIndex!0 lt!238298 mask!3524))))

(assert (=> b!520227 (= lt!238298 (select (store (arr!15946 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!520227 (= lt!238302 (toIndex!0 (select (arr!15946 a!3235) j!176) mask!3524))))

(assert (=> b!520227 (= lt!238300 (array!33179 (store (arr!15946 a!3235) i!1204 k0!2280) (size!16310 a!3235)))))

(declare-fun e!303555 () Bool)

(assert (=> b!520227 e!303555))

(declare-fun res!318398 () Bool)

(assert (=> b!520227 (=> (not res!318398) (not e!303555))))

(assert (=> b!520227 (= res!318398 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16087 0))(
  ( (Unit!16088) )
))
(declare-fun lt!238297 () Unit!16087)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16087)

(assert (=> b!520227 (= lt!238297 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!520228 () Bool)

(declare-fun e!303552 () Unit!16087)

(declare-fun Unit!16089 () Unit!16087)

(assert (=> b!520228 (= e!303552 Unit!16089)))

(declare-fun b!520229 () Bool)

(declare-fun res!318397 () Bool)

(assert (=> b!520229 (=> (not res!318397) (not e!303554))))

(assert (=> b!520229 (= res!318397 (validKeyInArray!0 k0!2280))))

(declare-fun res!318400 () Bool)

(assert (=> start!47288 (=> (not res!318400) (not e!303554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47288 (= res!318400 (validMask!0 mask!3524))))

(assert (=> start!47288 e!303554))

(assert (=> start!47288 true))

(declare-fun array_inv!11805 (array!33178) Bool)

(assert (=> start!47288 (array_inv!11805 a!3235)))

(declare-fun b!520230 () Bool)

(declare-fun res!318402 () Bool)

(assert (=> b!520230 (=> res!318402 e!303558)))

(get-info :version)

(assert (=> b!520230 (= res!318402 (or (undefined!5181 lt!238295) (not ((_ is Intermediate!4369) lt!238295))))))

(declare-fun b!520231 () Bool)

(declare-fun res!318405 () Bool)

(assert (=> b!520231 (=> (not res!318405) (not e!303554))))

(assert (=> b!520231 (= res!318405 (and (= (size!16310 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16310 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16310 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!520232 () Bool)

(declare-fun Unit!16090 () Unit!16087)

(assert (=> b!520232 (= e!303552 Unit!16090)))

(declare-fun lt!238303 () Unit!16087)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33178 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16087)

(assert (=> b!520232 (= lt!238303 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238302 #b00000000000000000000000000000000 (index!19678 lt!238295) (x!48807 lt!238295) mask!3524))))

(declare-fun res!318406 () Bool)

(assert (=> b!520232 (= res!318406 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238302 lt!238298 lt!238300 mask!3524) (Intermediate!4369 false (index!19678 lt!238295) (x!48807 lt!238295))))))

(declare-fun e!303557 () Bool)

(assert (=> b!520232 (=> (not res!318406) (not e!303557))))

(assert (=> b!520232 e!303557))

(declare-fun b!520233 () Bool)

(assert (=> b!520233 (= e!303555 (= (seekEntryOrOpen!0 (select (arr!15946 a!3235) j!176) a!3235 mask!3524) (Found!4369 j!176)))))

(declare-fun b!520234 () Bool)

(declare-fun res!318401 () Bool)

(assert (=> b!520234 (=> (not res!318401) (not e!303556))))

(declare-datatypes ((List!10011 0))(
  ( (Nil!10008) (Cons!10007 (h!10926 (_ BitVec 64)) (t!16231 List!10011)) )
))
(declare-fun arrayNoDuplicates!0 (array!33178 (_ BitVec 32) List!10011) Bool)

(assert (=> b!520234 (= res!318401 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10008))))

(declare-fun b!520235 () Bool)

(assert (=> b!520235 (= e!303558 (and (bvsge (index!19678 lt!238295) #b00000000000000000000000000000000) (bvslt (index!19678 lt!238295) (size!16310 a!3235))))))

(assert (=> b!520235 (and (or (= (select (arr!15946 a!3235) (index!19678 lt!238295)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15946 a!3235) (index!19678 lt!238295)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15946 a!3235) (index!19678 lt!238295)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!238296 () Unit!16087)

(assert (=> b!520235 (= lt!238296 e!303552)))

(declare-fun c!61214 () Bool)

(assert (=> b!520235 (= c!61214 (= (select (arr!15946 a!3235) (index!19678 lt!238295)) (select (arr!15946 a!3235) j!176)))))

(assert (=> b!520235 (and (bvslt (x!48807 lt!238295) #b01111111111111111111111111111110) (or (= (select (arr!15946 a!3235) (index!19678 lt!238295)) (select (arr!15946 a!3235) j!176)) (= (select (arr!15946 a!3235) (index!19678 lt!238295)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15946 a!3235) (index!19678 lt!238295)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520236 () Bool)

(declare-fun res!318404 () Bool)

(assert (=> b!520236 (=> (not res!318404) (not e!303554))))

(declare-fun arrayContainsKey!0 (array!33178 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!520236 (= res!318404 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!520237 () Bool)

(assert (=> b!520237 (= e!303557 false)))

(assert (= (and start!47288 res!318400) b!520231))

(assert (= (and b!520231 res!318405) b!520226))

(assert (= (and b!520226 res!318395) b!520229))

(assert (= (and b!520229 res!318397) b!520236))

(assert (= (and b!520236 res!318404) b!520225))

(assert (= (and b!520225 res!318399) b!520224))

(assert (= (and b!520224 res!318396) b!520234))

(assert (= (and b!520234 res!318401) b!520227))

(assert (= (and b!520227 res!318398) b!520233))

(assert (= (and b!520227 (not res!318403)) b!520230))

(assert (= (and b!520230 (not res!318402)) b!520235))

(assert (= (and b!520235 c!61214) b!520232))

(assert (= (and b!520235 (not c!61214)) b!520228))

(assert (= (and b!520232 res!318406) b!520237))

(declare-fun m!501475 () Bool)

(assert (=> b!520226 m!501475))

(assert (=> b!520226 m!501475))

(declare-fun m!501477 () Bool)

(assert (=> b!520226 m!501477))

(declare-fun m!501479 () Bool)

(assert (=> b!520224 m!501479))

(declare-fun m!501481 () Bool)

(assert (=> b!520236 m!501481))

(declare-fun m!501483 () Bool)

(assert (=> b!520234 m!501483))

(declare-fun m!501485 () Bool)

(assert (=> b!520225 m!501485))

(assert (=> b!520233 m!501475))

(assert (=> b!520233 m!501475))

(declare-fun m!501487 () Bool)

(assert (=> b!520233 m!501487))

(declare-fun m!501489 () Bool)

(assert (=> b!520232 m!501489))

(declare-fun m!501491 () Bool)

(assert (=> b!520232 m!501491))

(declare-fun m!501493 () Bool)

(assert (=> start!47288 m!501493))

(declare-fun m!501495 () Bool)

(assert (=> start!47288 m!501495))

(declare-fun m!501497 () Bool)

(assert (=> b!520229 m!501497))

(assert (=> b!520227 m!501475))

(declare-fun m!501499 () Bool)

(assert (=> b!520227 m!501499))

(declare-fun m!501501 () Bool)

(assert (=> b!520227 m!501501))

(assert (=> b!520227 m!501475))

(declare-fun m!501503 () Bool)

(assert (=> b!520227 m!501503))

(assert (=> b!520227 m!501475))

(declare-fun m!501505 () Bool)

(assert (=> b!520227 m!501505))

(declare-fun m!501507 () Bool)

(assert (=> b!520227 m!501507))

(declare-fun m!501509 () Bool)

(assert (=> b!520227 m!501509))

(declare-fun m!501511 () Bool)

(assert (=> b!520227 m!501511))

(declare-fun m!501513 () Bool)

(assert (=> b!520227 m!501513))

(declare-fun m!501515 () Bool)

(assert (=> b!520235 m!501515))

(assert (=> b!520235 m!501475))

(check-sat (not b!520226) (not b!520234) (not b!520232) (not start!47288) (not b!520224) (not b!520227) (not b!520225) (not b!520236) (not b!520229) (not b!520233))
(check-sat)
(get-model)

(declare-fun b!520340 () Bool)

(declare-fun lt!238363 () SeekEntryResult!4369)

(assert (=> b!520340 (and (bvsge (index!19678 lt!238363) #b00000000000000000000000000000000) (bvslt (index!19678 lt!238363) (size!16310 lt!238300)))))

(declare-fun res!318486 () Bool)

(assert (=> b!520340 (= res!318486 (= (select (arr!15946 lt!238300) (index!19678 lt!238363)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303614 () Bool)

(assert (=> b!520340 (=> res!318486 e!303614)))

(declare-fun d!80313 () Bool)

(declare-fun e!303615 () Bool)

(assert (=> d!80313 e!303615))

(declare-fun c!61227 () Bool)

(assert (=> d!80313 (= c!61227 (and ((_ is Intermediate!4369) lt!238363) (undefined!5181 lt!238363)))))

(declare-fun e!303612 () SeekEntryResult!4369)

(assert (=> d!80313 (= lt!238363 e!303612)))

(declare-fun c!61229 () Bool)

(assert (=> d!80313 (= c!61229 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!238362 () (_ BitVec 64))

(assert (=> d!80313 (= lt!238362 (select (arr!15946 lt!238300) lt!238299))))

(assert (=> d!80313 (validMask!0 mask!3524)))

(assert (=> d!80313 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238299 lt!238298 lt!238300 mask!3524) lt!238363)))

(declare-fun b!520341 () Bool)

(declare-fun e!303611 () SeekEntryResult!4369)

(assert (=> b!520341 (= e!303611 (Intermediate!4369 false lt!238299 #b00000000000000000000000000000000))))

(declare-fun b!520342 () Bool)

(assert (=> b!520342 (and (bvsge (index!19678 lt!238363) #b00000000000000000000000000000000) (bvslt (index!19678 lt!238363) (size!16310 lt!238300)))))

(declare-fun res!318487 () Bool)

(assert (=> b!520342 (= res!318487 (= (select (arr!15946 lt!238300) (index!19678 lt!238363)) lt!238298))))

(assert (=> b!520342 (=> res!318487 e!303614)))

(declare-fun e!303613 () Bool)

(assert (=> b!520342 (= e!303613 e!303614)))

(declare-fun b!520343 () Bool)

(assert (=> b!520343 (= e!303615 (bvsge (x!48807 lt!238363) #b01111111111111111111111111111110))))

(declare-fun b!520344 () Bool)

(assert (=> b!520344 (and (bvsge (index!19678 lt!238363) #b00000000000000000000000000000000) (bvslt (index!19678 lt!238363) (size!16310 lt!238300)))))

(assert (=> b!520344 (= e!303614 (= (select (arr!15946 lt!238300) (index!19678 lt!238363)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!520345 () Bool)

(assert (=> b!520345 (= e!303612 e!303611)))

(declare-fun c!61228 () Bool)

(assert (=> b!520345 (= c!61228 (or (= lt!238362 lt!238298) (= (bvadd lt!238362 lt!238362) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520346 () Bool)

(assert (=> b!520346 (= e!303615 e!303613)))

(declare-fun res!318485 () Bool)

(assert (=> b!520346 (= res!318485 (and ((_ is Intermediate!4369) lt!238363) (not (undefined!5181 lt!238363)) (bvslt (x!48807 lt!238363) #b01111111111111111111111111111110) (bvsge (x!48807 lt!238363) #b00000000000000000000000000000000) (bvsge (x!48807 lt!238363) #b00000000000000000000000000000000)))))

(assert (=> b!520346 (=> (not res!318485) (not e!303613))))

(declare-fun b!520347 () Bool)

(assert (=> b!520347 (= e!303612 (Intermediate!4369 true lt!238299 #b00000000000000000000000000000000))))

(declare-fun b!520348 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520348 (= e!303611 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!238299 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) lt!238298 lt!238300 mask!3524))))

(assert (= (and d!80313 c!61229) b!520347))

(assert (= (and d!80313 (not c!61229)) b!520345))

(assert (= (and b!520345 c!61228) b!520341))

(assert (= (and b!520345 (not c!61228)) b!520348))

(assert (= (and d!80313 c!61227) b!520343))

(assert (= (and d!80313 (not c!61227)) b!520346))

(assert (= (and b!520346 res!318485) b!520342))

(assert (= (and b!520342 (not res!318487)) b!520340))

(assert (= (and b!520340 (not res!318486)) b!520344))

(declare-fun m!501601 () Bool)

(assert (=> d!80313 m!501601))

(assert (=> d!80313 m!501493))

(declare-fun m!501603 () Bool)

(assert (=> b!520342 m!501603))

(assert (=> b!520344 m!501603))

(declare-fun m!501605 () Bool)

(assert (=> b!520348 m!501605))

(assert (=> b!520348 m!501605))

(declare-fun m!501607 () Bool)

(assert (=> b!520348 m!501607))

(assert (=> b!520340 m!501603))

(assert (=> b!520227 d!80313))

(declare-fun d!80315 () Bool)

(declare-fun lt!238369 () (_ BitVec 32))

(declare-fun lt!238368 () (_ BitVec 32))

(assert (=> d!80315 (= lt!238369 (bvmul (bvxor lt!238368 (bvlshr lt!238368 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80315 (= lt!238368 ((_ extract 31 0) (bvand (bvxor (select (arr!15946 a!3235) j!176) (bvlshr (select (arr!15946 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80315 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!318488 (let ((h!10929 ((_ extract 31 0) (bvand (bvxor (select (arr!15946 a!3235) j!176) (bvlshr (select (arr!15946 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48811 (bvmul (bvxor h!10929 (bvlshr h!10929 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48811 (bvlshr x!48811 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!318488 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!318488 #b00000000000000000000000000000000))))))

(assert (=> d!80315 (= (toIndex!0 (select (arr!15946 a!3235) j!176) mask!3524) (bvand (bvxor lt!238369 (bvlshr lt!238369 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!520227 d!80315))

(declare-fun b!520357 () Bool)

(declare-fun e!303622 () Bool)

(declare-fun call!31776 () Bool)

(assert (=> b!520357 (= e!303622 call!31776)))

(declare-fun b!520358 () Bool)

(declare-fun e!303624 () Bool)

(assert (=> b!520358 (= e!303624 e!303622)))

(declare-fun c!61232 () Bool)

(assert (=> b!520358 (= c!61232 (validKeyInArray!0 (select (arr!15946 a!3235) j!176)))))

(declare-fun b!520359 () Bool)

(declare-fun e!303623 () Bool)

(assert (=> b!520359 (= e!303622 e!303623)))

(declare-fun lt!238378 () (_ BitVec 64))

(assert (=> b!520359 (= lt!238378 (select (arr!15946 a!3235) j!176))))

(declare-fun lt!238376 () Unit!16087)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33178 (_ BitVec 64) (_ BitVec 32)) Unit!16087)

(assert (=> b!520359 (= lt!238376 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!238378 j!176))))

(assert (=> b!520359 (arrayContainsKey!0 a!3235 lt!238378 #b00000000000000000000000000000000)))

(declare-fun lt!238377 () Unit!16087)

(assert (=> b!520359 (= lt!238377 lt!238376)))

(declare-fun res!318494 () Bool)

(assert (=> b!520359 (= res!318494 (= (seekEntryOrOpen!0 (select (arr!15946 a!3235) j!176) a!3235 mask!3524) (Found!4369 j!176)))))

(assert (=> b!520359 (=> (not res!318494) (not e!303623))))

(declare-fun bm!31773 () Bool)

(assert (=> bm!31773 (= call!31776 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!520360 () Bool)

(assert (=> b!520360 (= e!303623 call!31776)))

(declare-fun d!80317 () Bool)

(declare-fun res!318493 () Bool)

(assert (=> d!80317 (=> res!318493 e!303624)))

(assert (=> d!80317 (= res!318493 (bvsge j!176 (size!16310 a!3235)))))

(assert (=> d!80317 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!303624)))

(assert (= (and d!80317 (not res!318493)) b!520358))

(assert (= (and b!520358 c!61232) b!520359))

(assert (= (and b!520358 (not c!61232)) b!520357))

(assert (= (and b!520359 res!318494) b!520360))

(assert (= (or b!520360 b!520357) bm!31773))

(assert (=> b!520358 m!501475))

(assert (=> b!520358 m!501475))

(assert (=> b!520358 m!501477))

(assert (=> b!520359 m!501475))

(declare-fun m!501609 () Bool)

(assert (=> b!520359 m!501609))

(declare-fun m!501611 () Bool)

(assert (=> b!520359 m!501611))

(assert (=> b!520359 m!501475))

(assert (=> b!520359 m!501487))

(declare-fun m!501613 () Bool)

(assert (=> bm!31773 m!501613))

(assert (=> b!520227 d!80317))

(declare-fun d!80321 () Bool)

(declare-fun lt!238380 () (_ BitVec 32))

(declare-fun lt!238379 () (_ BitVec 32))

(assert (=> d!80321 (= lt!238380 (bvmul (bvxor lt!238379 (bvlshr lt!238379 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80321 (= lt!238379 ((_ extract 31 0) (bvand (bvxor lt!238298 (bvlshr lt!238298 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80321 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!318488 (let ((h!10929 ((_ extract 31 0) (bvand (bvxor lt!238298 (bvlshr lt!238298 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48811 (bvmul (bvxor h!10929 (bvlshr h!10929 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48811 (bvlshr x!48811 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!318488 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!318488 #b00000000000000000000000000000000))))))

(assert (=> d!80321 (= (toIndex!0 lt!238298 mask!3524) (bvand (bvxor lt!238380 (bvlshr lt!238380 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!520227 d!80321))

(declare-fun d!80323 () Bool)

(assert (=> d!80323 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!238383 () Unit!16087)

(declare-fun choose!38 (array!33178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16087)

(assert (=> d!80323 (= lt!238383 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80323 (validMask!0 mask!3524)))

(assert (=> d!80323 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!238383)))

(declare-fun bs!16403 () Bool)

(assert (= bs!16403 d!80323))

(assert (=> bs!16403 m!501505))

(declare-fun m!501615 () Bool)

(assert (=> bs!16403 m!501615))

(assert (=> bs!16403 m!501493))

(assert (=> b!520227 d!80323))

(declare-fun b!520361 () Bool)

(declare-fun lt!238385 () SeekEntryResult!4369)

(assert (=> b!520361 (and (bvsge (index!19678 lt!238385) #b00000000000000000000000000000000) (bvslt (index!19678 lt!238385) (size!16310 a!3235)))))

(declare-fun res!318496 () Bool)

(assert (=> b!520361 (= res!318496 (= (select (arr!15946 a!3235) (index!19678 lt!238385)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303628 () Bool)

(assert (=> b!520361 (=> res!318496 e!303628)))

(declare-fun d!80327 () Bool)

(declare-fun e!303629 () Bool)

(assert (=> d!80327 e!303629))

(declare-fun c!61233 () Bool)

(assert (=> d!80327 (= c!61233 (and ((_ is Intermediate!4369) lt!238385) (undefined!5181 lt!238385)))))

(declare-fun e!303626 () SeekEntryResult!4369)

(assert (=> d!80327 (= lt!238385 e!303626)))

(declare-fun c!61235 () Bool)

(assert (=> d!80327 (= c!61235 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!238384 () (_ BitVec 64))

(assert (=> d!80327 (= lt!238384 (select (arr!15946 a!3235) lt!238302))))

(assert (=> d!80327 (validMask!0 mask!3524)))

(assert (=> d!80327 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238302 (select (arr!15946 a!3235) j!176) a!3235 mask!3524) lt!238385)))

(declare-fun b!520362 () Bool)

(declare-fun e!303625 () SeekEntryResult!4369)

(assert (=> b!520362 (= e!303625 (Intermediate!4369 false lt!238302 #b00000000000000000000000000000000))))

(declare-fun b!520363 () Bool)

(assert (=> b!520363 (and (bvsge (index!19678 lt!238385) #b00000000000000000000000000000000) (bvslt (index!19678 lt!238385) (size!16310 a!3235)))))

(declare-fun res!318497 () Bool)

(assert (=> b!520363 (= res!318497 (= (select (arr!15946 a!3235) (index!19678 lt!238385)) (select (arr!15946 a!3235) j!176)))))

(assert (=> b!520363 (=> res!318497 e!303628)))

(declare-fun e!303627 () Bool)

(assert (=> b!520363 (= e!303627 e!303628)))

(declare-fun b!520364 () Bool)

(assert (=> b!520364 (= e!303629 (bvsge (x!48807 lt!238385) #b01111111111111111111111111111110))))

(declare-fun b!520365 () Bool)

(assert (=> b!520365 (and (bvsge (index!19678 lt!238385) #b00000000000000000000000000000000) (bvslt (index!19678 lt!238385) (size!16310 a!3235)))))

(assert (=> b!520365 (= e!303628 (= (select (arr!15946 a!3235) (index!19678 lt!238385)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!520366 () Bool)

(assert (=> b!520366 (= e!303626 e!303625)))

(declare-fun c!61234 () Bool)

(assert (=> b!520366 (= c!61234 (or (= lt!238384 (select (arr!15946 a!3235) j!176)) (= (bvadd lt!238384 lt!238384) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520367 () Bool)

(assert (=> b!520367 (= e!303629 e!303627)))

(declare-fun res!318495 () Bool)

(assert (=> b!520367 (= res!318495 (and ((_ is Intermediate!4369) lt!238385) (not (undefined!5181 lt!238385)) (bvslt (x!48807 lt!238385) #b01111111111111111111111111111110) (bvsge (x!48807 lt!238385) #b00000000000000000000000000000000) (bvsge (x!48807 lt!238385) #b00000000000000000000000000000000)))))

(assert (=> b!520367 (=> (not res!318495) (not e!303627))))

(declare-fun b!520368 () Bool)

(assert (=> b!520368 (= e!303626 (Intermediate!4369 true lt!238302 #b00000000000000000000000000000000))))

(declare-fun b!520369 () Bool)

(assert (=> b!520369 (= e!303625 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!238302 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (arr!15946 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!80327 c!61235) b!520368))

(assert (= (and d!80327 (not c!61235)) b!520366))

(assert (= (and b!520366 c!61234) b!520362))

(assert (= (and b!520366 (not c!61234)) b!520369))

(assert (= (and d!80327 c!61233) b!520364))

(assert (= (and d!80327 (not c!61233)) b!520367))

(assert (= (and b!520367 res!318495) b!520363))

(assert (= (and b!520363 (not res!318497)) b!520361))

(assert (= (and b!520361 (not res!318496)) b!520365))

(declare-fun m!501617 () Bool)

(assert (=> d!80327 m!501617))

(assert (=> d!80327 m!501493))

(declare-fun m!501619 () Bool)

(assert (=> b!520363 m!501619))

(assert (=> b!520365 m!501619))

(declare-fun m!501621 () Bool)

(assert (=> b!520369 m!501621))

(assert (=> b!520369 m!501621))

(assert (=> b!520369 m!501475))

(declare-fun m!501623 () Bool)

(assert (=> b!520369 m!501623))

(assert (=> b!520361 m!501619))

(assert (=> b!520227 d!80327))

(declare-fun b!520413 () Bool)

(declare-fun c!61253 () Bool)

(declare-fun lt!238405 () (_ BitVec 64))

(assert (=> b!520413 (= c!61253 (= lt!238405 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303658 () SeekEntryResult!4369)

(declare-fun e!303657 () SeekEntryResult!4369)

(assert (=> b!520413 (= e!303658 e!303657)))

(declare-fun b!520414 () Bool)

(declare-fun lt!238404 () SeekEntryResult!4369)

(assert (=> b!520414 (= e!303657 (MissingZero!4369 (index!19678 lt!238404)))))

(declare-fun d!80329 () Bool)

(declare-fun lt!238406 () SeekEntryResult!4369)

(assert (=> d!80329 (and (or ((_ is Undefined!4369) lt!238406) (not ((_ is Found!4369) lt!238406)) (and (bvsge (index!19677 lt!238406) #b00000000000000000000000000000000) (bvslt (index!19677 lt!238406) (size!16310 a!3235)))) (or ((_ is Undefined!4369) lt!238406) ((_ is Found!4369) lt!238406) (not ((_ is MissingZero!4369) lt!238406)) (and (bvsge (index!19676 lt!238406) #b00000000000000000000000000000000) (bvslt (index!19676 lt!238406) (size!16310 a!3235)))) (or ((_ is Undefined!4369) lt!238406) ((_ is Found!4369) lt!238406) ((_ is MissingZero!4369) lt!238406) (not ((_ is MissingVacant!4369) lt!238406)) (and (bvsge (index!19679 lt!238406) #b00000000000000000000000000000000) (bvslt (index!19679 lt!238406) (size!16310 a!3235)))) (or ((_ is Undefined!4369) lt!238406) (ite ((_ is Found!4369) lt!238406) (= (select (arr!15946 a!3235) (index!19677 lt!238406)) (select (arr!15946 a!3235) j!176)) (ite ((_ is MissingZero!4369) lt!238406) (= (select (arr!15946 a!3235) (index!19676 lt!238406)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4369) lt!238406) (= (select (arr!15946 a!3235) (index!19679 lt!238406)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!303656 () SeekEntryResult!4369)

(assert (=> d!80329 (= lt!238406 e!303656)))

(declare-fun c!61254 () Bool)

(assert (=> d!80329 (= c!61254 (and ((_ is Intermediate!4369) lt!238404) (undefined!5181 lt!238404)))))

(assert (=> d!80329 (= lt!238404 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15946 a!3235) j!176) mask!3524) (select (arr!15946 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80329 (validMask!0 mask!3524)))

(assert (=> d!80329 (= (seekEntryOrOpen!0 (select (arr!15946 a!3235) j!176) a!3235 mask!3524) lt!238406)))

(declare-fun b!520415 () Bool)

(assert (=> b!520415 (= e!303656 Undefined!4369)))

(declare-fun b!520416 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33178 (_ BitVec 32)) SeekEntryResult!4369)

(assert (=> b!520416 (= e!303657 (seekKeyOrZeroReturnVacant!0 (x!48807 lt!238404) (index!19678 lt!238404) (index!19678 lt!238404) (select (arr!15946 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!520417 () Bool)

(assert (=> b!520417 (= e!303658 (Found!4369 (index!19678 lt!238404)))))

(declare-fun b!520418 () Bool)

(assert (=> b!520418 (= e!303656 e!303658)))

(assert (=> b!520418 (= lt!238405 (select (arr!15946 a!3235) (index!19678 lt!238404)))))

(declare-fun c!61255 () Bool)

(assert (=> b!520418 (= c!61255 (= lt!238405 (select (arr!15946 a!3235) j!176)))))

(assert (= (and d!80329 c!61254) b!520415))

(assert (= (and d!80329 (not c!61254)) b!520418))

(assert (= (and b!520418 c!61255) b!520417))

(assert (= (and b!520418 (not c!61255)) b!520413))

(assert (= (and b!520413 c!61253) b!520414))

(assert (= (and b!520413 (not c!61253)) b!520416))

(declare-fun m!501641 () Bool)

(assert (=> d!80329 m!501641))

(declare-fun m!501643 () Bool)

(assert (=> d!80329 m!501643))

(assert (=> d!80329 m!501503))

(assert (=> d!80329 m!501475))

(declare-fun m!501645 () Bool)

(assert (=> d!80329 m!501645))

(declare-fun m!501647 () Bool)

(assert (=> d!80329 m!501647))

(assert (=> d!80329 m!501493))

(assert (=> d!80329 m!501475))

(assert (=> d!80329 m!501503))

(assert (=> b!520416 m!501475))

(declare-fun m!501649 () Bool)

(assert (=> b!520416 m!501649))

(declare-fun m!501651 () Bool)

(assert (=> b!520418 m!501651))

(assert (=> b!520233 d!80329))

(declare-fun d!80339 () Bool)

(assert (=> d!80339 (= (validKeyInArray!0 (select (arr!15946 a!3235) j!176)) (and (not (= (select (arr!15946 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15946 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!520226 d!80339))

(declare-fun d!80341 () Bool)

(declare-fun e!303674 () Bool)

(assert (=> d!80341 e!303674))

(declare-fun res!318518 () Bool)

(assert (=> d!80341 (=> (not res!318518) (not e!303674))))

(assert (=> d!80341 (= res!318518 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16310 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16310 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16310 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16310 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16310 a!3235))))))

(declare-fun lt!238412 () Unit!16087)

(declare-fun choose!47 (array!33178 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16087)

(assert (=> d!80341 (= lt!238412 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!238302 #b00000000000000000000000000000000 (index!19678 lt!238295) (x!48807 lt!238295) mask!3524))))

(assert (=> d!80341 (validMask!0 mask!3524)))

(assert (=> d!80341 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238302 #b00000000000000000000000000000000 (index!19678 lt!238295) (x!48807 lt!238295) mask!3524) lt!238412)))

(declare-fun b!520438 () Bool)

(assert (=> b!520438 (= e!303674 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238302 (select (store (arr!15946 a!3235) i!1204 k0!2280) j!176) (array!33179 (store (arr!15946 a!3235) i!1204 k0!2280) (size!16310 a!3235)) mask!3524) (Intermediate!4369 false (index!19678 lt!238295) (x!48807 lt!238295))))))

(assert (= (and d!80341 res!318518) b!520438))

(declare-fun m!501677 () Bool)

(assert (=> d!80341 m!501677))

(assert (=> d!80341 m!501493))

(assert (=> b!520438 m!501509))

(assert (=> b!520438 m!501513))

(assert (=> b!520438 m!501513))

(declare-fun m!501679 () Bool)

(assert (=> b!520438 m!501679))

(assert (=> b!520232 d!80341))

(declare-fun b!520439 () Bool)

(declare-fun lt!238414 () SeekEntryResult!4369)

(assert (=> b!520439 (and (bvsge (index!19678 lt!238414) #b00000000000000000000000000000000) (bvslt (index!19678 lt!238414) (size!16310 lt!238300)))))

(declare-fun res!318520 () Bool)

(assert (=> b!520439 (= res!318520 (= (select (arr!15946 lt!238300) (index!19678 lt!238414)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303678 () Bool)

(assert (=> b!520439 (=> res!318520 e!303678)))

(declare-fun d!80351 () Bool)

(declare-fun e!303679 () Bool)

(assert (=> d!80351 e!303679))

(declare-fun c!61260 () Bool)

(assert (=> d!80351 (= c!61260 (and ((_ is Intermediate!4369) lt!238414) (undefined!5181 lt!238414)))))

(declare-fun e!303676 () SeekEntryResult!4369)

(assert (=> d!80351 (= lt!238414 e!303676)))

(declare-fun c!61262 () Bool)

(assert (=> d!80351 (= c!61262 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!238413 () (_ BitVec 64))

(assert (=> d!80351 (= lt!238413 (select (arr!15946 lt!238300) lt!238302))))

(assert (=> d!80351 (validMask!0 mask!3524)))

(assert (=> d!80351 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238302 lt!238298 lt!238300 mask!3524) lt!238414)))

(declare-fun b!520440 () Bool)

(declare-fun e!303675 () SeekEntryResult!4369)

(assert (=> b!520440 (= e!303675 (Intermediate!4369 false lt!238302 #b00000000000000000000000000000000))))

(declare-fun b!520441 () Bool)

(assert (=> b!520441 (and (bvsge (index!19678 lt!238414) #b00000000000000000000000000000000) (bvslt (index!19678 lt!238414) (size!16310 lt!238300)))))

(declare-fun res!318521 () Bool)

(assert (=> b!520441 (= res!318521 (= (select (arr!15946 lt!238300) (index!19678 lt!238414)) lt!238298))))

(assert (=> b!520441 (=> res!318521 e!303678)))

(declare-fun e!303677 () Bool)

(assert (=> b!520441 (= e!303677 e!303678)))

(declare-fun b!520442 () Bool)

(assert (=> b!520442 (= e!303679 (bvsge (x!48807 lt!238414) #b01111111111111111111111111111110))))

(declare-fun b!520443 () Bool)

(assert (=> b!520443 (and (bvsge (index!19678 lt!238414) #b00000000000000000000000000000000) (bvslt (index!19678 lt!238414) (size!16310 lt!238300)))))

(assert (=> b!520443 (= e!303678 (= (select (arr!15946 lt!238300) (index!19678 lt!238414)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!520444 () Bool)

(assert (=> b!520444 (= e!303676 e!303675)))

(declare-fun c!61261 () Bool)

(assert (=> b!520444 (= c!61261 (or (= lt!238413 lt!238298) (= (bvadd lt!238413 lt!238413) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520445 () Bool)

(assert (=> b!520445 (= e!303679 e!303677)))

(declare-fun res!318519 () Bool)

(assert (=> b!520445 (= res!318519 (and ((_ is Intermediate!4369) lt!238414) (not (undefined!5181 lt!238414)) (bvslt (x!48807 lt!238414) #b01111111111111111111111111111110) (bvsge (x!48807 lt!238414) #b00000000000000000000000000000000) (bvsge (x!48807 lt!238414) #b00000000000000000000000000000000)))))

(assert (=> b!520445 (=> (not res!318519) (not e!303677))))

(declare-fun b!520446 () Bool)

(assert (=> b!520446 (= e!303676 (Intermediate!4369 true lt!238302 #b00000000000000000000000000000000))))

(declare-fun b!520447 () Bool)

(assert (=> b!520447 (= e!303675 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!238302 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) lt!238298 lt!238300 mask!3524))))

(assert (= (and d!80351 c!61262) b!520446))

(assert (= (and d!80351 (not c!61262)) b!520444))

(assert (= (and b!520444 c!61261) b!520440))

(assert (= (and b!520444 (not c!61261)) b!520447))

(assert (= (and d!80351 c!61260) b!520442))

(assert (= (and d!80351 (not c!61260)) b!520445))

(assert (= (and b!520445 res!318519) b!520441))

(assert (= (and b!520441 (not res!318521)) b!520439))

(assert (= (and b!520439 (not res!318520)) b!520443))

(declare-fun m!501681 () Bool)

(assert (=> d!80351 m!501681))

(assert (=> d!80351 m!501493))

(declare-fun m!501683 () Bool)

(assert (=> b!520441 m!501683))

(assert (=> b!520443 m!501683))

(assert (=> b!520447 m!501621))

(assert (=> b!520447 m!501621))

(declare-fun m!501685 () Bool)

(assert (=> b!520447 m!501685))

(assert (=> b!520439 m!501683))

(assert (=> b!520232 d!80351))

(declare-fun b!520450 () Bool)

(declare-fun c!61263 () Bool)

(declare-fun lt!238420 () (_ BitVec 64))

(assert (=> b!520450 (= c!61263 (= lt!238420 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303682 () SeekEntryResult!4369)

(declare-fun e!303681 () SeekEntryResult!4369)

(assert (=> b!520450 (= e!303682 e!303681)))

(declare-fun b!520451 () Bool)

(declare-fun lt!238419 () SeekEntryResult!4369)

(assert (=> b!520451 (= e!303681 (MissingZero!4369 (index!19678 lt!238419)))))

(declare-fun d!80353 () Bool)

(declare-fun lt!238421 () SeekEntryResult!4369)

(assert (=> d!80353 (and (or ((_ is Undefined!4369) lt!238421) (not ((_ is Found!4369) lt!238421)) (and (bvsge (index!19677 lt!238421) #b00000000000000000000000000000000) (bvslt (index!19677 lt!238421) (size!16310 a!3235)))) (or ((_ is Undefined!4369) lt!238421) ((_ is Found!4369) lt!238421) (not ((_ is MissingZero!4369) lt!238421)) (and (bvsge (index!19676 lt!238421) #b00000000000000000000000000000000) (bvslt (index!19676 lt!238421) (size!16310 a!3235)))) (or ((_ is Undefined!4369) lt!238421) ((_ is Found!4369) lt!238421) ((_ is MissingZero!4369) lt!238421) (not ((_ is MissingVacant!4369) lt!238421)) (and (bvsge (index!19679 lt!238421) #b00000000000000000000000000000000) (bvslt (index!19679 lt!238421) (size!16310 a!3235)))) (or ((_ is Undefined!4369) lt!238421) (ite ((_ is Found!4369) lt!238421) (= (select (arr!15946 a!3235) (index!19677 lt!238421)) k0!2280) (ite ((_ is MissingZero!4369) lt!238421) (= (select (arr!15946 a!3235) (index!19676 lt!238421)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4369) lt!238421) (= (select (arr!15946 a!3235) (index!19679 lt!238421)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!303680 () SeekEntryResult!4369)

(assert (=> d!80353 (= lt!238421 e!303680)))

(declare-fun c!61264 () Bool)

(assert (=> d!80353 (= c!61264 (and ((_ is Intermediate!4369) lt!238419) (undefined!5181 lt!238419)))))

(assert (=> d!80353 (= lt!238419 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!80353 (validMask!0 mask!3524)))

(assert (=> d!80353 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!238421)))

(declare-fun b!520452 () Bool)

(assert (=> b!520452 (= e!303680 Undefined!4369)))

(declare-fun b!520453 () Bool)

(assert (=> b!520453 (= e!303681 (seekKeyOrZeroReturnVacant!0 (x!48807 lt!238419) (index!19678 lt!238419) (index!19678 lt!238419) k0!2280 a!3235 mask!3524))))

(declare-fun b!520454 () Bool)

(assert (=> b!520454 (= e!303682 (Found!4369 (index!19678 lt!238419)))))

(declare-fun b!520455 () Bool)

(assert (=> b!520455 (= e!303680 e!303682)))

(assert (=> b!520455 (= lt!238420 (select (arr!15946 a!3235) (index!19678 lt!238419)))))

(declare-fun c!61265 () Bool)

(assert (=> b!520455 (= c!61265 (= lt!238420 k0!2280))))

(assert (= (and d!80353 c!61264) b!520452))

(assert (= (and d!80353 (not c!61264)) b!520455))

(assert (= (and b!520455 c!61265) b!520454))

(assert (= (and b!520455 (not c!61265)) b!520450))

(assert (= (and b!520450 c!61263) b!520451))

(assert (= (and b!520450 (not c!61263)) b!520453))

(declare-fun m!501687 () Bool)

(assert (=> d!80353 m!501687))

(declare-fun m!501689 () Bool)

(assert (=> d!80353 m!501689))

(declare-fun m!501691 () Bool)

(assert (=> d!80353 m!501691))

(declare-fun m!501693 () Bool)

(assert (=> d!80353 m!501693))

(declare-fun m!501695 () Bool)

(assert (=> d!80353 m!501695))

(assert (=> d!80353 m!501493))

(assert (=> d!80353 m!501691))

(declare-fun m!501697 () Bool)

(assert (=> b!520453 m!501697))

(declare-fun m!501699 () Bool)

(assert (=> b!520455 m!501699))

(assert (=> b!520225 d!80353))

(declare-fun d!80355 () Bool)

(declare-fun res!318532 () Bool)

(declare-fun e!303697 () Bool)

(assert (=> d!80355 (=> res!318532 e!303697)))

(assert (=> d!80355 (= res!318532 (= (select (arr!15946 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!80355 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!303697)))

(declare-fun b!520476 () Bool)

(declare-fun e!303698 () Bool)

(assert (=> b!520476 (= e!303697 e!303698)))

(declare-fun res!318533 () Bool)

(assert (=> b!520476 (=> (not res!318533) (not e!303698))))

(assert (=> b!520476 (= res!318533 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16310 a!3235)))))

(declare-fun b!520477 () Bool)

(assert (=> b!520477 (= e!303698 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80355 (not res!318532)) b!520476))

(assert (= (and b!520476 res!318533) b!520477))

(declare-fun m!501701 () Bool)

(assert (=> d!80355 m!501701))

(declare-fun m!501703 () Bool)

(assert (=> b!520477 m!501703))

(assert (=> b!520236 d!80355))

(declare-fun d!80357 () Bool)

(assert (=> d!80357 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47288 d!80357))

(declare-fun d!80365 () Bool)

(assert (=> d!80365 (= (array_inv!11805 a!3235) (bvsge (size!16310 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47288 d!80365))

(declare-fun b!520541 () Bool)

(declare-fun e!303741 () Bool)

(declare-fun call!31784 () Bool)

(assert (=> b!520541 (= e!303741 call!31784)))

(declare-fun b!520542 () Bool)

(declare-fun e!303740 () Bool)

(assert (=> b!520542 (= e!303740 e!303741)))

(declare-fun c!61291 () Bool)

(assert (=> b!520542 (= c!61291 (validKeyInArray!0 (select (arr!15946 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!520543 () Bool)

(assert (=> b!520543 (= e!303741 call!31784)))

(declare-fun b!520544 () Bool)

(declare-fun e!303738 () Bool)

(assert (=> b!520544 (= e!303738 e!303740)))

(declare-fun res!318563 () Bool)

(assert (=> b!520544 (=> (not res!318563) (not e!303740))))

(declare-fun e!303739 () Bool)

(assert (=> b!520544 (= res!318563 (not e!303739))))

(declare-fun res!318562 () Bool)

(assert (=> b!520544 (=> (not res!318562) (not e!303739))))

(assert (=> b!520544 (= res!318562 (validKeyInArray!0 (select (arr!15946 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80367 () Bool)

(declare-fun res!318561 () Bool)

(assert (=> d!80367 (=> res!318561 e!303738)))

(assert (=> d!80367 (= res!318561 (bvsge #b00000000000000000000000000000000 (size!16310 a!3235)))))

(assert (=> d!80367 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10008) e!303738)))

(declare-fun bm!31781 () Bool)

(assert (=> bm!31781 (= call!31784 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61291 (Cons!10007 (select (arr!15946 a!3235) #b00000000000000000000000000000000) Nil!10008) Nil!10008)))))

(declare-fun b!520545 () Bool)

(declare-fun contains!2740 (List!10011 (_ BitVec 64)) Bool)

(assert (=> b!520545 (= e!303739 (contains!2740 Nil!10008 (select (arr!15946 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80367 (not res!318561)) b!520544))

(assert (= (and b!520544 res!318562) b!520545))

(assert (= (and b!520544 res!318563) b!520542))

(assert (= (and b!520542 c!61291) b!520543))

(assert (= (and b!520542 (not c!61291)) b!520541))

(assert (= (or b!520543 b!520541) bm!31781))

(assert (=> b!520542 m!501701))

(assert (=> b!520542 m!501701))

(declare-fun m!501729 () Bool)

(assert (=> b!520542 m!501729))

(assert (=> b!520544 m!501701))

(assert (=> b!520544 m!501701))

(assert (=> b!520544 m!501729))

(assert (=> bm!31781 m!501701))

(declare-fun m!501731 () Bool)

(assert (=> bm!31781 m!501731))

(assert (=> b!520545 m!501701))

(assert (=> b!520545 m!501701))

(declare-fun m!501733 () Bool)

(assert (=> b!520545 m!501733))

(assert (=> b!520234 d!80367))

(declare-fun d!80377 () Bool)

(assert (=> d!80377 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!520229 d!80377))

(declare-fun b!520550 () Bool)

(declare-fun e!303745 () Bool)

(declare-fun call!31786 () Bool)

(assert (=> b!520550 (= e!303745 call!31786)))

(declare-fun b!520551 () Bool)

(declare-fun e!303747 () Bool)

(assert (=> b!520551 (= e!303747 e!303745)))

(declare-fun c!61293 () Bool)

(assert (=> b!520551 (= c!61293 (validKeyInArray!0 (select (arr!15946 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!520552 () Bool)

(declare-fun e!303746 () Bool)

(assert (=> b!520552 (= e!303745 e!303746)))

(declare-fun lt!238457 () (_ BitVec 64))

(assert (=> b!520552 (= lt!238457 (select (arr!15946 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!238455 () Unit!16087)

(assert (=> b!520552 (= lt!238455 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!238457 #b00000000000000000000000000000000))))

(assert (=> b!520552 (arrayContainsKey!0 a!3235 lt!238457 #b00000000000000000000000000000000)))

(declare-fun lt!238456 () Unit!16087)

(assert (=> b!520552 (= lt!238456 lt!238455)))

(declare-fun res!318567 () Bool)

(assert (=> b!520552 (= res!318567 (= (seekEntryOrOpen!0 (select (arr!15946 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4369 #b00000000000000000000000000000000)))))

(assert (=> b!520552 (=> (not res!318567) (not e!303746))))

(declare-fun bm!31783 () Bool)

(assert (=> bm!31783 (= call!31786 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!520553 () Bool)

(assert (=> b!520553 (= e!303746 call!31786)))

(declare-fun d!80379 () Bool)

(declare-fun res!318566 () Bool)

(assert (=> d!80379 (=> res!318566 e!303747)))

(assert (=> d!80379 (= res!318566 (bvsge #b00000000000000000000000000000000 (size!16310 a!3235)))))

(assert (=> d!80379 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!303747)))

(assert (= (and d!80379 (not res!318566)) b!520551))

(assert (= (and b!520551 c!61293) b!520552))

(assert (= (and b!520551 (not c!61293)) b!520550))

(assert (= (and b!520552 res!318567) b!520553))

(assert (= (or b!520553 b!520550) bm!31783))

(assert (=> b!520551 m!501701))

(assert (=> b!520551 m!501701))

(assert (=> b!520551 m!501729))

(assert (=> b!520552 m!501701))

(declare-fun m!501741 () Bool)

(assert (=> b!520552 m!501741))

(declare-fun m!501743 () Bool)

(assert (=> b!520552 m!501743))

(assert (=> b!520552 m!501701))

(declare-fun m!501745 () Bool)

(assert (=> b!520552 m!501745))

(declare-fun m!501747 () Bool)

(assert (=> bm!31783 m!501747))

(assert (=> b!520224 d!80379))

(check-sat (not b!520544) (not b!520369) (not b!520438) (not b!520551) (not bm!31781) (not b!520348) (not b!520477) (not d!80327) (not d!80341) (not b!520542) (not d!80351) (not b!520447) (not b!520416) (not b!520358) (not d!80329) (not d!80313) (not b!520552) (not bm!31773) (not d!80323) (not b!520359) (not b!520545) (not d!80353) (not bm!31783) (not b!520453))
(check-sat)
