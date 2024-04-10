; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30774 () Bool)

(assert start!30774)

(declare-fun res!165443 () Bool)

(declare-fun e!193039 () Bool)

(assert (=> start!30774 (=> (not res!165443) (not e!193039))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30774 (= res!165443 (validMask!0 mask!3709))))

(assert (=> start!30774 e!193039))

(declare-datatypes ((array!15727 0))(
  ( (array!15728 (arr!7447 (Array (_ BitVec 32) (_ BitVec 64))) (size!7799 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15727)

(declare-fun array_inv!5410 (array!15727) Bool)

(assert (=> start!30774 (array_inv!5410 a!3293)))

(assert (=> start!30774 true))

(declare-fun b!308823 () Bool)

(declare-fun e!193042 () Bool)

(assert (=> b!308823 (= e!193039 e!193042)))

(declare-fun res!165438 () Bool)

(assert (=> b!308823 (=> (not res!165438) (not e!193042))))

(declare-datatypes ((SeekEntryResult!2587 0))(
  ( (MissingZero!2587 (index!12524 (_ BitVec 32))) (Found!2587 (index!12525 (_ BitVec 32))) (Intermediate!2587 (undefined!3399 Bool) (index!12526 (_ BitVec 32)) (x!30759 (_ BitVec 32))) (Undefined!2587) (MissingVacant!2587 (index!12527 (_ BitVec 32))) )
))
(declare-fun lt!151451 () SeekEntryResult!2587)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15727 (_ BitVec 32)) SeekEntryResult!2587)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308823 (= res!165438 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151451))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!308823 (= lt!151451 (Intermediate!2587 false resIndex!52 resX!52))))

(declare-fun b!308824 () Bool)

(declare-fun res!165442 () Bool)

(assert (=> b!308824 (=> (not res!165442) (not e!193039))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!308824 (= res!165442 (and (= (size!7799 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7799 a!3293))))))

(declare-fun b!308825 () Bool)

(declare-fun res!165441 () Bool)

(assert (=> b!308825 (=> (not res!165441) (not e!193042))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308825 (= res!165441 (and (= (select (arr!7447 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7799 a!3293))))))

(declare-fun b!308826 () Bool)

(declare-fun e!193040 () Bool)

(assert (=> b!308826 (= e!193042 e!193040)))

(declare-fun res!165436 () Bool)

(assert (=> b!308826 (=> (not res!165436) (not e!193040))))

(declare-fun lt!151452 () SeekEntryResult!2587)

(assert (=> b!308826 (= res!165436 (and (= lt!151452 lt!151451) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7447 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!308826 (= lt!151452 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!308827 () Bool)

(assert (=> b!308827 (= e!193040 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308827 (= lt!151452 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!308828 () Bool)

(declare-fun res!165437 () Bool)

(assert (=> b!308828 (=> (not res!165437) (not e!193039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308828 (= res!165437 (validKeyInArray!0 k!2441))))

(declare-fun b!308829 () Bool)

(declare-fun res!165444 () Bool)

(assert (=> b!308829 (=> (not res!165444) (not e!193039))))

(declare-fun arrayContainsKey!0 (array!15727 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308829 (= res!165444 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308830 () Bool)

(declare-fun res!165439 () Bool)

(assert (=> b!308830 (=> (not res!165439) (not e!193039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15727 (_ BitVec 32)) Bool)

(assert (=> b!308830 (= res!165439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308831 () Bool)

(declare-fun res!165440 () Bool)

(assert (=> b!308831 (=> (not res!165440) (not e!193039))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15727 (_ BitVec 32)) SeekEntryResult!2587)

(assert (=> b!308831 (= res!165440 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2587 i!1240)))))

(assert (= (and start!30774 res!165443) b!308824))

(assert (= (and b!308824 res!165442) b!308828))

(assert (= (and b!308828 res!165437) b!308829))

(assert (= (and b!308829 res!165444) b!308831))

(assert (= (and b!308831 res!165440) b!308830))

(assert (= (and b!308830 res!165439) b!308823))

(assert (= (and b!308823 res!165438) b!308825))

(assert (= (and b!308825 res!165441) b!308826))

(assert (= (and b!308826 res!165436) b!308827))

(declare-fun m!318849 () Bool)

(assert (=> b!308825 m!318849))

(declare-fun m!318851 () Bool)

(assert (=> b!308827 m!318851))

(assert (=> b!308827 m!318851))

(declare-fun m!318853 () Bool)

(assert (=> b!308827 m!318853))

(declare-fun m!318855 () Bool)

(assert (=> b!308830 m!318855))

(declare-fun m!318857 () Bool)

(assert (=> b!308823 m!318857))

(assert (=> b!308823 m!318857))

(declare-fun m!318859 () Bool)

(assert (=> b!308823 m!318859))

(declare-fun m!318861 () Bool)

(assert (=> b!308826 m!318861))

(declare-fun m!318863 () Bool)

(assert (=> b!308826 m!318863))

(declare-fun m!318865 () Bool)

(assert (=> b!308831 m!318865))

(declare-fun m!318867 () Bool)

(assert (=> b!308828 m!318867))

(declare-fun m!318869 () Bool)

(assert (=> b!308829 m!318869))

(declare-fun m!318871 () Bool)

(assert (=> start!30774 m!318871))

(declare-fun m!318873 () Bool)

(assert (=> start!30774 m!318873))

(push 1)

(assert (not start!30774))

(assert (not b!308823))

(assert (not b!308830))

(assert (not b!308827))

(assert (not b!308828))

(assert (not b!308831))

(assert (not b!308829))

(assert (not b!308826))

(check-sat)

(pop 1)

(push 1)

(check-sat)

