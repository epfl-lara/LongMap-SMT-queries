; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30408 () Bool)

(assert start!30408)

(declare-fun b!304459 () Bool)

(declare-fun res!161862 () Bool)

(declare-fun e!191336 () Bool)

(assert (=> b!304459 (=> (not res!161862) (not e!191336))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304459 (= res!161862 (validKeyInArray!0 k0!2441))))

(declare-fun b!304460 () Bool)

(declare-fun res!161855 () Bool)

(declare-fun e!191337 () Bool)

(assert (=> b!304460 (=> (not res!161855) (not e!191337))))

(declare-datatypes ((array!15476 0))(
  ( (array!15477 (arr!7324 (Array (_ BitVec 32) (_ BitVec 64))) (size!7676 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15476)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!304460 (= res!161855 (and (= (select (arr!7324 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7676 a!3293))))))

(declare-fun res!161860 () Bool)

(assert (=> start!30408 (=> (not res!161860) (not e!191336))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30408 (= res!161860 (validMask!0 mask!3709))))

(assert (=> start!30408 e!191336))

(declare-fun array_inv!5274 (array!15476) Bool)

(assert (=> start!30408 (array_inv!5274 a!3293)))

(assert (=> start!30408 true))

(declare-fun b!304461 () Bool)

(declare-fun res!161857 () Bool)

(assert (=> b!304461 (=> (not res!161857) (not e!191336))))

(declare-datatypes ((SeekEntryResult!2429 0))(
  ( (MissingZero!2429 (index!11892 (_ BitVec 32))) (Found!2429 (index!11893 (_ BitVec 32))) (Intermediate!2429 (undefined!3241 Bool) (index!11894 (_ BitVec 32)) (x!30260 (_ BitVec 32))) (Undefined!2429) (MissingVacant!2429 (index!11895 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15476 (_ BitVec 32)) SeekEntryResult!2429)

(assert (=> b!304461 (= res!161857 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2429 i!1240)))))

(declare-fun b!304462 () Bool)

(declare-fun res!161859 () Bool)

(assert (=> b!304462 (=> (not res!161859) (not e!191336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15476 (_ BitVec 32)) Bool)

(assert (=> b!304462 (= res!161859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304463 () Bool)

(declare-fun res!161854 () Bool)

(assert (=> b!304463 (=> (not res!161854) (not e!191336))))

(assert (=> b!304463 (= res!161854 (and (= (size!7676 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7676 a!3293))))))

(declare-fun b!304464 () Bool)

(declare-fun res!161856 () Bool)

(assert (=> b!304464 (=> (not res!161856) (not e!191336))))

(declare-fun arrayContainsKey!0 (array!15476 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304464 (= res!161856 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304465 () Bool)

(declare-fun e!191334 () Bool)

(assert (=> b!304465 (= e!191337 e!191334)))

(declare-fun res!161861 () Bool)

(assert (=> b!304465 (=> (not res!161861) (not e!191334))))

(declare-fun lt!150485 () SeekEntryResult!2429)

(declare-fun lt!150486 () SeekEntryResult!2429)

(assert (=> b!304465 (= res!161861 (and (= lt!150485 lt!150486) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7324 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7324 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7324 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15476 (_ BitVec 32)) SeekEntryResult!2429)

(assert (=> b!304465 (= lt!150485 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!304466 () Bool)

(assert (=> b!304466 (= e!191334 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304466 (= lt!150485 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!304467 () Bool)

(assert (=> b!304467 (= e!191336 e!191337)))

(declare-fun res!161858 () Bool)

(assert (=> b!304467 (=> (not res!161858) (not e!191337))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304467 (= res!161858 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150486))))

(assert (=> b!304467 (= lt!150486 (Intermediate!2429 false resIndex!52 resX!52))))

(assert (= (and start!30408 res!161860) b!304463))

(assert (= (and b!304463 res!161854) b!304459))

(assert (= (and b!304459 res!161862) b!304464))

(assert (= (and b!304464 res!161856) b!304461))

(assert (= (and b!304461 res!161857) b!304462))

(assert (= (and b!304462 res!161859) b!304467))

(assert (= (and b!304467 res!161858) b!304460))

(assert (= (and b!304460 res!161855) b!304465))

(assert (= (and b!304465 res!161861) b!304466))

(declare-fun m!315721 () Bool)

(assert (=> b!304465 m!315721))

(declare-fun m!315723 () Bool)

(assert (=> b!304465 m!315723))

(declare-fun m!315725 () Bool)

(assert (=> b!304466 m!315725))

(assert (=> b!304466 m!315725))

(declare-fun m!315727 () Bool)

(assert (=> b!304466 m!315727))

(declare-fun m!315729 () Bool)

(assert (=> b!304464 m!315729))

(declare-fun m!315731 () Bool)

(assert (=> b!304467 m!315731))

(assert (=> b!304467 m!315731))

(declare-fun m!315733 () Bool)

(assert (=> b!304467 m!315733))

(declare-fun m!315735 () Bool)

(assert (=> b!304461 m!315735))

(declare-fun m!315737 () Bool)

(assert (=> start!30408 m!315737))

(declare-fun m!315739 () Bool)

(assert (=> start!30408 m!315739))

(declare-fun m!315741 () Bool)

(assert (=> b!304460 m!315741))

(declare-fun m!315743 () Bool)

(assert (=> b!304459 m!315743))

(declare-fun m!315745 () Bool)

(assert (=> b!304462 m!315745))

(check-sat (not b!304465) (not b!304461) (not b!304466) (not start!30408) (not b!304462) (not b!304464) (not b!304467) (not b!304459))
(check-sat)
