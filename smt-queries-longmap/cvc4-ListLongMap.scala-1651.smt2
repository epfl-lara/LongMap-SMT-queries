; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30744 () Bool)

(assert start!30744)

(declare-fun res!165027 () Bool)

(declare-fun e!192869 () Bool)

(assert (=> start!30744 (=> (not res!165027) (not e!192869))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30744 (= res!165027 (validMask!0 mask!3709))))

(assert (=> start!30744 e!192869))

(declare-datatypes ((array!15697 0))(
  ( (array!15698 (arr!7432 (Array (_ BitVec 32) (_ BitVec 64))) (size!7784 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15697)

(declare-fun array_inv!5395 (array!15697) Bool)

(assert (=> start!30744 (array_inv!5395 a!3293)))

(assert (=> start!30744 true))

(declare-fun b!308408 () Bool)

(declare-fun res!165029 () Bool)

(assert (=> b!308408 (=> (not res!165029) (not e!192869))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308408 (= res!165029 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308409 () Bool)

(declare-fun res!165030 () Bool)

(declare-fun e!192871 () Bool)

(assert (=> b!308409 (=> (not res!165030) (not e!192871))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308409 (= res!165030 (and (= (select (arr!7432 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7784 a!3293))))))

(declare-fun b!308410 () Bool)

(assert (=> b!308410 (= e!192869 e!192871)))

(declare-fun res!165023 () Bool)

(assert (=> b!308410 (=> (not res!165023) (not e!192871))))

(declare-datatypes ((SeekEntryResult!2572 0))(
  ( (MissingZero!2572 (index!12464 (_ BitVec 32))) (Found!2572 (index!12465 (_ BitVec 32))) (Intermediate!2572 (undefined!3384 Bool) (index!12466 (_ BitVec 32)) (x!30704 (_ BitVec 32))) (Undefined!2572) (MissingVacant!2572 (index!12467 (_ BitVec 32))) )
))
(declare-fun lt!151361 () SeekEntryResult!2572)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15697 (_ BitVec 32)) SeekEntryResult!2572)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308410 (= res!165023 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151361))))

(assert (=> b!308410 (= lt!151361 (Intermediate!2572 false resIndex!52 resX!52))))

(declare-fun lt!151362 () (_ BitVec 32))

(declare-fun b!308411 () Bool)

(assert (=> b!308411 (= e!192871 (and (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge lt!151362 #b00000000000000000000000000000000) (bvslt lt!151362 (bvadd #b00000000000000000000000000000001 mask!3709)) (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308411 (= lt!151362 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!308412 () Bool)

(declare-fun res!165025 () Bool)

(assert (=> b!308412 (=> (not res!165025) (not e!192869))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308412 (= res!165025 (validKeyInArray!0 k!2441))))

(declare-fun b!308413 () Bool)

(declare-fun res!165024 () Bool)

(assert (=> b!308413 (=> (not res!165024) (not e!192869))))

(assert (=> b!308413 (= res!165024 (and (= (size!7784 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7784 a!3293))))))

(declare-fun b!308414 () Bool)

(declare-fun res!165028 () Bool)

(assert (=> b!308414 (=> (not res!165028) (not e!192871))))

(assert (=> b!308414 (= res!165028 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151361))))

(declare-fun b!308415 () Bool)

(declare-fun res!165026 () Bool)

(assert (=> b!308415 (=> (not res!165026) (not e!192869))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15697 (_ BitVec 32)) Bool)

(assert (=> b!308415 (= res!165026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308416 () Bool)

(declare-fun res!165022 () Bool)

(assert (=> b!308416 (=> (not res!165022) (not e!192869))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15697 (_ BitVec 32)) SeekEntryResult!2572)

(assert (=> b!308416 (= res!165022 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2572 i!1240)))))

(declare-fun b!308417 () Bool)

(declare-fun res!165021 () Bool)

(assert (=> b!308417 (=> (not res!165021) (not e!192871))))

(assert (=> b!308417 (= res!165021 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7432 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (= (and start!30744 res!165027) b!308413))

(assert (= (and b!308413 res!165024) b!308412))

(assert (= (and b!308412 res!165025) b!308408))

(assert (= (and b!308408 res!165029) b!308416))

(assert (= (and b!308416 res!165022) b!308415))

(assert (= (and b!308415 res!165026) b!308410))

(assert (= (and b!308410 res!165023) b!308409))

(assert (= (and b!308409 res!165030) b!308414))

(assert (= (and b!308414 res!165028) b!308417))

(assert (= (and b!308417 res!165021) b!308411))

(declare-fun m!318467 () Bool)

(assert (=> b!308411 m!318467))

(declare-fun m!318469 () Bool)

(assert (=> b!308410 m!318469))

(assert (=> b!308410 m!318469))

(declare-fun m!318471 () Bool)

(assert (=> b!308410 m!318471))

(declare-fun m!318473 () Bool)

(assert (=> b!308408 m!318473))

(declare-fun m!318475 () Bool)

(assert (=> b!308417 m!318475))

(declare-fun m!318477 () Bool)

(assert (=> b!308416 m!318477))

(declare-fun m!318479 () Bool)

(assert (=> b!308414 m!318479))

(declare-fun m!318481 () Bool)

(assert (=> start!30744 m!318481))

(declare-fun m!318483 () Bool)

(assert (=> start!30744 m!318483))

(declare-fun m!318485 () Bool)

(assert (=> b!308412 m!318485))

(declare-fun m!318487 () Bool)

(assert (=> b!308415 m!318487))

(declare-fun m!318489 () Bool)

(assert (=> b!308409 m!318489))

(push 1)

(assert (not b!308414))

(assert (not b!308410))

(assert (not start!30744))

(assert (not b!308412))

(assert (not b!308408))

(assert (not b!308416))

(assert (not b!308415))

(assert (not b!308411))

(check-sat)

(pop 1)

(push 1)

(check-sat)

