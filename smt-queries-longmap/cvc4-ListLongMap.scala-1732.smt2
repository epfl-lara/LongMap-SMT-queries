; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31848 () Bool)

(assert start!31848)

(declare-fun b!318362 () Bool)

(declare-fun res!172944 () Bool)

(declare-fun e!197829 () Bool)

(assert (=> b!318362 (=> (not res!172944) (not e!197829))))

(declare-datatypes ((array!16219 0))(
  ( (array!16220 (arr!7675 (Array (_ BitVec 32) (_ BitVec 64))) (size!8027 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16219)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16219 (_ BitVec 32)) Bool)

(assert (=> b!318362 (= res!172944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun lt!155320 () array!16219)

(declare-fun lt!155319 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun e!197827 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun b!318363 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2815 0))(
  ( (MissingZero!2815 (index!13436 (_ BitVec 32))) (Found!2815 (index!13437 (_ BitVec 32))) (Intermediate!2815 (undefined!3627 Bool) (index!13438 (_ BitVec 32)) (x!31688 (_ BitVec 32))) (Undefined!2815) (MissingVacant!2815 (index!13439 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16219 (_ BitVec 32)) SeekEntryResult!2815)

(assert (=> b!318363 (= e!197827 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155320 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155319 k!2441 lt!155320 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318363 (= lt!155320 (array!16220 (store (arr!7675 a!3293) i!1240 k!2441) (size!8027 a!3293)))))

(declare-fun b!318364 () Bool)

(declare-fun e!197830 () Bool)

(assert (=> b!318364 (= e!197830 (not true))))

(assert (=> b!318364 e!197827))

(declare-fun res!172946 () Bool)

(assert (=> b!318364 (=> (not res!172946) (not e!197827))))

(declare-fun lt!155321 () SeekEntryResult!2815)

(assert (=> b!318364 (= res!172946 (= lt!155321 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155319 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318364 (= lt!155319 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!318366 () Bool)

(declare-fun res!172942 () Bool)

(assert (=> b!318366 (=> (not res!172942) (not e!197829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318366 (= res!172942 (validKeyInArray!0 k!2441))))

(declare-fun b!318367 () Bool)

(declare-fun e!197828 () Bool)

(assert (=> b!318367 (= e!197828 e!197830)))

(declare-fun res!172950 () Bool)

(assert (=> b!318367 (=> (not res!172950) (not e!197830))))

(declare-fun lt!155322 () SeekEntryResult!2815)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!318367 (= res!172950 (and (= lt!155321 lt!155322) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7675 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318367 (= lt!155321 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!318368 () Bool)

(declare-fun res!172945 () Bool)

(assert (=> b!318368 (=> (not res!172945) (not e!197829))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16219 (_ BitVec 32)) SeekEntryResult!2815)

(assert (=> b!318368 (= res!172945 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2815 i!1240)))))

(declare-fun b!318369 () Bool)

(assert (=> b!318369 (= e!197829 e!197828)))

(declare-fun res!172949 () Bool)

(assert (=> b!318369 (=> (not res!172949) (not e!197828))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318369 (= res!172949 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155322))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!318369 (= lt!155322 (Intermediate!2815 false resIndex!52 resX!52))))

(declare-fun res!172947 () Bool)

(assert (=> start!31848 (=> (not res!172947) (not e!197829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31848 (= res!172947 (validMask!0 mask!3709))))

(assert (=> start!31848 e!197829))

(declare-fun array_inv!5638 (array!16219) Bool)

(assert (=> start!31848 (array_inv!5638 a!3293)))

(assert (=> start!31848 true))

(declare-fun b!318365 () Bool)

(declare-fun res!172941 () Bool)

(assert (=> b!318365 (=> (not res!172941) (not e!197829))))

(assert (=> b!318365 (= res!172941 (and (= (size!8027 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8027 a!3293))))))

(declare-fun b!318370 () Bool)

(declare-fun res!172943 () Bool)

(assert (=> b!318370 (=> (not res!172943) (not e!197829))))

(declare-fun arrayContainsKey!0 (array!16219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318370 (= res!172943 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318371 () Bool)

(declare-fun res!172948 () Bool)

(assert (=> b!318371 (=> (not res!172948) (not e!197828))))

(assert (=> b!318371 (= res!172948 (and (= (select (arr!7675 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8027 a!3293))))))

(assert (= (and start!31848 res!172947) b!318365))

(assert (= (and b!318365 res!172941) b!318366))

(assert (= (and b!318366 res!172942) b!318370))

(assert (= (and b!318370 res!172943) b!318368))

(assert (= (and b!318368 res!172945) b!318362))

(assert (= (and b!318362 res!172944) b!318369))

(assert (= (and b!318369 res!172949) b!318371))

(assert (= (and b!318371 res!172948) b!318367))

(assert (= (and b!318367 res!172950) b!318364))

(assert (= (and b!318364 res!172946) b!318363))

(declare-fun m!327057 () Bool)

(assert (=> b!318363 m!327057))

(declare-fun m!327059 () Bool)

(assert (=> b!318363 m!327059))

(declare-fun m!327061 () Bool)

(assert (=> b!318363 m!327061))

(declare-fun m!327063 () Bool)

(assert (=> b!318366 m!327063))

(declare-fun m!327065 () Bool)

(assert (=> b!318369 m!327065))

(assert (=> b!318369 m!327065))

(declare-fun m!327067 () Bool)

(assert (=> b!318369 m!327067))

(declare-fun m!327069 () Bool)

(assert (=> b!318364 m!327069))

(declare-fun m!327071 () Bool)

(assert (=> b!318364 m!327071))

(declare-fun m!327073 () Bool)

(assert (=> b!318368 m!327073))

(declare-fun m!327075 () Bool)

(assert (=> start!31848 m!327075))

(declare-fun m!327077 () Bool)

(assert (=> start!31848 m!327077))

(declare-fun m!327079 () Bool)

(assert (=> b!318370 m!327079))

(declare-fun m!327081 () Bool)

(assert (=> b!318371 m!327081))

(declare-fun m!327083 () Bool)

(assert (=> b!318362 m!327083))

(declare-fun m!327085 () Bool)

(assert (=> b!318367 m!327085))

(declare-fun m!327087 () Bool)

(assert (=> b!318367 m!327087))

(push 1)

(assert (not b!318364))

(assert (not b!318366))

(assert (not b!318363))

(assert (not start!31848))

