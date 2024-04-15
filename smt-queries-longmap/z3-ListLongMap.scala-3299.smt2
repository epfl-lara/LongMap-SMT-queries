; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45726 () Bool)

(assert start!45726)

(declare-fun b!505476 () Bool)

(declare-fun res!306657 () Bool)

(declare-fun e!295875 () Bool)

(assert (=> b!505476 (=> (not res!306657) (not e!295875))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505476 (= res!306657 (validKeyInArray!0 k0!2280))))

(declare-fun b!505477 () Bool)

(declare-fun res!306658 () Bool)

(declare-fun e!295876 () Bool)

(assert (=> b!505477 (=> res!306658 e!295876)))

(declare-fun e!295873 () Bool)

(assert (=> b!505477 (= res!306658 e!295873)))

(declare-fun res!306651 () Bool)

(assert (=> b!505477 (=> (not res!306651) (not e!295873))))

(declare-datatypes ((SeekEntryResult!4090 0))(
  ( (MissingZero!4090 (index!18548 (_ BitVec 32))) (Found!4090 (index!18549 (_ BitVec 32))) (Intermediate!4090 (undefined!4902 Bool) (index!18550 (_ BitVec 32)) (x!47566 (_ BitVec 32))) (Undefined!4090) (MissingVacant!4090 (index!18551 (_ BitVec 32))) )
))
(declare-fun lt!230364 () SeekEntryResult!4090)

