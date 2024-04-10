; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30648 () Bool)

(assert start!30648)

(declare-fun b!307581 () Bool)

(declare-fun res!164338 () Bool)

(declare-fun e!192549 () Bool)

(assert (=> b!307581 (=> (not res!164338) (not e!192549))))

(declare-datatypes ((array!15652 0))(
  ( (array!15653 (arr!7411 (Array (_ BitVec 32) (_ BitVec 64))) (size!7763 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15652)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2551 0))(
  ( (MissingZero!2551 (index!12380 (_ BitVec 32))) (Found!2551 (index!12381 (_ BitVec 32))) (Intermediate!2551 (undefined!3363 Bool) (index!12382 (_ BitVec 32)) (x!30618 (_ BitVec 32))) (Undefined!2551) (MissingVacant!2551 (index!12383 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15652 (_ BitVec 32)) SeekEntryResult!2551)

(assert (=> b!307581 (= res!164338 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2551 i!1240)))))

(declare-fun b!307582 () Bool)

(declare-fun res!164337 () Bool)

(assert (=> b!307582 (=> (not res!164337) (not e!192549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15652 (_ BitVec 32)) Bool)

(assert (=> b!307582 (= res!164337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307583 () Bool)

(declare-fun res!164342 () Bool)

(assert (=> b!307583 (=> (not res!164342) (not e!192549))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307583 (= res!164342 (validKeyInArray!0 k!2441))))

(declare-fun b!307584 () Bool)

(declare-fun res!164340 () Bool)

(declare-fun e!192550 () Bool)

(assert (=> b!307584 (=> (not res!164340) (not e!192550))))

(declare-fun lt!151149 () SeekEntryResult!2551)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15652 (_ BitVec 32)) SeekEntryResult!2551)

(assert (=> b!307584 (= res!164340 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151149))))

(declare-fun b!307585 () Bool)

(declare-fun res!164343 () Bool)

(assert (=> b!307585 (=> (not res!164343) (not e!192549))))

(assert (=> b!307585 (= res!164343 (and (= (size!7763 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7763 a!3293))))))

(declare-fun b!307586 () Bool)

(assert (=> b!307586 (= e!192549 e!192550)))

(declare-fun res!164341 () Bool)

(assert (=> b!307586 (=> (not res!164341) (not e!192550))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307586 (= res!164341 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151149))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!307586 (= lt!151149 (Intermediate!2551 false resIndex!52 resX!52))))

(declare-fun b!307587 () Bool)

(declare-fun res!164339 () Bool)

(assert (=> b!307587 (=> (not res!164339) (not e!192549))))

(declare-fun arrayContainsKey!0 (array!15652 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307587 (= res!164339 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!164335 () Bool)

(assert (=> start!30648 (=> (not res!164335) (not e!192549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30648 (= res!164335 (validMask!0 mask!3709))))

(assert (=> start!30648 e!192549))

(declare-fun array_inv!5374 (array!15652) Bool)

(assert (=> start!30648 (array_inv!5374 a!3293)))

(assert (=> start!30648 true))

(declare-fun b!307588 () Bool)

(declare-fun res!164336 () Bool)

(assert (=> b!307588 (=> (not res!164336) (not e!192550))))

(assert (=> b!307588 (= res!164336 (and (= (select (arr!7411 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7763 a!3293))))))

(declare-fun b!307589 () Bool)

(assert (=> b!307589 (= e!192550 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7411 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(assert (= (and start!30648 res!164335) b!307585))

(assert (= (and b!307585 res!164343) b!307583))

(assert (= (and b!307583 res!164342) b!307587))

(assert (= (and b!307587 res!164339) b!307581))

(assert (= (and b!307581 res!164338) b!307582))

(assert (= (and b!307582 res!164337) b!307586))

(assert (= (and b!307586 res!164341) b!307588))

(assert (= (and b!307588 res!164336) b!307584))

(assert (= (and b!307584 res!164340) b!307589))

(declare-fun m!317863 () Bool)

(assert (=> b!307587 m!317863))

(declare-fun m!317865 () Bool)

(assert (=> b!307581 m!317865))

(declare-fun m!317867 () Bool)

(assert (=> b!307583 m!317867))

(declare-fun m!317869 () Bool)

(assert (=> b!307588 m!317869))

(declare-fun m!317871 () Bool)

(assert (=> b!307589 m!317871))

(declare-fun m!317873 () Bool)

(assert (=> b!307582 m!317873))

(declare-fun m!317875 () Bool)

(assert (=> start!30648 m!317875))

(declare-fun m!317877 () Bool)

(assert (=> start!30648 m!317877))

(declare-fun m!317879 () Bool)

(assert (=> b!307584 m!317879))

(declare-fun m!317881 () Bool)

(assert (=> b!307586 m!317881))

(assert (=> b!307586 m!317881))

(declare-fun m!317883 () Bool)

(assert (=> b!307586 m!317883))

(push 1)

(assert (not start!30648))

(assert (not b!307583))

(assert (not b!307586))

(assert (not b!307582))

(assert (not b!307584))

(assert (not b!307587))

(assert (not b!307581))

(check-sat)

(pop 1)

