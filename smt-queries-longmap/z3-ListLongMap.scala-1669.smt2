; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30904 () Bool)

(assert start!30904)

(declare-fun b!310097 () Bool)

(declare-fun e!193648 () Bool)

(declare-fun e!193649 () Bool)

(assert (=> b!310097 (= e!193648 e!193649)))

(declare-fun res!166552 () Bool)

(assert (=> b!310097 (=> (not res!166552) (not e!193649))))

(declare-datatypes ((SeekEntryResult!2625 0))(
  ( (MissingZero!2625 (index!12676 (_ BitVec 32))) (Found!2625 (index!12677 (_ BitVec 32))) (Intermediate!2625 (undefined!3437 Bool) (index!12678 (_ BitVec 32)) (x!30910 (_ BitVec 32))) (Undefined!2625) (MissingVacant!2625 (index!12679 (_ BitVec 32))) )
))
(declare-fun lt!151820 () SeekEntryResult!2625)

(declare-datatypes ((array!15806 0))(
  ( (array!15807 (arr!7485 (Array (_ BitVec 32) (_ BitVec 64))) (size!7837 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15806)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15806 (_ BitVec 32)) SeekEntryResult!2625)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310097 (= res!166552 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151820))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310097 (= lt!151820 (Intermediate!2625 false resIndex!52 resX!52))))

(declare-fun b!310098 () Bool)

(declare-fun e!193647 () Bool)

(assert (=> b!310098 (= e!193647 (not true))))

(declare-fun e!193651 () Bool)

(assert (=> b!310098 e!193651))

(declare-fun res!166556 () Bool)

(assert (=> b!310098 (=> (not res!166556) (not e!193651))))

(declare-fun lt!151821 () (_ BitVec 32))

(declare-fun lt!151819 () SeekEntryResult!2625)

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!310098 (= res!166556 (= lt!151819 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151821 k0!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310098 (= lt!151821 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310099 () Bool)

(declare-fun res!166551 () Bool)

(assert (=> b!310099 (=> (not res!166551) (not e!193648))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15806 (_ BitVec 32)) SeekEntryResult!2625)

(assert (=> b!310099 (= res!166551 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2625 i!1240)))))

(declare-fun b!310100 () Bool)

(declare-fun res!166555 () Bool)

(assert (=> b!310100 (=> (not res!166555) (not e!193648))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15806 (_ BitVec 32)) Bool)

(assert (=> b!310100 (= res!166555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310101 () Bool)

(declare-fun res!166558 () Bool)

(assert (=> b!310101 (=> (not res!166558) (not e!193648))))

(assert (=> b!310101 (= res!166558 (and (= (size!7837 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7837 a!3293))))))

(declare-fun lt!151818 () array!15806)

(declare-fun b!310102 () Bool)

(assert (=> b!310102 (= e!193651 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!151818 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151821 k0!2441 lt!151818 mask!3709)))))

(assert (=> b!310102 (= lt!151818 (array!15807 (store (arr!7485 a!3293) i!1240 k0!2441) (size!7837 a!3293)))))

(declare-fun b!310103 () Bool)

(declare-fun res!166554 () Bool)

(assert (=> b!310103 (=> (not res!166554) (not e!193649))))

(assert (=> b!310103 (= res!166554 (and (= (select (arr!7485 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7837 a!3293))))))

(declare-fun b!310105 () Bool)

(assert (=> b!310105 (= e!193649 e!193647)))

(declare-fun res!166560 () Bool)

(assert (=> b!310105 (=> (not res!166560) (not e!193647))))

(assert (=> b!310105 (= res!166560 (and (= lt!151819 lt!151820) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7485 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310105 (= lt!151819 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!310106 () Bool)

(declare-fun res!166559 () Bool)

(assert (=> b!310106 (=> (not res!166559) (not e!193648))))

(declare-fun arrayContainsKey!0 (array!15806 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310106 (= res!166559 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!166557 () Bool)

(assert (=> start!30904 (=> (not res!166557) (not e!193648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30904 (= res!166557 (validMask!0 mask!3709))))

(assert (=> start!30904 e!193648))

(declare-fun array_inv!5448 (array!15806) Bool)

(assert (=> start!30904 (array_inv!5448 a!3293)))

(assert (=> start!30904 true))

(declare-fun b!310104 () Bool)

(declare-fun res!166553 () Bool)

(assert (=> b!310104 (=> (not res!166553) (not e!193648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310104 (= res!166553 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30904 res!166557) b!310101))

(assert (= (and b!310101 res!166558) b!310104))

(assert (= (and b!310104 res!166553) b!310106))

(assert (= (and b!310106 res!166559) b!310099))

(assert (= (and b!310099 res!166551) b!310100))

(assert (= (and b!310100 res!166555) b!310097))

(assert (= (and b!310097 res!166552) b!310103))

(assert (= (and b!310103 res!166554) b!310105))

(assert (= (and b!310105 res!166560) b!310098))

(assert (= (and b!310098 res!166556) b!310102))

(declare-fun m!319981 () Bool)

(assert (=> b!310105 m!319981))

(declare-fun m!319983 () Bool)

(assert (=> b!310105 m!319983))

(declare-fun m!319985 () Bool)

(assert (=> b!310099 m!319985))

(declare-fun m!319987 () Bool)

(assert (=> b!310097 m!319987))

(assert (=> b!310097 m!319987))

(declare-fun m!319989 () Bool)

(assert (=> b!310097 m!319989))

(declare-fun m!319991 () Bool)

(assert (=> b!310103 m!319991))

(declare-fun m!319993 () Bool)

(assert (=> b!310102 m!319993))

(declare-fun m!319995 () Bool)

(assert (=> b!310102 m!319995))

(declare-fun m!319997 () Bool)

(assert (=> b!310102 m!319997))

(declare-fun m!319999 () Bool)

(assert (=> b!310104 m!319999))

(declare-fun m!320001 () Bool)

(assert (=> start!30904 m!320001))

(declare-fun m!320003 () Bool)

(assert (=> start!30904 m!320003))

(declare-fun m!320005 () Bool)

(assert (=> b!310098 m!320005))

(declare-fun m!320007 () Bool)

(assert (=> b!310098 m!320007))

(declare-fun m!320009 () Bool)

(assert (=> b!310100 m!320009))

(declare-fun m!320011 () Bool)

(assert (=> b!310106 m!320011))

(check-sat (not b!310106) (not b!310104) (not b!310105) (not b!310098) (not b!310099) (not b!310100) (not b!310097) (not b!310102) (not start!30904))
(check-sat)
