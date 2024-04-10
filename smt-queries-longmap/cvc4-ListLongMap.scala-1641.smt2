; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30630 () Bool)

(assert start!30630)

(declare-fun b!307356 () Bool)

(declare-fun res!164115 () Bool)

(declare-fun e!192485 () Bool)

(assert (=> b!307356 (=> (not res!164115) (not e!192485))))

(declare-datatypes ((array!15634 0))(
  ( (array!15635 (arr!7402 (Array (_ BitVec 32) (_ BitVec 64))) (size!7754 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15634)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2542 0))(
  ( (MissingZero!2542 (index!12344 (_ BitVec 32))) (Found!2542 (index!12345 (_ BitVec 32))) (Intermediate!2542 (undefined!3354 Bool) (index!12346 (_ BitVec 32)) (x!30585 (_ BitVec 32))) (Undefined!2542) (MissingVacant!2542 (index!12347 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15634 (_ BitVec 32)) SeekEntryResult!2542)

(assert (=> b!307356 (= res!164115 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2542 i!1240)))))

(declare-fun b!307357 () Bool)

(declare-fun res!164114 () Bool)

(assert (=> b!307357 (=> (not res!164114) (not e!192485))))

(declare-fun arrayContainsKey!0 (array!15634 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307357 (= res!164114 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307358 () Bool)

(declare-fun res!164118 () Bool)

(declare-fun e!192486 () Bool)

(assert (=> b!307358 (=> (not res!164118) (not e!192486))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307358 (= res!164118 (and (= (select (arr!7402 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7754 a!3293))))))

(declare-fun b!307359 () Bool)

(assert (=> b!307359 (= e!192486 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7402 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsgt x!1427 #b01111111111111111111111111111110)))))

(declare-fun b!307361 () Bool)

(declare-fun res!164113 () Bool)

(assert (=> b!307361 (=> (not res!164113) (not e!192486))))

(declare-fun lt!151122 () SeekEntryResult!2542)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15634 (_ BitVec 32)) SeekEntryResult!2542)

(assert (=> b!307361 (= res!164113 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151122))))

(declare-fun b!307362 () Bool)

(declare-fun res!164110 () Bool)

(assert (=> b!307362 (=> (not res!164110) (not e!192485))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15634 (_ BitVec 32)) Bool)

(assert (=> b!307362 (= res!164110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307363 () Bool)

(assert (=> b!307363 (= e!192485 e!192486)))

(declare-fun res!164112 () Bool)

(assert (=> b!307363 (=> (not res!164112) (not e!192486))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307363 (= res!164112 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151122))))

(assert (=> b!307363 (= lt!151122 (Intermediate!2542 false resIndex!52 resX!52))))

(declare-fun b!307364 () Bool)

(declare-fun res!164111 () Bool)

(assert (=> b!307364 (=> (not res!164111) (not e!192485))))

(assert (=> b!307364 (= res!164111 (and (= (size!7754 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7754 a!3293))))))

(declare-fun b!307360 () Bool)

(declare-fun res!164116 () Bool)

(assert (=> b!307360 (=> (not res!164116) (not e!192485))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307360 (= res!164116 (validKeyInArray!0 k!2441))))

(declare-fun res!164117 () Bool)

(assert (=> start!30630 (=> (not res!164117) (not e!192485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30630 (= res!164117 (validMask!0 mask!3709))))

(assert (=> start!30630 e!192485))

(declare-fun array_inv!5365 (array!15634) Bool)

(assert (=> start!30630 (array_inv!5365 a!3293)))

(assert (=> start!30630 true))

(assert (= (and start!30630 res!164117) b!307364))

(assert (= (and b!307364 res!164111) b!307360))

(assert (= (and b!307360 res!164116) b!307357))

(assert (= (and b!307357 res!164114) b!307356))

(assert (= (and b!307356 res!164115) b!307362))

(assert (= (and b!307362 res!164110) b!307363))

(assert (= (and b!307363 res!164112) b!307358))

(assert (= (and b!307358 res!164118) b!307361))

(assert (= (and b!307361 res!164113) b!307359))

(declare-fun m!317677 () Bool)

(assert (=> b!307357 m!317677))

(declare-fun m!317679 () Bool)

(assert (=> b!307361 m!317679))

(declare-fun m!317681 () Bool)

(assert (=> b!307363 m!317681))

(assert (=> b!307363 m!317681))

(declare-fun m!317683 () Bool)

(assert (=> b!307363 m!317683))

(declare-fun m!317685 () Bool)

(assert (=> b!307356 m!317685))

(declare-fun m!317687 () Bool)

(assert (=> b!307362 m!317687))

(declare-fun m!317689 () Bool)

(assert (=> b!307359 m!317689))

(declare-fun m!317691 () Bool)

(assert (=> b!307360 m!317691))

(declare-fun m!317693 () Bool)

(assert (=> b!307358 m!317693))

(declare-fun m!317695 () Bool)

(assert (=> start!30630 m!317695))

(declare-fun m!317697 () Bool)

(assert (=> start!30630 m!317697))

(push 1)

(assert (not b!307361))

(assert (not b!307356))

(assert (not b!307357))

(assert (not start!30630))

(assert (not b!307360))

(assert (not b!307363))

(assert (not b!307362))

(check-sat)

