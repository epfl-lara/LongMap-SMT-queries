; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30786 () Bool)

(assert start!30786)

(declare-fun b!308899 () Bool)

(declare-fun res!165660 () Bool)

(declare-fun e!193020 () Bool)

(assert (=> b!308899 (=> (not res!165660) (not e!193020))))

(declare-datatypes ((array!15743 0))(
  ( (array!15744 (arr!7455 (Array (_ BitVec 32) (_ BitVec 64))) (size!7808 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15743)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308899 (= res!165660 (and (= (select (arr!7455 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7808 a!3293))))))

(declare-fun b!308900 () Bool)

(declare-fun res!165663 () Bool)

(declare-fun e!193019 () Bool)

(assert (=> b!308900 (=> (not res!165663) (not e!193019))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308900 (= res!165663 (validKeyInArray!0 k0!2441))))

(declare-fun b!308901 () Bool)

(assert (=> b!308901 (= e!193019 e!193020)))

(declare-fun res!165665 () Bool)

(assert (=> b!308901 (=> (not res!165665) (not e!193020))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2594 0))(
  ( (MissingZero!2594 (index!12552 (_ BitVec 32))) (Found!2594 (index!12553 (_ BitVec 32))) (Intermediate!2594 (undefined!3406 Bool) (index!12554 (_ BitVec 32)) (x!30801 (_ BitVec 32))) (Undefined!2594) (MissingVacant!2594 (index!12555 (_ BitVec 32))) )
))
(declare-fun lt!151295 () SeekEntryResult!2594)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15743 (_ BitVec 32)) SeekEntryResult!2594)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308901 (= res!165665 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151295))))

(assert (=> b!308901 (= lt!151295 (Intermediate!2594 false resIndex!52 resX!52))))

(declare-fun b!308902 () Bool)

(declare-fun e!193022 () Bool)

(assert (=> b!308902 (= e!193022 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun lt!151294 () SeekEntryResult!2594)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308902 (= lt!151294 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!308903 () Bool)

(assert (=> b!308903 (= e!193020 e!193022)))

(declare-fun res!165659 () Bool)

(assert (=> b!308903 (=> (not res!165659) (not e!193022))))

(assert (=> b!308903 (= res!165659 (and (= lt!151294 lt!151295) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7455 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!308903 (= lt!151294 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!308904 () Bool)

(declare-fun res!165658 () Bool)

(assert (=> b!308904 (=> (not res!165658) (not e!193019))))

(assert (=> b!308904 (= res!165658 (and (= (size!7808 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7808 a!3293))))))

(declare-fun b!308905 () Bool)

(declare-fun res!165666 () Bool)

(assert (=> b!308905 (=> (not res!165666) (not e!193019))))

(declare-fun arrayContainsKey!0 (array!15743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308905 (= res!165666 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!165664 () Bool)

(assert (=> start!30786 (=> (not res!165664) (not e!193019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30786 (= res!165664 (validMask!0 mask!3709))))

(assert (=> start!30786 e!193019))

(declare-fun array_inv!5427 (array!15743) Bool)

(assert (=> start!30786 (array_inv!5427 a!3293)))

(assert (=> start!30786 true))

(declare-fun b!308906 () Bool)

(declare-fun res!165661 () Bool)

(assert (=> b!308906 (=> (not res!165661) (not e!193019))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15743 (_ BitVec 32)) SeekEntryResult!2594)

(assert (=> b!308906 (= res!165661 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2594 i!1240)))))

(declare-fun b!308907 () Bool)

(declare-fun res!165662 () Bool)

(assert (=> b!308907 (=> (not res!165662) (not e!193019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15743 (_ BitVec 32)) Bool)

(assert (=> b!308907 (= res!165662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30786 res!165664) b!308904))

(assert (= (and b!308904 res!165658) b!308900))

(assert (= (and b!308900 res!165663) b!308905))

(assert (= (and b!308905 res!165666) b!308906))

(assert (= (and b!308906 res!165661) b!308907))

(assert (= (and b!308907 res!165662) b!308901))

(assert (= (and b!308901 res!165665) b!308899))

(assert (= (and b!308899 res!165660) b!308903))

(assert (= (and b!308903 res!165659) b!308902))

(declare-fun m!318457 () Bool)

(assert (=> b!308905 m!318457))

(declare-fun m!318459 () Bool)

(assert (=> start!30786 m!318459))

(declare-fun m!318461 () Bool)

(assert (=> start!30786 m!318461))

(declare-fun m!318463 () Bool)

(assert (=> b!308907 m!318463))

(declare-fun m!318465 () Bool)

(assert (=> b!308906 m!318465))

(declare-fun m!318467 () Bool)

(assert (=> b!308902 m!318467))

(assert (=> b!308902 m!318467))

(declare-fun m!318469 () Bool)

(assert (=> b!308902 m!318469))

(declare-fun m!318471 () Bool)

(assert (=> b!308899 m!318471))

(declare-fun m!318473 () Bool)

(assert (=> b!308901 m!318473))

(assert (=> b!308901 m!318473))

(declare-fun m!318475 () Bool)

(assert (=> b!308901 m!318475))

(declare-fun m!318477 () Bool)

(assert (=> b!308900 m!318477))

(declare-fun m!318479 () Bool)

(assert (=> b!308903 m!318479))

(declare-fun m!318481 () Bool)

(assert (=> b!308903 m!318481))

(check-sat (not b!308900) (not b!308903) (not b!308901) (not start!30786) (not b!308902) (not b!308906) (not b!308905) (not b!308907))
(check-sat)
