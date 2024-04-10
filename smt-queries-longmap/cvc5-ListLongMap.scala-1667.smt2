; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30890 () Bool)

(assert start!30890)

(declare-fun b!309903 () Bool)

(declare-fun res!166359 () Bool)

(declare-fun e!193561 () Bool)

(assert (=> b!309903 (=> (not res!166359) (not e!193561))))

(declare-datatypes ((array!15792 0))(
  ( (array!15793 (arr!7478 (Array (_ BitVec 32) (_ BitVec 64))) (size!7830 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15792)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15792 (_ BitVec 32)) Bool)

(assert (=> b!309903 (= res!166359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309905 () Bool)

(declare-fun res!166365 () Bool)

(assert (=> b!309905 (=> (not res!166365) (not e!193561))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!309905 (= res!166365 (and (= (size!7830 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7830 a!3293))))))

(declare-fun b!309906 () Bool)

(declare-fun res!166358 () Bool)

(assert (=> b!309906 (=> (not res!166358) (not e!193561))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15792 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309906 (= res!166358 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309907 () Bool)

(declare-fun res!166360 () Bool)

(assert (=> b!309907 (=> (not res!166360) (not e!193561))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309907 (= res!166360 (validKeyInArray!0 k!2441))))

(declare-fun b!309908 () Bool)

(declare-fun lt!151760 () (_ BitVec 32))

(declare-fun e!193558 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!309908 (= e!193558 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt lt!151760 #b00000000000000000000000000000000) (bvsge lt!151760 (bvadd #b00000000000000000000000000000001 mask!3709)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000)))))))

(declare-datatypes ((SeekEntryResult!2618 0))(
  ( (MissingZero!2618 (index!12648 (_ BitVec 32))) (Found!2618 (index!12649 (_ BitVec 32))) (Intermediate!2618 (undefined!3430 Bool) (index!12650 (_ BitVec 32)) (x!30887 (_ BitVec 32))) (Undefined!2618) (MissingVacant!2618 (index!12651 (_ BitVec 32))) )
))
(declare-fun lt!151759 () SeekEntryResult!2618)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15792 (_ BitVec 32)) SeekEntryResult!2618)

(assert (=> b!309908 (= lt!151759 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151760 k!2441 a!3293 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309908 (= lt!151760 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!309909 () Bool)

(declare-fun e!193559 () Bool)

(assert (=> b!309909 (= e!193561 e!193559)))

(declare-fun res!166362 () Bool)

(assert (=> b!309909 (=> (not res!166362) (not e!193559))))

(declare-fun lt!151761 () SeekEntryResult!2618)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309909 (= res!166362 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151761))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!309909 (= lt!151761 (Intermediate!2618 false resIndex!52 resX!52))))

(declare-fun b!309904 () Bool)

(assert (=> b!309904 (= e!193559 e!193558)))

(declare-fun res!166364 () Bool)

(assert (=> b!309904 (=> (not res!166364) (not e!193558))))

(assert (=> b!309904 (= res!166364 (and (= lt!151759 lt!151761) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7478 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309904 (= lt!151759 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun res!166361 () Bool)

(assert (=> start!30890 (=> (not res!166361) (not e!193561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30890 (= res!166361 (validMask!0 mask!3709))))

(assert (=> start!30890 e!193561))

(declare-fun array_inv!5441 (array!15792) Bool)

(assert (=> start!30890 (array_inv!5441 a!3293)))

(assert (=> start!30890 true))

(declare-fun b!309910 () Bool)

(declare-fun res!166357 () Bool)

(assert (=> b!309910 (=> (not res!166357) (not e!193559))))

(assert (=> b!309910 (= res!166357 (and (= (select (arr!7478 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7830 a!3293))))))

(declare-fun b!309911 () Bool)

(declare-fun res!166363 () Bool)

(assert (=> b!309911 (=> (not res!166363) (not e!193561))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15792 (_ BitVec 32)) SeekEntryResult!2618)

(assert (=> b!309911 (= res!166363 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2618 i!1240)))))

(assert (= (and start!30890 res!166361) b!309905))

(assert (= (and b!309905 res!166365) b!309907))

(assert (= (and b!309907 res!166360) b!309906))

(assert (= (and b!309906 res!166358) b!309911))

(assert (= (and b!309911 res!166363) b!309903))

(assert (= (and b!309903 res!166359) b!309909))

(assert (= (and b!309909 res!166362) b!309910))

(assert (= (and b!309910 res!166357) b!309904))

(assert (= (and b!309904 res!166364) b!309908))

(declare-fun m!319793 () Bool)

(assert (=> b!309903 m!319793))

(declare-fun m!319795 () Bool)

(assert (=> b!309909 m!319795))

(assert (=> b!309909 m!319795))

(declare-fun m!319797 () Bool)

(assert (=> b!309909 m!319797))

(declare-fun m!319799 () Bool)

(assert (=> b!309911 m!319799))

(declare-fun m!319801 () Bool)

(assert (=> b!309910 m!319801))

(declare-fun m!319803 () Bool)

(assert (=> b!309906 m!319803))

(declare-fun m!319805 () Bool)

(assert (=> b!309908 m!319805))

(declare-fun m!319807 () Bool)

(assert (=> b!309908 m!319807))

(declare-fun m!319809 () Bool)

(assert (=> start!30890 m!319809))

(declare-fun m!319811 () Bool)

(assert (=> start!30890 m!319811))

(declare-fun m!319813 () Bool)

(assert (=> b!309907 m!319813))

(declare-fun m!319815 () Bool)

(assert (=> b!309904 m!319815))

(declare-fun m!319817 () Bool)

(assert (=> b!309904 m!319817))

(push 1)

(assert (not b!309908))

(assert (not b!309904))

(assert (not b!309909))

(assert (not b!309911))

(assert (not b!309903))

(assert (not b!309907))

(assert (not start!30890))

(assert (not b!309906))

(check-sat)

(pop 1)

(push 1)

(check-sat)

