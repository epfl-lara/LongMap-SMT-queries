; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47750 () Bool)

(assert start!47750)

(declare-fun b!525699 () Bool)

(declare-fun res!322479 () Bool)

(declare-fun e!306480 () Bool)

(assert (=> b!525699 (=> (not res!322479) (not e!306480))))

(declare-datatypes ((array!33388 0))(
  ( (array!33389 (arr!16045 (Array (_ BitVec 32) (_ BitVec 64))) (size!16409 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33388)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33388 (_ BitVec 32)) Bool)

(assert (=> b!525699 (= res!322479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525700 () Bool)

(declare-fun e!306484 () Bool)

(assert (=> b!525700 (= e!306484 e!306480)))

(declare-fun res!322481 () Bool)

(assert (=> b!525700 (=> (not res!322481) (not e!306480))))

(declare-datatypes ((SeekEntryResult!4468 0))(
  ( (MissingZero!4468 (index!20084 (_ BitVec 32))) (Found!4468 (index!20085 (_ BitVec 32))) (Intermediate!4468 (undefined!5280 Bool) (index!20086 (_ BitVec 32)) (x!49206 (_ BitVec 32))) (Undefined!4468) (MissingVacant!4468 (index!20087 (_ BitVec 32))) )
))
(declare-fun lt!241642 () SeekEntryResult!4468)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!525700 (= res!322481 (or (= lt!241642 (MissingZero!4468 i!1204)) (= lt!241642 (MissingVacant!4468 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33388 (_ BitVec 32)) SeekEntryResult!4468)

(assert (=> b!525700 (= lt!241642 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!525701 () Bool)

(declare-fun e!306486 () Bool)

(assert (=> b!525701 (= e!306486 false)))

(declare-fun b!525702 () Bool)

(declare-fun e!306482 () Bool)

(assert (=> b!525702 (= e!306482 true)))

(declare-fun lt!241639 () SeekEntryResult!4468)

(assert (=> b!525702 (= (index!20086 lt!241639) i!1204)))

(declare-fun lt!241645 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((Unit!16483 0))(
  ( (Unit!16484) )
))
(declare-fun lt!241637 () Unit!16483)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33388 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16483)

(assert (=> b!525702 (= lt!241637 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241645 #b00000000000000000000000000000000 (index!20086 lt!241639) (x!49206 lt!241639) mask!3524))))

(assert (=> b!525702 (and (or (= (select (arr!16045 a!3235) (index!20086 lt!241639)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16045 a!3235) (index!20086 lt!241639)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16045 a!3235) (index!20086 lt!241639)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16045 a!3235) (index!20086 lt!241639)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241638 () Unit!16483)

(declare-fun e!306483 () Unit!16483)

(assert (=> b!525702 (= lt!241638 e!306483)))

(declare-fun c!61919 () Bool)

(assert (=> b!525702 (= c!61919 (= (select (arr!16045 a!3235) (index!20086 lt!241639)) (select (arr!16045 a!3235) j!176)))))

(assert (=> b!525702 (and (bvslt (x!49206 lt!241639) #b01111111111111111111111111111110) (or (= (select (arr!16045 a!3235) (index!20086 lt!241639)) (select (arr!16045 a!3235) j!176)) (= (select (arr!16045 a!3235) (index!20086 lt!241639)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16045 a!3235) (index!20086 lt!241639)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525703 () Bool)

(declare-fun res!322475 () Bool)

(assert (=> b!525703 (=> (not res!322475) (not e!306484))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525703 (= res!322475 (validKeyInArray!0 k0!2280))))

(declare-fun b!525704 () Bool)

(declare-fun res!322472 () Bool)

(assert (=> b!525704 (=> (not res!322472) (not e!306484))))

(declare-fun arrayContainsKey!0 (array!33388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525704 (= res!322472 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525705 () Bool)

(assert (=> b!525705 (= e!306480 (not e!306482))))

(declare-fun res!322480 () Bool)

(assert (=> b!525705 (=> res!322480 e!306482)))

(declare-fun lt!241640 () (_ BitVec 32))

(declare-fun lt!241636 () array!33388)

(declare-fun lt!241644 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33388 (_ BitVec 32)) SeekEntryResult!4468)

(assert (=> b!525705 (= res!322480 (= lt!241639 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241640 lt!241644 lt!241636 mask!3524)))))

(assert (=> b!525705 (= lt!241639 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241645 (select (arr!16045 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525705 (= lt!241640 (toIndex!0 lt!241644 mask!3524))))

(assert (=> b!525705 (= lt!241644 (select (store (arr!16045 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!525705 (= lt!241645 (toIndex!0 (select (arr!16045 a!3235) j!176) mask!3524))))

(assert (=> b!525705 (= lt!241636 (array!33389 (store (arr!16045 a!3235) i!1204 k0!2280) (size!16409 a!3235)))))

(declare-fun e!306481 () Bool)

(assert (=> b!525705 e!306481))

(declare-fun res!322483 () Bool)

(assert (=> b!525705 (=> (not res!322483) (not e!306481))))

(assert (=> b!525705 (= res!322483 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241643 () Unit!16483)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33388 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16483)

(assert (=> b!525705 (= lt!241643 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525707 () Bool)

(declare-fun res!322482 () Bool)

(assert (=> b!525707 (=> (not res!322482) (not e!306484))))

(assert (=> b!525707 (= res!322482 (and (= (size!16409 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16409 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16409 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525708 () Bool)

(declare-fun Unit!16485 () Unit!16483)

(assert (=> b!525708 (= e!306483 Unit!16485)))

(declare-fun lt!241641 () Unit!16483)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33388 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16483)

(assert (=> b!525708 (= lt!241641 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241645 #b00000000000000000000000000000000 (index!20086 lt!241639) (x!49206 lt!241639) mask!3524))))

(declare-fun res!322478 () Bool)

(assert (=> b!525708 (= res!322478 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241645 lt!241644 lt!241636 mask!3524) (Intermediate!4468 false (index!20086 lt!241639) (x!49206 lt!241639))))))

(assert (=> b!525708 (=> (not res!322478) (not e!306486))))

(assert (=> b!525708 e!306486))

(declare-fun b!525709 () Bool)

(declare-fun res!322474 () Bool)

(assert (=> b!525709 (=> res!322474 e!306482)))

(get-info :version)

(assert (=> b!525709 (= res!322474 (or (undefined!5280 lt!241639) (not ((_ is Intermediate!4468) lt!241639))))))

(declare-fun b!525710 () Bool)

(declare-fun res!322477 () Bool)

(assert (=> b!525710 (=> (not res!322477) (not e!306484))))

(assert (=> b!525710 (= res!322477 (validKeyInArray!0 (select (arr!16045 a!3235) j!176)))))

(declare-fun b!525711 () Bool)

(assert (=> b!525711 (= e!306481 (= (seekEntryOrOpen!0 (select (arr!16045 a!3235) j!176) a!3235 mask!3524) (Found!4468 j!176)))))

(declare-fun b!525712 () Bool)

(declare-fun res!322476 () Bool)

(assert (=> b!525712 (=> (not res!322476) (not e!306480))))

(declare-datatypes ((List!10110 0))(
  ( (Nil!10107) (Cons!10106 (h!11037 (_ BitVec 64)) (t!16330 List!10110)) )
))
(declare-fun arrayNoDuplicates!0 (array!33388 (_ BitVec 32) List!10110) Bool)

(assert (=> b!525712 (= res!322476 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10107))))

(declare-fun res!322473 () Bool)

(assert (=> start!47750 (=> (not res!322473) (not e!306484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47750 (= res!322473 (validMask!0 mask!3524))))

(assert (=> start!47750 e!306484))

(assert (=> start!47750 true))

(declare-fun array_inv!11904 (array!33388) Bool)

(assert (=> start!47750 (array_inv!11904 a!3235)))

(declare-fun b!525706 () Bool)

(declare-fun Unit!16486 () Unit!16483)

(assert (=> b!525706 (= e!306483 Unit!16486)))

(assert (= (and start!47750 res!322473) b!525707))

(assert (= (and b!525707 res!322482) b!525710))

(assert (= (and b!525710 res!322477) b!525703))

(assert (= (and b!525703 res!322475) b!525704))

(assert (= (and b!525704 res!322472) b!525700))

(assert (= (and b!525700 res!322481) b!525699))

(assert (= (and b!525699 res!322479) b!525712))

(assert (= (and b!525712 res!322476) b!525705))

(assert (= (and b!525705 res!322483) b!525711))

(assert (= (and b!525705 (not res!322480)) b!525709))

(assert (= (and b!525709 (not res!322474)) b!525702))

(assert (= (and b!525702 c!61919) b!525708))

(assert (= (and b!525702 (not c!61919)) b!525706))

(assert (= (and b!525708 res!322478) b!525701))

(declare-fun m!506617 () Bool)

(assert (=> b!525700 m!506617))

(declare-fun m!506619 () Bool)

(assert (=> start!47750 m!506619))

(declare-fun m!506621 () Bool)

(assert (=> start!47750 m!506621))

(declare-fun m!506623 () Bool)

(assert (=> b!525711 m!506623))

(assert (=> b!525711 m!506623))

(declare-fun m!506625 () Bool)

(assert (=> b!525711 m!506625))

(declare-fun m!506627 () Bool)

(assert (=> b!525704 m!506627))

(declare-fun m!506629 () Bool)

(assert (=> b!525705 m!506629))

(declare-fun m!506631 () Bool)

(assert (=> b!525705 m!506631))

(declare-fun m!506633 () Bool)

(assert (=> b!525705 m!506633))

(declare-fun m!506635 () Bool)

(assert (=> b!525705 m!506635))

(assert (=> b!525705 m!506623))

(declare-fun m!506637 () Bool)

(assert (=> b!525705 m!506637))

(assert (=> b!525705 m!506623))

(assert (=> b!525705 m!506623))

(declare-fun m!506639 () Bool)

(assert (=> b!525705 m!506639))

(declare-fun m!506641 () Bool)

(assert (=> b!525705 m!506641))

(declare-fun m!506643 () Bool)

(assert (=> b!525705 m!506643))

(declare-fun m!506645 () Bool)

(assert (=> b!525712 m!506645))

(declare-fun m!506647 () Bool)

(assert (=> b!525703 m!506647))

(assert (=> b!525710 m!506623))

(assert (=> b!525710 m!506623))

(declare-fun m!506649 () Bool)

(assert (=> b!525710 m!506649))

(declare-fun m!506651 () Bool)

(assert (=> b!525699 m!506651))

(declare-fun m!506653 () Bool)

(assert (=> b!525708 m!506653))

(declare-fun m!506655 () Bool)

(assert (=> b!525708 m!506655))

(declare-fun m!506657 () Bool)

(assert (=> b!525702 m!506657))

(declare-fun m!506659 () Bool)

(assert (=> b!525702 m!506659))

(assert (=> b!525702 m!506623))

(check-sat (not b!525700) (not b!525702) (not b!525703) (not b!525711) (not b!525704) (not b!525699) (not b!525708) (not b!525712) (not start!47750) (not b!525710) (not b!525705))
(check-sat)
