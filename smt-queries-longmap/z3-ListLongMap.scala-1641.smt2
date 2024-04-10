; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30628 () Bool)

(assert start!30628)

(declare-fun b!307329 () Bool)

(declare-fun res!164086 () Bool)

(declare-fun e!192477 () Bool)

(assert (=> b!307329 (=> (not res!164086) (not e!192477))))

(declare-datatypes ((array!15632 0))(
  ( (array!15633 (arr!7401 (Array (_ BitVec 32) (_ BitVec 64))) (size!7753 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15632)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15632 (_ BitVec 32)) Bool)

(assert (=> b!307329 (= res!164086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307330 () Bool)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun e!192478 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307330 (= e!192478 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7401 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsgt x!1427 #b01111111111111111111111111111110)))))

(declare-fun res!164085 () Bool)

(assert (=> start!30628 (=> (not res!164085) (not e!192477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30628 (= res!164085 (validMask!0 mask!3709))))

(assert (=> start!30628 e!192477))

(declare-fun array_inv!5364 (array!15632) Bool)

(assert (=> start!30628 (array_inv!5364 a!3293)))

(assert (=> start!30628 true))

(declare-fun b!307331 () Bool)

(declare-fun res!164084 () Bool)

(assert (=> b!307331 (=> (not res!164084) (not e!192477))))

(declare-fun arrayContainsKey!0 (array!15632 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307331 (= res!164084 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307332 () Bool)

(assert (=> b!307332 (= e!192477 e!192478)))

(declare-fun res!164087 () Bool)

(assert (=> b!307332 (=> (not res!164087) (not e!192478))))

(declare-datatypes ((SeekEntryResult!2541 0))(
  ( (MissingZero!2541 (index!12340 (_ BitVec 32))) (Found!2541 (index!12341 (_ BitVec 32))) (Intermediate!2541 (undefined!3353 Bool) (index!12342 (_ BitVec 32)) (x!30584 (_ BitVec 32))) (Undefined!2541) (MissingVacant!2541 (index!12343 (_ BitVec 32))) )
))
(declare-fun lt!151119 () SeekEntryResult!2541)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15632 (_ BitVec 32)) SeekEntryResult!2541)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307332 (= res!164087 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151119))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!307332 (= lt!151119 (Intermediate!2541 false resIndex!52 resX!52))))

(declare-fun b!307333 () Bool)

(declare-fun res!164090 () Bool)

(assert (=> b!307333 (=> (not res!164090) (not e!192477))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15632 (_ BitVec 32)) SeekEntryResult!2541)

(assert (=> b!307333 (= res!164090 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2541 i!1240)))))

(declare-fun b!307334 () Bool)

(declare-fun res!164083 () Bool)

(assert (=> b!307334 (=> (not res!164083) (not e!192478))))

(assert (=> b!307334 (= res!164083 (and (= (select (arr!7401 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7753 a!3293))))))

(declare-fun b!307335 () Bool)

(declare-fun res!164091 () Bool)

(assert (=> b!307335 (=> (not res!164091) (not e!192477))))

(assert (=> b!307335 (= res!164091 (and (= (size!7753 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7753 a!3293))))))

(declare-fun b!307336 () Bool)

(declare-fun res!164089 () Bool)

(assert (=> b!307336 (=> (not res!164089) (not e!192477))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307336 (= res!164089 (validKeyInArray!0 k0!2441))))

(declare-fun b!307337 () Bool)

(declare-fun res!164088 () Bool)

(assert (=> b!307337 (=> (not res!164088) (not e!192478))))

(assert (=> b!307337 (= res!164088 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151119))))

(assert (= (and start!30628 res!164085) b!307335))

(assert (= (and b!307335 res!164091) b!307336))

(assert (= (and b!307336 res!164089) b!307331))

(assert (= (and b!307331 res!164084) b!307333))

(assert (= (and b!307333 res!164090) b!307329))

(assert (= (and b!307329 res!164086) b!307332))

(assert (= (and b!307332 res!164087) b!307334))

(assert (= (and b!307334 res!164083) b!307337))

(assert (= (and b!307337 res!164088) b!307330))

(declare-fun m!317655 () Bool)

(assert (=> b!307334 m!317655))

(declare-fun m!317657 () Bool)

(assert (=> b!307336 m!317657))

(declare-fun m!317659 () Bool)

(assert (=> b!307337 m!317659))

(declare-fun m!317661 () Bool)

(assert (=> b!307333 m!317661))

(declare-fun m!317663 () Bool)

(assert (=> b!307330 m!317663))

(declare-fun m!317665 () Bool)

(assert (=> b!307331 m!317665))

(declare-fun m!317667 () Bool)

(assert (=> b!307329 m!317667))

(declare-fun m!317669 () Bool)

(assert (=> start!30628 m!317669))

(declare-fun m!317671 () Bool)

(assert (=> start!30628 m!317671))

(declare-fun m!317673 () Bool)

(assert (=> b!307332 m!317673))

(assert (=> b!307332 m!317673))

(declare-fun m!317675 () Bool)

(assert (=> b!307332 m!317675))

(check-sat (not start!30628) (not b!307329) (not b!307336) (not b!307337) (not b!307331) (not b!307332) (not b!307333))
(check-sat)
