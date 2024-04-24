; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46604 () Bool)

(assert start!46604)

(declare-fun b!514632 () Bool)

(declare-fun e!300519 () Bool)

(declare-fun e!300517 () Bool)

(assert (=> b!514632 (= e!300519 e!300517)))

(declare-fun res!314436 () Bool)

(assert (=> b!514632 (=> (not res!314436) (not e!300517))))

(declare-datatypes ((SeekEntryResult!4279 0))(
  ( (MissingZero!4279 (index!19304 (_ BitVec 32))) (Found!4279 (index!19305 (_ BitVec 32))) (Intermediate!4279 (undefined!5091 Bool) (index!19306 (_ BitVec 32)) (x!48417 (_ BitVec 32))) (Undefined!4279) (MissingVacant!4279 (index!19307 (_ BitVec 32))) )
))
(declare-fun lt!235640 () SeekEntryResult!4279)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!514632 (= res!314436 (or (= lt!235640 (MissingZero!4279 i!1204)) (= lt!235640 (MissingVacant!4279 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32974 0))(
  ( (array!32975 (arr!15856 (Array (_ BitVec 32) (_ BitVec 64))) (size!16220 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32974)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32974 (_ BitVec 32)) SeekEntryResult!4279)

(assert (=> b!514632 (= lt!235640 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!514633 () Bool)

(declare-fun e!300516 () Bool)

(assert (=> b!514633 (= e!300517 (not e!300516))))

(declare-fun res!314441 () Bool)

(assert (=> b!514633 (=> res!314441 e!300516)))

(declare-fun lt!235638 () SeekEntryResult!4279)

(declare-fun lt!235641 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32974 (_ BitVec 32)) SeekEntryResult!4279)

(assert (=> b!514633 (= res!314441 (= lt!235638 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235641 (select (store (arr!15856 a!3235) i!1204 k0!2280) j!176) (array!32975 (store (arr!15856 a!3235) i!1204 k0!2280) (size!16220 a!3235)) mask!3524)))))

(declare-fun lt!235639 () (_ BitVec 32))

(assert (=> b!514633 (= lt!235638 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235639 (select (arr!15856 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!514633 (= lt!235641 (toIndex!0 (select (store (arr!15856 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!514633 (= lt!235639 (toIndex!0 (select (arr!15856 a!3235) j!176) mask!3524))))

(declare-fun e!300515 () Bool)

(assert (=> b!514633 e!300515))

(declare-fun res!314443 () Bool)

(assert (=> b!514633 (=> (not res!314443) (not e!300515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32974 (_ BitVec 32)) Bool)

(assert (=> b!514633 (= res!314443 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15877 0))(
  ( (Unit!15878) )
))
(declare-fun lt!235642 () Unit!15877)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32974 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15877)

(assert (=> b!514633 (= lt!235642 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!514634 () Bool)

(declare-fun res!314437 () Bool)

(assert (=> b!514634 (=> res!314437 e!300516)))

(get-info :version)

(assert (=> b!514634 (= res!314437 (or (undefined!5091 lt!235638) (not ((_ is Intermediate!4279) lt!235638))))))

(declare-fun b!514635 () Bool)

(declare-fun res!314438 () Bool)

(assert (=> b!514635 (=> (not res!314438) (not e!300519))))

(declare-fun arrayContainsKey!0 (array!32974 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!514635 (= res!314438 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!314435 () Bool)

(assert (=> start!46604 (=> (not res!314435) (not e!300519))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46604 (= res!314435 (validMask!0 mask!3524))))

(assert (=> start!46604 e!300519))

(assert (=> start!46604 true))

(declare-fun array_inv!11715 (array!32974) Bool)

(assert (=> start!46604 (array_inv!11715 a!3235)))

(declare-fun b!514636 () Bool)

(declare-fun res!314433 () Bool)

(assert (=> b!514636 (=> (not res!314433) (not e!300519))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!514636 (= res!314433 (validKeyInArray!0 (select (arr!15856 a!3235) j!176)))))

(declare-fun b!514637 () Bool)

(assert (=> b!514637 (= e!300515 (= (seekEntryOrOpen!0 (select (arr!15856 a!3235) j!176) a!3235 mask!3524) (Found!4279 j!176)))))

(declare-fun b!514638 () Bool)

(declare-fun res!314439 () Bool)

(assert (=> b!514638 (=> (not res!314439) (not e!300519))))

(assert (=> b!514638 (= res!314439 (and (= (size!16220 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16220 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16220 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!514639 () Bool)

(declare-fun res!314434 () Bool)

(assert (=> b!514639 (=> (not res!314434) (not e!300517))))

(assert (=> b!514639 (= res!314434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!514640 () Bool)

(declare-fun res!314442 () Bool)

(assert (=> b!514640 (=> (not res!314442) (not e!300519))))

(assert (=> b!514640 (= res!314442 (validKeyInArray!0 k0!2280))))

(declare-fun b!514641 () Bool)

(assert (=> b!514641 (= e!300516 (and (bvsge (index!19306 lt!235638) #b00000000000000000000000000000000) (bvslt (index!19306 lt!235638) (size!16220 a!3235))))))

(assert (=> b!514641 (and (bvslt (x!48417 lt!235638) #b01111111111111111111111111111110) (or (= (select (arr!15856 a!3235) (index!19306 lt!235638)) (select (arr!15856 a!3235) j!176)) (= (select (arr!15856 a!3235) (index!19306 lt!235638)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15856 a!3235) (index!19306 lt!235638)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!514642 () Bool)

(declare-fun res!314440 () Bool)

(assert (=> b!514642 (=> (not res!314440) (not e!300517))))

(declare-datatypes ((List!9921 0))(
  ( (Nil!9918) (Cons!9917 (h!10812 (_ BitVec 64)) (t!16141 List!9921)) )
))
(declare-fun arrayNoDuplicates!0 (array!32974 (_ BitVec 32) List!9921) Bool)

(assert (=> b!514642 (= res!314440 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9918))))

(assert (= (and start!46604 res!314435) b!514638))

(assert (= (and b!514638 res!314439) b!514636))

(assert (= (and b!514636 res!314433) b!514640))

(assert (= (and b!514640 res!314442) b!514635))

(assert (= (and b!514635 res!314438) b!514632))

(assert (= (and b!514632 res!314436) b!514639))

(assert (= (and b!514639 res!314434) b!514642))

(assert (= (and b!514642 res!314440) b!514633))

(assert (= (and b!514633 res!314443) b!514637))

(assert (= (and b!514633 (not res!314441)) b!514634))

(assert (= (and b!514634 (not res!314437)) b!514641))

(declare-fun m!496231 () Bool)

(assert (=> b!514640 m!496231))

(declare-fun m!496233 () Bool)

(assert (=> b!514633 m!496233))

(declare-fun m!496235 () Bool)

(assert (=> b!514633 m!496235))

(declare-fun m!496237 () Bool)

(assert (=> b!514633 m!496237))

(declare-fun m!496239 () Bool)

(assert (=> b!514633 m!496239))

(declare-fun m!496241 () Bool)

(assert (=> b!514633 m!496241))

(assert (=> b!514633 m!496239))

(declare-fun m!496243 () Bool)

(assert (=> b!514633 m!496243))

(assert (=> b!514633 m!496239))

(declare-fun m!496245 () Bool)

(assert (=> b!514633 m!496245))

(assert (=> b!514633 m!496237))

(declare-fun m!496247 () Bool)

(assert (=> b!514633 m!496247))

(assert (=> b!514633 m!496237))

(declare-fun m!496249 () Bool)

(assert (=> b!514633 m!496249))

(declare-fun m!496251 () Bool)

(assert (=> b!514635 m!496251))

(declare-fun m!496253 () Bool)

(assert (=> b!514632 m!496253))

(declare-fun m!496255 () Bool)

(assert (=> b!514642 m!496255))

(assert (=> b!514637 m!496239))

(assert (=> b!514637 m!496239))

(declare-fun m!496257 () Bool)

(assert (=> b!514637 m!496257))

(declare-fun m!496259 () Bool)

(assert (=> b!514641 m!496259))

(assert (=> b!514641 m!496239))

(assert (=> b!514636 m!496239))

(assert (=> b!514636 m!496239))

(declare-fun m!496261 () Bool)

(assert (=> b!514636 m!496261))

(declare-fun m!496263 () Bool)

(assert (=> b!514639 m!496263))

(declare-fun m!496265 () Bool)

(assert (=> start!46604 m!496265))

(declare-fun m!496267 () Bool)

(assert (=> start!46604 m!496267))

(check-sat (not b!514635) (not start!46604) (not b!514640) (not b!514639) (not b!514632) (not b!514636) (not b!514633) (not b!514642) (not b!514637))
(check-sat)
(get-model)

(declare-fun bm!31605 () Bool)

(declare-fun call!31608 () Bool)

(assert (=> bm!31605 (= call!31608 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!514717 () Bool)

(declare-fun e!300557 () Bool)

(declare-fun e!300558 () Bool)

(assert (=> b!514717 (= e!300557 e!300558)))

(declare-fun lt!235681 () (_ BitVec 64))

(assert (=> b!514717 (= lt!235681 (select (arr!15856 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!235679 () Unit!15877)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32974 (_ BitVec 64) (_ BitVec 32)) Unit!15877)

(assert (=> b!514717 (= lt!235679 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235681 #b00000000000000000000000000000000))))

(assert (=> b!514717 (arrayContainsKey!0 a!3235 lt!235681 #b00000000000000000000000000000000)))

(declare-fun lt!235680 () Unit!15877)

(assert (=> b!514717 (= lt!235680 lt!235679)))

(declare-fun res!314514 () Bool)

(assert (=> b!514717 (= res!314514 (= (seekEntryOrOpen!0 (select (arr!15856 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4279 #b00000000000000000000000000000000)))))

(assert (=> b!514717 (=> (not res!314514) (not e!300558))))

(declare-fun b!514718 () Bool)

(assert (=> b!514718 (= e!300557 call!31608)))

(declare-fun d!79485 () Bool)

(declare-fun res!314515 () Bool)

(declare-fun e!300556 () Bool)

(assert (=> d!79485 (=> res!314515 e!300556)))

(assert (=> d!79485 (= res!314515 (bvsge #b00000000000000000000000000000000 (size!16220 a!3235)))))

(assert (=> d!79485 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!300556)))

(declare-fun b!514719 () Bool)

(assert (=> b!514719 (= e!300556 e!300557)))

(declare-fun c!60389 () Bool)

(assert (=> b!514719 (= c!60389 (validKeyInArray!0 (select (arr!15856 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!514720 () Bool)

(assert (=> b!514720 (= e!300558 call!31608)))

(assert (= (and d!79485 (not res!314515)) b!514719))

(assert (= (and b!514719 c!60389) b!514717))

(assert (= (and b!514719 (not c!60389)) b!514718))

(assert (= (and b!514717 res!314514) b!514720))

(assert (= (or b!514720 b!514718) bm!31605))

(declare-fun m!496345 () Bool)

(assert (=> bm!31605 m!496345))

(declare-fun m!496347 () Bool)

(assert (=> b!514717 m!496347))

(declare-fun m!496349 () Bool)

(assert (=> b!514717 m!496349))

(declare-fun m!496351 () Bool)

(assert (=> b!514717 m!496351))

(assert (=> b!514717 m!496347))

(declare-fun m!496353 () Bool)

(assert (=> b!514717 m!496353))

(assert (=> b!514719 m!496347))

(assert (=> b!514719 m!496347))

(declare-fun m!496355 () Bool)

(assert (=> b!514719 m!496355))

(assert (=> b!514639 d!79485))

(declare-fun d!79487 () Bool)

(assert (=> d!79487 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!514640 d!79487))

(declare-fun d!79489 () Bool)

(declare-fun res!314520 () Bool)

(declare-fun e!300563 () Bool)

(assert (=> d!79489 (=> res!314520 e!300563)))

(assert (=> d!79489 (= res!314520 (= (select (arr!15856 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79489 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!300563)))

(declare-fun b!514725 () Bool)

(declare-fun e!300564 () Bool)

(assert (=> b!514725 (= e!300563 e!300564)))

(declare-fun res!314521 () Bool)

(assert (=> b!514725 (=> (not res!314521) (not e!300564))))

(assert (=> b!514725 (= res!314521 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16220 a!3235)))))

(declare-fun b!514726 () Bool)

(assert (=> b!514726 (= e!300564 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79489 (not res!314520)) b!514725))

(assert (= (and b!514725 res!314521) b!514726))

(assert (=> d!79489 m!496347))

(declare-fun m!496357 () Bool)

(assert (=> b!514726 m!496357))

(assert (=> b!514635 d!79489))

(declare-fun d!79491 () Bool)

(assert (=> d!79491 (= (validKeyInArray!0 (select (arr!15856 a!3235) j!176)) (and (not (= (select (arr!15856 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15856 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!514636 d!79491))

(declare-fun b!514737 () Bool)

(declare-fun e!300576 () Bool)

(declare-fun call!31611 () Bool)

(assert (=> b!514737 (= e!300576 call!31611)))

(declare-fun b!514738 () Bool)

(assert (=> b!514738 (= e!300576 call!31611)))

(declare-fun b!514739 () Bool)

(declare-fun e!300575 () Bool)

(assert (=> b!514739 (= e!300575 e!300576)))

(declare-fun c!60392 () Bool)

(assert (=> b!514739 (= c!60392 (validKeyInArray!0 (select (arr!15856 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!514740 () Bool)

(declare-fun e!300573 () Bool)

(declare-fun contains!2716 (List!9921 (_ BitVec 64)) Bool)

(assert (=> b!514740 (= e!300573 (contains!2716 Nil!9918 (select (arr!15856 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79493 () Bool)

(declare-fun res!314529 () Bool)

(declare-fun e!300574 () Bool)

(assert (=> d!79493 (=> res!314529 e!300574)))

(assert (=> d!79493 (= res!314529 (bvsge #b00000000000000000000000000000000 (size!16220 a!3235)))))

(assert (=> d!79493 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9918) e!300574)))

(declare-fun bm!31608 () Bool)

(assert (=> bm!31608 (= call!31611 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60392 (Cons!9917 (select (arr!15856 a!3235) #b00000000000000000000000000000000) Nil!9918) Nil!9918)))))

(declare-fun b!514741 () Bool)

(assert (=> b!514741 (= e!300574 e!300575)))

(declare-fun res!314530 () Bool)

(assert (=> b!514741 (=> (not res!314530) (not e!300575))))

(assert (=> b!514741 (= res!314530 (not e!300573))))

(declare-fun res!314528 () Bool)

(assert (=> b!514741 (=> (not res!314528) (not e!300573))))

(assert (=> b!514741 (= res!314528 (validKeyInArray!0 (select (arr!15856 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79493 (not res!314529)) b!514741))

(assert (= (and b!514741 res!314528) b!514740))

(assert (= (and b!514741 res!314530) b!514739))

(assert (= (and b!514739 c!60392) b!514738))

(assert (= (and b!514739 (not c!60392)) b!514737))

(assert (= (or b!514738 b!514737) bm!31608))

(assert (=> b!514739 m!496347))

(assert (=> b!514739 m!496347))

(assert (=> b!514739 m!496355))

(assert (=> b!514740 m!496347))

(assert (=> b!514740 m!496347))

(declare-fun m!496359 () Bool)

(assert (=> b!514740 m!496359))

(assert (=> bm!31608 m!496347))

(declare-fun m!496361 () Bool)

(assert (=> bm!31608 m!496361))

(assert (=> b!514741 m!496347))

(assert (=> b!514741 m!496347))

(assert (=> b!514741 m!496355))

(assert (=> b!514642 d!79493))

(declare-fun d!79495 () Bool)

(assert (=> d!79495 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46604 d!79495))

(declare-fun d!79497 () Bool)

(assert (=> d!79497 (= (array_inv!11715 a!3235) (bvsge (size!16220 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46604 d!79497))

(declare-fun b!514775 () Bool)

(declare-fun e!300603 () SeekEntryResult!4279)

(declare-fun e!300602 () SeekEntryResult!4279)

(assert (=> b!514775 (= e!300603 e!300602)))

(declare-fun lt!235694 () (_ BitVec 64))

(declare-fun lt!235695 () SeekEntryResult!4279)

(assert (=> b!514775 (= lt!235694 (select (arr!15856 a!3235) (index!19306 lt!235695)))))

(declare-fun c!60404 () Bool)

(assert (=> b!514775 (= c!60404 (= lt!235694 (select (arr!15856 a!3235) j!176)))))

(declare-fun b!514776 () Bool)

(declare-fun e!300601 () SeekEntryResult!4279)

(assert (=> b!514776 (= e!300601 (MissingZero!4279 (index!19306 lt!235695)))))

(declare-fun b!514777 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32974 (_ BitVec 32)) SeekEntryResult!4279)

(assert (=> b!514777 (= e!300601 (seekKeyOrZeroReturnVacant!0 (x!48417 lt!235695) (index!19306 lt!235695) (index!19306 lt!235695) (select (arr!15856 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!514778 () Bool)

(assert (=> b!514778 (= e!300603 Undefined!4279)))

(declare-fun d!79499 () Bool)

(declare-fun lt!235696 () SeekEntryResult!4279)

(assert (=> d!79499 (and (or ((_ is Undefined!4279) lt!235696) (not ((_ is Found!4279) lt!235696)) (and (bvsge (index!19305 lt!235696) #b00000000000000000000000000000000) (bvslt (index!19305 lt!235696) (size!16220 a!3235)))) (or ((_ is Undefined!4279) lt!235696) ((_ is Found!4279) lt!235696) (not ((_ is MissingZero!4279) lt!235696)) (and (bvsge (index!19304 lt!235696) #b00000000000000000000000000000000) (bvslt (index!19304 lt!235696) (size!16220 a!3235)))) (or ((_ is Undefined!4279) lt!235696) ((_ is Found!4279) lt!235696) ((_ is MissingZero!4279) lt!235696) (not ((_ is MissingVacant!4279) lt!235696)) (and (bvsge (index!19307 lt!235696) #b00000000000000000000000000000000) (bvslt (index!19307 lt!235696) (size!16220 a!3235)))) (or ((_ is Undefined!4279) lt!235696) (ite ((_ is Found!4279) lt!235696) (= (select (arr!15856 a!3235) (index!19305 lt!235696)) (select (arr!15856 a!3235) j!176)) (ite ((_ is MissingZero!4279) lt!235696) (= (select (arr!15856 a!3235) (index!19304 lt!235696)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4279) lt!235696) (= (select (arr!15856 a!3235) (index!19307 lt!235696)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79499 (= lt!235696 e!300603)))

(declare-fun c!60402 () Bool)

(assert (=> d!79499 (= c!60402 (and ((_ is Intermediate!4279) lt!235695) (undefined!5091 lt!235695)))))

(assert (=> d!79499 (= lt!235695 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15856 a!3235) j!176) mask!3524) (select (arr!15856 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79499 (validMask!0 mask!3524)))

(assert (=> d!79499 (= (seekEntryOrOpen!0 (select (arr!15856 a!3235) j!176) a!3235 mask!3524) lt!235696)))

(declare-fun b!514779 () Bool)

(assert (=> b!514779 (= e!300602 (Found!4279 (index!19306 lt!235695)))))

(declare-fun b!514780 () Bool)

(declare-fun c!60403 () Bool)

(assert (=> b!514780 (= c!60403 (= lt!235694 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514780 (= e!300602 e!300601)))

(assert (= (and d!79499 c!60402) b!514778))

(assert (= (and d!79499 (not c!60402)) b!514775))

(assert (= (and b!514775 c!60404) b!514779))

(assert (= (and b!514775 (not c!60404)) b!514780))

(assert (= (and b!514780 c!60403) b!514776))

(assert (= (and b!514780 (not c!60403)) b!514777))

(declare-fun m!496373 () Bool)

(assert (=> b!514775 m!496373))

(assert (=> b!514777 m!496239))

(declare-fun m!496375 () Bool)

(assert (=> b!514777 m!496375))

(assert (=> d!79499 m!496243))

(assert (=> d!79499 m!496239))

(declare-fun m!496377 () Bool)

(assert (=> d!79499 m!496377))

(declare-fun m!496379 () Bool)

(assert (=> d!79499 m!496379))

(assert (=> d!79499 m!496265))

(assert (=> d!79499 m!496239))

(assert (=> d!79499 m!496243))

(declare-fun m!496381 () Bool)

(assert (=> d!79499 m!496381))

(declare-fun m!496383 () Bool)

(assert (=> d!79499 m!496383))

(assert (=> b!514637 d!79499))

(declare-fun b!514781 () Bool)

(declare-fun e!300606 () SeekEntryResult!4279)

(declare-fun e!300605 () SeekEntryResult!4279)

(assert (=> b!514781 (= e!300606 e!300605)))

(declare-fun lt!235697 () (_ BitVec 64))

(declare-fun lt!235698 () SeekEntryResult!4279)

(assert (=> b!514781 (= lt!235697 (select (arr!15856 a!3235) (index!19306 lt!235698)))))

(declare-fun c!60407 () Bool)

(assert (=> b!514781 (= c!60407 (= lt!235697 k0!2280))))

(declare-fun b!514782 () Bool)

(declare-fun e!300604 () SeekEntryResult!4279)

(assert (=> b!514782 (= e!300604 (MissingZero!4279 (index!19306 lt!235698)))))

(declare-fun b!514783 () Bool)

(assert (=> b!514783 (= e!300604 (seekKeyOrZeroReturnVacant!0 (x!48417 lt!235698) (index!19306 lt!235698) (index!19306 lt!235698) k0!2280 a!3235 mask!3524))))

(declare-fun b!514784 () Bool)

(assert (=> b!514784 (= e!300606 Undefined!4279)))

(declare-fun d!79513 () Bool)

(declare-fun lt!235699 () SeekEntryResult!4279)

(assert (=> d!79513 (and (or ((_ is Undefined!4279) lt!235699) (not ((_ is Found!4279) lt!235699)) (and (bvsge (index!19305 lt!235699) #b00000000000000000000000000000000) (bvslt (index!19305 lt!235699) (size!16220 a!3235)))) (or ((_ is Undefined!4279) lt!235699) ((_ is Found!4279) lt!235699) (not ((_ is MissingZero!4279) lt!235699)) (and (bvsge (index!19304 lt!235699) #b00000000000000000000000000000000) (bvslt (index!19304 lt!235699) (size!16220 a!3235)))) (or ((_ is Undefined!4279) lt!235699) ((_ is Found!4279) lt!235699) ((_ is MissingZero!4279) lt!235699) (not ((_ is MissingVacant!4279) lt!235699)) (and (bvsge (index!19307 lt!235699) #b00000000000000000000000000000000) (bvslt (index!19307 lt!235699) (size!16220 a!3235)))) (or ((_ is Undefined!4279) lt!235699) (ite ((_ is Found!4279) lt!235699) (= (select (arr!15856 a!3235) (index!19305 lt!235699)) k0!2280) (ite ((_ is MissingZero!4279) lt!235699) (= (select (arr!15856 a!3235) (index!19304 lt!235699)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4279) lt!235699) (= (select (arr!15856 a!3235) (index!19307 lt!235699)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79513 (= lt!235699 e!300606)))

(declare-fun c!60405 () Bool)

(assert (=> d!79513 (= c!60405 (and ((_ is Intermediate!4279) lt!235698) (undefined!5091 lt!235698)))))

(assert (=> d!79513 (= lt!235698 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79513 (validMask!0 mask!3524)))

(assert (=> d!79513 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!235699)))

(declare-fun b!514785 () Bool)

(assert (=> b!514785 (= e!300605 (Found!4279 (index!19306 lt!235698)))))

(declare-fun b!514786 () Bool)

(declare-fun c!60406 () Bool)

(assert (=> b!514786 (= c!60406 (= lt!235697 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514786 (= e!300605 e!300604)))

(assert (= (and d!79513 c!60405) b!514784))

(assert (= (and d!79513 (not c!60405)) b!514781))

(assert (= (and b!514781 c!60407) b!514785))

(assert (= (and b!514781 (not c!60407)) b!514786))

(assert (= (and b!514786 c!60406) b!514782))

(assert (= (and b!514786 (not c!60406)) b!514783))

(declare-fun m!496385 () Bool)

(assert (=> b!514781 m!496385))

(declare-fun m!496387 () Bool)

(assert (=> b!514783 m!496387))

(declare-fun m!496389 () Bool)

(assert (=> d!79513 m!496389))

(declare-fun m!496391 () Bool)

(assert (=> d!79513 m!496391))

(declare-fun m!496393 () Bool)

(assert (=> d!79513 m!496393))

(assert (=> d!79513 m!496265))

(assert (=> d!79513 m!496389))

(declare-fun m!496395 () Bool)

(assert (=> d!79513 m!496395))

(declare-fun m!496397 () Bool)

(assert (=> d!79513 m!496397))

(assert (=> b!514632 d!79513))

(declare-fun b!514862 () Bool)

(declare-fun e!300650 () SeekEntryResult!4279)

(assert (=> b!514862 (= e!300650 (Intermediate!4279 false lt!235639 #b00000000000000000000000000000000))))

(declare-fun b!514863 () Bool)

(declare-fun e!300653 () Bool)

(declare-fun lt!235729 () SeekEntryResult!4279)

(assert (=> b!514863 (= e!300653 (bvsge (x!48417 lt!235729) #b01111111111111111111111111111110))))

(declare-fun b!514864 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!514864 (= e!300650 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235639 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (arr!15856 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!514865 () Bool)

(declare-fun e!300654 () SeekEntryResult!4279)

(assert (=> b!514865 (= e!300654 (Intermediate!4279 true lt!235639 #b00000000000000000000000000000000))))

(declare-fun b!514866 () Bool)

(assert (=> b!514866 (and (bvsge (index!19306 lt!235729) #b00000000000000000000000000000000) (bvslt (index!19306 lt!235729) (size!16220 a!3235)))))

(declare-fun res!314571 () Bool)

(assert (=> b!514866 (= res!314571 (= (select (arr!15856 a!3235) (index!19306 lt!235729)) (select (arr!15856 a!3235) j!176)))))

(declare-fun e!300652 () Bool)

(assert (=> b!514866 (=> res!314571 e!300652)))

(declare-fun e!300651 () Bool)

(assert (=> b!514866 (= e!300651 e!300652)))

(declare-fun b!514867 () Bool)

(assert (=> b!514867 (and (bvsge (index!19306 lt!235729) #b00000000000000000000000000000000) (bvslt (index!19306 lt!235729) (size!16220 a!3235)))))

(declare-fun res!314570 () Bool)

(assert (=> b!514867 (= res!314570 (= (select (arr!15856 a!3235) (index!19306 lt!235729)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514867 (=> res!314570 e!300652)))

(declare-fun b!514868 () Bool)

(assert (=> b!514868 (= e!300654 e!300650)))

(declare-fun c!60435 () Bool)

(declare-fun lt!235728 () (_ BitVec 64))

(assert (=> b!514868 (= c!60435 (or (= lt!235728 (select (arr!15856 a!3235) j!176)) (= (bvadd lt!235728 lt!235728) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!79515 () Bool)

(assert (=> d!79515 e!300653))

(declare-fun c!60436 () Bool)

(assert (=> d!79515 (= c!60436 (and ((_ is Intermediate!4279) lt!235729) (undefined!5091 lt!235729)))))

(assert (=> d!79515 (= lt!235729 e!300654)))

(declare-fun c!60437 () Bool)

(assert (=> d!79515 (= c!60437 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79515 (= lt!235728 (select (arr!15856 a!3235) lt!235639))))

(assert (=> d!79515 (validMask!0 mask!3524)))

(assert (=> d!79515 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235639 (select (arr!15856 a!3235) j!176) a!3235 mask!3524) lt!235729)))

(declare-fun b!514869 () Bool)

(assert (=> b!514869 (and (bvsge (index!19306 lt!235729) #b00000000000000000000000000000000) (bvslt (index!19306 lt!235729) (size!16220 a!3235)))))

(assert (=> b!514869 (= e!300652 (= (select (arr!15856 a!3235) (index!19306 lt!235729)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!514870 () Bool)

(assert (=> b!514870 (= e!300653 e!300651)))

(declare-fun res!314569 () Bool)

(assert (=> b!514870 (= res!314569 (and ((_ is Intermediate!4279) lt!235729) (not (undefined!5091 lt!235729)) (bvslt (x!48417 lt!235729) #b01111111111111111111111111111110) (bvsge (x!48417 lt!235729) #b00000000000000000000000000000000) (bvsge (x!48417 lt!235729) #b00000000000000000000000000000000)))))

(assert (=> b!514870 (=> (not res!314569) (not e!300651))))

(assert (= (and d!79515 c!60437) b!514865))

(assert (= (and d!79515 (not c!60437)) b!514868))

(assert (= (and b!514868 c!60435) b!514862))

(assert (= (and b!514868 (not c!60435)) b!514864))

(assert (= (and d!79515 c!60436) b!514863))

(assert (= (and d!79515 (not c!60436)) b!514870))

(assert (= (and b!514870 res!314569) b!514866))

(assert (= (and b!514866 (not res!314571)) b!514867))

(assert (= (and b!514867 (not res!314570)) b!514869))

(declare-fun m!496427 () Bool)

(assert (=> d!79515 m!496427))

(assert (=> d!79515 m!496265))

(declare-fun m!496429 () Bool)

(assert (=> b!514864 m!496429))

(assert (=> b!514864 m!496429))

(assert (=> b!514864 m!496239))

(declare-fun m!496431 () Bool)

(assert (=> b!514864 m!496431))

(declare-fun m!496433 () Bool)

(assert (=> b!514867 m!496433))

(assert (=> b!514866 m!496433))

(assert (=> b!514869 m!496433))

(assert (=> b!514633 d!79515))

(declare-fun d!79523 () Bool)

(declare-fun lt!235748 () (_ BitVec 32))

(declare-fun lt!235747 () (_ BitVec 32))

(assert (=> d!79523 (= lt!235748 (bvmul (bvxor lt!235747 (bvlshr lt!235747 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79523 (= lt!235747 ((_ extract 31 0) (bvand (bvxor (select (arr!15856 a!3235) j!176) (bvlshr (select (arr!15856 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79523 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314575 (let ((h!10817 ((_ extract 31 0) (bvand (bvxor (select (arr!15856 a!3235) j!176) (bvlshr (select (arr!15856 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48424 (bvmul (bvxor h!10817 (bvlshr h!10817 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48424 (bvlshr x!48424 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314575 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314575 #b00000000000000000000000000000000))))))

(assert (=> d!79523 (= (toIndex!0 (select (arr!15856 a!3235) j!176) mask!3524) (bvand (bvxor lt!235748 (bvlshr lt!235748 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!514633 d!79523))

(declare-fun d!79533 () Bool)

(assert (=> d!79533 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!235754 () Unit!15877)

(declare-fun choose!38 (array!32974 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15877)

(assert (=> d!79533 (= lt!235754 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79533 (validMask!0 mask!3524)))

(assert (=> d!79533 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!235754)))

(declare-fun bs!16290 () Bool)

(assert (= bs!16290 d!79533))

(assert (=> bs!16290 m!496245))

(declare-fun m!496457 () Bool)

(assert (=> bs!16290 m!496457))

(assert (=> bs!16290 m!496265))

(assert (=> b!514633 d!79533))

(declare-fun d!79539 () Bool)

(declare-fun lt!235756 () (_ BitVec 32))

(declare-fun lt!235755 () (_ BitVec 32))

(assert (=> d!79539 (= lt!235756 (bvmul (bvxor lt!235755 (bvlshr lt!235755 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79539 (= lt!235755 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15856 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15856 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79539 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314575 (let ((h!10817 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15856 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15856 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48424 (bvmul (bvxor h!10817 (bvlshr h!10817 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48424 (bvlshr x!48424 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314575 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314575 #b00000000000000000000000000000000))))))

(assert (=> d!79539 (= (toIndex!0 (select (store (arr!15856 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!235756 (bvlshr lt!235756 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!514633 d!79539))

(declare-fun call!31619 () Bool)

(declare-fun bm!31616 () Bool)

(assert (=> bm!31616 (= call!31619 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!514884 () Bool)

(declare-fun e!300664 () Bool)

(declare-fun e!300665 () Bool)

(assert (=> b!514884 (= e!300664 e!300665)))

(declare-fun lt!235759 () (_ BitVec 64))

(assert (=> b!514884 (= lt!235759 (select (arr!15856 a!3235) j!176))))

(declare-fun lt!235757 () Unit!15877)

(assert (=> b!514884 (= lt!235757 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235759 j!176))))

(assert (=> b!514884 (arrayContainsKey!0 a!3235 lt!235759 #b00000000000000000000000000000000)))

(declare-fun lt!235758 () Unit!15877)

(assert (=> b!514884 (= lt!235758 lt!235757)))

(declare-fun res!314578 () Bool)

(assert (=> b!514884 (= res!314578 (= (seekEntryOrOpen!0 (select (arr!15856 a!3235) j!176) a!3235 mask!3524) (Found!4279 j!176)))))

(assert (=> b!514884 (=> (not res!314578) (not e!300665))))

(declare-fun b!514885 () Bool)

(assert (=> b!514885 (= e!300664 call!31619)))

(declare-fun d!79541 () Bool)

(declare-fun res!314579 () Bool)

(declare-fun e!300663 () Bool)

(assert (=> d!79541 (=> res!314579 e!300663)))

(assert (=> d!79541 (= res!314579 (bvsge j!176 (size!16220 a!3235)))))

(assert (=> d!79541 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!300663)))

(declare-fun b!514886 () Bool)

(assert (=> b!514886 (= e!300663 e!300664)))

(declare-fun c!60442 () Bool)

(assert (=> b!514886 (= c!60442 (validKeyInArray!0 (select (arr!15856 a!3235) j!176)))))

(declare-fun b!514887 () Bool)

(assert (=> b!514887 (= e!300665 call!31619)))

(assert (= (and d!79541 (not res!314579)) b!514886))

(assert (= (and b!514886 c!60442) b!514884))

(assert (= (and b!514886 (not c!60442)) b!514885))

(assert (= (and b!514884 res!314578) b!514887))

(assert (= (or b!514887 b!514885) bm!31616))

(declare-fun m!496459 () Bool)

(assert (=> bm!31616 m!496459))

(assert (=> b!514884 m!496239))

(declare-fun m!496461 () Bool)

(assert (=> b!514884 m!496461))

(declare-fun m!496463 () Bool)

(assert (=> b!514884 m!496463))

(assert (=> b!514884 m!496239))

(assert (=> b!514884 m!496257))

(assert (=> b!514886 m!496239))

(assert (=> b!514886 m!496239))

(assert (=> b!514886 m!496261))

(assert (=> b!514633 d!79541))

(declare-fun b!514888 () Bool)

(declare-fun e!300666 () SeekEntryResult!4279)

(assert (=> b!514888 (= e!300666 (Intermediate!4279 false lt!235641 #b00000000000000000000000000000000))))

(declare-fun b!514889 () Bool)

(declare-fun e!300669 () Bool)

(declare-fun lt!235761 () SeekEntryResult!4279)

(assert (=> b!514889 (= e!300669 (bvsge (x!48417 lt!235761) #b01111111111111111111111111111110))))

(declare-fun b!514890 () Bool)

(assert (=> b!514890 (= e!300666 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235641 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (store (arr!15856 a!3235) i!1204 k0!2280) j!176) (array!32975 (store (arr!15856 a!3235) i!1204 k0!2280) (size!16220 a!3235)) mask!3524))))

(declare-fun b!514891 () Bool)

(declare-fun e!300670 () SeekEntryResult!4279)

(assert (=> b!514891 (= e!300670 (Intermediate!4279 true lt!235641 #b00000000000000000000000000000000))))

(declare-fun b!514892 () Bool)

(assert (=> b!514892 (and (bvsge (index!19306 lt!235761) #b00000000000000000000000000000000) (bvslt (index!19306 lt!235761) (size!16220 (array!32975 (store (arr!15856 a!3235) i!1204 k0!2280) (size!16220 a!3235)))))))

(declare-fun res!314582 () Bool)

(assert (=> b!514892 (= res!314582 (= (select (arr!15856 (array!32975 (store (arr!15856 a!3235) i!1204 k0!2280) (size!16220 a!3235))) (index!19306 lt!235761)) (select (store (arr!15856 a!3235) i!1204 k0!2280) j!176)))))

(declare-fun e!300668 () Bool)

(assert (=> b!514892 (=> res!314582 e!300668)))

(declare-fun e!300667 () Bool)

(assert (=> b!514892 (= e!300667 e!300668)))

(declare-fun b!514893 () Bool)

(assert (=> b!514893 (and (bvsge (index!19306 lt!235761) #b00000000000000000000000000000000) (bvslt (index!19306 lt!235761) (size!16220 (array!32975 (store (arr!15856 a!3235) i!1204 k0!2280) (size!16220 a!3235)))))))

(declare-fun res!314581 () Bool)

(assert (=> b!514893 (= res!314581 (= (select (arr!15856 (array!32975 (store (arr!15856 a!3235) i!1204 k0!2280) (size!16220 a!3235))) (index!19306 lt!235761)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514893 (=> res!314581 e!300668)))

(declare-fun b!514894 () Bool)

(assert (=> b!514894 (= e!300670 e!300666)))

(declare-fun c!60443 () Bool)

(declare-fun lt!235760 () (_ BitVec 64))

(assert (=> b!514894 (= c!60443 (or (= lt!235760 (select (store (arr!15856 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!235760 lt!235760) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!79543 () Bool)

(assert (=> d!79543 e!300669))

(declare-fun c!60444 () Bool)

(assert (=> d!79543 (= c!60444 (and ((_ is Intermediate!4279) lt!235761) (undefined!5091 lt!235761)))))

(assert (=> d!79543 (= lt!235761 e!300670)))

(declare-fun c!60445 () Bool)

(assert (=> d!79543 (= c!60445 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79543 (= lt!235760 (select (arr!15856 (array!32975 (store (arr!15856 a!3235) i!1204 k0!2280) (size!16220 a!3235))) lt!235641))))

(assert (=> d!79543 (validMask!0 mask!3524)))

(assert (=> d!79543 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235641 (select (store (arr!15856 a!3235) i!1204 k0!2280) j!176) (array!32975 (store (arr!15856 a!3235) i!1204 k0!2280) (size!16220 a!3235)) mask!3524) lt!235761)))

(declare-fun b!514895 () Bool)

(assert (=> b!514895 (and (bvsge (index!19306 lt!235761) #b00000000000000000000000000000000) (bvslt (index!19306 lt!235761) (size!16220 (array!32975 (store (arr!15856 a!3235) i!1204 k0!2280) (size!16220 a!3235)))))))

(assert (=> b!514895 (= e!300668 (= (select (arr!15856 (array!32975 (store (arr!15856 a!3235) i!1204 k0!2280) (size!16220 a!3235))) (index!19306 lt!235761)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!514896 () Bool)

(assert (=> b!514896 (= e!300669 e!300667)))

(declare-fun res!314580 () Bool)

(assert (=> b!514896 (= res!314580 (and ((_ is Intermediate!4279) lt!235761) (not (undefined!5091 lt!235761)) (bvslt (x!48417 lt!235761) #b01111111111111111111111111111110) (bvsge (x!48417 lt!235761) #b00000000000000000000000000000000) (bvsge (x!48417 lt!235761) #b00000000000000000000000000000000)))))

(assert (=> b!514896 (=> (not res!314580) (not e!300667))))

(assert (= (and d!79543 c!60445) b!514891))

(assert (= (and d!79543 (not c!60445)) b!514894))

(assert (= (and b!514894 c!60443) b!514888))

(assert (= (and b!514894 (not c!60443)) b!514890))

(assert (= (and d!79543 c!60444) b!514889))

(assert (= (and d!79543 (not c!60444)) b!514896))

(assert (= (and b!514896 res!314580) b!514892))

(assert (= (and b!514892 (not res!314582)) b!514893))

(assert (= (and b!514893 (not res!314581)) b!514895))

(declare-fun m!496465 () Bool)

(assert (=> d!79543 m!496465))

(assert (=> d!79543 m!496265))

(declare-fun m!496467 () Bool)

(assert (=> b!514890 m!496467))

(assert (=> b!514890 m!496467))

(assert (=> b!514890 m!496237))

(declare-fun m!496469 () Bool)

(assert (=> b!514890 m!496469))

(declare-fun m!496471 () Bool)

(assert (=> b!514893 m!496471))

(assert (=> b!514892 m!496471))

(assert (=> b!514895 m!496471))

(assert (=> b!514633 d!79543))

(check-sat (not b!514777) (not b!514890) (not bm!31608) (not d!79533) (not b!514783) (not b!514886) (not bm!31616) (not b!514741) (not b!514739) (not b!514740) (not d!79515) (not d!79513) (not bm!31605) (not b!514719) (not b!514726) (not b!514884) (not d!79499) (not b!514864) (not d!79543) (not b!514717))
(check-sat)
