; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30894 () Bool)

(assert start!30894)

(declare-fun b!309882 () Bool)

(declare-fun res!166491 () Bool)

(declare-fun e!193505 () Bool)

(assert (=> b!309882 (=> (not res!166491) (not e!193505))))

(declare-datatypes ((array!15800 0))(
  ( (array!15801 (arr!7482 (Array (_ BitVec 32) (_ BitVec 64))) (size!7835 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15800)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15800 (_ BitVec 32)) Bool)

(assert (=> b!309882 (= res!166491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!166487 () Bool)

(assert (=> start!30894 (=> (not res!166487) (not e!193505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30894 (= res!166487 (validMask!0 mask!3709))))

(assert (=> start!30894 e!193505))

(declare-fun array_inv!5454 (array!15800) Bool)

(assert (=> start!30894 (array_inv!5454 a!3293)))

(assert (=> start!30894 true))

(declare-fun b!309883 () Bool)

(declare-fun res!166483 () Bool)

(assert (=> b!309883 (=> (not res!166483) (not e!193505))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15800 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309883 (= res!166483 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309884 () Bool)

(declare-fun res!166488 () Bool)

(assert (=> b!309884 (=> (not res!166488) (not e!193505))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309884 (= res!166488 (validKeyInArray!0 k0!2441))))

(declare-fun b!309885 () Bool)

(declare-fun e!193503 () Bool)

(assert (=> b!309885 (= e!193503 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(declare-fun e!193502 () Bool)

(assert (=> b!309885 e!193502))

(declare-fun res!166489 () Bool)

(assert (=> b!309885 (=> (not res!166489) (not e!193502))))

(declare-fun lt!151610 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2621 0))(
  ( (MissingZero!2621 (index!12660 (_ BitVec 32))) (Found!2621 (index!12661 (_ BitVec 32))) (Intermediate!2621 (undefined!3433 Bool) (index!12662 (_ BitVec 32)) (x!30909 (_ BitVec 32))) (Undefined!2621) (MissingVacant!2621 (index!12663 (_ BitVec 32))) )
))
(declare-fun lt!151607 () SeekEntryResult!2621)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15800 (_ BitVec 32)) SeekEntryResult!2621)

(assert (=> b!309885 (= res!166489 (= lt!151607 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151610 k0!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309885 (= lt!151610 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!309886 () Bool)

(declare-fun lt!151608 () array!15800)

(assert (=> b!309886 (= e!193502 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!151608 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151610 k0!2441 lt!151608 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!309886 (= lt!151608 (array!15801 (store (arr!7482 a!3293) i!1240 k0!2441) (size!7835 a!3293)))))

(declare-fun b!309887 () Bool)

(declare-fun e!193504 () Bool)

(assert (=> b!309887 (= e!193504 e!193503)))

(declare-fun res!166484 () Bool)

(assert (=> b!309887 (=> (not res!166484) (not e!193503))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!151609 () SeekEntryResult!2621)

(assert (=> b!309887 (= res!166484 (and (= lt!151607 lt!151609) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7482 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309887 (= lt!151607 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!309888 () Bool)

(declare-fun res!166482 () Bool)

(assert (=> b!309888 (=> (not res!166482) (not e!193505))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15800 (_ BitVec 32)) SeekEntryResult!2621)

(assert (=> b!309888 (= res!166482 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2621 i!1240)))))

(declare-fun b!309889 () Bool)

(declare-fun res!166486 () Bool)

(assert (=> b!309889 (=> (not res!166486) (not e!193505))))

(assert (=> b!309889 (= res!166486 (and (= (size!7835 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7835 a!3293))))))

(declare-fun b!309890 () Bool)

(assert (=> b!309890 (= e!193505 e!193504)))

(declare-fun res!166485 () Bool)

(assert (=> b!309890 (=> (not res!166485) (not e!193504))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309890 (= res!166485 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151609))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!309890 (= lt!151609 (Intermediate!2621 false resIndex!52 resX!52))))

(declare-fun b!309891 () Bool)

(declare-fun res!166490 () Bool)

(assert (=> b!309891 (=> (not res!166490) (not e!193504))))

(assert (=> b!309891 (= res!166490 (and (= (select (arr!7482 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7835 a!3293))))))

(assert (= (and start!30894 res!166487) b!309889))

(assert (= (and b!309889 res!166486) b!309884))

(assert (= (and b!309884 res!166488) b!309883))

(assert (= (and b!309883 res!166483) b!309888))

(assert (= (and b!309888 res!166482) b!309882))

(assert (= (and b!309882 res!166491) b!309890))

(assert (= (and b!309890 res!166485) b!309891))

(assert (= (and b!309891 res!166490) b!309887))

(assert (= (and b!309887 res!166484) b!309885))

(assert (= (and b!309885 res!166489) b!309886))

(declare-fun m!319315 () Bool)

(assert (=> b!309882 m!319315))

(declare-fun m!319317 () Bool)

(assert (=> b!309887 m!319317))

(declare-fun m!319319 () Bool)

(assert (=> b!309887 m!319319))

(declare-fun m!319321 () Bool)

(assert (=> b!309890 m!319321))

(assert (=> b!309890 m!319321))

(declare-fun m!319323 () Bool)

(assert (=> b!309890 m!319323))

(declare-fun m!319325 () Bool)

(assert (=> b!309891 m!319325))

(declare-fun m!319327 () Bool)

(assert (=> start!30894 m!319327))

(declare-fun m!319329 () Bool)

(assert (=> start!30894 m!319329))

(declare-fun m!319331 () Bool)

(assert (=> b!309883 m!319331))

(declare-fun m!319333 () Bool)

(assert (=> b!309885 m!319333))

(declare-fun m!319335 () Bool)

(assert (=> b!309885 m!319335))

(declare-fun m!319337 () Bool)

(assert (=> b!309884 m!319337))

(declare-fun m!319339 () Bool)

(assert (=> b!309886 m!319339))

(declare-fun m!319341 () Bool)

(assert (=> b!309886 m!319341))

(declare-fun m!319343 () Bool)

(assert (=> b!309886 m!319343))

(declare-fun m!319345 () Bool)

(assert (=> b!309888 m!319345))

(check-sat (not b!309883) (not b!309890) (not b!309887) (not b!309886) (not start!30894) (not b!309882) (not b!309884) (not b!309888) (not b!309885))
(check-sat)
