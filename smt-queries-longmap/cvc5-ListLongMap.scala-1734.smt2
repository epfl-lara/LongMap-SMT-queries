; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31856 () Bool)

(assert start!31856)

(declare-fun b!318482 () Bool)

(declare-fun res!173066 () Bool)

(declare-fun e!197890 () Bool)

(assert (=> b!318482 (=> (not res!173066) (not e!197890))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318482 (= res!173066 (validKeyInArray!0 k!2441))))

(declare-fun b!318483 () Bool)

(declare-fun e!197889 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!318483 (= e!197889 (not (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000))))))

(declare-fun e!197886 () Bool)

(assert (=> b!318483 e!197886))

(declare-fun res!173067 () Bool)

(assert (=> b!318483 (=> (not res!173067) (not e!197886))))

(declare-datatypes ((array!16227 0))(
  ( (array!16228 (arr!7679 (Array (_ BitVec 32) (_ BitVec 64))) (size!8031 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16227)

(declare-datatypes ((SeekEntryResult!2819 0))(
  ( (MissingZero!2819 (index!13452 (_ BitVec 32))) (Found!2819 (index!13453 (_ BitVec 32))) (Intermediate!2819 (undefined!3631 Bool) (index!13454 (_ BitVec 32)) (x!31708 (_ BitVec 32))) (Undefined!2819) (MissingVacant!2819 (index!13455 (_ BitVec 32))) )
))
(declare-fun lt!155367 () SeekEntryResult!2819)

(declare-fun lt!155368 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16227 (_ BitVec 32)) SeekEntryResult!2819)

(assert (=> b!318483 (= res!173067 (= lt!155367 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155368 k!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318483 (= lt!155368 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!318484 () Bool)

(declare-fun res!173069 () Bool)

(declare-fun e!197888 () Bool)

(assert (=> b!318484 (=> (not res!173069) (not e!197888))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318484 (= res!173069 (and (= (select (arr!7679 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8031 a!3293))))))

(declare-fun b!318485 () Bool)

(declare-fun res!173070 () Bool)

(assert (=> b!318485 (=> (not res!173070) (not e!197890))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16227 (_ BitVec 32)) Bool)

(assert (=> b!318485 (= res!173070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318486 () Bool)

(assert (=> b!318486 (= e!197890 e!197888)))

(declare-fun res!173061 () Bool)

(assert (=> b!318486 (=> (not res!173061) (not e!197888))))

(declare-fun lt!155370 () SeekEntryResult!2819)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318486 (= res!173061 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155370))))

(assert (=> b!318486 (= lt!155370 (Intermediate!2819 false resIndex!52 resX!52))))

(declare-fun b!318487 () Bool)

(declare-fun res!173068 () Bool)

(assert (=> b!318487 (=> (not res!173068) (not e!197890))))

(assert (=> b!318487 (= res!173068 (and (= (size!8031 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8031 a!3293))))))

(declare-fun b!318488 () Bool)

(assert (=> b!318488 (= e!197888 e!197889)))

(declare-fun res!173065 () Bool)

(assert (=> b!318488 (=> (not res!173065) (not e!197889))))

(assert (=> b!318488 (= res!173065 (and (= lt!155367 lt!155370) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7679 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318488 (= lt!155367 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun res!173064 () Bool)

(assert (=> start!31856 (=> (not res!173064) (not e!197890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31856 (= res!173064 (validMask!0 mask!3709))))

(assert (=> start!31856 e!197890))

(declare-fun array_inv!5642 (array!16227) Bool)

(assert (=> start!31856 (array_inv!5642 a!3293)))

(assert (=> start!31856 true))

(declare-fun b!318489 () Bool)

(declare-fun res!173062 () Bool)

(assert (=> b!318489 (=> (not res!173062) (not e!197890))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16227 (_ BitVec 32)) SeekEntryResult!2819)

(assert (=> b!318489 (= res!173062 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2819 i!1240)))))

(declare-fun b!318490 () Bool)

(declare-fun res!173063 () Bool)

(assert (=> b!318490 (=> (not res!173063) (not e!197890))))

(declare-fun arrayContainsKey!0 (array!16227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318490 (= res!173063 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318491 () Bool)

(declare-fun lt!155369 () array!16227)

(assert (=> b!318491 (= e!197886 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155369 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155368 k!2441 lt!155369 mask!3709)))))

(assert (=> b!318491 (= lt!155369 (array!16228 (store (arr!7679 a!3293) i!1240 k!2441) (size!8031 a!3293)))))

(assert (= (and start!31856 res!173064) b!318487))

(assert (= (and b!318487 res!173068) b!318482))

(assert (= (and b!318482 res!173066) b!318490))

(assert (= (and b!318490 res!173063) b!318489))

(assert (= (and b!318489 res!173062) b!318485))

(assert (= (and b!318485 res!173070) b!318486))

(assert (= (and b!318486 res!173061) b!318484))

(assert (= (and b!318484 res!173069) b!318488))

(assert (= (and b!318488 res!173065) b!318483))

(assert (= (and b!318483 res!173067) b!318491))

(declare-fun m!327185 () Bool)

(assert (=> b!318484 m!327185))

(declare-fun m!327187 () Bool)

(assert (=> b!318485 m!327187))

(declare-fun m!327189 () Bool)

(assert (=> b!318482 m!327189))

(declare-fun m!327191 () Bool)

(assert (=> b!318491 m!327191))

(declare-fun m!327193 () Bool)

(assert (=> b!318491 m!327193))

(declare-fun m!327195 () Bool)

(assert (=> b!318491 m!327195))

(declare-fun m!327197 () Bool)

(assert (=> b!318490 m!327197))

(declare-fun m!327199 () Bool)

(assert (=> start!31856 m!327199))

(declare-fun m!327201 () Bool)

(assert (=> start!31856 m!327201))

(declare-fun m!327203 () Bool)

(assert (=> b!318488 m!327203))

(declare-fun m!327205 () Bool)

(assert (=> b!318488 m!327205))

(declare-fun m!327207 () Bool)

(assert (=> b!318486 m!327207))

(assert (=> b!318486 m!327207))

(declare-fun m!327209 () Bool)

(assert (=> b!318486 m!327209))

(declare-fun m!327211 () Bool)

(assert (=> b!318489 m!327211))

(declare-fun m!327213 () Bool)

(assert (=> b!318483 m!327213))

(declare-fun m!327215 () Bool)

(assert (=> b!318483 m!327215))

(push 1)

