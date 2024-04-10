; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30420 () Bool)

(assert start!30420)

(declare-fun b!304485 () Bool)

(declare-fun res!161837 () Bool)

(declare-fun e!191356 () Bool)

(assert (=> b!304485 (=> (not res!161837) (not e!191356))))

(declare-datatypes ((array!15475 0))(
  ( (array!15476 (arr!7324 (Array (_ BitVec 32) (_ BitVec 64))) (size!7676 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15475)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2464 0))(
  ( (MissingZero!2464 (index!12032 (_ BitVec 32))) (Found!2464 (index!12033 (_ BitVec 32))) (Intermediate!2464 (undefined!3276 Bool) (index!12034 (_ BitVec 32)) (x!30290 (_ BitVec 32))) (Undefined!2464) (MissingVacant!2464 (index!12035 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15475 (_ BitVec 32)) SeekEntryResult!2464)

(assert (=> b!304485 (= res!161837 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2464 i!1240)))))

(declare-fun b!304486 () Bool)

(declare-fun e!191357 () Bool)

(declare-fun e!191358 () Bool)

(assert (=> b!304486 (= e!191357 e!191358)))

(declare-fun res!161835 () Bool)

(assert (=> b!304486 (=> (not res!161835) (not e!191358))))

(declare-fun lt!150462 () SeekEntryResult!2464)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun lt!150461 () SeekEntryResult!2464)

(assert (=> b!304486 (= res!161835 (and (= lt!150462 lt!150461) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7324 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7324 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7324 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15475 (_ BitVec 32)) SeekEntryResult!2464)

(assert (=> b!304486 (= lt!150462 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!304487 () Bool)

(declare-fun res!161831 () Bool)

(assert (=> b!304487 (=> (not res!161831) (not e!191356))))

(assert (=> b!304487 (= res!161831 (and (= (size!7676 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7676 a!3293))))))

(declare-fun b!304488 () Bool)

(declare-fun res!161834 () Bool)

(assert (=> b!304488 (=> (not res!161834) (not e!191356))))

(declare-fun arrayContainsKey!0 (array!15475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304488 (= res!161834 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!161833 () Bool)

(assert (=> start!30420 (=> (not res!161833) (not e!191356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30420 (= res!161833 (validMask!0 mask!3709))))

(assert (=> start!30420 e!191356))

(declare-fun array_inv!5287 (array!15475) Bool)

(assert (=> start!30420 (array_inv!5287 a!3293)))

(assert (=> start!30420 true))

(declare-fun b!304489 () Bool)

(declare-fun res!161838 () Bool)

(assert (=> b!304489 (=> (not res!161838) (not e!191357))))

(assert (=> b!304489 (= res!161838 (and (= (select (arr!7324 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7676 a!3293))))))

(declare-fun b!304490 () Bool)

(assert (=> b!304490 (= e!191358 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304490 (= lt!150462 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!304491 () Bool)

(declare-fun res!161836 () Bool)

(assert (=> b!304491 (=> (not res!161836) (not e!191356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304491 (= res!161836 (validKeyInArray!0 k!2441))))

(declare-fun b!304492 () Bool)

(declare-fun res!161830 () Bool)

(assert (=> b!304492 (=> (not res!161830) (not e!191356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15475 (_ BitVec 32)) Bool)

(assert (=> b!304492 (= res!161830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304493 () Bool)

(assert (=> b!304493 (= e!191356 e!191357)))

(declare-fun res!161832 () Bool)

(assert (=> b!304493 (=> (not res!161832) (not e!191357))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304493 (= res!161832 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150461))))

(assert (=> b!304493 (= lt!150461 (Intermediate!2464 false resIndex!52 resX!52))))

(assert (= (and start!30420 res!161833) b!304487))

(assert (= (and b!304487 res!161831) b!304491))

(assert (= (and b!304491 res!161836) b!304488))

(assert (= (and b!304488 res!161834) b!304485))

(assert (= (and b!304485 res!161837) b!304492))

(assert (= (and b!304492 res!161830) b!304493))

(assert (= (and b!304493 res!161832) b!304489))

(assert (= (and b!304489 res!161838) b!304486))

(assert (= (and b!304486 res!161835) b!304490))

(declare-fun m!315579 () Bool)

(assert (=> b!304490 m!315579))

(assert (=> b!304490 m!315579))

(declare-fun m!315581 () Bool)

(assert (=> b!304490 m!315581))

(declare-fun m!315583 () Bool)

(assert (=> b!304492 m!315583))

(declare-fun m!315585 () Bool)

(assert (=> b!304493 m!315585))

(assert (=> b!304493 m!315585))

(declare-fun m!315587 () Bool)

(assert (=> b!304493 m!315587))

(declare-fun m!315589 () Bool)

(assert (=> b!304488 m!315589))

(declare-fun m!315591 () Bool)

(assert (=> b!304485 m!315591))

(declare-fun m!315593 () Bool)

(assert (=> start!30420 m!315593))

(declare-fun m!315595 () Bool)

(assert (=> start!30420 m!315595))

(declare-fun m!315597 () Bool)

(assert (=> b!304491 m!315597))

(declare-fun m!315599 () Bool)

(assert (=> b!304486 m!315599))

(declare-fun m!315601 () Bool)

(assert (=> b!304486 m!315601))

(declare-fun m!315603 () Bool)

(assert (=> b!304489 m!315603))

(push 1)

(assert (not b!304488))

(assert (not b!304492))

(assert (not b!304491))

(assert (not b!304486))

(assert (not b!304490))

