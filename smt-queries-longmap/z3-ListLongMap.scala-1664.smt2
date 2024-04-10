; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30820 () Bool)

(assert start!30820)

(declare-fun b!309444 () Bool)

(declare-fun e!193318 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(assert (=> b!309444 (= e!193318 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!15773 0))(
  ( (array!15774 (arr!7470 (Array (_ BitVec 32) (_ BitVec 64))) (size!7822 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15773)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2610 0))(
  ( (MissingZero!2610 (index!12616 (_ BitVec 32))) (Found!2610 (index!12617 (_ BitVec 32))) (Intermediate!2610 (undefined!3422 Bool) (index!12618 (_ BitVec 32)) (x!30846 (_ BitVec 32))) (Undefined!2610) (MissingVacant!2610 (index!12619 (_ BitVec 32))) )
))
(declare-fun lt!151589 () SeekEntryResult!2610)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15773 (_ BitVec 32)) SeekEntryResult!2610)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309444 (= lt!151589 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!309445 () Bool)

(declare-fun res!166059 () Bool)

(declare-fun e!193317 () Bool)

(assert (=> b!309445 (=> (not res!166059) (not e!193317))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309445 (= res!166059 (validKeyInArray!0 k0!2441))))

(declare-fun b!309446 () Bool)

(declare-fun e!193315 () Bool)

(assert (=> b!309446 (= e!193317 e!193315)))

(declare-fun res!166064 () Bool)

(assert (=> b!309446 (=> (not res!166064) (not e!193315))))

(declare-fun lt!151590 () SeekEntryResult!2610)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309446 (= res!166064 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151590))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!309446 (= lt!151590 (Intermediate!2610 false resIndex!52 resX!52))))

(declare-fun b!309447 () Bool)

(declare-fun res!166065 () Bool)

(assert (=> b!309447 (=> (not res!166065) (not e!193317))))

(declare-fun arrayContainsKey!0 (array!15773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309447 (= res!166065 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!166057 () Bool)

(assert (=> start!30820 (=> (not res!166057) (not e!193317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30820 (= res!166057 (validMask!0 mask!3709))))

(assert (=> start!30820 e!193317))

(declare-fun array_inv!5433 (array!15773) Bool)

(assert (=> start!30820 (array_inv!5433 a!3293)))

(assert (=> start!30820 true))

(declare-fun b!309448 () Bool)

(declare-fun res!166058 () Bool)

(assert (=> b!309448 (=> (not res!166058) (not e!193317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15773 (_ BitVec 32)) Bool)

(assert (=> b!309448 (= res!166058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309449 () Bool)

(declare-fun res!166060 () Bool)

(assert (=> b!309449 (=> (not res!166060) (not e!193315))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!309449 (= res!166060 (and (= (select (arr!7470 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7822 a!3293))))))

(declare-fun b!309450 () Bool)

(declare-fun res!166061 () Bool)

(assert (=> b!309450 (=> (not res!166061) (not e!193317))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15773 (_ BitVec 32)) SeekEntryResult!2610)

(assert (=> b!309450 (= res!166061 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2610 i!1240)))))

(declare-fun b!309451 () Bool)

(assert (=> b!309451 (= e!193315 e!193318)))

(declare-fun res!166063 () Bool)

(assert (=> b!309451 (=> (not res!166063) (not e!193318))))

(assert (=> b!309451 (= res!166063 (and (= lt!151589 lt!151590) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7470 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309451 (= lt!151589 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!309452 () Bool)

(declare-fun res!166062 () Bool)

(assert (=> b!309452 (=> (not res!166062) (not e!193317))))

(assert (=> b!309452 (= res!166062 (and (= (size!7822 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7822 a!3293))))))

(assert (= (and start!30820 res!166057) b!309452))

(assert (= (and b!309452 res!166062) b!309445))

(assert (= (and b!309445 res!166059) b!309447))

(assert (= (and b!309447 res!166065) b!309450))

(assert (= (and b!309450 res!166061) b!309448))

(assert (= (and b!309448 res!166058) b!309446))

(assert (= (and b!309446 res!166064) b!309449))

(assert (= (and b!309449 res!166060) b!309451))

(assert (= (and b!309451 res!166063) b!309444))

(declare-fun m!319447 () Bool)

(assert (=> b!309449 m!319447))

(declare-fun m!319449 () Bool)

(assert (=> b!309448 m!319449))

(declare-fun m!319451 () Bool)

(assert (=> b!309445 m!319451))

(declare-fun m!319453 () Bool)

(assert (=> start!30820 m!319453))

(declare-fun m!319455 () Bool)

(assert (=> start!30820 m!319455))

(declare-fun m!319457 () Bool)

(assert (=> b!309447 m!319457))

(declare-fun m!319459 () Bool)

(assert (=> b!309446 m!319459))

(assert (=> b!309446 m!319459))

(declare-fun m!319461 () Bool)

(assert (=> b!309446 m!319461))

(declare-fun m!319463 () Bool)

(assert (=> b!309450 m!319463))

(declare-fun m!319465 () Bool)

(assert (=> b!309451 m!319465))

(declare-fun m!319467 () Bool)

(assert (=> b!309451 m!319467))

(declare-fun m!319469 () Bool)

(assert (=> b!309444 m!319469))

(assert (=> b!309444 m!319469))

(declare-fun m!319471 () Bool)

(assert (=> b!309444 m!319471))

(check-sat (not b!309444) (not b!309445) (not start!30820) (not b!309447) (not b!309450) (not b!309448) (not b!309446) (not b!309451))
(check-sat)
