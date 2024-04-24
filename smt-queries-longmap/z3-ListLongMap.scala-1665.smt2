; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30810 () Bool)

(assert start!30810)

(declare-fun b!309445 () Bool)

(declare-fun res!166110 () Bool)

(declare-fun e!193306 () Bool)

(assert (=> b!309445 (=> (not res!166110) (not e!193306))))

(declare-datatypes ((array!15776 0))(
  ( (array!15777 (arr!7471 (Array (_ BitVec 32) (_ BitVec 64))) (size!7823 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15776)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2576 0))(
  ( (MissingZero!2576 (index!12480 (_ BitVec 32))) (Found!2576 (index!12481 (_ BitVec 32))) (Intermediate!2576 (undefined!3388 Bool) (index!12482 (_ BitVec 32)) (x!30817 (_ BitVec 32))) (Undefined!2576) (MissingVacant!2576 (index!12483 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15776 (_ BitVec 32)) SeekEntryResult!2576)

(assert (=> b!309445 (= res!166110 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2576 i!1240)))))

(declare-fun b!309446 () Bool)

(declare-fun res!166112 () Bool)

(assert (=> b!309446 (=> (not res!166112) (not e!193306))))

(assert (=> b!309446 (= res!166112 (and (= (size!7823 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7823 a!3293))))))

(declare-fun b!309447 () Bool)

(declare-fun res!166111 () Bool)

(assert (=> b!309447 (=> (not res!166111) (not e!193306))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309447 (= res!166111 (validKeyInArray!0 k0!2441))))

(declare-fun b!309448 () Bool)

(declare-fun e!193307 () Bool)

(declare-fun e!193308 () Bool)

(assert (=> b!309448 (= e!193307 e!193308)))

(declare-fun res!166114 () Bool)

(assert (=> b!309448 (=> (not res!166114) (not e!193308))))

(declare-fun lt!151620 () SeekEntryResult!2576)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!151619 () SeekEntryResult!2576)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309448 (= res!166114 (and (= lt!151620 lt!151619) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7471 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15776 (_ BitVec 32)) SeekEntryResult!2576)

(assert (=> b!309448 (= lt!151620 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!309449 () Bool)

(declare-fun res!166116 () Bool)

(assert (=> b!309449 (=> (not res!166116) (not e!193306))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15776 (_ BitVec 32)) Bool)

(assert (=> b!309449 (= res!166116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309450 () Bool)

(declare-fun res!166108 () Bool)

(assert (=> b!309450 (=> (not res!166108) (not e!193307))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!309450 (= res!166108 (and (= (select (arr!7471 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7823 a!3293))))))

(declare-fun b!309451 () Bool)

(declare-fun res!166115 () Bool)

(assert (=> b!309451 (=> (not res!166115) (not e!193306))))

(declare-fun arrayContainsKey!0 (array!15776 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309451 (= res!166115 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!166109 () Bool)

(assert (=> start!30810 (=> (not res!166109) (not e!193306))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30810 (= res!166109 (validMask!0 mask!3709))))

(assert (=> start!30810 e!193306))

(declare-fun array_inv!5421 (array!15776) Bool)

(assert (=> start!30810 (array_inv!5421 a!3293)))

(assert (=> start!30810 true))

(declare-fun b!309452 () Bool)

(assert (=> b!309452 (= e!193306 e!193307)))

(declare-fun res!166113 () Bool)

(assert (=> b!309452 (=> (not res!166113) (not e!193307))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309452 (= res!166113 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151619))))

(assert (=> b!309452 (= lt!151619 (Intermediate!2576 false resIndex!52 resX!52))))

(declare-fun b!309453 () Bool)

(assert (=> b!309453 (= e!193308 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309453 (= lt!151620 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(assert (= (and start!30810 res!166109) b!309446))

(assert (= (and b!309446 res!166112) b!309447))

(assert (= (and b!309447 res!166111) b!309451))

(assert (= (and b!309451 res!166115) b!309445))

(assert (= (and b!309445 res!166110) b!309449))

(assert (= (and b!309449 res!166116) b!309452))

(assert (= (and b!309452 res!166113) b!309450))

(assert (= (and b!309450 res!166108) b!309448))

(assert (= (and b!309448 res!166114) b!309453))

(declare-fun m!319627 () Bool)

(assert (=> b!309453 m!319627))

(assert (=> b!309453 m!319627))

(declare-fun m!319629 () Bool)

(assert (=> b!309453 m!319629))

(declare-fun m!319631 () Bool)

(assert (=> b!309445 m!319631))

(declare-fun m!319633 () Bool)

(assert (=> b!309452 m!319633))

(assert (=> b!309452 m!319633))

(declare-fun m!319635 () Bool)

(assert (=> b!309452 m!319635))

(declare-fun m!319637 () Bool)

(assert (=> b!309449 m!319637))

(declare-fun m!319639 () Bool)

(assert (=> b!309450 m!319639))

(declare-fun m!319641 () Bool)

(assert (=> b!309448 m!319641))

(declare-fun m!319643 () Bool)

(assert (=> b!309448 m!319643))

(declare-fun m!319645 () Bool)

(assert (=> b!309451 m!319645))

(declare-fun m!319647 () Bool)

(assert (=> start!30810 m!319647))

(declare-fun m!319649 () Bool)

(assert (=> start!30810 m!319649))

(declare-fun m!319651 () Bool)

(assert (=> b!309447 m!319651))

(check-sat (not b!309447) (not start!30810) (not b!309449) (not b!309448) (not b!309453) (not b!309451) (not b!309445) (not b!309452))
(check-sat)
