; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45732 () Bool)

(assert start!45732)

(declare-fun b!505594 () Bool)

(declare-fun e!295971 () Bool)

(assert (=> b!505594 (= e!295971 true)))

(declare-fun lt!230478 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32488 0))(
  ( (array!32489 (arr!15624 (Array (_ BitVec 32) (_ BitVec 64))) (size!15988 (_ BitVec 32))) )
))
(declare-fun lt!230483 () array!32488)

(declare-datatypes ((SeekEntryResult!4091 0))(
  ( (MissingZero!4091 (index!18552 (_ BitVec 32))) (Found!4091 (index!18553 (_ BitVec 32))) (Intermediate!4091 (undefined!4903 Bool) (index!18554 (_ BitVec 32)) (x!47564 (_ BitVec 32))) (Undefined!4091) (MissingVacant!4091 (index!18555 (_ BitVec 32))) )
))
(declare-fun lt!230479 () SeekEntryResult!4091)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32488 (_ BitVec 32)) SeekEntryResult!4091)

(assert (=> b!505594 (= (seekEntryOrOpen!0 lt!230478 lt!230483 mask!3524) lt!230479)))

(declare-datatypes ((Unit!15440 0))(
  ( (Unit!15441) )
))
(declare-fun lt!230481 () Unit!15440)

(declare-fun lt!230480 () SeekEntryResult!4091)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun a!3235 () array!32488)

(declare-fun lt!230477 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32488 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15440)

