; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31060 () Bool)

(assert start!31060)

(declare-fun b!312437 () Bool)

(declare-fun res!168894 () Bool)

(declare-fun e!194817 () Bool)

(assert (=> b!312437 (=> (not res!168894) (not e!194817))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312437 (= res!168894 (validKeyInArray!0 k0!2441))))

(declare-fun res!168898 () Bool)

(assert (=> start!31060 (=> (not res!168898) (not e!194817))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31060 (= res!168898 (validMask!0 mask!3709))))

(assert (=> start!31060 e!194817))

(declare-datatypes ((array!15962 0))(
  ( (array!15963 (arr!7563 (Array (_ BitVec 32) (_ BitVec 64))) (size!7915 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15962)

(declare-fun array_inv!5526 (array!15962) Bool)

(assert (=> start!31060 (array_inv!5526 a!3293)))

(assert (=> start!31060 true))

(declare-fun b!312438 () Bool)

(declare-fun res!168900 () Bool)

(declare-fun e!194821 () Bool)

(assert (=> b!312438 (=> (not res!168900) (not e!194821))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!312438 (= res!168900 (and (= (select (arr!7563 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7915 a!3293))))))

(declare-fun b!312439 () Bool)

(assert (=> b!312439 (= e!194817 e!194821)))

(declare-fun res!168892 () Bool)

(assert (=> b!312439 (=> (not res!168892) (not e!194821))))

(declare-datatypes ((SeekEntryResult!2703 0))(
  ( (MissingZero!2703 (index!12988 (_ BitVec 32))) (Found!2703 (index!12989 (_ BitVec 32))) (Intermediate!2703 (undefined!3515 Bool) (index!12990 (_ BitVec 32)) (x!31196 (_ BitVec 32))) (Undefined!2703) (MissingVacant!2703 (index!12991 (_ BitVec 32))) )
))
(declare-fun lt!153032 () SeekEntryResult!2703)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15962 (_ BitVec 32)) SeekEntryResult!2703)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312439 (= res!168892 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153032))))

(assert (=> b!312439 (= lt!153032 (Intermediate!2703 false resIndex!52 resX!52))))

(declare-fun b!312440 () Bool)

(declare-fun res!168891 () Bool)

(assert (=> b!312440 (=> (not res!168891) (not e!194817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15962 (_ BitVec 32)) Bool)

(assert (=> b!312440 (= res!168891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312441 () Bool)

(declare-fun res!168897 () Bool)

(assert (=> b!312441 (=> (not res!168897) (not e!194817))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15962 (_ BitVec 32)) SeekEntryResult!2703)

(assert (=> b!312441 (= res!168897 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2703 i!1240)))))

(declare-fun b!312442 () Bool)

(declare-fun e!194819 () Bool)

(declare-fun e!194818 () Bool)

(assert (=> b!312442 (= e!194819 (not e!194818))))

(declare-fun res!168895 () Bool)

(assert (=> b!312442 (=> res!168895 e!194818)))

(declare-fun lt!153029 () (_ BitVec 32))

(declare-fun lt!153028 () SeekEntryResult!2703)

(assert (=> b!312442 (= res!168895 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!153029 #b00000000000000000000000000000000) (bvsge lt!153029 (size!7915 a!3293)) (not (= lt!153028 lt!153032))))))

(declare-fun lt!153030 () SeekEntryResult!2703)

(declare-fun lt!153033 () SeekEntryResult!2703)

(assert (=> b!312442 (= lt!153030 lt!153033)))

(declare-fun lt!153031 () array!15962)

(assert (=> b!312442 (= lt!153033 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153029 k0!2441 lt!153031 mask!3709))))

(assert (=> b!312442 (= lt!153030 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!153031 mask!3709))))

(assert (=> b!312442 (= lt!153031 (array!15963 (store (arr!7563 a!3293) i!1240 k0!2441) (size!7915 a!3293)))))

(declare-fun lt!153027 () SeekEntryResult!2703)

(assert (=> b!312442 (= lt!153027 lt!153028)))

(assert (=> b!312442 (= lt!153028 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153029 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312442 (= lt!153029 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312443 () Bool)

(assert (=> b!312443 (= e!194821 e!194819)))

(declare-fun res!168893 () Bool)

(assert (=> b!312443 (=> (not res!168893) (not e!194819))))

(assert (=> b!312443 (= res!168893 (and (= lt!153027 lt!153032) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7563 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!312443 (= lt!153027 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!312444 () Bool)

(declare-fun res!168896 () Bool)

(assert (=> b!312444 (=> (not res!168896) (not e!194817))))

(assert (=> b!312444 (= res!168896 (and (= (size!7915 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7915 a!3293))))))

(declare-fun b!312445 () Bool)

(assert (=> b!312445 (= e!194818 (bvsge mask!3709 #b00000000000000000000000000000000))))

(assert (=> b!312445 (= lt!153033 lt!153028)))

(declare-datatypes ((Unit!9637 0))(
  ( (Unit!9638) )
))
(declare-fun lt!153026 () Unit!9637)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15962 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9637)

(assert (=> b!312445 (= lt!153026 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!153029 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312446 () Bool)

(declare-fun res!168899 () Bool)

(assert (=> b!312446 (=> (not res!168899) (not e!194817))))

(declare-fun arrayContainsKey!0 (array!15962 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312446 (= res!168899 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!31060 res!168898) b!312444))

(assert (= (and b!312444 res!168896) b!312437))

(assert (= (and b!312437 res!168894) b!312446))

(assert (= (and b!312446 res!168899) b!312441))

(assert (= (and b!312441 res!168897) b!312440))

(assert (= (and b!312440 res!168891) b!312439))

(assert (= (and b!312439 res!168892) b!312438))

(assert (= (and b!312438 res!168900) b!312443))

(assert (= (and b!312443 res!168893) b!312442))

(assert (= (and b!312442 (not res!168895)) b!312445))

(declare-fun m!322521 () Bool)

(assert (=> b!312441 m!322521))

(declare-fun m!322523 () Bool)

(assert (=> b!312445 m!322523))

(declare-fun m!322525 () Bool)

(assert (=> b!312442 m!322525))

(declare-fun m!322527 () Bool)

(assert (=> b!312442 m!322527))

(declare-fun m!322529 () Bool)

(assert (=> b!312442 m!322529))

(declare-fun m!322531 () Bool)

(assert (=> b!312442 m!322531))

(declare-fun m!322533 () Bool)

(assert (=> b!312442 m!322533))

(declare-fun m!322535 () Bool)

(assert (=> b!312446 m!322535))

(declare-fun m!322537 () Bool)

(assert (=> b!312439 m!322537))

(assert (=> b!312439 m!322537))

(declare-fun m!322539 () Bool)

(assert (=> b!312439 m!322539))

(declare-fun m!322541 () Bool)

(assert (=> b!312437 m!322541))

(declare-fun m!322543 () Bool)

(assert (=> start!31060 m!322543))

(declare-fun m!322545 () Bool)

(assert (=> start!31060 m!322545))

(declare-fun m!322547 () Bool)

(assert (=> b!312443 m!322547))

(declare-fun m!322549 () Bool)

(assert (=> b!312443 m!322549))

(declare-fun m!322551 () Bool)

(assert (=> b!312440 m!322551))

(declare-fun m!322553 () Bool)

(assert (=> b!312438 m!322553))

(check-sat (not b!312446) (not b!312442) (not b!312445) (not b!312443) (not b!312439) (not start!31060) (not b!312437) (not b!312441) (not b!312440))
(check-sat)
