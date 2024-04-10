; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30746 () Bool)

(assert start!30746)

(declare-fun b!308438 () Bool)

(declare-fun e!192879 () Bool)

(assert (=> b!308438 (= e!192879 false)))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!151367 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308438 (= lt!151367 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!308439 () Bool)

(declare-fun res!165054 () Bool)

(declare-fun e!192880 () Bool)

(assert (=> b!308439 (=> (not res!165054) (not e!192880))))

(declare-datatypes ((array!15699 0))(
  ( (array!15700 (arr!7433 (Array (_ BitVec 32) (_ BitVec 64))) (size!7785 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15699)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15699 (_ BitVec 32)) Bool)

(assert (=> b!308439 (= res!165054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308440 () Bool)

(declare-fun res!165051 () Bool)

(assert (=> b!308440 (=> (not res!165051) (not e!192880))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308440 (= res!165051 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!165060 () Bool)

(assert (=> start!30746 (=> (not res!165060) (not e!192880))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30746 (= res!165060 (validMask!0 mask!3709))))

(assert (=> start!30746 e!192880))

(declare-fun array_inv!5396 (array!15699) Bool)

(assert (=> start!30746 (array_inv!5396 a!3293)))

(assert (=> start!30746 true))

(declare-fun b!308441 () Bool)

(declare-fun res!165057 () Bool)

(assert (=> b!308441 (=> (not res!165057) (not e!192879))))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!308441 (= res!165057 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7433 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun b!308442 () Bool)

(declare-fun res!165056 () Bool)

(assert (=> b!308442 (=> (not res!165056) (not e!192879))))

(declare-datatypes ((SeekEntryResult!2573 0))(
  ( (MissingZero!2573 (index!12468 (_ BitVec 32))) (Found!2573 (index!12469 (_ BitVec 32))) (Intermediate!2573 (undefined!3385 Bool) (index!12470 (_ BitVec 32)) (x!30713 (_ BitVec 32))) (Undefined!2573) (MissingVacant!2573 (index!12471 (_ BitVec 32))) )
))
(declare-fun lt!151368 () SeekEntryResult!2573)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15699 (_ BitVec 32)) SeekEntryResult!2573)

(assert (=> b!308442 (= res!165056 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151368))))

(declare-fun b!308443 () Bool)

(assert (=> b!308443 (= e!192880 e!192879)))

(declare-fun res!165055 () Bool)

(assert (=> b!308443 (=> (not res!165055) (not e!192879))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308443 (= res!165055 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151368))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!308443 (= lt!151368 (Intermediate!2573 false resIndex!52 resX!52))))

(declare-fun b!308444 () Bool)

(declare-fun res!165052 () Bool)

(assert (=> b!308444 (=> (not res!165052) (not e!192880))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!308444 (= res!165052 (and (= (size!7785 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7785 a!3293))))))

(declare-fun b!308445 () Bool)

(declare-fun res!165058 () Bool)

(assert (=> b!308445 (=> (not res!165058) (not e!192880))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308445 (= res!165058 (validKeyInArray!0 k!2441))))

(declare-fun b!308446 () Bool)

(declare-fun res!165059 () Bool)

(assert (=> b!308446 (=> (not res!165059) (not e!192879))))

(assert (=> b!308446 (= res!165059 (and (= (select (arr!7433 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7785 a!3293))))))

(declare-fun b!308447 () Bool)

(declare-fun res!165053 () Bool)

(assert (=> b!308447 (=> (not res!165053) (not e!192880))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15699 (_ BitVec 32)) SeekEntryResult!2573)

(assert (=> b!308447 (= res!165053 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2573 i!1240)))))

(assert (= (and start!30746 res!165060) b!308444))

(assert (= (and b!308444 res!165052) b!308445))

(assert (= (and b!308445 res!165058) b!308440))

(assert (= (and b!308440 res!165051) b!308447))

(assert (= (and b!308447 res!165053) b!308439))

(assert (= (and b!308439 res!165054) b!308443))

(assert (= (and b!308443 res!165055) b!308446))

(assert (= (and b!308446 res!165059) b!308442))

(assert (= (and b!308442 res!165056) b!308441))

(assert (= (and b!308441 res!165057) b!308438))

(declare-fun m!318491 () Bool)

(assert (=> b!308447 m!318491))

(declare-fun m!318493 () Bool)

(assert (=> b!308440 m!318493))

(declare-fun m!318495 () Bool)

(assert (=> b!308439 m!318495))

(declare-fun m!318497 () Bool)

(assert (=> b!308446 m!318497))

(declare-fun m!318499 () Bool)

(assert (=> b!308445 m!318499))

(declare-fun m!318501 () Bool)

(assert (=> b!308442 m!318501))

(declare-fun m!318503 () Bool)

(assert (=> b!308443 m!318503))

(assert (=> b!308443 m!318503))

(declare-fun m!318505 () Bool)

(assert (=> b!308443 m!318505))

(declare-fun m!318507 () Bool)

(assert (=> b!308441 m!318507))

(declare-fun m!318509 () Bool)

(assert (=> b!308438 m!318509))

(declare-fun m!318511 () Bool)

(assert (=> start!30746 m!318511))

(declare-fun m!318513 () Bool)

(assert (=> start!30746 m!318513))

(push 1)

