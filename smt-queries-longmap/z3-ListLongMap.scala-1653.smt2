; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30738 () Bool)

(assert start!30738)

(declare-fun b!308473 () Bool)

(declare-fun res!165138 () Bool)

(declare-fun e!192875 () Bool)

(assert (=> b!308473 (=> (not res!165138) (not e!192875))))

(declare-datatypes ((array!15704 0))(
  ( (array!15705 (arr!7435 (Array (_ BitVec 32) (_ BitVec 64))) (size!7787 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15704)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15704 (_ BitVec 32)) Bool)

(assert (=> b!308473 (= res!165138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308474 () Bool)

(declare-fun res!165141 () Bool)

(assert (=> b!308474 (=> (not res!165141) (not e!192875))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15704 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308474 (= res!165141 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308475 () Bool)

(declare-fun res!165143 () Bool)

(assert (=> b!308475 (=> (not res!165143) (not e!192875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308475 (= res!165143 (validKeyInArray!0 k0!2441))))

(declare-fun b!308476 () Bool)

(declare-fun e!192876 () Bool)

(declare-fun e!192874 () Bool)

(assert (=> b!308476 (= e!192876 e!192874)))

(declare-fun res!165140 () Bool)

(assert (=> b!308476 (=> (not res!165140) (not e!192874))))

(declare-datatypes ((SeekEntryResult!2540 0))(
  ( (MissingZero!2540 (index!12336 (_ BitVec 32))) (Found!2540 (index!12337 (_ BitVec 32))) (Intermediate!2540 (undefined!3352 Bool) (index!12338 (_ BitVec 32)) (x!30685 (_ BitVec 32))) (Undefined!2540) (MissingVacant!2540 (index!12339 (_ BitVec 32))) )
))
(declare-fun lt!151404 () SeekEntryResult!2540)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!151403 () SeekEntryResult!2540)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308476 (= res!165140 (and (= lt!151404 lt!151403) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7435 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15704 (_ BitVec 32)) SeekEntryResult!2540)

(assert (=> b!308476 (= lt!151404 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!308477 () Bool)

(declare-fun res!165142 () Bool)

(assert (=> b!308477 (=> (not res!165142) (not e!192875))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!308477 (= res!165142 (and (= (size!7787 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7787 a!3293))))))

(declare-fun b!308478 () Bool)

(declare-fun res!165136 () Bool)

(assert (=> b!308478 (=> (not res!165136) (not e!192875))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15704 (_ BitVec 32)) SeekEntryResult!2540)

(assert (=> b!308478 (= res!165136 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2540 i!1240)))))

(declare-fun b!308479 () Bool)

(assert (=> b!308479 (= e!192874 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308479 (= lt!151404 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!308480 () Bool)

(assert (=> b!308480 (= e!192875 e!192876)))

(declare-fun res!165139 () Bool)

(assert (=> b!308480 (=> (not res!165139) (not e!192876))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308480 (= res!165139 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151403))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!308480 (= lt!151403 (Intermediate!2540 false resIndex!52 resX!52))))

(declare-fun b!308481 () Bool)

(declare-fun res!165137 () Bool)

(assert (=> b!308481 (=> (not res!165137) (not e!192876))))

(assert (=> b!308481 (= res!165137 (and (= (select (arr!7435 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7787 a!3293))))))

(declare-fun res!165144 () Bool)

(assert (=> start!30738 (=> (not res!165144) (not e!192875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30738 (= res!165144 (validMask!0 mask!3709))))

(assert (=> start!30738 e!192875))

(declare-fun array_inv!5385 (array!15704) Bool)

(assert (=> start!30738 (array_inv!5385 a!3293)))

(assert (=> start!30738 true))

(assert (= (and start!30738 res!165144) b!308477))

(assert (= (and b!308477 res!165142) b!308475))

(assert (= (and b!308475 res!165143) b!308474))

(assert (= (and b!308474 res!165141) b!308478))

(assert (= (and b!308478 res!165136) b!308473))

(assert (= (and b!308473 res!165138) b!308480))

(assert (= (and b!308480 res!165139) b!308481))

(assert (= (and b!308481 res!165137) b!308476))

(assert (= (and b!308476 res!165140) b!308479))

(declare-fun m!318691 () Bool)

(assert (=> b!308478 m!318691))

(declare-fun m!318693 () Bool)

(assert (=> start!30738 m!318693))

(declare-fun m!318695 () Bool)

(assert (=> start!30738 m!318695))

(declare-fun m!318697 () Bool)

(assert (=> b!308481 m!318697))

(declare-fun m!318699 () Bool)

(assert (=> b!308480 m!318699))

(assert (=> b!308480 m!318699))

(declare-fun m!318701 () Bool)

(assert (=> b!308480 m!318701))

(declare-fun m!318703 () Bool)

(assert (=> b!308475 m!318703))

(declare-fun m!318705 () Bool)

(assert (=> b!308479 m!318705))

(assert (=> b!308479 m!318705))

(declare-fun m!318707 () Bool)

(assert (=> b!308479 m!318707))

(declare-fun m!318709 () Bool)

(assert (=> b!308473 m!318709))

(declare-fun m!318711 () Bool)

(assert (=> b!308476 m!318711))

(declare-fun m!318713 () Bool)

(assert (=> b!308476 m!318713))

(declare-fun m!318715 () Bool)

(assert (=> b!308474 m!318715))

(check-sat (not b!308473) (not b!308478) (not b!308474) (not b!308479) (not start!30738) (not b!308476) (not b!308480) (not b!308475))
(check-sat)
