; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30748 () Bool)

(assert start!30748)

(declare-fun b!308468 () Bool)

(declare-fun res!165085 () Bool)

(declare-fun e!192889 () Bool)

(assert (=> b!308468 (=> (not res!165085) (not e!192889))))

(declare-datatypes ((array!15701 0))(
  ( (array!15702 (arr!7434 (Array (_ BitVec 32) (_ BitVec 64))) (size!7786 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15701)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15701 (_ BitVec 32)) Bool)

(assert (=> b!308468 (= res!165085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308469 () Bool)

(declare-fun res!165083 () Bool)

(assert (=> b!308469 (=> (not res!165083) (not e!192889))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!308469 (= res!165083 (and (= (size!7786 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7786 a!3293))))))

(declare-fun b!308470 () Bool)

(declare-fun e!192887 () Bool)

(assert (=> b!308470 (= e!192889 e!192887)))

(declare-fun res!165087 () Bool)

(assert (=> b!308470 (=> (not res!165087) (not e!192887))))

(declare-datatypes ((SeekEntryResult!2574 0))(
  ( (MissingZero!2574 (index!12472 (_ BitVec 32))) (Found!2574 (index!12473 (_ BitVec 32))) (Intermediate!2574 (undefined!3386 Bool) (index!12474 (_ BitVec 32)) (x!30714 (_ BitVec 32))) (Undefined!2574) (MissingVacant!2574 (index!12475 (_ BitVec 32))) )
))
(declare-fun lt!151374 () SeekEntryResult!2574)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15701 (_ BitVec 32)) SeekEntryResult!2574)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308470 (= res!165087 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151374))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!308470 (= lt!151374 (Intermediate!2574 false resIndex!52 resX!52))))

(declare-fun b!308471 () Bool)

(declare-fun res!165089 () Bool)

(assert (=> b!308471 (=> (not res!165089) (not e!192887))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308471 (= res!165089 (and (= (select (arr!7434 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7786 a!3293))))))

(declare-fun b!308472 () Bool)

(declare-fun res!165090 () Bool)

(assert (=> b!308472 (=> (not res!165090) (not e!192887))))

(assert (=> b!308472 (= res!165090 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151374))))

(declare-fun b!308473 () Bool)

(declare-fun res!165086 () Bool)

(assert (=> b!308473 (=> (not res!165086) (not e!192889))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15701 (_ BitVec 32)) SeekEntryResult!2574)

(assert (=> b!308473 (= res!165086 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2574 i!1240)))))

(declare-fun b!308474 () Bool)

(declare-fun res!165088 () Bool)

(assert (=> b!308474 (=> (not res!165088) (not e!192889))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308474 (= res!165088 (validKeyInArray!0 k0!2441))))

(declare-fun res!165082 () Bool)

(assert (=> start!30748 (=> (not res!165082) (not e!192889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30748 (= res!165082 (validMask!0 mask!3709))))

(assert (=> start!30748 e!192889))

(declare-fun array_inv!5397 (array!15701) Bool)

(assert (=> start!30748 (array_inv!5397 a!3293)))

(assert (=> start!30748 true))

(declare-fun b!308475 () Bool)

(declare-fun res!165081 () Bool)

(assert (=> b!308475 (=> (not res!165081) (not e!192887))))

(assert (=> b!308475 (= res!165081 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7434 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun b!308476 () Bool)

(declare-fun res!165084 () Bool)

(assert (=> b!308476 (=> (not res!165084) (not e!192889))))

(declare-fun arrayContainsKey!0 (array!15701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308476 (= res!165084 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308477 () Bool)

(assert (=> b!308477 (= e!192887 false)))

(declare-fun lt!151373 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308477 (= lt!151373 (nextIndex!0 index!1781 x!1427 mask!3709))))

(assert (= (and start!30748 res!165082) b!308469))

(assert (= (and b!308469 res!165083) b!308474))

(assert (= (and b!308474 res!165088) b!308476))

(assert (= (and b!308476 res!165084) b!308473))

(assert (= (and b!308473 res!165086) b!308468))

(assert (= (and b!308468 res!165085) b!308470))

(assert (= (and b!308470 res!165087) b!308471))

(assert (= (and b!308471 res!165089) b!308472))

(assert (= (and b!308472 res!165090) b!308475))

(assert (= (and b!308475 res!165081) b!308477))

(declare-fun m!318515 () Bool)

(assert (=> b!308470 m!318515))

(assert (=> b!308470 m!318515))

(declare-fun m!318517 () Bool)

(assert (=> b!308470 m!318517))

(declare-fun m!318519 () Bool)

(assert (=> b!308472 m!318519))

(declare-fun m!318521 () Bool)

(assert (=> start!30748 m!318521))

(declare-fun m!318523 () Bool)

(assert (=> start!30748 m!318523))

(declare-fun m!318525 () Bool)

(assert (=> b!308477 m!318525))

(declare-fun m!318527 () Bool)

(assert (=> b!308468 m!318527))

(declare-fun m!318529 () Bool)

(assert (=> b!308476 m!318529))

(declare-fun m!318531 () Bool)

(assert (=> b!308473 m!318531))

(declare-fun m!318533 () Bool)

(assert (=> b!308474 m!318533))

(declare-fun m!318535 () Bool)

(assert (=> b!308475 m!318535))

(declare-fun m!318537 () Bool)

(assert (=> b!308471 m!318537))

(check-sat (not b!308468) (not b!308476) (not b!308472) (not b!308470) (not start!30748) (not b!308473) (not b!308474) (not b!308477))
(check-sat)
