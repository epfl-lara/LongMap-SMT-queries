; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30822 () Bool)

(assert start!30822)

(declare-fun b!309471 () Bool)

(declare-fun e!193328 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(assert (=> b!309471 (= e!193328 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!15775 0))(
  ( (array!15776 (arr!7471 (Array (_ BitVec 32) (_ BitVec 64))) (size!7823 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15775)

(declare-datatypes ((SeekEntryResult!2611 0))(
  ( (MissingZero!2611 (index!12620 (_ BitVec 32))) (Found!2611 (index!12621 (_ BitVec 32))) (Intermediate!2611 (undefined!3423 Bool) (index!12622 (_ BitVec 32)) (x!30847 (_ BitVec 32))) (Undefined!2611) (MissingVacant!2611 (index!12623 (_ BitVec 32))) )
))
(declare-fun lt!151595 () SeekEntryResult!2611)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15775 (_ BitVec 32)) SeekEntryResult!2611)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309471 (= lt!151595 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!309472 () Bool)

(declare-fun res!166086 () Bool)

(declare-fun e!193330 () Bool)

(assert (=> b!309472 (=> (not res!166086) (not e!193330))))

(declare-fun arrayContainsKey!0 (array!15775 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309472 (= res!166086 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309473 () Bool)

(declare-fun res!166090 () Bool)

(assert (=> b!309473 (=> (not res!166090) (not e!193330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309473 (= res!166090 (validKeyInArray!0 k!2441))))

(declare-fun b!309474 () Bool)

(declare-fun res!166089 () Bool)

(assert (=> b!309474 (=> (not res!166089) (not e!193330))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!309474 (= res!166089 (and (= (size!7823 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7823 a!3293))))))

(declare-fun b!309475 () Bool)

(declare-fun res!166085 () Bool)

(assert (=> b!309475 (=> (not res!166085) (not e!193330))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15775 (_ BitVec 32)) SeekEntryResult!2611)

(assert (=> b!309475 (= res!166085 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2611 i!1240)))))

(declare-fun res!166087 () Bool)

(assert (=> start!30822 (=> (not res!166087) (not e!193330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30822 (= res!166087 (validMask!0 mask!3709))))

(assert (=> start!30822 e!193330))

(declare-fun array_inv!5434 (array!15775) Bool)

(assert (=> start!30822 (array_inv!5434 a!3293)))

(assert (=> start!30822 true))

(declare-fun b!309476 () Bool)

(declare-fun res!166084 () Bool)

(declare-fun e!193329 () Bool)

(assert (=> b!309476 (=> (not res!166084) (not e!193329))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!309476 (= res!166084 (and (= (select (arr!7471 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7823 a!3293))))))

(declare-fun b!309477 () Bool)

(declare-fun res!166092 () Bool)

(assert (=> b!309477 (=> (not res!166092) (not e!193330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15775 (_ BitVec 32)) Bool)

(assert (=> b!309477 (= res!166092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309478 () Bool)

(assert (=> b!309478 (= e!193329 e!193328)))

(declare-fun res!166091 () Bool)

(assert (=> b!309478 (=> (not res!166091) (not e!193328))))

(declare-fun lt!151596 () SeekEntryResult!2611)

(assert (=> b!309478 (= res!166091 (and (= lt!151595 lt!151596) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7471 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309478 (= lt!151595 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!309479 () Bool)

(assert (=> b!309479 (= e!193330 e!193329)))

(declare-fun res!166088 () Bool)

(assert (=> b!309479 (=> (not res!166088) (not e!193329))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309479 (= res!166088 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151596))))

(assert (=> b!309479 (= lt!151596 (Intermediate!2611 false resIndex!52 resX!52))))

(assert (= (and start!30822 res!166087) b!309474))

(assert (= (and b!309474 res!166089) b!309473))

(assert (= (and b!309473 res!166090) b!309472))

(assert (= (and b!309472 res!166086) b!309475))

(assert (= (and b!309475 res!166085) b!309477))

(assert (= (and b!309477 res!166092) b!309479))

(assert (= (and b!309479 res!166088) b!309476))

(assert (= (and b!309476 res!166084) b!309478))

(assert (= (and b!309478 res!166091) b!309471))

(declare-fun m!319473 () Bool)

(assert (=> b!309479 m!319473))

(assert (=> b!309479 m!319473))

(declare-fun m!319475 () Bool)

(assert (=> b!309479 m!319475))

(declare-fun m!319477 () Bool)

(assert (=> b!309476 m!319477))

(declare-fun m!319479 () Bool)

(assert (=> b!309475 m!319479))

(declare-fun m!319481 () Bool)

(assert (=> b!309472 m!319481))

(declare-fun m!319483 () Bool)

(assert (=> b!309478 m!319483))

(declare-fun m!319485 () Bool)

(assert (=> b!309478 m!319485))

(declare-fun m!319487 () Bool)

(assert (=> b!309473 m!319487))

(declare-fun m!319489 () Bool)

(assert (=> start!30822 m!319489))

(declare-fun m!319491 () Bool)

(assert (=> start!30822 m!319491))

(declare-fun m!319493 () Bool)

(assert (=> b!309477 m!319493))

(declare-fun m!319495 () Bool)

(assert (=> b!309471 m!319495))

(assert (=> b!309471 m!319495))

(declare-fun m!319497 () Bool)

(assert (=> b!309471 m!319497))

(push 1)

(assert (not b!309478))

(assert (not b!309475))

(assert (not b!309479))

(assert (not b!309471))

(assert (not b!309472))

(assert (not b!309473))

(assert (not start!30822))

(assert (not b!309477))

