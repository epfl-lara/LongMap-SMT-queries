; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30644 () Bool)

(assert start!30644)

(declare-fun b!307527 () Bool)

(declare-fun res!164283 () Bool)

(declare-fun e!192532 () Bool)

(assert (=> b!307527 (=> (not res!164283) (not e!192532))))

(declare-datatypes ((array!15648 0))(
  ( (array!15649 (arr!7409 (Array (_ BitVec 32) (_ BitVec 64))) (size!7761 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15648)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15648 (_ BitVec 32)) Bool)

(assert (=> b!307527 (= res!164283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307528 () Bool)

(declare-fun res!164287 () Bool)

(assert (=> b!307528 (=> (not res!164287) (not e!192532))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2549 0))(
  ( (MissingZero!2549 (index!12372 (_ BitVec 32))) (Found!2549 (index!12373 (_ BitVec 32))) (Intermediate!2549 (undefined!3361 Bool) (index!12374 (_ BitVec 32)) (x!30616 (_ BitVec 32))) (Undefined!2549) (MissingVacant!2549 (index!12375 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15648 (_ BitVec 32)) SeekEntryResult!2549)

(assert (=> b!307528 (= res!164287 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2549 i!1240)))))

(declare-fun b!307529 () Bool)

(declare-fun res!164281 () Bool)

(assert (=> b!307529 (=> (not res!164281) (not e!192532))))

(declare-fun arrayContainsKey!0 (array!15648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307529 (= res!164281 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun e!192531 () Bool)

(declare-fun b!307530 () Bool)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307530 (= e!192531 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7409 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(declare-fun res!164285 () Bool)

(assert (=> start!30644 (=> (not res!164285) (not e!192532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30644 (= res!164285 (validMask!0 mask!3709))))

(assert (=> start!30644 e!192532))

(declare-fun array_inv!5372 (array!15648) Bool)

(assert (=> start!30644 (array_inv!5372 a!3293)))

(assert (=> start!30644 true))

(declare-fun b!307531 () Bool)

(declare-fun res!164284 () Bool)

(assert (=> b!307531 (=> (not res!164284) (not e!192531))))

(declare-fun lt!151143 () SeekEntryResult!2549)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15648 (_ BitVec 32)) SeekEntryResult!2549)

(assert (=> b!307531 (= res!164284 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151143))))

(declare-fun b!307532 () Bool)

(declare-fun res!164286 () Bool)

(assert (=> b!307532 (=> (not res!164286) (not e!192531))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!307532 (= res!164286 (and (= (select (arr!7409 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7761 a!3293))))))

(declare-fun b!307533 () Bool)

(declare-fun res!164289 () Bool)

(assert (=> b!307533 (=> (not res!164289) (not e!192532))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307533 (= res!164289 (validKeyInArray!0 k!2441))))

(declare-fun b!307534 () Bool)

(assert (=> b!307534 (= e!192532 e!192531)))

(declare-fun res!164288 () Bool)

(assert (=> b!307534 (=> (not res!164288) (not e!192531))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307534 (= res!164288 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151143))))

(assert (=> b!307534 (= lt!151143 (Intermediate!2549 false resIndex!52 resX!52))))

(declare-fun b!307535 () Bool)

(declare-fun res!164282 () Bool)

(assert (=> b!307535 (=> (not res!164282) (not e!192532))))

(assert (=> b!307535 (= res!164282 (and (= (size!7761 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7761 a!3293))))))

(assert (= (and start!30644 res!164285) b!307535))

(assert (= (and b!307535 res!164282) b!307533))

(assert (= (and b!307533 res!164289) b!307529))

(assert (= (and b!307529 res!164281) b!307528))

(assert (= (and b!307528 res!164287) b!307527))

(assert (= (and b!307527 res!164283) b!307534))

(assert (= (and b!307534 res!164288) b!307532))

(assert (= (and b!307532 res!164286) b!307531))

(assert (= (and b!307531 res!164284) b!307530))

(declare-fun m!317819 () Bool)

(assert (=> b!307530 m!317819))

(declare-fun m!317821 () Bool)

(assert (=> b!307527 m!317821))

(declare-fun m!317823 () Bool)

(assert (=> b!307528 m!317823))

(declare-fun m!317825 () Bool)

(assert (=> b!307534 m!317825))

(assert (=> b!307534 m!317825))

(declare-fun m!317827 () Bool)

(assert (=> b!307534 m!317827))

(declare-fun m!317829 () Bool)

(assert (=> start!30644 m!317829))

(declare-fun m!317831 () Bool)

(assert (=> start!30644 m!317831))

(declare-fun m!317833 () Bool)

(assert (=> b!307532 m!317833))

(declare-fun m!317835 () Bool)

(assert (=> b!307531 m!317835))

(declare-fun m!317837 () Bool)

(assert (=> b!307533 m!317837))

(declare-fun m!317839 () Bool)

(assert (=> b!307529 m!317839))

(push 1)

(assert (not b!307527))

(assert (not b!307529))

