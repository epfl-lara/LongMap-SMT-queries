; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30740 () Bool)

(assert start!30740)

(declare-fun lt!151349 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun b!308348 () Bool)

(declare-fun e!192851 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!308348 (= e!192851 (and (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge lt!151349 #b00000000000000000000000000000000) (bvslt lt!151349 (bvadd #b00000000000000000000000000000001 mask!3709)) (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000))))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308348 (= lt!151349 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!308349 () Bool)

(declare-fun res!164963 () Bool)

(declare-fun e!192852 () Bool)

(assert (=> b!308349 (=> (not res!164963) (not e!192852))))

(declare-datatypes ((array!15693 0))(
  ( (array!15694 (arr!7430 (Array (_ BitVec 32) (_ BitVec 64))) (size!7782 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15693)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2570 0))(
  ( (MissingZero!2570 (index!12456 (_ BitVec 32))) (Found!2570 (index!12457 (_ BitVec 32))) (Intermediate!2570 (undefined!3382 Bool) (index!12458 (_ BitVec 32)) (x!30702 (_ BitVec 32))) (Undefined!2570) (MissingVacant!2570 (index!12459 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15693 (_ BitVec 32)) SeekEntryResult!2570)

(assert (=> b!308349 (= res!164963 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2570 i!1240)))))

(declare-fun b!308350 () Bool)

(declare-fun res!164966 () Bool)

(assert (=> b!308350 (=> (not res!164966) (not e!192852))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308350 (= res!164966 (validKeyInArray!0 k!2441))))

(declare-fun b!308351 () Bool)

(declare-fun res!164967 () Bool)

(assert (=> b!308351 (=> (not res!164967) (not e!192851))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!308351 (= res!164967 (and (= (select (arr!7430 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7782 a!3293))))))

(declare-fun b!308352 () Bool)

(declare-fun res!164962 () Bool)

(assert (=> b!308352 (=> (not res!164962) (not e!192852))))

(declare-fun arrayContainsKey!0 (array!15693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308352 (= res!164962 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308353 () Bool)

(declare-fun res!164964 () Bool)

(assert (=> b!308353 (=> (not res!164964) (not e!192852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15693 (_ BitVec 32)) Bool)

(assert (=> b!308353 (= res!164964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!164965 () Bool)

(assert (=> start!30740 (=> (not res!164965) (not e!192852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30740 (= res!164965 (validMask!0 mask!3709))))

(assert (=> start!30740 e!192852))

(declare-fun array_inv!5393 (array!15693) Bool)

(assert (=> start!30740 (array_inv!5393 a!3293)))

(assert (=> start!30740 true))

(declare-fun b!308354 () Bool)

(declare-fun res!164969 () Bool)

(assert (=> b!308354 (=> (not res!164969) (not e!192851))))

(declare-fun lt!151350 () SeekEntryResult!2570)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15693 (_ BitVec 32)) SeekEntryResult!2570)

(assert (=> b!308354 (= res!164969 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151350))))

(declare-fun b!308355 () Bool)

(declare-fun res!164968 () Bool)

(assert (=> b!308355 (=> (not res!164968) (not e!192851))))

(assert (=> b!308355 (= res!164968 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7430 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun b!308356 () Bool)

(assert (=> b!308356 (= e!192852 e!192851)))

(declare-fun res!164961 () Bool)

(assert (=> b!308356 (=> (not res!164961) (not e!192851))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308356 (= res!164961 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151350))))

(assert (=> b!308356 (= lt!151350 (Intermediate!2570 false resIndex!52 resX!52))))

(declare-fun b!308357 () Bool)

(declare-fun res!164970 () Bool)

(assert (=> b!308357 (=> (not res!164970) (not e!192852))))

(assert (=> b!308357 (= res!164970 (and (= (size!7782 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7782 a!3293))))))

(assert (= (and start!30740 res!164965) b!308357))

(assert (= (and b!308357 res!164970) b!308350))

(assert (= (and b!308350 res!164966) b!308352))

(assert (= (and b!308352 res!164962) b!308349))

(assert (= (and b!308349 res!164963) b!308353))

(assert (= (and b!308353 res!164964) b!308356))

(assert (= (and b!308356 res!164961) b!308351))

(assert (= (and b!308351 res!164967) b!308354))

(assert (= (and b!308354 res!164969) b!308355))

(assert (= (and b!308355 res!164968) b!308348))

(declare-fun m!318419 () Bool)

(assert (=> b!308348 m!318419))

(declare-fun m!318421 () Bool)

(assert (=> b!308349 m!318421))

(declare-fun m!318423 () Bool)

(assert (=> b!308351 m!318423))

(declare-fun m!318425 () Bool)

(assert (=> b!308350 m!318425))

(declare-fun m!318427 () Bool)

(assert (=> b!308356 m!318427))

(assert (=> b!308356 m!318427))

(declare-fun m!318429 () Bool)

(assert (=> b!308356 m!318429))

(declare-fun m!318431 () Bool)

(assert (=> b!308353 m!318431))

(declare-fun m!318433 () Bool)

(assert (=> b!308352 m!318433))

(declare-fun m!318435 () Bool)

(assert (=> b!308355 m!318435))

(declare-fun m!318437 () Bool)

(assert (=> start!30740 m!318437))

(declare-fun m!318439 () Bool)

(assert (=> start!30740 m!318439))

(declare-fun m!318441 () Bool)

(assert (=> b!308354 m!318441))

(push 1)

(assert (not b!308356))

(assert (not b!308354))

(assert (not b!308350))

(assert (not b!308348))

(assert (not b!308349))

(assert (not b!308352))

(assert (not b!308353))

(assert (not start!30740))

(check-sat)

(pop 1)

