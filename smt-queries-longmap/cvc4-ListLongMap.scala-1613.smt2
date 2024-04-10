; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30408 () Bool)

(assert start!30408)

(declare-fun b!304313 () Bool)

(declare-fun res!161665 () Bool)

(declare-fun e!191295 () Bool)

(assert (=> b!304313 (=> (not res!161665) (not e!191295))))

(declare-datatypes ((array!15463 0))(
  ( (array!15464 (arr!7318 (Array (_ BitVec 32) (_ BitVec 64))) (size!7670 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15463)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304313 (= res!161665 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304314 () Bool)

(declare-fun res!161658 () Bool)

(assert (=> b!304314 (=> (not res!161658) (not e!191295))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15463 (_ BitVec 32)) Bool)

(assert (=> b!304314 (= res!161658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304315 () Bool)

(declare-fun res!161659 () Bool)

(declare-fun e!191294 () Bool)

(assert (=> b!304315 (=> (not res!161659) (not e!191294))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304315 (= res!161659 (and (= (select (arr!7318 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7670 a!3293))))))

(declare-fun b!304316 () Bool)

(declare-fun res!161664 () Bool)

(assert (=> b!304316 (=> (not res!161664) (not e!191294))))

(declare-datatypes ((SeekEntryResult!2458 0))(
  ( (MissingZero!2458 (index!12008 (_ BitVec 32))) (Found!2458 (index!12009 (_ BitVec 32))) (Intermediate!2458 (undefined!3270 Bool) (index!12010 (_ BitVec 32)) (x!30268 (_ BitVec 32))) (Undefined!2458) (MissingVacant!2458 (index!12011 (_ BitVec 32))) )
))
(declare-fun lt!150426 () SeekEntryResult!2458)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15463 (_ BitVec 32)) SeekEntryResult!2458)

(assert (=> b!304316 (= res!161664 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150426))))

(declare-fun b!304317 () Bool)

(declare-fun res!161662 () Bool)

(assert (=> b!304317 (=> (not res!161662) (not e!191295))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15463 (_ BitVec 32)) SeekEntryResult!2458)

(assert (=> b!304317 (= res!161662 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2458 i!1240)))))

(declare-fun b!304318 () Bool)

(declare-fun res!161663 () Bool)

(assert (=> b!304318 (=> (not res!161663) (not e!191295))))

(assert (=> b!304318 (= res!161663 (and (= (size!7670 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7670 a!3293))))))

(declare-fun b!304319 () Bool)

(assert (=> b!304319 (= e!191295 e!191294)))

(declare-fun res!161667 () Bool)

(assert (=> b!304319 (=> (not res!161667) (not e!191294))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304319 (= res!161667 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150426))))

(assert (=> b!304319 (= lt!150426 (Intermediate!2458 false resIndex!52 resX!52))))

(declare-fun b!304320 () Bool)

(declare-fun res!161661 () Bool)

(assert (=> b!304320 (=> (not res!161661) (not e!191294))))

(assert (=> b!304320 (= res!161661 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7318 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7318 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7318 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!304321 () Bool)

(declare-fun res!161660 () Bool)

(assert (=> b!304321 (=> (not res!161660) (not e!191295))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304321 (= res!161660 (validKeyInArray!0 k!2441))))

(declare-fun lt!150425 () (_ BitVec 32))

(declare-fun b!304322 () Bool)

(assert (=> b!304322 (= e!191294 (and (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge lt!150425 #b00000000000000000000000000000000) (bvslt lt!150425 (bvadd #b00000000000000000000000000000001 mask!3709)) (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304322 (= lt!150425 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!161666 () Bool)

(assert (=> start!30408 (=> (not res!161666) (not e!191295))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30408 (= res!161666 (validMask!0 mask!3709))))

(assert (=> start!30408 e!191295))

(declare-fun array_inv!5281 (array!15463) Bool)

(assert (=> start!30408 (array_inv!5281 a!3293)))

(assert (=> start!30408 true))

(assert (= (and start!30408 res!161666) b!304318))

(assert (= (and b!304318 res!161663) b!304321))

(assert (= (and b!304321 res!161660) b!304313))

(assert (= (and b!304313 res!161665) b!304317))

(assert (= (and b!304317 res!161662) b!304314))

(assert (= (and b!304314 res!161658) b!304319))

(assert (= (and b!304319 res!161667) b!304315))

(assert (= (and b!304315 res!161659) b!304316))

(assert (= (and b!304316 res!161664) b!304320))

(assert (= (and b!304320 res!161661) b!304322))

(declare-fun m!315431 () Bool)

(assert (=> b!304321 m!315431))

(declare-fun m!315433 () Bool)

(assert (=> b!304316 m!315433))

(declare-fun m!315435 () Bool)

(assert (=> b!304315 m!315435))

(declare-fun m!315437 () Bool)

(assert (=> b!304314 m!315437))

(declare-fun m!315439 () Bool)

(assert (=> b!304320 m!315439))

(declare-fun m!315441 () Bool)

(assert (=> b!304319 m!315441))

(assert (=> b!304319 m!315441))

(declare-fun m!315443 () Bool)

(assert (=> b!304319 m!315443))

(declare-fun m!315445 () Bool)

(assert (=> b!304322 m!315445))

(declare-fun m!315447 () Bool)

(assert (=> b!304317 m!315447))

(declare-fun m!315449 () Bool)

(assert (=> start!30408 m!315449))

(declare-fun m!315451 () Bool)

(assert (=> start!30408 m!315451))

(declare-fun m!315453 () Bool)

(assert (=> b!304313 m!315453))

(push 1)

(assert (not b!304322))

(assert (not b!304314))

(assert (not b!304313))

(assert (not start!30408))

(assert (not b!304317))

(assert (not b!304319))

(assert (not b!304316))

(assert (not b!304321))

(check-sat)

(pop 1)

(push 1)

(check-sat)