(assert (=> b!505594 (= lt!230481 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k!2280 j!176 lt!230477 #b00000000000000000000000000000000 (index!18554 lt!230480) (x!47564 lt!230480) mask!3524))))

(declare-fun b!505595 () Bool)

(declare-fun e!295964 () Bool)

(assert (=> b!505595 (= e!295964 false)))

(declare-fun b!505596 () Bool)

(declare-fun res!306639 () Bool)

(declare-fun e!295967 () Bool)

(assert (=> b!505596 (=> (not res!306639) (not e!295967))))

(declare-fun arrayContainsKey!0 (array!32488 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505596 (= res!306639 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!306642 () Bool)

(assert (=> start!45732 (=> (not res!306642) (not e!295967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45732 (= res!306642 (validMask!0 mask!3524))))

(assert (=> start!45732 e!295967))

(assert (=> start!45732 true))

(declare-fun array_inv!11420 (array!32488) Bool)

(assert (=> start!45732 (array_inv!11420 a!3235)))

(declare-fun b!505597 () Bool)

(declare-fun e!295966 () Unit!15440)

(declare-fun Unit!15442 () Unit!15440)

(assert (=> b!505597 (= e!295966 Unit!15442)))

(declare-fun b!505598 () Bool)

(declare-fun res!306648 () Bool)

(assert (=> b!505598 (=> (not res!306648) (not e!295967))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505598 (= res!306648 (validKeyInArray!0 (select (arr!15624 a!3235) j!176)))))

(declare-fun b!505599 () Bool)

(declare-fun res!306649 () Bool)

(assert (=> b!505599 (=> (not res!306649) (not e!295967))))

(assert (=> b!505599 (= res!306649 (validKeyInArray!0 k!2280))))

(declare-fun b!505600 () Bool)

(declare-fun e!295969 () Bool)

(declare-fun e!295970 () Bool)

(assert (=> b!505600 (= e!295969 (not e!295970))))

(declare-fun res!306640 () Bool)

(assert (=> b!505600 (=> res!306640 e!295970)))

(declare-fun lt!230486 () SeekEntryResult!4091)

(assert (=> b!505600 (= res!306640 (or (= lt!230480 lt!230486) (undefined!4903 lt!230480) (not (is-Intermediate!4091 lt!230480))))))

(declare-fun lt!230487 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32488 (_ BitVec 32)) SeekEntryResult!4091)

(assert (=> b!505600 (= lt!230486 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230487 lt!230478 lt!230483 mask!3524))))

(assert (=> b!505600 (= lt!230480 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230477 (select (arr!15624 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505600 (= lt!230487 (toIndex!0 lt!230478 mask!3524))))

(assert (=> b!505600 (= lt!230478 (select (store (arr!15624 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!505600 (= lt!230477 (toIndex!0 (select (arr!15624 a!3235) j!176) mask!3524))))

(assert (=> b!505600 (= lt!230483 (array!32489 (store (arr!15624 a!3235) i!1204 k!2280) (size!15988 a!3235)))))

(assert (=> b!505600 (= lt!230479 (Found!4091 j!176))))

(declare-fun e!295963 () Bool)

(assert (=> b!505600 e!295963))

(declare-fun res!306651 () Bool)

(assert (=> b!505600 (=> (not res!306651) (not e!295963))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32488 (_ BitVec 32)) Bool)

(assert (=> b!505600 (= res!306651 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230488 () Unit!15440)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32488 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15440)

(assert (=> b!505600 (= lt!230488 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505601 () Bool)

(assert (=> b!505601 (= e!295967 e!295969)))

(declare-fun res!306653 () Bool)

(assert (=> b!505601 (=> (not res!306653) (not e!295969))))

(declare-fun lt!230482 () SeekEntryResult!4091)

(assert (=> b!505601 (= res!306653 (or (= lt!230482 (MissingZero!4091 i!1204)) (= lt!230482 (MissingVacant!4091 i!1204))))))

(assert (=> b!505601 (= lt!230482 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!505602 () Bool)

(declare-fun res!306643 () Bool)

(assert (=> b!505602 (=> res!306643 e!295971)))

(declare-fun e!295965 () Bool)

(assert (=> b!505602 (= res!306643 e!295965)))

(declare-fun res!306645 () Bool)

(assert (=> b!505602 (=> (not res!306645) (not e!295965))))

(assert (=> b!505602 (= res!306645 (bvsgt #b00000000000000000000000000000000 (x!47564 lt!230480)))))

(declare-fun b!505603 () Bool)

(declare-fun res!306652 () Bool)

(assert (=> b!505603 (=> (not res!306652) (not e!295969))))

(assert (=> b!505603 (= res!306652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!505604 () Bool)

(assert (=> b!505604 (= e!295970 e!295971)))

(declare-fun res!306650 () Bool)

(assert (=> b!505604 (=> res!306650 e!295971)))

(assert (=> b!505604 (= res!306650 (or (bvsgt (x!47564 lt!230480) #b01111111111111111111111111111110) (bvslt lt!230477 #b00000000000000000000000000000000) (bvsge lt!230477 (size!15988 a!3235)) (bvslt (index!18554 lt!230480) #b00000000000000000000000000000000) (bvsge (index!18554 lt!230480) (size!15988 a!3235)) (not (= lt!230480 (Intermediate!4091 false (index!18554 lt!230480) (x!47564 lt!230480))))))))

(assert (=> b!505604 (= (index!18554 lt!230480) i!1204)))

(declare-fun lt!230485 () Unit!15440)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32488 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15440)

(assert (=> b!505604 (= lt!230485 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!230477 #b00000000000000000000000000000000 (index!18554 lt!230480) (x!47564 lt!230480) mask!3524))))

(assert (=> b!505604 (and (or (= (select (arr!15624 a!3235) (index!18554 lt!230480)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15624 a!3235) (index!18554 lt!230480)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15624 a!3235) (index!18554 lt!230480)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15624 a!3235) (index!18554 lt!230480)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230484 () Unit!15440)

(assert (=> b!505604 (= lt!230484 e!295966)))

(declare-fun c!59756 () Bool)

(assert (=> b!505604 (= c!59756 (= (select (arr!15624 a!3235) (index!18554 lt!230480)) (select (arr!15624 a!3235) j!176)))))

(assert (=> b!505604 (and (bvslt (x!47564 lt!230480) #b01111111111111111111111111111110) (or (= (select (arr!15624 a!3235) (index!18554 lt!230480)) (select (arr!15624 a!3235) j!176)) (= (select (arr!15624 a!3235) (index!18554 lt!230480)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15624 a!3235) (index!18554 lt!230480)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!505605 () Bool)

(declare-fun res!306646 () Bool)

(assert (=> b!505605 (=> (not res!306646) (not e!295969))))

(declare-datatypes ((List!9782 0))(
  ( (Nil!9779) (Cons!9778 (h!10655 (_ BitVec 64)) (t!16010 List!9782)) )
))
(declare-fun arrayNoDuplicates!0 (array!32488 (_ BitVec 32) List!9782) Bool)

(assert (=> b!505605 (= res!306646 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9779))))

(declare-fun b!505606 () Bool)

(assert (=> b!505606 (= e!295963 (= (seekEntryOrOpen!0 (select (arr!15624 a!3235) j!176) a!3235 mask!3524) (Found!4091 j!176)))))

(declare-fun b!505607 () Bool)

(declare-fun Unit!15443 () Unit!15440)

(assert (=> b!505607 (= e!295966 Unit!15443)))

(declare-fun lt!230476 () Unit!15440)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32488 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15440)

(assert (=> b!505607 (= lt!230476 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!230477 #b00000000000000000000000000000000 (index!18554 lt!230480) (x!47564 lt!230480) mask!3524))))

(declare-fun res!306647 () Bool)

(assert (=> b!505607 (= res!306647 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230477 lt!230478 lt!230483 mask!3524) (Intermediate!4091 false (index!18554 lt!230480) (x!47564 lt!230480))))))

(assert (=> b!505607 (=> (not res!306647) (not e!295964))))

(assert (=> b!505607 e!295964))

(declare-fun b!505608 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32488 (_ BitVec 32)) SeekEntryResult!4091)

(assert (=> b!505608 (= e!295965 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230477 (index!18554 lt!230480) (select (arr!15624 a!3235) j!176) a!3235 mask!3524) lt!230479)))))

(declare-fun b!505609 () Bool)

(declare-fun res!306644 () Bool)

(assert (=> b!505609 (=> res!306644 e!295971)))

(assert (=> b!505609 (= res!306644 (not (= lt!230486 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230477 lt!230478 lt!230483 mask!3524))))))

(declare-fun b!505610 () Bool)

(declare-fun res!306641 () Bool)

(assert (=> b!505610 (=> (not res!306641) (not e!295967))))

(assert (=> b!505610 (= res!306641 (and (= (size!15988 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15988 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15988 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45732 res!306642) b!505610))

(assert (= (and b!505610 res!306641) b!505598))

(assert (= (and b!505598 res!306648) b!505599))

(assert (= (and b!505599 res!306649) b!505596))

(assert (= (and b!505596 res!306639) b!505601))

(assert (= (and b!505601 res!306653) b!505603))

(assert (= (and b!505603 res!306652) b!505605))

(assert (= (and b!505605 res!306646) b!505600))

(assert (= (and b!505600 res!306651) b!505606))

(assert (= (and b!505600 (not res!306640)) b!505604))

(assert (= (and b!505604 c!59756) b!505607))

(assert (= (and b!505604 (not c!59756)) b!505597))

(assert (= (and b!505607 res!306647) b!505595))

(assert (= (and b!505604 (not res!306650)) b!505602))

(assert (= (and b!505602 res!306645) b!505608))

(assert (= (and b!505602 (not res!306643)) b!505609))

(assert (= (and b!505609 (not res!306644)) b!505594))

(declare-fun m!486255 () Bool)

(assert (=> b!505606 m!486255))

(assert (=> b!505606 m!486255))

(declare-fun m!486257 () Bool)

(assert (=> b!505606 m!486257))

(declare-fun m!486259 () Bool)

(assert (=> b!505609 m!486259))

(declare-fun m!486261 () Bool)

(assert (=> b!505600 m!486261))

(declare-fun m!486263 () Bool)

(assert (=> b!505600 m!486263))

(assert (=> b!505600 m!486255))

(declare-fun m!486265 () Bool)

(assert (=> b!505600 m!486265))

(assert (=> b!505600 m!486255))

(declare-fun m!486267 () Bool)

(assert (=> b!505600 m!486267))

(declare-fun m!486269 () Bool)

(assert (=> b!505600 m!486269))

(assert (=> b!505600 m!486255))

(declare-fun m!486271 () Bool)

(assert (=> b!505600 m!486271))

(declare-fun m!486273 () Bool)

(assert (=> b!505600 m!486273))

(declare-fun m!486275 () Bool)

(assert (=> b!505600 m!486275))

(declare-fun m!486277 () Bool)

(assert (=> start!45732 m!486277))

(declare-fun m!486279 () Bool)

(assert (=> start!45732 m!486279))

(declare-fun m!486281 () Bool)

(assert (=> b!505605 m!486281))

(declare-fun m!486283 () Bool)

(assert (=> b!505607 m!486283))

(assert (=> b!505607 m!486259))

(declare-fun m!486285 () Bool)

(assert (=> b!505603 m!486285))

(declare-fun m!486287 () Bool)

(assert (=> b!505599 m!486287))

(declare-fun m!486289 () Bool)

(assert (=> b!505596 m!486289))

(assert (=> b!505598 m!486255))

(assert (=> b!505598 m!486255))

(declare-fun m!486291 () Bool)

(assert (=> b!505598 m!486291))

(assert (=> b!505608 m!486255))

(assert (=> b!505608 m!486255))

(declare-fun m!486293 () Bool)

(assert (=> b!505608 m!486293))

(declare-fun m!486295 () Bool)

(assert (=> b!505594 m!486295))

(declare-fun m!486297 () Bool)

(assert (=> b!505594 m!486297))

(declare-fun m!486299 () Bool)

(assert (=> b!505601 m!486299))

(declare-fun m!486301 () Bool)

(assert (=> b!505604 m!486301))

(declare-fun m!486303 () Bool)

(assert (=> b!505604 m!486303))

(assert (=> b!505604 m!486255))

(push 1)

