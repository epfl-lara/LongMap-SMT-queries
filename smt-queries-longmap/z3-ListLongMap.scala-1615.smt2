; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30402 () Bool)

(assert start!30402)

(declare-fun b!304378 () Bool)

(declare-fun res!161776 () Bool)

(declare-fun e!191298 () Bool)

(assert (=> b!304378 (=> (not res!161776) (not e!191298))))

(declare-datatypes ((array!15470 0))(
  ( (array!15471 (arr!7321 (Array (_ BitVec 32) (_ BitVec 64))) (size!7673 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15470)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304378 (= res!161776 (and (= (select (arr!7321 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7673 a!3293))))))

(declare-fun b!304379 () Bool)

(declare-fun res!161775 () Bool)

(declare-fun e!191301 () Bool)

(assert (=> b!304379 (=> (not res!161775) (not e!191301))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304379 (= res!161775 (validKeyInArray!0 k0!2441))))

(declare-fun b!304381 () Bool)

(declare-fun res!161777 () Bool)

(assert (=> b!304381 (=> (not res!161777) (not e!191301))))

(declare-fun arrayContainsKey!0 (array!15470 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304381 (= res!161777 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304382 () Bool)

(declare-fun e!191299 () Bool)

(assert (=> b!304382 (= e!191299 (not true))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2426 0))(
  ( (MissingZero!2426 (index!11880 (_ BitVec 32))) (Found!2426 (index!11881 (_ BitVec 32))) (Intermediate!2426 (undefined!3238 Bool) (index!11882 (_ BitVec 32)) (x!30249 (_ BitVec 32))) (Undefined!2426) (MissingVacant!2426 (index!11883 (_ BitVec 32))) )
))
(declare-fun lt!150467 () SeekEntryResult!2426)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15470 (_ BitVec 32)) SeekEntryResult!2426)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304382 (= lt!150467 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!304383 () Bool)

(declare-fun res!161780 () Bool)

(assert (=> b!304383 (=> (not res!161780) (not e!191301))))

(assert (=> b!304383 (= res!161780 (and (= (size!7673 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7673 a!3293))))))

(declare-fun b!304384 () Bool)

(assert (=> b!304384 (= e!191301 e!191298)))

(declare-fun res!161774 () Bool)

(assert (=> b!304384 (=> (not res!161774) (not e!191298))))

(declare-fun lt!150468 () SeekEntryResult!2426)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304384 (= res!161774 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150468))))

(assert (=> b!304384 (= lt!150468 (Intermediate!2426 false resIndex!52 resX!52))))

(declare-fun b!304385 () Bool)

(assert (=> b!304385 (= e!191298 e!191299)))

(declare-fun res!161781 () Bool)

(assert (=> b!304385 (=> (not res!161781) (not e!191299))))

(assert (=> b!304385 (= res!161781 (and (= lt!150467 lt!150468) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7321 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7321 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7321 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304385 (= lt!150467 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!304386 () Bool)

(declare-fun res!161773 () Bool)

(assert (=> b!304386 (=> (not res!161773) (not e!191301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15470 (_ BitVec 32)) Bool)

(assert (=> b!304386 (= res!161773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304380 () Bool)

(declare-fun res!161778 () Bool)

(assert (=> b!304380 (=> (not res!161778) (not e!191301))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15470 (_ BitVec 32)) SeekEntryResult!2426)

(assert (=> b!304380 (= res!161778 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2426 i!1240)))))

(declare-fun res!161779 () Bool)

(assert (=> start!30402 (=> (not res!161779) (not e!191301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30402 (= res!161779 (validMask!0 mask!3709))))

(assert (=> start!30402 e!191301))

(declare-fun array_inv!5271 (array!15470) Bool)

(assert (=> start!30402 (array_inv!5271 a!3293)))

(assert (=> start!30402 true))

(assert (= (and start!30402 res!161779) b!304383))

(assert (= (and b!304383 res!161780) b!304379))

(assert (= (and b!304379 res!161775) b!304381))

(assert (= (and b!304381 res!161777) b!304380))

(assert (= (and b!304380 res!161778) b!304386))

(assert (= (and b!304386 res!161773) b!304384))

(assert (= (and b!304384 res!161774) b!304378))

(assert (= (and b!304378 res!161776) b!304385))

(assert (= (and b!304385 res!161781) b!304382))

(declare-fun m!315643 () Bool)

(assert (=> b!304380 m!315643))

(declare-fun m!315645 () Bool)

(assert (=> b!304379 m!315645))

(declare-fun m!315647 () Bool)

(assert (=> b!304381 m!315647))

(declare-fun m!315649 () Bool)

(assert (=> b!304382 m!315649))

(assert (=> b!304382 m!315649))

(declare-fun m!315651 () Bool)

(assert (=> b!304382 m!315651))

(declare-fun m!315653 () Bool)

(assert (=> b!304378 m!315653))

(declare-fun m!315655 () Bool)

(assert (=> b!304386 m!315655))

(declare-fun m!315657 () Bool)

(assert (=> b!304385 m!315657))

(declare-fun m!315659 () Bool)

(assert (=> b!304385 m!315659))

(declare-fun m!315661 () Bool)

(assert (=> b!304384 m!315661))

(assert (=> b!304384 m!315661))

(declare-fun m!315663 () Bool)

(assert (=> b!304384 m!315663))

(declare-fun m!315665 () Bool)

(assert (=> start!30402 m!315665))

(declare-fun m!315667 () Bool)

(assert (=> start!30402 m!315667))

(check-sat (not b!304382) (not b!304380) (not b!304379) (not b!304386) (not b!304384) (not b!304381) (not start!30402) (not b!304385))
(check-sat)
