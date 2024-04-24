; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30984 () Bool)

(assert start!30984)

(declare-fun b!311454 () Bool)

(declare-fun e!194322 () Bool)

(declare-fun e!194320 () Bool)

(assert (=> b!311454 (= e!194322 e!194320)))

(declare-fun res!167960 () Bool)

(assert (=> b!311454 (=> (not res!167960) (not e!194320))))

(declare-datatypes ((array!15899 0))(
  ( (array!15900 (arr!7531 (Array (_ BitVec 32) (_ BitVec 64))) (size!7883 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15899)

(declare-datatypes ((SeekEntryResult!2636 0))(
  ( (MissingZero!2636 (index!12720 (_ BitVec 32))) (Found!2636 (index!12721 (_ BitVec 32))) (Intermediate!2636 (undefined!3448 Bool) (index!12722 (_ BitVec 32)) (x!31046 (_ BitVec 32))) (Undefined!2636) (MissingVacant!2636 (index!12723 (_ BitVec 32))) )
))
(declare-fun lt!152400 () SeekEntryResult!2636)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15899 (_ BitVec 32)) SeekEntryResult!2636)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311454 (= res!167960 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152400))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311454 (= lt!152400 (Intermediate!2636 false resIndex!52 resX!52))))

(declare-fun b!311455 () Bool)

(declare-fun res!167958 () Bool)

(assert (=> b!311455 (=> (not res!167958) (not e!194322))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311455 (= res!167958 (validKeyInArray!0 k0!2441))))

(declare-fun b!311456 () Bool)

(declare-fun res!167965 () Bool)

(assert (=> b!311456 (=> (not res!167965) (not e!194322))))

(declare-fun arrayContainsKey!0 (array!15899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311456 (= res!167965 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311457 () Bool)

(declare-fun res!167964 () Bool)

(assert (=> b!311457 (=> (not res!167964) (not e!194320))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311457 (= res!167964 (and (= (select (arr!7531 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7883 a!3293))))))

(declare-fun res!167963 () Bool)

(assert (=> start!30984 (=> (not res!167963) (not e!194322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30984 (= res!167963 (validMask!0 mask!3709))))

(assert (=> start!30984 e!194322))

(declare-fun array_inv!5481 (array!15899) Bool)

(assert (=> start!30984 (array_inv!5481 a!3293)))

(assert (=> start!30984 true))

(declare-fun lt!152401 () (_ BitVec 32))

(declare-fun e!194319 () Bool)

(declare-fun b!311458 () Bool)

(declare-fun lt!152403 () array!15899)

(assert (=> b!311458 (= e!194319 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152403 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152401 k0!2441 lt!152403 mask!3709)))))

(assert (=> b!311458 (= lt!152403 (array!15900 (store (arr!7531 a!3293) i!1240 k0!2441) (size!7883 a!3293)))))

(declare-fun b!311459 () Bool)

(declare-fun res!167959 () Bool)

(assert (=> b!311459 (=> (not res!167959) (not e!194322))))

(assert (=> b!311459 (= res!167959 (and (= (size!7883 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7883 a!3293))))))

(declare-fun b!311460 () Bool)

(declare-fun res!167961 () Bool)

(assert (=> b!311460 (=> (not res!167961) (not e!194322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15899 (_ BitVec 32)) Bool)

(assert (=> b!311460 (= res!167961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311461 () Bool)

(declare-fun e!194321 () Bool)

(assert (=> b!311461 (= e!194320 e!194321)))

(declare-fun res!167966 () Bool)

(assert (=> b!311461 (=> (not res!167966) (not e!194321))))

(declare-fun lt!152402 () SeekEntryResult!2636)

(assert (=> b!311461 (= res!167966 (and (= lt!152402 lt!152400) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7531 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311461 (= lt!152402 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311462 () Bool)

(declare-fun res!167962 () Bool)

(assert (=> b!311462 (=> (not res!167962) (not e!194322))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15899 (_ BitVec 32)) SeekEntryResult!2636)

(assert (=> b!311462 (= res!167962 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2636 i!1240)))))

(declare-fun b!311463 () Bool)

(assert (=> b!311463 (= e!194321 (not true))))

(assert (=> b!311463 e!194319))

(declare-fun res!167967 () Bool)

(assert (=> b!311463 (=> (not res!167967) (not e!194319))))

(assert (=> b!311463 (= res!167967 (= lt!152402 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152401 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311463 (= lt!152401 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(assert (= (and start!30984 res!167963) b!311459))

(assert (= (and b!311459 res!167959) b!311455))

(assert (= (and b!311455 res!167958) b!311456))

(assert (= (and b!311456 res!167965) b!311462))

(assert (= (and b!311462 res!167962) b!311460))

(assert (= (and b!311460 res!167961) b!311454))

(assert (= (and b!311454 res!167960) b!311457))

(assert (= (and b!311457 res!167964) b!311461))

(assert (= (and b!311461 res!167966) b!311463))

(assert (= (and b!311463 res!167967) b!311458))

(declare-fun m!321619 () Bool)

(assert (=> start!30984 m!321619))

(declare-fun m!321621 () Bool)

(assert (=> start!30984 m!321621))

(declare-fun m!321623 () Bool)

(assert (=> b!311455 m!321623))

(declare-fun m!321625 () Bool)

(assert (=> b!311458 m!321625))

(declare-fun m!321627 () Bool)

(assert (=> b!311458 m!321627))

(declare-fun m!321629 () Bool)

(assert (=> b!311458 m!321629))

(declare-fun m!321631 () Bool)

(assert (=> b!311463 m!321631))

(declare-fun m!321633 () Bool)

(assert (=> b!311463 m!321633))

(declare-fun m!321635 () Bool)

(assert (=> b!311454 m!321635))

(assert (=> b!311454 m!321635))

(declare-fun m!321637 () Bool)

(assert (=> b!311454 m!321637))

(declare-fun m!321639 () Bool)

(assert (=> b!311460 m!321639))

(declare-fun m!321641 () Bool)

(assert (=> b!311457 m!321641))

(declare-fun m!321643 () Bool)

(assert (=> b!311461 m!321643))

(declare-fun m!321645 () Bool)

(assert (=> b!311461 m!321645))

(declare-fun m!321647 () Bool)

(assert (=> b!311462 m!321647))

(declare-fun m!321649 () Bool)

(assert (=> b!311456 m!321649))

(check-sat (not b!311458) (not b!311463) (not b!311462) (not b!311456) (not b!311460) (not b!311455) (not b!311454) (not b!311461) (not start!30984))
(check-sat)
