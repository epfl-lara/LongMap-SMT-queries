; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30240 () Bool)

(assert start!30240)

(declare-fun b!302473 () Bool)

(declare-fun e!190583 () Bool)

(declare-fun e!190581 () Bool)

(assert (=> b!302473 (= e!190583 e!190581)))

(declare-fun res!160113 () Bool)

(assert (=> b!302473 (=> (not res!160113) (not e!190581))))

(declare-datatypes ((array!15350 0))(
  ( (array!15351 (arr!7263 (Array (_ BitVec 32) (_ BitVec 64))) (size!7616 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15350)

(declare-datatypes ((SeekEntryResult!2402 0))(
  ( (MissingZero!2402 (index!11784 (_ BitVec 32))) (Found!2402 (index!11785 (_ BitVec 32))) (Intermediate!2402 (undefined!3214 Bool) (index!11786 (_ BitVec 32)) (x!30070 (_ BitVec 32))) (Undefined!2402) (MissingVacant!2402 (index!11787 (_ BitVec 32))) )
))
(declare-fun lt!149891 () SeekEntryResult!2402)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15350 (_ BitVec 32)) SeekEntryResult!2402)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302473 (= res!160113 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!149891))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!302473 (= lt!149891 (Intermediate!2402 false resIndex!52 resX!52))))

(declare-fun b!302474 () Bool)

(declare-fun res!160108 () Bool)

(assert (=> b!302474 (=> (not res!160108) (not e!190581))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!302474 (= res!160108 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!149891))))

(declare-fun b!302475 () Bool)

(declare-fun res!160106 () Bool)

(assert (=> b!302475 (=> (not res!160106) (not e!190583))))

(declare-fun arrayContainsKey!0 (array!15350 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302475 (= res!160106 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302476 () Bool)

(declare-fun res!160107 () Bool)

(assert (=> b!302476 (=> (not res!160107) (not e!190581))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302476 (= res!160107 (and (= (select (arr!7263 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7616 a!3293))))))

(declare-fun b!302478 () Bool)

(assert (=> b!302478 (= e!190581 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7263 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (or (= (select (arr!7263 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7263 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsgt x!1427 #b01111111111111111111111111111110)))))

(declare-fun b!302479 () Bool)

(declare-fun res!160110 () Bool)

(assert (=> b!302479 (=> (not res!160110) (not e!190583))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302479 (= res!160110 (validKeyInArray!0 k0!2441))))

(declare-fun b!302477 () Bool)

(declare-fun res!160105 () Bool)

(assert (=> b!302477 (=> (not res!160105) (not e!190583))))

(assert (=> b!302477 (= res!160105 (and (= (size!7616 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7616 a!3293))))))

(declare-fun res!160111 () Bool)

(assert (=> start!30240 (=> (not res!160111) (not e!190583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30240 (= res!160111 (validMask!0 mask!3709))))

(assert (=> start!30240 e!190583))

(declare-fun array_inv!5235 (array!15350) Bool)

(assert (=> start!30240 (array_inv!5235 a!3293)))

(assert (=> start!30240 true))

(declare-fun b!302480 () Bool)

(declare-fun res!160109 () Bool)

(assert (=> b!302480 (=> (not res!160109) (not e!190583))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15350 (_ BitVec 32)) SeekEntryResult!2402)

(assert (=> b!302480 (= res!160109 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2402 i!1240)))))

(declare-fun b!302481 () Bool)

(declare-fun res!160112 () Bool)

(assert (=> b!302481 (=> (not res!160112) (not e!190583))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15350 (_ BitVec 32)) Bool)

(assert (=> b!302481 (= res!160112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30240 res!160111) b!302477))

(assert (= (and b!302477 res!160105) b!302479))

(assert (= (and b!302479 res!160110) b!302475))

(assert (= (and b!302475 res!160106) b!302480))

(assert (= (and b!302480 res!160109) b!302481))

(assert (= (and b!302481 res!160112) b!302473))

(assert (= (and b!302473 res!160113) b!302476))

(assert (= (and b!302476 res!160107) b!302474))

(assert (= (and b!302474 res!160108) b!302478))

(declare-fun m!313489 () Bool)

(assert (=> b!302479 m!313489))

(declare-fun m!313491 () Bool)

(assert (=> b!302478 m!313491))

(declare-fun m!313493 () Bool)

(assert (=> b!302481 m!313493))

(declare-fun m!313495 () Bool)

(assert (=> b!302480 m!313495))

(declare-fun m!313497 () Bool)

(assert (=> b!302475 m!313497))

(declare-fun m!313499 () Bool)

(assert (=> b!302476 m!313499))

(declare-fun m!313501 () Bool)

(assert (=> start!30240 m!313501))

(declare-fun m!313503 () Bool)

(assert (=> start!30240 m!313503))

(declare-fun m!313505 () Bool)

(assert (=> b!302473 m!313505))

(assert (=> b!302473 m!313505))

(declare-fun m!313507 () Bool)

(assert (=> b!302473 m!313507))

(declare-fun m!313509 () Bool)

(assert (=> b!302474 m!313509))

(check-sat (not b!302474) (not b!302481) (not b!302480) (not b!302473) (not start!30240) (not b!302479) (not b!302475))
(check-sat)
