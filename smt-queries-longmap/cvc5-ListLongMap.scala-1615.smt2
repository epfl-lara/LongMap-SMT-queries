; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30416 () Bool)

(assert start!30416)

(declare-fun b!304431 () Bool)

(declare-fun e!191334 () Bool)

(declare-fun e!191332 () Bool)

(assert (=> b!304431 (= e!191334 e!191332)))

(declare-fun res!161776 () Bool)

(assert (=> b!304431 (=> (not res!161776) (not e!191332))))

(declare-datatypes ((array!15471 0))(
  ( (array!15472 (arr!7322 (Array (_ BitVec 32) (_ BitVec 64))) (size!7674 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15471)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2462 0))(
  ( (MissingZero!2462 (index!12024 (_ BitVec 32))) (Found!2462 (index!12025 (_ BitVec 32))) (Intermediate!2462 (undefined!3274 Bool) (index!12026 (_ BitVec 32)) (x!30288 (_ BitVec 32))) (Undefined!2462) (MissingVacant!2462 (index!12027 (_ BitVec 32))) )
))
(declare-fun lt!150450 () SeekEntryResult!2462)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15471 (_ BitVec 32)) SeekEntryResult!2462)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304431 (= res!161776 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150450))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!304431 (= lt!150450 (Intermediate!2462 false resIndex!52 resX!52))))

(declare-fun b!304432 () Bool)

(declare-fun e!191333 () Bool)

(assert (=> b!304432 (= e!191332 e!191333)))

(declare-fun res!161783 () Bool)

(assert (=> b!304432 (=> (not res!161783) (not e!191333))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun lt!150449 () SeekEntryResult!2462)

(assert (=> b!304432 (= res!161783 (and (= lt!150449 lt!150450) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7322 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7322 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7322 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304432 (= lt!150449 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!304433 () Bool)

(assert (=> b!304433 (= e!191333 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304433 (= lt!150449 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!304434 () Bool)

(declare-fun res!161782 () Bool)

(assert (=> b!304434 (=> (not res!161782) (not e!191332))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!304434 (= res!161782 (and (= (select (arr!7322 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7674 a!3293))))))

(declare-fun b!304435 () Bool)

(declare-fun res!161778 () Bool)

(assert (=> b!304435 (=> (not res!161778) (not e!191334))))

(declare-fun arrayContainsKey!0 (array!15471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304435 (= res!161778 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304436 () Bool)

(declare-fun res!161780 () Bool)

(assert (=> b!304436 (=> (not res!161780) (not e!191334))))

(assert (=> b!304436 (= res!161780 (and (= (size!7674 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7674 a!3293))))))

(declare-fun b!304437 () Bool)

(declare-fun res!161781 () Bool)

(assert (=> b!304437 (=> (not res!161781) (not e!191334))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15471 (_ BitVec 32)) SeekEntryResult!2462)

(assert (=> b!304437 (= res!161781 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2462 i!1240)))))

(declare-fun res!161779 () Bool)

(assert (=> start!30416 (=> (not res!161779) (not e!191334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30416 (= res!161779 (validMask!0 mask!3709))))

(assert (=> start!30416 e!191334))

(declare-fun array_inv!5285 (array!15471) Bool)

(assert (=> start!30416 (array_inv!5285 a!3293)))

(assert (=> start!30416 true))

(declare-fun b!304438 () Bool)

(declare-fun res!161784 () Bool)

(assert (=> b!304438 (=> (not res!161784) (not e!191334))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304438 (= res!161784 (validKeyInArray!0 k!2441))))

(declare-fun b!304439 () Bool)

(declare-fun res!161777 () Bool)

(assert (=> b!304439 (=> (not res!161777) (not e!191334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15471 (_ BitVec 32)) Bool)

(assert (=> b!304439 (= res!161777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30416 res!161779) b!304436))

(assert (= (and b!304436 res!161780) b!304438))

(assert (= (and b!304438 res!161784) b!304435))

(assert (= (and b!304435 res!161778) b!304437))

(assert (= (and b!304437 res!161781) b!304439))

(assert (= (and b!304439 res!161777) b!304431))

(assert (= (and b!304431 res!161776) b!304434))

(assert (= (and b!304434 res!161782) b!304432))

(assert (= (and b!304432 res!161783) b!304433))

(declare-fun m!315527 () Bool)

(assert (=> b!304433 m!315527))

(assert (=> b!304433 m!315527))

(declare-fun m!315529 () Bool)

(assert (=> b!304433 m!315529))

(declare-fun m!315531 () Bool)

(assert (=> b!304434 m!315531))

(declare-fun m!315533 () Bool)

(assert (=> b!304438 m!315533))

(declare-fun m!315535 () Bool)

(assert (=> start!30416 m!315535))

(declare-fun m!315537 () Bool)

(assert (=> start!30416 m!315537))

(declare-fun m!315539 () Bool)

(assert (=> b!304439 m!315539))

(declare-fun m!315541 () Bool)

(assert (=> b!304435 m!315541))

(declare-fun m!315543 () Bool)

(assert (=> b!304437 m!315543))

(declare-fun m!315545 () Bool)

(assert (=> b!304432 m!315545))

(declare-fun m!315547 () Bool)

(assert (=> b!304432 m!315547))

(declare-fun m!315549 () Bool)

(assert (=> b!304431 m!315549))

(assert (=> b!304431 m!315549))

(declare-fun m!315551 () Bool)

(assert (=> b!304431 m!315551))

(push 1)

(assert (not b!304439))

(assert (not b!304433))

(assert (not start!30416))

(assert (not b!304438))

(assert (not b!304432))

(assert (not b!304437))

(assert (not b!304431))

(assert (not b!304435))

(check-sat)

(pop 1)

