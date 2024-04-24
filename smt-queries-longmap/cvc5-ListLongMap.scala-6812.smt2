; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85874 () Bool)

(assert start!85874)

(declare-fun b!995454 () Bool)

(declare-fun res!665396 () Bool)

(declare-fun e!561860 () Bool)

(assert (=> b!995454 (=> (not res!665396) (not e!561860))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995454 (= res!665396 (validKeyInArray!0 k!2224))))

(declare-fun b!995455 () Bool)

(declare-fun res!665398 () Bool)

(assert (=> b!995455 (=> (not res!665398) (not e!561860))))

(declare-datatypes ((array!62950 0))(
  ( (array!62951 (arr!30309 (Array (_ BitVec 32) (_ BitVec 64))) (size!30812 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62950)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995455 (= res!665398 (and (= (size!30812 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30812 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30812 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995456 () Bool)

(declare-fun res!665397 () Bool)

(assert (=> b!995456 (=> (not res!665397) (not e!561860))))

(assert (=> b!995456 (= res!665397 (validKeyInArray!0 (select (arr!30309 a!3219) j!170)))))

(declare-fun b!995457 () Bool)

(declare-fun res!665399 () Bool)

(assert (=> b!995457 (=> (not res!665399) (not e!561860))))

(declare-fun arrayContainsKey!0 (array!62950 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995457 (= res!665399 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995458 () Bool)

(assert (=> b!995458 (= e!561860 false)))

(declare-datatypes ((SeekEntryResult!9177 0))(
  ( (MissingZero!9177 (index!39079 (_ BitVec 32))) (Found!9177 (index!39080 (_ BitVec 32))) (Intermediate!9177 (undefined!9989 Bool) (index!39081 (_ BitVec 32)) (x!86680 (_ BitVec 32))) (Undefined!9177) (MissingVacant!9177 (index!39082 (_ BitVec 32))) )
))
(declare-fun lt!441089 () SeekEntryResult!9177)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62950 (_ BitVec 32)) SeekEntryResult!9177)

(assert (=> b!995458 (= lt!441089 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun res!665395 () Bool)

(assert (=> start!85874 (=> (not res!665395) (not e!561860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85874 (= res!665395 (validMask!0 mask!3464))))

(assert (=> start!85874 e!561860))

(declare-fun array_inv!23445 (array!62950) Bool)

(assert (=> start!85874 (array_inv!23445 a!3219)))

(assert (=> start!85874 true))

(assert (= (and start!85874 res!665395) b!995455))

(assert (= (and b!995455 res!665398) b!995456))

(assert (= (and b!995456 res!665397) b!995454))

(assert (= (and b!995454 res!665396) b!995457))

(assert (= (and b!995457 res!665399) b!995458))

(declare-fun m!923433 () Bool)

(assert (=> start!85874 m!923433))

(declare-fun m!923435 () Bool)

(assert (=> start!85874 m!923435))

(declare-fun m!923437 () Bool)

(assert (=> b!995457 m!923437))

(declare-fun m!923439 () Bool)

(assert (=> b!995456 m!923439))

(assert (=> b!995456 m!923439))

(declare-fun m!923441 () Bool)

(assert (=> b!995456 m!923441))

(declare-fun m!923443 () Bool)

(assert (=> b!995454 m!923443))

(declare-fun m!923445 () Bool)

(assert (=> b!995458 m!923445))

(push 1)

(assert (not b!995458))

(assert (not b!995454))

(assert (not start!85874))

(assert (not b!995457))

(assert (not b!995456))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

