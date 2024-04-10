; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30612 () Bool)

(assert start!30612)

(declare-fun b!307122 () Bool)

(declare-fun res!163879 () Bool)

(declare-fun e!192413 () Bool)

(assert (=> b!307122 (=> (not res!163879) (not e!192413))))

(declare-datatypes ((array!15616 0))(
  ( (array!15617 (arr!7393 (Array (_ BitVec 32) (_ BitVec 64))) (size!7745 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15616)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15616 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307122 (= res!163879 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307123 () Bool)

(declare-fun res!163876 () Bool)

(assert (=> b!307123 (=> (not res!163876) (not e!192413))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307123 (= res!163876 (validKeyInArray!0 k!2441))))

(declare-fun b!307124 () Bool)

(declare-fun e!192415 () Bool)

(assert (=> b!307124 (= e!192413 e!192415)))

(declare-fun res!163878 () Bool)

(assert (=> b!307124 (=> (not res!163878) (not e!192415))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2533 0))(
  ( (MissingZero!2533 (index!12308 (_ BitVec 32))) (Found!2533 (index!12309 (_ BitVec 32))) (Intermediate!2533 (undefined!3345 Bool) (index!12310 (_ BitVec 32)) (x!30552 (_ BitVec 32))) (Undefined!2533) (MissingVacant!2533 (index!12311 (_ BitVec 32))) )
))
(declare-fun lt!151095 () SeekEntryResult!2533)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15616 (_ BitVec 32)) SeekEntryResult!2533)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307124 (= res!163878 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151095))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!307124 (= lt!151095 (Intermediate!2533 false resIndex!52 resX!52))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun b!307125 () Bool)

(assert (=> b!307125 (= e!192415 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7393 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(declare-fun b!307126 () Bool)

(declare-fun res!163880 () Bool)

(assert (=> b!307126 (=> (not res!163880) (not e!192415))))

(assert (=> b!307126 (= res!163880 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151095))))

(declare-fun b!307127 () Bool)

(declare-fun res!163883 () Bool)

(assert (=> b!307127 (=> (not res!163883) (not e!192415))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307127 (= res!163883 (and (= (select (arr!7393 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7745 a!3293))))))

(declare-fun b!307128 () Bool)

(declare-fun res!163877 () Bool)

(assert (=> b!307128 (=> (not res!163877) (not e!192413))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15616 (_ BitVec 32)) SeekEntryResult!2533)

(assert (=> b!307128 (= res!163877 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2533 i!1240)))))

(declare-fun res!163882 () Bool)

(assert (=> start!30612 (=> (not res!163882) (not e!192413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30612 (= res!163882 (validMask!0 mask!3709))))

(assert (=> start!30612 e!192413))

(declare-fun array_inv!5356 (array!15616) Bool)

(assert (=> start!30612 (array_inv!5356 a!3293)))

(assert (=> start!30612 true))

(declare-fun b!307129 () Bool)

(declare-fun res!163881 () Bool)

(assert (=> b!307129 (=> (not res!163881) (not e!192413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15616 (_ BitVec 32)) Bool)

(assert (=> b!307129 (= res!163881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307130 () Bool)

(declare-fun res!163884 () Bool)

(assert (=> b!307130 (=> (not res!163884) (not e!192413))))

(assert (=> b!307130 (= res!163884 (and (= (size!7745 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7745 a!3293))))))

(assert (= (and start!30612 res!163882) b!307130))

(assert (= (and b!307130 res!163884) b!307123))

(assert (= (and b!307123 res!163876) b!307122))

(assert (= (and b!307122 res!163879) b!307128))

(assert (= (and b!307128 res!163877) b!307129))

(assert (= (and b!307129 res!163881) b!307124))

(assert (= (and b!307124 res!163878) b!307127))

(assert (= (and b!307127 res!163883) b!307126))

(assert (= (and b!307126 res!163880) b!307125))

(declare-fun m!317485 () Bool)

(assert (=> b!307127 m!317485))

(declare-fun m!317487 () Bool)

(assert (=> b!307122 m!317487))

(declare-fun m!317489 () Bool)

(assert (=> b!307128 m!317489))

(declare-fun m!317491 () Bool)

(assert (=> b!307126 m!317491))

(declare-fun m!317493 () Bool)

(assert (=> b!307125 m!317493))

(declare-fun m!317495 () Bool)

(assert (=> start!30612 m!317495))

(declare-fun m!317497 () Bool)

(assert (=> start!30612 m!317497))

(declare-fun m!317499 () Bool)

(assert (=> b!307123 m!317499))

(declare-fun m!317501 () Bool)

(assert (=> b!307129 m!317501))

(declare-fun m!317503 () Bool)

(assert (=> b!307124 m!317503))

(assert (=> b!307124 m!317503))

(declare-fun m!317505 () Bool)

(assert (=> b!307124 m!317505))

(push 1)

(assert (not b!307128))

(assert (not b!307124))

(assert (not start!30612))

(assert (not b!307122))

(assert (not b!307126))

(assert (not b!307129))

(assert (not b!307123))

(check-sat)

(pop 1)

(push 1)

(check-sat)

