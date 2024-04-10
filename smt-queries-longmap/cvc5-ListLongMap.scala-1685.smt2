; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30998 () Bool)

(assert start!30998)

(declare-fun b!311507 () Bool)

(declare-fun e!194353 () Bool)

(declare-fun e!194355 () Bool)

(assert (=> b!311507 (= e!194353 e!194355)))

(declare-fun res!167969 () Bool)

(assert (=> b!311507 (=> (not res!167969) (not e!194355))))

(declare-datatypes ((array!15900 0))(
  ( (array!15901 (arr!7532 (Array (_ BitVec 32) (_ BitVec 64))) (size!7884 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15900)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2672 0))(
  ( (MissingZero!2672 (index!12864 (_ BitVec 32))) (Found!2672 (index!12865 (_ BitVec 32))) (Intermediate!2672 (undefined!3484 Bool) (index!12866 (_ BitVec 32)) (x!31085 (_ BitVec 32))) (Undefined!2672) (MissingVacant!2672 (index!12867 (_ BitVec 32))) )
))
(declare-fun lt!152384 () SeekEntryResult!2672)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15900 (_ BitVec 32)) SeekEntryResult!2672)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311507 (= res!167969 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152384))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311507 (= lt!152384 (Intermediate!2672 false resIndex!52 resX!52))))

(declare-fun b!311508 () Bool)

(declare-fun res!167966 () Bool)

(assert (=> b!311508 (=> (not res!167966) (not e!194353))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311508 (= res!167966 (and (= (size!7884 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7884 a!3293))))))

(declare-fun b!311509 () Bool)

(declare-fun e!194354 () Bool)

(assert (=> b!311509 (= e!194354 (not true))))

(declare-fun e!194356 () Bool)

(assert (=> b!311509 e!194356))

(declare-fun res!167965 () Bool)

(assert (=> b!311509 (=> (not res!167965) (not e!194356))))

(declare-fun lt!152382 () SeekEntryResult!2672)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!152383 () (_ BitVec 32))

(assert (=> b!311509 (= res!167965 (= lt!152382 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152383 k!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311509 (= lt!152383 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311510 () Bool)

(declare-fun res!167961 () Bool)

(assert (=> b!311510 (=> (not res!167961) (not e!194353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15900 (_ BitVec 32)) Bool)

(assert (=> b!311510 (= res!167961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!167967 () Bool)

(assert (=> start!30998 (=> (not res!167967) (not e!194353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30998 (= res!167967 (validMask!0 mask!3709))))

(assert (=> start!30998 e!194353))

(declare-fun array_inv!5495 (array!15900) Bool)

(assert (=> start!30998 (array_inv!5495 a!3293)))

(assert (=> start!30998 true))

(declare-fun b!311511 () Bool)

(declare-fun res!167970 () Bool)

(assert (=> b!311511 (=> (not res!167970) (not e!194355))))

(assert (=> b!311511 (= res!167970 (and (= (select (arr!7532 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7884 a!3293))))))

(declare-fun b!311512 () Bool)

(declare-fun res!167968 () Bool)

(assert (=> b!311512 (=> (not res!167968) (not e!194353))))

(declare-fun arrayContainsKey!0 (array!15900 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311512 (= res!167968 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311513 () Bool)

(declare-fun res!167962 () Bool)

(assert (=> b!311513 (=> (not res!167962) (not e!194353))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15900 (_ BitVec 32)) SeekEntryResult!2672)

(assert (=> b!311513 (= res!167962 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2672 i!1240)))))

(declare-fun lt!152385 () array!15900)

(declare-fun b!311514 () Bool)

(assert (=> b!311514 (= e!194356 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152385 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152383 k!2441 lt!152385 mask!3709)))))

(assert (=> b!311514 (= lt!152385 (array!15901 (store (arr!7532 a!3293) i!1240 k!2441) (size!7884 a!3293)))))

(declare-fun b!311515 () Bool)

(assert (=> b!311515 (= e!194355 e!194354)))

(declare-fun res!167964 () Bool)

(assert (=> b!311515 (=> (not res!167964) (not e!194354))))

(assert (=> b!311515 (= res!167964 (and (= lt!152382 lt!152384) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7532 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311515 (= lt!152382 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!311516 () Bool)

(declare-fun res!167963 () Bool)

(assert (=> b!311516 (=> (not res!167963) (not e!194353))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311516 (= res!167963 (validKeyInArray!0 k!2441))))

(assert (= (and start!30998 res!167967) b!311508))

(assert (= (and b!311508 res!167966) b!311516))

(assert (= (and b!311516 res!167963) b!311512))

(assert (= (and b!311512 res!167968) b!311513))

(assert (= (and b!311513 res!167962) b!311510))

(assert (= (and b!311510 res!167961) b!311507))

(assert (= (and b!311507 res!167969) b!311511))

(assert (= (and b!311511 res!167970) b!311515))

(assert (= (and b!311515 res!167964) b!311509))

(assert (= (and b!311509 res!167965) b!311514))

(declare-fun m!321485 () Bool)

(assert (=> b!311510 m!321485))

(declare-fun m!321487 () Bool)

(assert (=> b!311513 m!321487))

(declare-fun m!321489 () Bool)

(assert (=> b!311514 m!321489))

(declare-fun m!321491 () Bool)

(assert (=> b!311514 m!321491))

(declare-fun m!321493 () Bool)

(assert (=> b!311514 m!321493))

(declare-fun m!321495 () Bool)

(assert (=> b!311509 m!321495))

(declare-fun m!321497 () Bool)

(assert (=> b!311509 m!321497))

(declare-fun m!321499 () Bool)

(assert (=> start!30998 m!321499))

(declare-fun m!321501 () Bool)

(assert (=> start!30998 m!321501))

(declare-fun m!321503 () Bool)

(assert (=> b!311512 m!321503))

(declare-fun m!321505 () Bool)

(assert (=> b!311516 m!321505))

(declare-fun m!321507 () Bool)

(assert (=> b!311507 m!321507))

(assert (=> b!311507 m!321507))

(declare-fun m!321509 () Bool)

(assert (=> b!311507 m!321509))

(declare-fun m!321511 () Bool)

(assert (=> b!311515 m!321511))

(declare-fun m!321513 () Bool)

(assert (=> b!311515 m!321513))

(declare-fun m!321515 () Bool)

(assert (=> b!311511 m!321515))

(push 1)

