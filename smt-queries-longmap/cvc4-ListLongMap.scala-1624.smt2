; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30528 () Bool)

(assert start!30528)

(declare-fun b!305457 () Bool)

(declare-fun res!162650 () Bool)

(declare-fun e!191829 () Bool)

(assert (=> b!305457 (=> (not res!162650) (not e!191829))))

(declare-datatypes ((array!15532 0))(
  ( (array!15533 (arr!7351 (Array (_ BitVec 32) (_ BitVec 64))) (size!7703 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15532)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2491 0))(
  ( (MissingZero!2491 (index!12140 (_ BitVec 32))) (Found!2491 (index!12141 (_ BitVec 32))) (Intermediate!2491 (undefined!3303 Bool) (index!12142 (_ BitVec 32)) (x!30398 (_ BitVec 32))) (Undefined!2491) (MissingVacant!2491 (index!12143 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15532 (_ BitVec 32)) SeekEntryResult!2491)

(assert (=> b!305457 (= res!162650 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2491 i!1240)))))

(declare-fun res!162647 () Bool)

(assert (=> start!30528 (=> (not res!162647) (not e!191829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30528 (= res!162647 (validMask!0 mask!3709))))

(assert (=> start!30528 e!191829))

(declare-fun array_inv!5314 (array!15532) Bool)

(assert (=> start!30528 (array_inv!5314 a!3293)))

(assert (=> start!30528 true))

(declare-fun b!305458 () Bool)

(declare-fun res!162648 () Bool)

(assert (=> b!305458 (=> (not res!162648) (not e!191829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305458 (= res!162648 (validKeyInArray!0 k!2441))))

(declare-fun b!305459 () Bool)

(declare-fun e!191830 () Bool)

(assert (=> b!305459 (= e!191829 e!191830)))

(declare-fun res!162646 () Bool)

(assert (=> b!305459 (=> (not res!162646) (not e!191830))))

(declare-fun lt!150753 () SeekEntryResult!2491)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15532 (_ BitVec 32)) SeekEntryResult!2491)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305459 (= res!162646 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150753))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!305459 (= lt!150753 (Intermediate!2491 false resIndex!52 resX!52))))

(declare-fun b!305460 () Bool)

(declare-fun res!162651 () Bool)

(assert (=> b!305460 (=> (not res!162651) (not e!191829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15532 (_ BitVec 32)) Bool)

(assert (=> b!305460 (= res!162651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305461 () Bool)

(declare-fun res!162649 () Bool)

(assert (=> b!305461 (=> (not res!162649) (not e!191829))))

(assert (=> b!305461 (= res!162649 (and (= (size!7703 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7703 a!3293))))))

(declare-fun b!305462 () Bool)

(declare-fun e!191828 () Bool)

(assert (=> b!305462 (= e!191828 (not true))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun lt!150752 () SeekEntryResult!2491)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305462 (= lt!150752 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!305463 () Bool)

(declare-fun res!162645 () Bool)

(assert (=> b!305463 (=> (not res!162645) (not e!191830))))

(assert (=> b!305463 (= res!162645 (and (= (select (arr!7351 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7703 a!3293))))))

(declare-fun b!305464 () Bool)

(declare-fun res!162643 () Bool)

(assert (=> b!305464 (=> (not res!162643) (not e!191829))))

(declare-fun arrayContainsKey!0 (array!15532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305464 (= res!162643 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305465 () Bool)

(assert (=> b!305465 (= e!191830 e!191828)))

(declare-fun res!162644 () Bool)

(assert (=> b!305465 (=> (not res!162644) (not e!191828))))

(assert (=> b!305465 (= res!162644 (and (= lt!150752 lt!150753) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7351 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7351 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7351 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!305465 (= lt!150752 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(assert (= (and start!30528 res!162647) b!305461))

(assert (= (and b!305461 res!162649) b!305458))

(assert (= (and b!305458 res!162648) b!305464))

(assert (= (and b!305464 res!162643) b!305457))

(assert (= (and b!305457 res!162650) b!305460))

(assert (= (and b!305460 res!162651) b!305459))

(assert (= (and b!305459 res!162646) b!305463))

(assert (= (and b!305463 res!162645) b!305465))

(assert (= (and b!305465 res!162644) b!305462))

(declare-fun m!316419 () Bool)

(assert (=> b!305465 m!316419))

(declare-fun m!316421 () Bool)

(assert (=> b!305465 m!316421))

(declare-fun m!316423 () Bool)

(assert (=> b!305464 m!316423))

(declare-fun m!316425 () Bool)

(assert (=> b!305457 m!316425))

(declare-fun m!316427 () Bool)

(assert (=> b!305458 m!316427))

(declare-fun m!316429 () Bool)

(assert (=> b!305462 m!316429))

(assert (=> b!305462 m!316429))

(declare-fun m!316431 () Bool)

(assert (=> b!305462 m!316431))

(declare-fun m!316433 () Bool)

(assert (=> b!305460 m!316433))

(declare-fun m!316435 () Bool)

(assert (=> b!305459 m!316435))

(assert (=> b!305459 m!316435))

(declare-fun m!316437 () Bool)

(assert (=> b!305459 m!316437))

(declare-fun m!316439 () Bool)

(assert (=> start!30528 m!316439))

(declare-fun m!316441 () Bool)

(assert (=> start!30528 m!316441))

(declare-fun m!316443 () Bool)

(assert (=> b!305463 m!316443))

(push 1)

(assert (not b!305458))

(assert (not b!305462))

(assert (not b!305464))

(assert (not b!305457))

(assert (not b!305459))

(assert (