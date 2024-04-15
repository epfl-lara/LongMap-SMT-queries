; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30888 () Bool)

(assert start!30888)

(declare-fun b!309792 () Bool)

(declare-fun res!166392 () Bool)

(declare-fun e!193460 () Bool)

(assert (=> b!309792 (=> (not res!166392) (not e!193460))))

(declare-datatypes ((array!15794 0))(
  ( (array!15795 (arr!7479 (Array (_ BitVec 32) (_ BitVec 64))) (size!7832 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15794)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15794 (_ BitVec 32)) Bool)

(assert (=> b!309792 (= res!166392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309793 () Bool)

(declare-fun res!166397 () Bool)

(declare-fun e!193459 () Bool)

(assert (=> b!309793 (=> (not res!166397) (not e!193459))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309793 (= res!166397 (and (= (select (arr!7479 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7832 a!3293))))))

(declare-fun b!309794 () Bool)

(declare-fun e!193457 () Bool)

(assert (=> b!309794 (= e!193457 (not true))))

(declare-fun e!193456 () Bool)

(assert (=> b!309794 e!193456))

(declare-fun res!166393 () Bool)

(assert (=> b!309794 (=> (not res!166393) (not e!193456))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2618 0))(
  ( (MissingZero!2618 (index!12648 (_ BitVec 32))) (Found!2618 (index!12649 (_ BitVec 32))) (Intermediate!2618 (undefined!3430 Bool) (index!12650 (_ BitVec 32)) (x!30898 (_ BitVec 32))) (Undefined!2618) (MissingVacant!2618 (index!12651 (_ BitVec 32))) )
))
(declare-fun lt!151574 () SeekEntryResult!2618)

(declare-fun lt!151571 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15794 (_ BitVec 32)) SeekEntryResult!2618)

(assert (=> b!309794 (= res!166393 (= lt!151574 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151571 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309794 (= lt!151571 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!309795 () Bool)

(declare-fun res!166401 () Bool)

(assert (=> b!309795 (=> (not res!166401) (not e!193460))))

(assert (=> b!309795 (= res!166401 (and (= (size!7832 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7832 a!3293))))))

(declare-fun b!309796 () Bool)

(assert (=> b!309796 (= e!193460 e!193459)))

(declare-fun res!166399 () Bool)

(assert (=> b!309796 (=> (not res!166399) (not e!193459))))

(declare-fun lt!151572 () SeekEntryResult!2618)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309796 (= res!166399 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151572))))

(assert (=> b!309796 (= lt!151572 (Intermediate!2618 false resIndex!52 resX!52))))

(declare-fun res!166398 () Bool)

(assert (=> start!30888 (=> (not res!166398) (not e!193460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30888 (= res!166398 (validMask!0 mask!3709))))

(assert (=> start!30888 e!193460))

(declare-fun array_inv!5451 (array!15794) Bool)

(assert (=> start!30888 (array_inv!5451 a!3293)))

(assert (=> start!30888 true))

(declare-fun b!309797 () Bool)

(declare-fun lt!151573 () array!15794)

(assert (=> b!309797 (= e!193456 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!151573 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151571 k0!2441 lt!151573 mask!3709)))))

(assert (=> b!309797 (= lt!151573 (array!15795 (store (arr!7479 a!3293) i!1240 k0!2441) (size!7832 a!3293)))))

(declare-fun b!309798 () Bool)

(declare-fun res!166394 () Bool)

(assert (=> b!309798 (=> (not res!166394) (not e!193460))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15794 (_ BitVec 32)) SeekEntryResult!2618)

(assert (=> b!309798 (= res!166394 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2618 i!1240)))))

(declare-fun b!309799 () Bool)

(declare-fun res!166396 () Bool)

(assert (=> b!309799 (=> (not res!166396) (not e!193460))))

(declare-fun arrayContainsKey!0 (array!15794 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309799 (= res!166396 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309800 () Bool)

(assert (=> b!309800 (= e!193459 e!193457)))

(declare-fun res!166400 () Bool)

(assert (=> b!309800 (=> (not res!166400) (not e!193457))))

(assert (=> b!309800 (= res!166400 (and (= lt!151574 lt!151572) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7479 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309800 (= lt!151574 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!309801 () Bool)

(declare-fun res!166395 () Bool)

(assert (=> b!309801 (=> (not res!166395) (not e!193460))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309801 (= res!166395 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30888 res!166398) b!309795))

(assert (= (and b!309795 res!166401) b!309801))

(assert (= (and b!309801 res!166395) b!309799))

(assert (= (and b!309799 res!166396) b!309798))

(assert (= (and b!309798 res!166394) b!309792))

(assert (= (and b!309792 res!166392) b!309796))

(assert (= (and b!309796 res!166399) b!309793))

(assert (= (and b!309793 res!166397) b!309800))

(assert (= (and b!309800 res!166400) b!309794))

(assert (= (and b!309794 res!166393) b!309797))

(declare-fun m!319219 () Bool)

(assert (=> b!309792 m!319219))

(declare-fun m!319221 () Bool)

(assert (=> b!309796 m!319221))

(assert (=> b!309796 m!319221))

(declare-fun m!319223 () Bool)

(assert (=> b!309796 m!319223))

(declare-fun m!319225 () Bool)

(assert (=> b!309800 m!319225))

(declare-fun m!319227 () Bool)

(assert (=> b!309800 m!319227))

(declare-fun m!319229 () Bool)

(assert (=> b!309793 m!319229))

(declare-fun m!319231 () Bool)

(assert (=> b!309801 m!319231))

(declare-fun m!319233 () Bool)

(assert (=> start!30888 m!319233))

(declare-fun m!319235 () Bool)

(assert (=> start!30888 m!319235))

(declare-fun m!319237 () Bool)

(assert (=> b!309797 m!319237))

(declare-fun m!319239 () Bool)

(assert (=> b!309797 m!319239))

(declare-fun m!319241 () Bool)

(assert (=> b!309797 m!319241))

(declare-fun m!319243 () Bool)

(assert (=> b!309794 m!319243))

(declare-fun m!319245 () Bool)

(assert (=> b!309794 m!319245))

(declare-fun m!319247 () Bool)

(assert (=> b!309798 m!319247))

(declare-fun m!319249 () Bool)

(assert (=> b!309799 m!319249))

(check-sat (not b!309794) (not b!309801) (not b!309796) (not b!309798) (not start!30888) (not b!309792) (not b!309799) (not b!309800) (not b!309797))
(check-sat)
