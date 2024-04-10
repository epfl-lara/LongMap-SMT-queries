; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30638 () Bool)

(assert start!30638)

(declare-fun b!307453 () Bool)

(declare-fun res!164213 () Bool)

(declare-fun e!192511 () Bool)

(assert (=> b!307453 (=> (not res!164213) (not e!192511))))

(declare-datatypes ((array!15642 0))(
  ( (array!15643 (arr!7406 (Array (_ BitVec 32) (_ BitVec 64))) (size!7758 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15642)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15642 (_ BitVec 32)) Bool)

(assert (=> b!307453 (= res!164213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307454 () Bool)

(declare-fun res!164210 () Bool)

(assert (=> b!307454 (=> (not res!164210) (not e!192511))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15642 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307454 (= res!164210 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307455 () Bool)

(declare-fun res!164209 () Bool)

(assert (=> b!307455 (=> (not res!164209) (not e!192511))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2546 0))(
  ( (MissingZero!2546 (index!12360 (_ BitVec 32))) (Found!2546 (index!12361 (_ BitVec 32))) (Intermediate!2546 (undefined!3358 Bool) (index!12362 (_ BitVec 32)) (x!30605 (_ BitVec 32))) (Undefined!2546) (MissingVacant!2546 (index!12363 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15642 (_ BitVec 32)) SeekEntryResult!2546)

(assert (=> b!307455 (= res!164209 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2546 i!1240)))))

(declare-fun b!307456 () Bool)

(declare-fun res!164207 () Bool)

(assert (=> b!307456 (=> (not res!164207) (not e!192511))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307456 (= res!164207 (validKeyInArray!0 k!2441))))

(declare-fun b!307457 () Bool)

(declare-fun res!164212 () Bool)

(assert (=> b!307457 (=> (not res!164212) (not e!192511))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15642 (_ BitVec 32)) SeekEntryResult!2546)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307457 (= res!164212 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2546 false resIndex!52 resX!52)))))

(declare-fun res!164208 () Bool)

(assert (=> start!30638 (=> (not res!164208) (not e!192511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30638 (= res!164208 (validMask!0 mask!3709))))

(assert (=> start!30638 e!192511))

(declare-fun array_inv!5369 (array!15642) Bool)

(assert (=> start!30638 (array_inv!5369 a!3293)))

(assert (=> start!30638 true))

(declare-fun b!307458 () Bool)

(assert (=> b!307458 (= e!192511 false)))

(declare-fun lt!151134 () SeekEntryResult!2546)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307458 (= lt!151134 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!307459 () Bool)

(declare-fun res!164211 () Bool)

(assert (=> b!307459 (=> (not res!164211) (not e!192511))))

(assert (=> b!307459 (= res!164211 (and (= (select (arr!7406 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7758 a!3293))))))

(declare-fun b!307460 () Bool)

(declare-fun res!164214 () Bool)

(assert (=> b!307460 (=> (not res!164214) (not e!192511))))

(assert (=> b!307460 (= res!164214 (and (= (size!7758 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7758 a!3293))))))

(assert (= (and start!30638 res!164208) b!307460))

(assert (= (and b!307460 res!164214) b!307456))

(assert (= (and b!307456 res!164207) b!307454))

(assert (= (and b!307454 res!164210) b!307455))

(assert (= (and b!307455 res!164209) b!307453))

(assert (= (and b!307453 res!164213) b!307457))

(assert (= (and b!307457 res!164212) b!307459))

(assert (= (and b!307459 res!164211) b!307458))

(declare-fun m!317759 () Bool)

(assert (=> b!307456 m!317759))

(declare-fun m!317761 () Bool)

(assert (=> b!307454 m!317761))

(declare-fun m!317763 () Bool)

(assert (=> b!307458 m!317763))

(declare-fun m!317765 () Bool)

(assert (=> start!30638 m!317765))

(declare-fun m!317767 () Bool)

(assert (=> start!30638 m!317767))

(declare-fun m!317769 () Bool)

(assert (=> b!307455 m!317769))

(declare-fun m!317771 () Bool)

(assert (=> b!307459 m!317771))

(declare-fun m!317773 () Bool)

(assert (=> b!307453 m!317773))

(declare-fun m!317775 () Bool)

(assert (=> b!307457 m!317775))

(assert (=> b!307457 m!317775))

(declare-fun m!317777 () Bool)

(assert (=> b!307457 m!317777))

(push 1)

(assert (not b!307457))

(assert (not b!307456))

(assert (not b!307454))

(assert (not b!307453))

(assert (not b!307458))

(assert (not start!30638))

(assert (not b!307455))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

