; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45474 () Bool)

(assert start!45474)

(declare-fun b!500627 () Bool)

(declare-fun res!302539 () Bool)

(declare-fun e!293275 () Bool)

(assert (=> b!500627 (=> (not res!302539) (not e!293275))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32309 0))(
  ( (array!32310 (arr!15536 (Array (_ BitVec 32) (_ BitVec 64))) (size!15901 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32309)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500627 (= res!302539 (and (= (size!15901 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15901 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15901 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500628 () Bool)

(declare-fun e!293277 () Bool)

(assert (=> b!500628 (= e!293275 e!293277)))

(declare-fun res!302538 () Bool)

(assert (=> b!500628 (=> (not res!302538) (not e!293277))))

(declare-datatypes ((SeekEntryResult!4000 0))(
  ( (MissingZero!4000 (index!18182 (_ BitVec 32))) (Found!4000 (index!18183 (_ BitVec 32))) (Intermediate!4000 (undefined!4812 Bool) (index!18184 (_ BitVec 32)) (x!47224 (_ BitVec 32))) (Undefined!4000) (MissingVacant!4000 (index!18185 (_ BitVec 32))) )
))
(declare-fun lt!227193 () SeekEntryResult!4000)

(assert (=> b!500628 (= res!302538 (or (= lt!227193 (MissingZero!4000 i!1204)) (= lt!227193 (MissingVacant!4000 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32309 (_ BitVec 32)) SeekEntryResult!4000)

(assert (=> b!500628 (= lt!227193 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!500629 () Bool)

(declare-fun e!293274 () Bool)

(declare-fun e!293279 () Bool)

(assert (=> b!500629 (= e!293274 e!293279)))

(declare-fun res!302545 () Bool)

(assert (=> b!500629 (=> res!302545 e!293279)))

(declare-fun lt!227192 () (_ BitVec 32))

(declare-fun lt!227186 () SeekEntryResult!4000)

(assert (=> b!500629 (= res!302545 (or (bvsgt #b00000000000000000000000000000000 (x!47224 lt!227186)) (bvsgt (x!47224 lt!227186) #b01111111111111111111111111111110) (bvslt lt!227192 #b00000000000000000000000000000000) (bvsge lt!227192 (size!15901 a!3235)) (bvslt (index!18184 lt!227186) #b00000000000000000000000000000000) (bvsge (index!18184 lt!227186) (size!15901 a!3235)) (not (= lt!227186 (Intermediate!4000 false (index!18184 lt!227186) (x!47224 lt!227186))))))))

(assert (=> b!500629 (and (or (= (select (arr!15536 a!3235) (index!18184 lt!227186)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15536 a!3235) (index!18184 lt!227186)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15536 a!3235) (index!18184 lt!227186)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15536 a!3235) (index!18184 lt!227186)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!15070 0))(
  ( (Unit!15071) )
))
(declare-fun lt!227187 () Unit!15070)

(declare-fun e!293276 () Unit!15070)

(assert (=> b!500629 (= lt!227187 e!293276)))

(declare-fun c!59322 () Bool)

(assert (=> b!500629 (= c!59322 (= (select (arr!15536 a!3235) (index!18184 lt!227186)) (select (arr!15536 a!3235) j!176)))))

(assert (=> b!500629 (and (bvslt (x!47224 lt!227186) #b01111111111111111111111111111110) (or (= (select (arr!15536 a!3235) (index!18184 lt!227186)) (select (arr!15536 a!3235) j!176)) (= (select (arr!15536 a!3235) (index!18184 lt!227186)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15536 a!3235) (index!18184 lt!227186)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!302541 () Bool)

(assert (=> start!45474 (=> (not res!302541) (not e!293275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45474 (= res!302541 (validMask!0 mask!3524))))

(assert (=> start!45474 e!293275))

(assert (=> start!45474 true))

(declare-fun array_inv!11419 (array!32309) Bool)

(assert (=> start!45474 (array_inv!11419 a!3235)))

(declare-fun b!500630 () Bool)

(declare-fun e!293280 () Bool)

(assert (=> b!500630 (= e!293280 (= (seekEntryOrOpen!0 (select (arr!15536 a!3235) j!176) a!3235 mask!3524) (Found!4000 j!176)))))

(declare-fun b!500631 () Bool)

(declare-fun res!302548 () Bool)

(assert (=> b!500631 (=> (not res!302548) (not e!293275))))

(declare-fun arrayContainsKey!0 (array!32309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500631 (= res!302548 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500632 () Bool)

(declare-fun res!302540 () Bool)

(assert (=> b!500632 (=> (not res!302540) (not e!293277))))

(declare-datatypes ((List!9733 0))(
  ( (Nil!9730) (Cons!9729 (h!10603 (_ BitVec 64)) (t!15952 List!9733)) )
))
(declare-fun arrayNoDuplicates!0 (array!32309 (_ BitVec 32) List!9733) Bool)

(assert (=> b!500632 (= res!302540 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9730))))

(declare-fun b!500633 () Bool)

(assert (=> b!500633 (= e!293277 (not e!293274))))

(declare-fun res!302547 () Bool)

(assert (=> b!500633 (=> res!302547 e!293274)))

(declare-fun lt!227189 () (_ BitVec 32))

(declare-fun lt!227185 () (_ BitVec 64))

(declare-fun lt!227188 () array!32309)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32309 (_ BitVec 32)) SeekEntryResult!4000)

(assert (=> b!500633 (= res!302547 (= lt!227186 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227189 lt!227185 lt!227188 mask!3524)))))

(assert (=> b!500633 (= lt!227186 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227192 (select (arr!15536 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500633 (= lt!227189 (toIndex!0 lt!227185 mask!3524))))

(assert (=> b!500633 (= lt!227185 (select (store (arr!15536 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!500633 (= lt!227192 (toIndex!0 (select (arr!15536 a!3235) j!176) mask!3524))))

(assert (=> b!500633 (= lt!227188 (array!32310 (store (arr!15536 a!3235) i!1204 k0!2280) (size!15901 a!3235)))))

(assert (=> b!500633 e!293280))

(declare-fun res!302544 () Bool)

(assert (=> b!500633 (=> (not res!302544) (not e!293280))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32309 (_ BitVec 32)) Bool)

(assert (=> b!500633 (= res!302544 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227190 () Unit!15070)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32309 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15070)

(assert (=> b!500633 (= lt!227190 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500634 () Bool)

(declare-fun res!302537 () Bool)

(assert (=> b!500634 (=> (not res!302537) (not e!293275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500634 (= res!302537 (validKeyInArray!0 (select (arr!15536 a!3235) j!176)))))

(declare-fun b!500635 () Bool)

(assert (=> b!500635 (= e!293279 true)))

(declare-fun lt!227194 () SeekEntryResult!4000)

(assert (=> b!500635 (= lt!227194 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227192 lt!227185 lt!227188 mask!3524))))

(declare-fun b!500636 () Bool)

(declare-fun Unit!15072 () Unit!15070)

(assert (=> b!500636 (= e!293276 Unit!15072)))

(declare-fun b!500637 () Bool)

(declare-fun Unit!15073 () Unit!15070)

(assert (=> b!500637 (= e!293276 Unit!15073)))

(declare-fun lt!227191 () Unit!15070)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32309 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15070)

(assert (=> b!500637 (= lt!227191 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227192 #b00000000000000000000000000000000 (index!18184 lt!227186) (x!47224 lt!227186) mask!3524))))

(declare-fun res!302542 () Bool)

(assert (=> b!500637 (= res!302542 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227192 lt!227185 lt!227188 mask!3524) (Intermediate!4000 false (index!18184 lt!227186) (x!47224 lt!227186))))))

(declare-fun e!293273 () Bool)

(assert (=> b!500637 (=> (not res!302542) (not e!293273))))

(assert (=> b!500637 e!293273))

(declare-fun b!500638 () Bool)

(assert (=> b!500638 (= e!293273 false)))

(declare-fun b!500639 () Bool)

(declare-fun res!302543 () Bool)

(assert (=> b!500639 (=> res!302543 e!293274)))

(get-info :version)

(assert (=> b!500639 (= res!302543 (or (undefined!4812 lt!227186) (not ((_ is Intermediate!4000) lt!227186))))))

(declare-fun b!500640 () Bool)

(declare-fun res!302546 () Bool)

(assert (=> b!500640 (=> (not res!302546) (not e!293275))))

(assert (=> b!500640 (= res!302546 (validKeyInArray!0 k0!2280))))

(declare-fun b!500641 () Bool)

(declare-fun res!302549 () Bool)

(assert (=> b!500641 (=> (not res!302549) (not e!293277))))

(assert (=> b!500641 (= res!302549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45474 res!302541) b!500627))

(assert (= (and b!500627 res!302539) b!500634))

(assert (= (and b!500634 res!302537) b!500640))

(assert (= (and b!500640 res!302546) b!500631))

(assert (= (and b!500631 res!302548) b!500628))

(assert (= (and b!500628 res!302538) b!500641))

(assert (= (and b!500641 res!302549) b!500632))

(assert (= (and b!500632 res!302540) b!500633))

(assert (= (and b!500633 res!302544) b!500630))

(assert (= (and b!500633 (not res!302547)) b!500639))

(assert (= (and b!500639 (not res!302543)) b!500629))

(assert (= (and b!500629 c!59322) b!500637))

(assert (= (and b!500629 (not c!59322)) b!500636))

(assert (= (and b!500637 res!302542) b!500638))

(assert (= (and b!500629 (not res!302545)) b!500635))

(declare-fun m!481249 () Bool)

(assert (=> b!500632 m!481249))

(declare-fun m!481251 () Bool)

(assert (=> start!45474 m!481251))

(declare-fun m!481253 () Bool)

(assert (=> start!45474 m!481253))

(declare-fun m!481255 () Bool)

(assert (=> b!500634 m!481255))

(assert (=> b!500634 m!481255))

(declare-fun m!481257 () Bool)

(assert (=> b!500634 m!481257))

(declare-fun m!481259 () Bool)

(assert (=> b!500628 m!481259))

(declare-fun m!481261 () Bool)

(assert (=> b!500637 m!481261))

(declare-fun m!481263 () Bool)

(assert (=> b!500637 m!481263))

(declare-fun m!481265 () Bool)

(assert (=> b!500629 m!481265))

(assert (=> b!500629 m!481255))

(declare-fun m!481267 () Bool)

(assert (=> b!500631 m!481267))

(declare-fun m!481269 () Bool)

(assert (=> b!500633 m!481269))

(declare-fun m!481271 () Bool)

(assert (=> b!500633 m!481271))

(declare-fun m!481273 () Bool)

(assert (=> b!500633 m!481273))

(declare-fun m!481275 () Bool)

(assert (=> b!500633 m!481275))

(assert (=> b!500633 m!481255))

(declare-fun m!481277 () Bool)

(assert (=> b!500633 m!481277))

(assert (=> b!500633 m!481255))

(declare-fun m!481279 () Bool)

(assert (=> b!500633 m!481279))

(assert (=> b!500633 m!481255))

(declare-fun m!481281 () Bool)

(assert (=> b!500633 m!481281))

(declare-fun m!481283 () Bool)

(assert (=> b!500633 m!481283))

(assert (=> b!500635 m!481263))

(assert (=> b!500630 m!481255))

(assert (=> b!500630 m!481255))

(declare-fun m!481285 () Bool)

(assert (=> b!500630 m!481285))

(declare-fun m!481287 () Bool)

(assert (=> b!500640 m!481287))

(declare-fun m!481289 () Bool)

(assert (=> b!500641 m!481289))

(check-sat (not b!500637) (not b!500628) (not start!45474) (not b!500635) (not b!500640) (not b!500641) (not b!500630) (not b!500632) (not b!500633) (not b!500631) (not b!500634))
(check-sat)
