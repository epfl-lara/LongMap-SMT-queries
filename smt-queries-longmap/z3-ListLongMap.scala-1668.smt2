; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30898 () Bool)

(assert start!30898)

(declare-fun b!310011 () Bool)

(declare-fun res!166472 () Bool)

(declare-fun e!193606 () Bool)

(assert (=> b!310011 (=> (not res!166472) (not e!193606))))

(declare-datatypes ((array!15800 0))(
  ( (array!15801 (arr!7482 (Array (_ BitVec 32) (_ BitVec 64))) (size!7834 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15800)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310011 (= res!166472 (and (= (select (arr!7482 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7834 a!3293))))))

(declare-fun b!310013 () Bool)

(declare-fun res!166469 () Bool)

(declare-fun e!193608 () Bool)

(assert (=> b!310013 (=> (not res!166469) (not e!193608))))

(declare-fun mask!3709 () (_ BitVec 32))

(assert (=> b!310013 (= res!166469 (and (= (size!7834 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7834 a!3293))))))

(declare-fun b!310014 () Bool)

(declare-fun res!166473 () Bool)

(assert (=> b!310014 (=> (not res!166473) (not e!193608))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310014 (= res!166473 (validKeyInArray!0 k0!2441))))

(declare-fun b!310015 () Bool)

(declare-fun e!193609 () Bool)

(assert (=> b!310015 (= e!193606 e!193609)))

(declare-fun res!166465 () Bool)

(assert (=> b!310015 (=> (not res!166465) (not e!193609))))

(declare-datatypes ((SeekEntryResult!2622 0))(
  ( (MissingZero!2622 (index!12664 (_ BitVec 32))) (Found!2622 (index!12665 (_ BitVec 32))) (Intermediate!2622 (undefined!3434 Bool) (index!12666 (_ BitVec 32)) (x!30899 (_ BitVec 32))) (Undefined!2622) (MissingVacant!2622 (index!12667 (_ BitVec 32))) )
))
(declare-fun lt!151791 () SeekEntryResult!2622)

(declare-fun lt!151790 () SeekEntryResult!2622)

(assert (=> b!310015 (= res!166465 (and (= lt!151790 lt!151791) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7482 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15800 (_ BitVec 32)) SeekEntryResult!2622)

(assert (=> b!310015 (= lt!151790 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!310016 () Bool)

(assert (=> b!310016 (= e!193609 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310016 (= lt!151790 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!310017 () Bool)

(assert (=> b!310017 (= e!193608 e!193606)))

(declare-fun res!166470 () Bool)

(assert (=> b!310017 (=> (not res!166470) (not e!193606))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310017 (= res!166470 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151791))))

(assert (=> b!310017 (= lt!151791 (Intermediate!2622 false resIndex!52 resX!52))))

(declare-fun b!310018 () Bool)

(declare-fun res!166467 () Bool)

(assert (=> b!310018 (=> (not res!166467) (not e!193608))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15800 (_ BitVec 32)) Bool)

(assert (=> b!310018 (= res!166467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310019 () Bool)

(declare-fun res!166468 () Bool)

(assert (=> b!310019 (=> (not res!166468) (not e!193608))))

(declare-fun arrayContainsKey!0 (array!15800 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310019 (= res!166468 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!166466 () Bool)

(assert (=> start!30898 (=> (not res!166466) (not e!193608))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30898 (= res!166466 (validMask!0 mask!3709))))

(assert (=> start!30898 e!193608))

(declare-fun array_inv!5445 (array!15800) Bool)

(assert (=> start!30898 (array_inv!5445 a!3293)))

(assert (=> start!30898 true))

(declare-fun b!310012 () Bool)

(declare-fun res!166471 () Bool)

(assert (=> b!310012 (=> (not res!166471) (not e!193608))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15800 (_ BitVec 32)) SeekEntryResult!2622)

(assert (=> b!310012 (= res!166471 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2622 i!1240)))))

(assert (= (and start!30898 res!166466) b!310013))

(assert (= (and b!310013 res!166469) b!310014))

(assert (= (and b!310014 res!166473) b!310019))

(assert (= (and b!310019 res!166468) b!310012))

(assert (= (and b!310012 res!166471) b!310018))

(assert (= (and b!310018 res!166467) b!310017))

(assert (= (and b!310017 res!166470) b!310011))

(assert (= (and b!310011 res!166472) b!310015))

(assert (= (and b!310015 res!166465) b!310016))

(declare-fun m!319897 () Bool)

(assert (=> start!30898 m!319897))

(declare-fun m!319899 () Bool)

(assert (=> start!30898 m!319899))

(declare-fun m!319901 () Bool)

(assert (=> b!310016 m!319901))

(assert (=> b!310016 m!319901))

(declare-fun m!319903 () Bool)

(assert (=> b!310016 m!319903))

(declare-fun m!319905 () Bool)

(assert (=> b!310018 m!319905))

(declare-fun m!319907 () Bool)

(assert (=> b!310019 m!319907))

(declare-fun m!319909 () Bool)

(assert (=> b!310015 m!319909))

(declare-fun m!319911 () Bool)

(assert (=> b!310015 m!319911))

(declare-fun m!319913 () Bool)

(assert (=> b!310014 m!319913))

(declare-fun m!319915 () Bool)

(assert (=> b!310012 m!319915))

(declare-fun m!319917 () Bool)

(assert (=> b!310017 m!319917))

(assert (=> b!310017 m!319917))

(declare-fun m!319919 () Bool)

(assert (=> b!310017 m!319919))

(declare-fun m!319921 () Bool)

(assert (=> b!310011 m!319921))

(check-sat (not b!310019) (not b!310012) (not b!310014) (not b!310017) (not b!310018) (not start!30898) (not b!310015) (not b!310016))
(check-sat)
