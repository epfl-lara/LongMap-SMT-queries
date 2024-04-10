; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30266 () Bool)

(assert start!30266)

(declare-fun b!302899 () Bool)

(declare-fun res!160390 () Bool)

(declare-fun e!190800 () Bool)

(assert (=> b!302899 (=> (not res!160390) (not e!190800))))

(declare-datatypes ((array!15372 0))(
  ( (array!15373 (arr!7274 (Array (_ BitVec 32) (_ BitVec 64))) (size!7626 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15372)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!302899 (= res!160390 (and (= (select (arr!7274 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7626 a!3293))))))

(declare-fun b!302900 () Bool)

(declare-fun res!160385 () Bool)

(assert (=> b!302900 (=> (not res!160385) (not e!190800))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15372 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302900 (= res!160385 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302901 () Bool)

(declare-fun res!160391 () Bool)

(assert (=> b!302901 (=> (not res!160391) (not e!190800))))

(declare-fun mask!3709 () (_ BitVec 32))

(assert (=> b!302901 (= res!160391 (and (= (size!7626 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7626 a!3293))))))

(declare-fun b!302902 () Bool)

(declare-fun res!160389 () Bool)

(assert (=> b!302902 (=> (not res!160389) (not e!190800))))

(declare-datatypes ((SeekEntryResult!2414 0))(
  ( (MissingZero!2414 (index!11832 (_ BitVec 32))) (Found!2414 (index!11833 (_ BitVec 32))) (Intermediate!2414 (undefined!3226 Bool) (index!11834 (_ BitVec 32)) (x!30103 (_ BitVec 32))) (Undefined!2414) (MissingVacant!2414 (index!11835 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15372 (_ BitVec 32)) SeekEntryResult!2414)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302902 (= res!160389 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2414 false resIndex!52 resX!52)))))

(declare-fun b!302904 () Bool)

(declare-fun res!160392 () Bool)

(assert (=> b!302904 (=> (not res!160392) (not e!190800))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15372 (_ BitVec 32)) SeekEntryResult!2414)

(assert (=> b!302904 (= res!160392 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2414 i!1240)))))

(declare-fun b!302905 () Bool)

(assert (=> b!302905 (= e!190800 false)))

(declare-fun lt!150144 () SeekEntryResult!2414)

(assert (=> b!302905 (= lt!150144 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!302906 () Bool)

(declare-fun res!160387 () Bool)

(assert (=> b!302906 (=> (not res!160387) (not e!190800))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302906 (= res!160387 (validKeyInArray!0 k!2441))))

(declare-fun res!160388 () Bool)

(assert (=> start!30266 (=> (not res!160388) (not e!190800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30266 (= res!160388 (validMask!0 mask!3709))))

(assert (=> start!30266 e!190800))

(declare-fun array_inv!5237 (array!15372) Bool)

(assert (=> start!30266 (array_inv!5237 a!3293)))

(assert (=> start!30266 true))

(declare-fun b!302903 () Bool)

(declare-fun res!160386 () Bool)

(assert (=> b!302903 (=> (not res!160386) (not e!190800))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15372 (_ BitVec 32)) Bool)

(assert (=> b!302903 (= res!160386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30266 res!160388) b!302901))

(assert (= (and b!302901 res!160391) b!302906))

(assert (= (and b!302906 res!160387) b!302900))

(assert (= (and b!302900 res!160385) b!302904))

(assert (= (and b!302904 res!160392) b!302903))

(assert (= (and b!302903 res!160386) b!302902))

(assert (= (and b!302902 res!160389) b!302899))

(assert (= (and b!302899 res!160390) b!302905))

(declare-fun m!314345 () Bool)

(assert (=> b!302899 m!314345))

(declare-fun m!314347 () Bool)

(assert (=> b!302904 m!314347))

(declare-fun m!314349 () Bool)

(assert (=> start!30266 m!314349))

(declare-fun m!314351 () Bool)

(assert (=> start!30266 m!314351))

(declare-fun m!314353 () Bool)

(assert (=> b!302902 m!314353))

(assert (=> b!302902 m!314353))

(declare-fun m!314355 () Bool)

(assert (=> b!302902 m!314355))

(declare-fun m!314357 () Bool)

(assert (=> b!302900 m!314357))

(declare-fun m!314359 () Bool)

(assert (=> b!302905 m!314359))

(declare-fun m!314361 () Bool)

(assert (=> b!302906 m!314361))

(declare-fun m!314363 () Bool)

(assert (=> b!302903 m!314363))

(push 1)

(assert (not b!302902))

(assert (not start!30266))

(assert (not b!302906))

(assert (not b!302903))

(assert (not b!302904))

(assert (not b!302900))

(assert (not b!302905))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