(assert (=> b!505477 (= res!306651 (bvsgt #b00000000000000000000000000000000 (x!47566 lt!230364)))))

(declare-fun b!505478 () Bool)

(declare-fun e!295872 () Bool)

(declare-fun e!295878 () Bool)

(assert (=> b!505478 (= e!295872 (not e!295878))))

(declare-fun res!306656 () Bool)

(assert (=> b!505478 (=> res!306656 e!295878)))

(declare-fun lt!230368 () SeekEntryResult!4090)

(get-info :version)

(assert (=> b!505478 (= res!306656 (or (= lt!230364 lt!230368) (undefined!4902 lt!230364) (not ((_ is Intermediate!4090) lt!230364))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!230359 () (_ BitVec 32))

(declare-datatypes ((array!32492 0))(
  ( (array!32493 (arr!15626 (Array (_ BitVec 32) (_ BitVec 64))) (size!15991 (_ BitVec 32))) )
))
(declare-fun lt!230370 () array!32492)

(declare-fun lt!230371 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32492 (_ BitVec 32)) SeekEntryResult!4090)

(assert (=> b!505478 (= lt!230368 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230359 lt!230371 lt!230370 mask!3524))))

(declare-fun a!3235 () array!32492)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!230369 () (_ BitVec 32))

(assert (=> b!505478 (= lt!230364 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230369 (select (arr!15626 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505478 (= lt!230359 (toIndex!0 lt!230371 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!505478 (= lt!230371 (select (store (arr!15626 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!505478 (= lt!230369 (toIndex!0 (select (arr!15626 a!3235) j!176) mask!3524))))

(assert (=> b!505478 (= lt!230370 (array!32493 (store (arr!15626 a!3235) i!1204 k0!2280) (size!15991 a!3235)))))

(declare-fun lt!230361 () SeekEntryResult!4090)

(assert (=> b!505478 (= lt!230361 (Found!4090 j!176))))

(declare-fun e!295874 () Bool)

(assert (=> b!505478 e!295874))

(declare-fun res!306653 () Bool)

(assert (=> b!505478 (=> (not res!306653) (not e!295874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32492 (_ BitVec 32)) Bool)

(assert (=> b!505478 (= res!306653 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15430 0))(
  ( (Unit!15431) )
))
(declare-fun lt!230362 () Unit!15430)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32492 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15430)

(assert (=> b!505478 (= lt!230362 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505479 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32492 (_ BitVec 32)) SeekEntryResult!4090)

(assert (=> b!505479 (= e!295874 (= (seekEntryOrOpen!0 (select (arr!15626 a!3235) j!176) a!3235 mask!3524) (Found!4090 j!176)))))

(declare-fun b!505480 () Bool)

(declare-fun res!306655 () Bool)

(assert (=> b!505480 (=> (not res!306655) (not e!295872))))

(declare-datatypes ((List!9823 0))(
  ( (Nil!9820) (Cons!9819 (h!10696 (_ BitVec 64)) (t!16042 List!9823)) )
))
(declare-fun arrayNoDuplicates!0 (array!32492 (_ BitVec 32) List!9823) Bool)

(assert (=> b!505480 (= res!306655 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9820))))

(declare-fun b!505481 () Bool)

(assert (=> b!505481 (= e!295876 true)))

(assert (=> b!505481 (= (seekEntryOrOpen!0 lt!230371 lt!230370 mask!3524) lt!230361)))

(declare-fun lt!230360 () Unit!15430)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32492 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15430)

(assert (=> b!505481 (= lt!230360 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!230369 #b00000000000000000000000000000000 (index!18550 lt!230364) (x!47566 lt!230364) mask!3524))))

(declare-fun b!505482 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32492 (_ BitVec 32)) SeekEntryResult!4090)

(assert (=> b!505482 (= e!295873 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230369 (index!18550 lt!230364) (select (arr!15626 a!3235) j!176) a!3235 mask!3524) lt!230361)))))

(declare-fun b!505484 () Bool)

(declare-fun res!306652 () Bool)

(assert (=> b!505484 (=> (not res!306652) (not e!295872))))

(assert (=> b!505484 (= res!306652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!505485 () Bool)

(declare-fun e!295871 () Unit!15430)

(declare-fun Unit!15432 () Unit!15430)

(assert (=> b!505485 (= e!295871 Unit!15432)))

(declare-fun lt!230365 () Unit!15430)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32492 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15430)

(assert (=> b!505485 (= lt!230365 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!230369 #b00000000000000000000000000000000 (index!18550 lt!230364) (x!47566 lt!230364) mask!3524))))

(declare-fun res!306647 () Bool)

(assert (=> b!505485 (= res!306647 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230369 lt!230371 lt!230370 mask!3524) (Intermediate!4090 false (index!18550 lt!230364) (x!47566 lt!230364))))))

(declare-fun e!295870 () Bool)

(assert (=> b!505485 (=> (not res!306647) (not e!295870))))

(assert (=> b!505485 e!295870))

(declare-fun b!505486 () Bool)

(assert (=> b!505486 (= e!295875 e!295872)))

(declare-fun res!306654 () Bool)

(assert (=> b!505486 (=> (not res!306654) (not e!295872))))

(declare-fun lt!230366 () SeekEntryResult!4090)

(assert (=> b!505486 (= res!306654 (or (= lt!230366 (MissingZero!4090 i!1204)) (= lt!230366 (MissingVacant!4090 i!1204))))))

(assert (=> b!505486 (= lt!230366 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!505487 () Bool)

(declare-fun res!306659 () Bool)

(assert (=> b!505487 (=> (not res!306659) (not e!295875))))

(assert (=> b!505487 (= res!306659 (and (= (size!15991 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15991 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15991 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!505488 () Bool)

(declare-fun Unit!15433 () Unit!15430)

(assert (=> b!505488 (= e!295871 Unit!15433)))

(declare-fun b!505489 () Bool)

(declare-fun res!306646 () Bool)

(assert (=> b!505489 (=> (not res!306646) (not e!295875))))

(assert (=> b!505489 (= res!306646 (validKeyInArray!0 (select (arr!15626 a!3235) j!176)))))

(declare-fun b!505490 () Bool)

(declare-fun res!306648 () Bool)

(assert (=> b!505490 (=> (not res!306648) (not e!295875))))

(declare-fun arrayContainsKey!0 (array!32492 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505490 (= res!306648 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505483 () Bool)

(declare-fun res!306649 () Bool)

(assert (=> b!505483 (=> res!306649 e!295876)))

(assert (=> b!505483 (= res!306649 (not (= lt!230368 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230369 lt!230371 lt!230370 mask!3524))))))

(declare-fun res!306645 () Bool)

(assert (=> start!45726 (=> (not res!306645) (not e!295875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45726 (= res!306645 (validMask!0 mask!3524))))

(assert (=> start!45726 e!295875))

(assert (=> start!45726 true))

(declare-fun array_inv!11509 (array!32492) Bool)

(assert (=> start!45726 (array_inv!11509 a!3235)))

(declare-fun b!505491 () Bool)

(assert (=> b!505491 (= e!295870 false)))

(declare-fun b!505492 () Bool)

(assert (=> b!505492 (= e!295878 e!295876)))

(declare-fun res!306650 () Bool)

(assert (=> b!505492 (=> res!306650 e!295876)))

(assert (=> b!505492 (= res!306650 (or (bvsgt (x!47566 lt!230364) #b01111111111111111111111111111110) (bvslt lt!230369 #b00000000000000000000000000000000) (bvsge lt!230369 (size!15991 a!3235)) (bvslt (index!18550 lt!230364) #b00000000000000000000000000000000) (bvsge (index!18550 lt!230364) (size!15991 a!3235)) (not (= lt!230364 (Intermediate!4090 false (index!18550 lt!230364) (x!47566 lt!230364))))))))

(assert (=> b!505492 (= (index!18550 lt!230364) i!1204)))

(declare-fun lt!230363 () Unit!15430)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32492 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15430)

(assert (=> b!505492 (= lt!230363 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!230369 #b00000000000000000000000000000000 (index!18550 lt!230364) (x!47566 lt!230364) mask!3524))))

(assert (=> b!505492 (and (or (= (select (arr!15626 a!3235) (index!18550 lt!230364)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15626 a!3235) (index!18550 lt!230364)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15626 a!3235) (index!18550 lt!230364)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15626 a!3235) (index!18550 lt!230364)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230367 () Unit!15430)

(assert (=> b!505492 (= lt!230367 e!295871)))

(declare-fun c!59694 () Bool)

(assert (=> b!505492 (= c!59694 (= (select (arr!15626 a!3235) (index!18550 lt!230364)) (select (arr!15626 a!3235) j!176)))))

(assert (=> b!505492 (and (bvslt (x!47566 lt!230364) #b01111111111111111111111111111110) (or (= (select (arr!15626 a!3235) (index!18550 lt!230364)) (select (arr!15626 a!3235) j!176)) (= (select (arr!15626 a!3235) (index!18550 lt!230364)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15626 a!3235) (index!18550 lt!230364)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45726 res!306645) b!505487))

(assert (= (and b!505487 res!306659) b!505489))

(assert (= (and b!505489 res!306646) b!505476))

(assert (= (and b!505476 res!306657) b!505490))

(assert (= (and b!505490 res!306648) b!505486))

(assert (= (and b!505486 res!306654) b!505484))

(assert (= (and b!505484 res!306652) b!505480))

(assert (= (and b!505480 res!306655) b!505478))

(assert (= (and b!505478 res!306653) b!505479))

(assert (= (and b!505478 (not res!306656)) b!505492))

(assert (= (and b!505492 c!59694) b!505485))

(assert (= (and b!505492 (not c!59694)) b!505488))

(assert (= (and b!505485 res!306647) b!505491))

(assert (= (and b!505492 (not res!306650)) b!505477))

(assert (= (and b!505477 res!306651) b!505482))

(assert (= (and b!505477 (not res!306658)) b!505483))

(assert (= (and b!505483 (not res!306649)) b!505481))

(declare-fun m!485653 () Bool)

(assert (=> b!505490 m!485653))

(declare-fun m!485655 () Bool)

(assert (=> b!505484 m!485655))

(declare-fun m!485657 () Bool)

(assert (=> b!505482 m!485657))

(assert (=> b!505482 m!485657))

(declare-fun m!485659 () Bool)

(assert (=> b!505482 m!485659))

(declare-fun m!485661 () Bool)

(assert (=> b!505476 m!485661))

(declare-fun m!485663 () Bool)

(assert (=> start!45726 m!485663))

(declare-fun m!485665 () Bool)

(assert (=> start!45726 m!485665))

(declare-fun m!485667 () Bool)

(assert (=> b!505480 m!485667))

(assert (=> b!505479 m!485657))

(assert (=> b!505479 m!485657))

(declare-fun m!485669 () Bool)

(assert (=> b!505479 m!485669))

(declare-fun m!485671 () Bool)

(assert (=> b!505481 m!485671))

(declare-fun m!485673 () Bool)

(assert (=> b!505481 m!485673))

(declare-fun m!485675 () Bool)

(assert (=> b!505486 m!485675))

(declare-fun m!485677 () Bool)

(assert (=> b!505478 m!485677))

(declare-fun m!485679 () Bool)

(assert (=> b!505478 m!485679))

(declare-fun m!485681 () Bool)

(assert (=> b!505478 m!485681))

(declare-fun m!485683 () Bool)

(assert (=> b!505478 m!485683))

(declare-fun m!485685 () Bool)

(assert (=> b!505478 m!485685))

(assert (=> b!505478 m!485657))

(declare-fun m!485687 () Bool)

(assert (=> b!505478 m!485687))

(assert (=> b!505478 m!485657))

(declare-fun m!485689 () Bool)

(assert (=> b!505478 m!485689))

(assert (=> b!505478 m!485657))

(declare-fun m!485691 () Bool)

(assert (=> b!505478 m!485691))

(declare-fun m!485693 () Bool)

(assert (=> b!505483 m!485693))

(declare-fun m!485695 () Bool)

(assert (=> b!505492 m!485695))

(declare-fun m!485697 () Bool)

(assert (=> b!505492 m!485697))

(assert (=> b!505492 m!485657))

(assert (=> b!505489 m!485657))

(assert (=> b!505489 m!485657))

(declare-fun m!485699 () Bool)

(assert (=> b!505489 m!485699))

(declare-fun m!485701 () Bool)

(assert (=> b!505485 m!485701))

(assert (=> b!505485 m!485693))

(check-sat (not b!505492) (not b!505489) (not b!505486) (not b!505479) (not b!505476) (not b!505480) (not start!45726) (not b!505484) (not b!505482) (not b!505485) (not b!505490) (not b!505483) (not b!505478) (not b!505481))
(check-sat)
