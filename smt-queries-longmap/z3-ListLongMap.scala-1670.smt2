; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30894 () Bool)

(assert start!30894)

(declare-fun b!310104 () Bool)

(declare-fun e!193647 () Bool)

(declare-fun e!193646 () Bool)

(assert (=> b!310104 (= e!193647 e!193646)))

(declare-fun res!166614 () Bool)

(assert (=> b!310104 (=> (not res!166614) (not e!193646))))

(declare-datatypes ((SeekEntryResult!2591 0))(
  ( (MissingZero!2591 (index!12540 (_ BitVec 32))) (Found!2591 (index!12541 (_ BitVec 32))) (Intermediate!2591 (undefined!3403 Bool) (index!12542 (_ BitVec 32)) (x!30881 (_ BitVec 32))) (Undefined!2591) (MissingVacant!2591 (index!12543 (_ BitVec 32))) )
))
(declare-fun lt!151860 () SeekEntryResult!2591)

(declare-fun lt!151861 () SeekEntryResult!2591)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((array!15809 0))(
  ( (array!15810 (arr!7486 (Array (_ BitVec 32) (_ BitVec 64))) (size!7838 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15809)

(assert (=> b!310104 (= res!166614 (and (= lt!151860 lt!151861) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7486 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15809 (_ BitVec 32)) SeekEntryResult!2591)

(assert (=> b!310104 (= lt!151860 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!310105 () Bool)

(declare-fun res!166612 () Bool)

(declare-fun e!193644 () Bool)

(assert (=> b!310105 (=> (not res!166612) (not e!193644))))

(declare-fun arrayContainsKey!0 (array!15809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310105 (= res!166612 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!166616 () Bool)

(assert (=> start!30894 (=> (not res!166616) (not e!193644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30894 (= res!166616 (validMask!0 mask!3709))))

(assert (=> start!30894 e!193644))

(declare-fun array_inv!5436 (array!15809) Bool)

(assert (=> start!30894 (array_inv!5436 a!3293)))

(assert (=> start!30894 true))

(declare-fun b!310106 () Bool)

(declare-fun res!166615 () Bool)

(assert (=> b!310106 (=> (not res!166615) (not e!193644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15809 (_ BitVec 32)) Bool)

(assert (=> b!310106 (= res!166615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310107 () Bool)

(declare-fun res!166610 () Bool)

(assert (=> b!310107 (=> (not res!166610) (not e!193644))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15809 (_ BitVec 32)) SeekEntryResult!2591)

(assert (=> b!310107 (= res!166610 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2591 i!1240)))))

(declare-fun b!310108 () Bool)

(assert (=> b!310108 (= e!193644 e!193647)))

(declare-fun res!166609 () Bool)

(assert (=> b!310108 (=> (not res!166609) (not e!193647))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310108 (= res!166609 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151861))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!310108 (= lt!151861 (Intermediate!2591 false resIndex!52 resX!52))))

(declare-fun b!310109 () Bool)

(declare-fun res!166608 () Bool)

(assert (=> b!310109 (=> (not res!166608) (not e!193644))))

(assert (=> b!310109 (= res!166608 (and (= (size!7838 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7838 a!3293))))))

(declare-fun b!310110 () Bool)

(declare-fun res!166613 () Bool)

(assert (=> b!310110 (=> (not res!166613) (not e!193644))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310110 (= res!166613 (validKeyInArray!0 k0!2441))))

(declare-fun lt!151862 () array!15809)

(declare-fun e!193645 () Bool)

(declare-fun lt!151863 () (_ BitVec 32))

(declare-fun b!310111 () Bool)

(assert (=> b!310111 (= e!193645 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!151862 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151863 k0!2441 lt!151862 mask!3709)))))

(assert (=> b!310111 (= lt!151862 (array!15810 (store (arr!7486 a!3293) i!1240 k0!2441) (size!7838 a!3293)))))

(declare-fun b!310112 () Bool)

(declare-fun res!166611 () Bool)

(assert (=> b!310112 (=> (not res!166611) (not e!193647))))

(assert (=> b!310112 (= res!166611 (and (= (select (arr!7486 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7838 a!3293))))))

(declare-fun b!310113 () Bool)

(assert (=> b!310113 (= e!193646 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(assert (=> b!310113 e!193645))

(declare-fun res!166617 () Bool)

(assert (=> b!310113 (=> (not res!166617) (not e!193645))))

(assert (=> b!310113 (= res!166617 (= lt!151860 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151863 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310113 (= lt!151863 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(assert (= (and start!30894 res!166616) b!310109))

(assert (= (and b!310109 res!166608) b!310110))

(assert (= (and b!310110 res!166613) b!310105))

(assert (= (and b!310105 res!166612) b!310107))

(assert (= (and b!310107 res!166610) b!310106))

(assert (= (and b!310106 res!166615) b!310108))

(assert (= (and b!310108 res!166609) b!310112))

(assert (= (and b!310112 res!166611) b!310104))

(assert (= (and b!310104 res!166614) b!310113))

(assert (= (and b!310113 res!166617) b!310111))

(declare-fun m!320179 () Bool)

(assert (=> b!310111 m!320179))

(declare-fun m!320181 () Bool)

(assert (=> b!310111 m!320181))

(declare-fun m!320183 () Bool)

(assert (=> b!310111 m!320183))

(declare-fun m!320185 () Bool)

(assert (=> b!310108 m!320185))

(assert (=> b!310108 m!320185))

(declare-fun m!320187 () Bool)

(assert (=> b!310108 m!320187))

(declare-fun m!320189 () Bool)

(assert (=> start!30894 m!320189))

(declare-fun m!320191 () Bool)

(assert (=> start!30894 m!320191))

(declare-fun m!320193 () Bool)

(assert (=> b!310106 m!320193))

(declare-fun m!320195 () Bool)

(assert (=> b!310104 m!320195))

(declare-fun m!320197 () Bool)

(assert (=> b!310104 m!320197))

(declare-fun m!320199 () Bool)

(assert (=> b!310110 m!320199))

(declare-fun m!320201 () Bool)

(assert (=> b!310112 m!320201))

(declare-fun m!320203 () Bool)

(assert (=> b!310107 m!320203))

(declare-fun m!320205 () Bool)

(assert (=> b!310105 m!320205))

(declare-fun m!320207 () Bool)

(assert (=> b!310113 m!320207))

(declare-fun m!320209 () Bool)

(assert (=> b!310113 m!320209))

(check-sat (not b!310108) (not b!310107) (not b!310105) (not b!310106) (not b!310113) (not b!310104) (not b!310111) (not start!30894) (not b!310110))
(check-sat)
