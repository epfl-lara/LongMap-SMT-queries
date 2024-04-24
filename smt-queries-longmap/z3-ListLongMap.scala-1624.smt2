; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30510 () Bool)

(assert start!30510)

(declare-fun b!305350 () Bool)

(declare-fun e!191771 () Bool)

(assert (=> b!305350 (= e!191771 (not true))))

(declare-datatypes ((array!15527 0))(
  ( (array!15528 (arr!7348 (Array (_ BitVec 32) (_ BitVec 64))) (size!7700 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15527)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2453 0))(
  ( (MissingZero!2453 (index!11988 (_ BitVec 32))) (Found!2453 (index!11989 (_ BitVec 32))) (Intermediate!2453 (undefined!3265 Bool) (index!11990 (_ BitVec 32)) (x!30357 (_ BitVec 32))) (Undefined!2453) (MissingVacant!2453 (index!11991 (_ BitVec 32))) )
))
(declare-fun lt!150758 () SeekEntryResult!2453)

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15527 (_ BitVec 32)) SeekEntryResult!2453)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305350 (= lt!150758 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!305351 () Bool)

(declare-fun e!191770 () Bool)

(declare-fun e!191769 () Bool)

(assert (=> b!305351 (= e!191770 e!191769)))

(declare-fun res!162586 () Bool)

(assert (=> b!305351 (=> (not res!162586) (not e!191769))))

(declare-fun lt!150759 () SeekEntryResult!2453)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305351 (= res!162586 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150759))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!305351 (= lt!150759 (Intermediate!2453 false resIndex!52 resX!52))))

(declare-fun b!305352 () Bool)

(declare-fun res!162593 () Bool)

(assert (=> b!305352 (=> (not res!162593) (not e!191770))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15527 (_ BitVec 32)) Bool)

(assert (=> b!305352 (= res!162593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305353 () Bool)

(declare-fun res!162589 () Bool)

(assert (=> b!305353 (=> (not res!162589) (not e!191770))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15527 (_ BitVec 32)) SeekEntryResult!2453)

(assert (=> b!305353 (= res!162589 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2453 i!1240)))))

(declare-fun b!305354 () Bool)

(declare-fun res!162590 () Bool)

(assert (=> b!305354 (=> (not res!162590) (not e!191770))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305354 (= res!162590 (validKeyInArray!0 k0!2441))))

(declare-fun b!305355 () Bool)

(declare-fun res!162587 () Bool)

(assert (=> b!305355 (=> (not res!162587) (not e!191770))))

(assert (=> b!305355 (= res!162587 (and (= (size!7700 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7700 a!3293))))))

(declare-fun b!305356 () Bool)

(declare-fun res!162592 () Bool)

(assert (=> b!305356 (=> (not res!162592) (not e!191769))))

(assert (=> b!305356 (= res!162592 (and (= (select (arr!7348 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7700 a!3293))))))

(declare-fun res!162588 () Bool)

(assert (=> start!30510 (=> (not res!162588) (not e!191770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30510 (= res!162588 (validMask!0 mask!3709))))

(assert (=> start!30510 e!191770))

(declare-fun array_inv!5298 (array!15527) Bool)

(assert (=> start!30510 (array_inv!5298 a!3293)))

(assert (=> start!30510 true))

(declare-fun b!305357 () Bool)

(declare-fun res!162594 () Bool)

(assert (=> b!305357 (=> (not res!162594) (not e!191770))))

(declare-fun arrayContainsKey!0 (array!15527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305357 (= res!162594 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305358 () Bool)

(assert (=> b!305358 (= e!191769 e!191771)))

(declare-fun res!162591 () Bool)

(assert (=> b!305358 (=> (not res!162591) (not e!191771))))

(assert (=> b!305358 (= res!162591 (and (= lt!150758 lt!150759) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7348 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7348 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7348 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!305358 (= lt!150758 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(assert (= (and start!30510 res!162588) b!305355))

(assert (= (and b!305355 res!162587) b!305354))

(assert (= (and b!305354 res!162590) b!305357))

(assert (= (and b!305357 res!162594) b!305353))

(assert (= (and b!305353 res!162589) b!305352))

(assert (= (and b!305352 res!162593) b!305351))

(assert (= (and b!305351 res!162586) b!305356))

(assert (= (and b!305356 res!162592) b!305358))

(assert (= (and b!305358 res!162591) b!305350))

(declare-fun m!316489 () Bool)

(assert (=> start!30510 m!316489))

(declare-fun m!316491 () Bool)

(assert (=> start!30510 m!316491))

(declare-fun m!316493 () Bool)

(assert (=> b!305354 m!316493))

(declare-fun m!316495 () Bool)

(assert (=> b!305358 m!316495))

(declare-fun m!316497 () Bool)

(assert (=> b!305358 m!316497))

(declare-fun m!316499 () Bool)

(assert (=> b!305350 m!316499))

(assert (=> b!305350 m!316499))

(declare-fun m!316501 () Bool)

(assert (=> b!305350 m!316501))

(declare-fun m!316503 () Bool)

(assert (=> b!305352 m!316503))

(declare-fun m!316505 () Bool)

(assert (=> b!305357 m!316505))

(declare-fun m!316507 () Bool)

(assert (=> b!305353 m!316507))

(declare-fun m!316509 () Bool)

(assert (=> b!305351 m!316509))

(assert (=> b!305351 m!316509))

(declare-fun m!316511 () Bool)

(assert (=> b!305351 m!316511))

(declare-fun m!316513 () Bool)

(assert (=> b!305356 m!316513))

(check-sat (not b!305357) (not b!305358) (not b!305354) (not b!305352) (not start!30510) (not b!305351) (not b!305353) (not b!305350))
(check-sat)
