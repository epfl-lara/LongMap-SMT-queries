; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30640 () Bool)

(assert start!30640)

(declare-fun b!307477 () Bool)

(declare-fun res!164235 () Bool)

(declare-fun e!192516 () Bool)

(assert (=> b!307477 (=> (not res!164235) (not e!192516))))

(declare-datatypes ((array!15644 0))(
  ( (array!15645 (arr!7407 (Array (_ BitVec 32) (_ BitVec 64))) (size!7759 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15644)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15644 (_ BitVec 32)) Bool)

(assert (=> b!307477 (= res!164235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!164232 () Bool)

(assert (=> start!30640 (=> (not res!164232) (not e!192516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30640 (= res!164232 (validMask!0 mask!3709))))

(assert (=> start!30640 e!192516))

(declare-fun array_inv!5370 (array!15644) Bool)

(assert (=> start!30640 (array_inv!5370 a!3293)))

(assert (=> start!30640 true))

(declare-fun b!307478 () Bool)

(declare-fun res!164238 () Bool)

(assert (=> b!307478 (=> (not res!164238) (not e!192516))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307478 (= res!164238 (and (= (size!7759 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7759 a!3293))))))

(declare-fun b!307479 () Bool)

(assert (=> b!307479 (= e!192516 false)))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2547 0))(
  ( (MissingZero!2547 (index!12364 (_ BitVec 32))) (Found!2547 (index!12365 (_ BitVec 32))) (Intermediate!2547 (undefined!3359 Bool) (index!12366 (_ BitVec 32)) (x!30606 (_ BitVec 32))) (Undefined!2547) (MissingVacant!2547 (index!12367 (_ BitVec 32))) )
))
(declare-fun lt!151137 () SeekEntryResult!2547)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15644 (_ BitVec 32)) SeekEntryResult!2547)

(assert (=> b!307479 (= lt!151137 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!307480 () Bool)

(declare-fun res!164231 () Bool)

(assert (=> b!307480 (=> (not res!164231) (not e!192516))))

(declare-fun arrayContainsKey!0 (array!15644 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307480 (= res!164231 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307481 () Bool)

(declare-fun res!164236 () Bool)

(assert (=> b!307481 (=> (not res!164236) (not e!192516))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!307481 (= res!164236 (and (= (select (arr!7407 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7759 a!3293))))))

(declare-fun b!307482 () Bool)

(declare-fun res!164234 () Bool)

(assert (=> b!307482 (=> (not res!164234) (not e!192516))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307482 (= res!164234 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) (Intermediate!2547 false resIndex!52 resX!52)))))

(declare-fun b!307483 () Bool)

(declare-fun res!164237 () Bool)

(assert (=> b!307483 (=> (not res!164237) (not e!192516))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15644 (_ BitVec 32)) SeekEntryResult!2547)

(assert (=> b!307483 (= res!164237 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2547 i!1240)))))

(declare-fun b!307484 () Bool)

(declare-fun res!164233 () Bool)

(assert (=> b!307484 (=> (not res!164233) (not e!192516))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307484 (= res!164233 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30640 res!164232) b!307478))

(assert (= (and b!307478 res!164238) b!307484))

(assert (= (and b!307484 res!164233) b!307480))

(assert (= (and b!307480 res!164231) b!307483))

(assert (= (and b!307483 res!164237) b!307477))

(assert (= (and b!307477 res!164235) b!307482))

(assert (= (and b!307482 res!164234) b!307481))

(assert (= (and b!307481 res!164236) b!307479))

(declare-fun m!317779 () Bool)

(assert (=> b!307477 m!317779))

(declare-fun m!317781 () Bool)

(assert (=> b!307483 m!317781))

(declare-fun m!317783 () Bool)

(assert (=> b!307482 m!317783))

(assert (=> b!307482 m!317783))

(declare-fun m!317785 () Bool)

(assert (=> b!307482 m!317785))

(declare-fun m!317787 () Bool)

(assert (=> b!307480 m!317787))

(declare-fun m!317789 () Bool)

(assert (=> b!307479 m!317789))

(declare-fun m!317791 () Bool)

(assert (=> b!307484 m!317791))

(declare-fun m!317793 () Bool)

(assert (=> b!307481 m!317793))

(declare-fun m!317795 () Bool)

(assert (=> start!30640 m!317795))

(declare-fun m!317797 () Bool)

(assert (=> start!30640 m!317797))

(check-sat (not start!30640) (not b!307480) (not b!307482) (not b!307483) (not b!307484) (not b!307479) (not b!307477))
