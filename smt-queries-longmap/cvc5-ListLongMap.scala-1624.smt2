; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30524 () Bool)

(assert start!30524)

(declare-fun b!305403 () Bool)

(declare-fun e!191805 () Bool)

(assert (=> b!305403 (= e!191805 (not true))))

(declare-datatypes ((array!15528 0))(
  ( (array!15529 (arr!7349 (Array (_ BitVec 32) (_ BitVec 64))) (size!7701 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15528)

(declare-datatypes ((SeekEntryResult!2489 0))(
  ( (MissingZero!2489 (index!12132 (_ BitVec 32))) (Found!2489 (index!12133 (_ BitVec 32))) (Intermediate!2489 (undefined!3301 Bool) (index!12134 (_ BitVec 32)) (x!30396 (_ BitVec 32))) (Undefined!2489) (MissingVacant!2489 (index!12135 (_ BitVec 32))) )
))
(declare-fun lt!150741 () SeekEntryResult!2489)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15528 (_ BitVec 32)) SeekEntryResult!2489)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305403 (= lt!150741 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!305404 () Bool)

(declare-fun res!162591 () Bool)

(declare-fun e!191806 () Bool)

(assert (=> b!305404 (=> (not res!162591) (not e!191806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15528 (_ BitVec 32)) Bool)

(assert (=> b!305404 (= res!162591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!162597 () Bool)

(assert (=> start!30524 (=> (not res!162597) (not e!191806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30524 (= res!162597 (validMask!0 mask!3709))))

(assert (=> start!30524 e!191806))

(declare-fun array_inv!5312 (array!15528) Bool)

(assert (=> start!30524 (array_inv!5312 a!3293)))

(assert (=> start!30524 true))

(declare-fun b!305405 () Bool)

(declare-fun e!191804 () Bool)

(assert (=> b!305405 (= e!191804 e!191805)))

(declare-fun res!162589 () Bool)

(assert (=> b!305405 (=> (not res!162589) (not e!191805))))

(declare-fun lt!150740 () SeekEntryResult!2489)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!305405 (= res!162589 (and (= lt!150741 lt!150740) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7349 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7349 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7349 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!305405 (= lt!150741 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!305406 () Bool)

(declare-fun res!162594 () Bool)

(assert (=> b!305406 (=> (not res!162594) (not e!191806))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305406 (= res!162594 (validKeyInArray!0 k!2441))))

(declare-fun b!305407 () Bool)

(declare-fun res!162593 () Bool)

(assert (=> b!305407 (=> (not res!162593) (not e!191806))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!305407 (= res!162593 (and (= (size!7701 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7701 a!3293))))))

(declare-fun b!305408 () Bool)

(declare-fun res!162595 () Bool)

(assert (=> b!305408 (=> (not res!162595) (not e!191804))))

(assert (=> b!305408 (= res!162595 (and (= (select (arr!7349 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7701 a!3293))))))

(declare-fun b!305409 () Bool)

(declare-fun res!162590 () Bool)

(assert (=> b!305409 (=> (not res!162590) (not e!191806))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15528 (_ BitVec 32)) SeekEntryResult!2489)

(assert (=> b!305409 (= res!162590 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2489 i!1240)))))

(declare-fun b!305410 () Bool)

(declare-fun res!162596 () Bool)

(assert (=> b!305410 (=> (not res!162596) (not e!191806))))

(declare-fun arrayContainsKey!0 (array!15528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305410 (= res!162596 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305411 () Bool)

(assert (=> b!305411 (= e!191806 e!191804)))

(declare-fun res!162592 () Bool)

(assert (=> b!305411 (=> (not res!162592) (not e!191804))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305411 (= res!162592 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150740))))

(assert (=> b!305411 (= lt!150740 (Intermediate!2489 false resIndex!52 resX!52))))

(assert (= (and start!30524 res!162597) b!305407))

(assert (= (and b!305407 res!162593) b!305406))

(assert (= (and b!305406 res!162594) b!305410))

(assert (= (and b!305410 res!162596) b!305409))

(assert (= (and b!305409 res!162590) b!305404))

(assert (= (and b!305404 res!162591) b!305411))

(assert (= (and b!305411 res!162592) b!305408))

(assert (= (and b!305408 res!162595) b!305405))

(assert (= (and b!305405 res!162589) b!305403))

(declare-fun m!316367 () Bool)

(assert (=> start!30524 m!316367))

(declare-fun m!316369 () Bool)

(assert (=> start!30524 m!316369))

(declare-fun m!316371 () Bool)

(assert (=> b!305411 m!316371))

(assert (=> b!305411 m!316371))

(declare-fun m!316373 () Bool)

(assert (=> b!305411 m!316373))

(declare-fun m!316375 () Bool)

(assert (=> b!305403 m!316375))

(assert (=> b!305403 m!316375))

(declare-fun m!316377 () Bool)

(assert (=> b!305403 m!316377))

(declare-fun m!316379 () Bool)

(assert (=> b!305404 m!316379))

(declare-fun m!316381 () Bool)

(assert (=> b!305405 m!316381))

(declare-fun m!316383 () Bool)

(assert (=> b!305405 m!316383))

(declare-fun m!316385 () Bool)

(assert (=> b!305408 m!316385))

(declare-fun m!316387 () Bool)

(assert (=> b!305406 m!316387))

(declare-fun m!316389 () Bool)

(assert (=> b!305409 m!316389))

(declare-fun m!316391 () Bool)

(assert (=> b!305410 m!316391))

(push 1)

