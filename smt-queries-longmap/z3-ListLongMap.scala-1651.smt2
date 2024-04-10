; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30742 () Bool)

(assert start!30742)

(declare-fun b!308378 () Bool)

(declare-fun res!164998 () Bool)

(declare-fun e!192861 () Bool)

(assert (=> b!308378 (=> (not res!164998) (not e!192861))))

(declare-datatypes ((array!15695 0))(
  ( (array!15696 (arr!7431 (Array (_ BitVec 32) (_ BitVec 64))) (size!7783 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15695)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308378 (= res!164998 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308379 () Bool)

(declare-fun e!192862 () Bool)

(assert (=> b!308379 (= e!192861 e!192862)))

(declare-fun res!164994 () Bool)

(assert (=> b!308379 (=> (not res!164994) (not e!192862))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2571 0))(
  ( (MissingZero!2571 (index!12460 (_ BitVec 32))) (Found!2571 (index!12461 (_ BitVec 32))) (Intermediate!2571 (undefined!3383 Bool) (index!12462 (_ BitVec 32)) (x!30703 (_ BitVec 32))) (Undefined!2571) (MissingVacant!2571 (index!12463 (_ BitVec 32))) )
))
(declare-fun lt!151355 () SeekEntryResult!2571)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15695 (_ BitVec 32)) SeekEntryResult!2571)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308379 (= res!164994 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151355))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!308379 (= lt!151355 (Intermediate!2571 false resIndex!52 resX!52))))

(declare-fun b!308380 () Bool)

(declare-fun res!164993 () Bool)

(assert (=> b!308380 (=> (not res!164993) (not e!192862))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308380 (= res!164993 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7431 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun b!308381 () Bool)

(declare-fun res!165000 () Bool)

(assert (=> b!308381 (=> (not res!165000) (not e!192862))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!308381 (= res!165000 (and (= (select (arr!7431 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7783 a!3293))))))

(declare-fun b!308382 () Bool)

(declare-fun res!164991 () Bool)

(assert (=> b!308382 (=> (not res!164991) (not e!192861))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308382 (= res!164991 (validKeyInArray!0 k0!2441))))

(declare-fun b!308383 () Bool)

(declare-fun res!164995 () Bool)

(assert (=> b!308383 (=> (not res!164995) (not e!192861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15695 (_ BitVec 32)) Bool)

(assert (=> b!308383 (= res!164995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308384 () Bool)

(declare-fun res!164999 () Bool)

(assert (=> b!308384 (=> (not res!164999) (not e!192862))))

(assert (=> b!308384 (= res!164999 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151355))))

(declare-fun b!308385 () Bool)

(declare-fun res!164992 () Bool)

(assert (=> b!308385 (=> (not res!164992) (not e!192861))))

(assert (=> b!308385 (= res!164992 (and (= (size!7783 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7783 a!3293))))))

(declare-fun b!308386 () Bool)

(declare-fun lt!151356 () (_ BitVec 32))

(assert (=> b!308386 (= e!192862 (and (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge lt!151356 #b00000000000000000000000000000000) (bvslt lt!151356 (bvadd #b00000000000000000000000000000001 mask!3709)) (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308386 (= lt!151356 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!308387 () Bool)

(declare-fun res!164996 () Bool)

(assert (=> b!308387 (=> (not res!164996) (not e!192861))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15695 (_ BitVec 32)) SeekEntryResult!2571)

(assert (=> b!308387 (= res!164996 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2571 i!1240)))))

(declare-fun res!164997 () Bool)

(assert (=> start!30742 (=> (not res!164997) (not e!192861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30742 (= res!164997 (validMask!0 mask!3709))))

(assert (=> start!30742 e!192861))

(declare-fun array_inv!5394 (array!15695) Bool)

(assert (=> start!30742 (array_inv!5394 a!3293)))

(assert (=> start!30742 true))

(assert (= (and start!30742 res!164997) b!308385))

(assert (= (and b!308385 res!164992) b!308382))

(assert (= (and b!308382 res!164991) b!308378))

(assert (= (and b!308378 res!164998) b!308387))

(assert (= (and b!308387 res!164996) b!308383))

(assert (= (and b!308383 res!164995) b!308379))

(assert (= (and b!308379 res!164994) b!308381))

(assert (= (and b!308381 res!165000) b!308384))

(assert (= (and b!308384 res!164999) b!308380))

(assert (= (and b!308380 res!164993) b!308386))

(declare-fun m!318443 () Bool)

(assert (=> b!308383 m!318443))

(declare-fun m!318445 () Bool)

(assert (=> b!308379 m!318445))

(assert (=> b!308379 m!318445))

(declare-fun m!318447 () Bool)

(assert (=> b!308379 m!318447))

(declare-fun m!318449 () Bool)

(assert (=> b!308381 m!318449))

(declare-fun m!318451 () Bool)

(assert (=> b!308386 m!318451))

(declare-fun m!318453 () Bool)

(assert (=> b!308380 m!318453))

(declare-fun m!318455 () Bool)

(assert (=> start!30742 m!318455))

(declare-fun m!318457 () Bool)

(assert (=> start!30742 m!318457))

(declare-fun m!318459 () Bool)

(assert (=> b!308384 m!318459))

(declare-fun m!318461 () Bool)

(assert (=> b!308378 m!318461))

(declare-fun m!318463 () Bool)

(assert (=> b!308387 m!318463))

(declare-fun m!318465 () Bool)

(assert (=> b!308382 m!318465))

(check-sat (not b!308382) (not b!308386) (not b!308378) (not b!308383) (not b!308379) (not b!308387) (not start!30742) (not b!308384))
(check-sat)
