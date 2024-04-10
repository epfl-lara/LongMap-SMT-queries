; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85746 () Bool)

(assert start!85746)

(declare-fun b!994908 () Bool)

(declare-fun res!665419 () Bool)

(declare-fun e!561407 () Bool)

(assert (=> b!994908 (=> (not res!665419) (not e!561407))))

(declare-datatypes ((array!62952 0))(
  ( (array!62953 (arr!30315 (Array (_ BitVec 32) (_ BitVec 64))) (size!30817 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62952)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994908 (= res!665419 (validKeyInArray!0 (select (arr!30315 a!3219) j!170)))))

(declare-fun b!994909 () Bool)

(declare-fun e!561409 () Bool)

(assert (=> b!994909 (= e!561407 e!561409)))

(declare-fun res!665415 () Bool)

(assert (=> b!994909 (=> (not res!665415) (not e!561409))))

(declare-datatypes ((SeekEntryResult!9247 0))(
  ( (MissingZero!9247 (index!39359 (_ BitVec 32))) (Found!9247 (index!39360 (_ BitVec 32))) (Intermediate!9247 (undefined!10059 Bool) (index!39361 (_ BitVec 32)) (x!86800 (_ BitVec 32))) (Undefined!9247) (MissingVacant!9247 (index!39362 (_ BitVec 32))) )
))
(declare-fun lt!440786 () SeekEntryResult!9247)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994909 (= res!665415 (or (= lt!440786 (MissingVacant!9247 i!1194)) (= lt!440786 (MissingZero!9247 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62952 (_ BitVec 32)) SeekEntryResult!9247)

(assert (=> b!994909 (= lt!440786 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun res!665416 () Bool)

(assert (=> start!85746 (=> (not res!665416) (not e!561407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85746 (= res!665416 (validMask!0 mask!3464))))

(assert (=> start!85746 e!561407))

(declare-fun array_inv!23439 (array!62952) Bool)

(assert (=> start!85746 (array_inv!23439 a!3219)))

(assert (=> start!85746 true))

(declare-fun b!994910 () Bool)

(declare-fun res!665420 () Bool)

(assert (=> b!994910 (=> (not res!665420) (not e!561407))))

(declare-fun arrayContainsKey!0 (array!62952 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994910 (= res!665420 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994911 () Bool)

(declare-fun res!665418 () Bool)

(assert (=> b!994911 (=> (not res!665418) (not e!561407))))

(assert (=> b!994911 (= res!665418 (and (= (size!30817 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30817 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30817 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994912 () Bool)

(declare-fun res!665417 () Bool)

(assert (=> b!994912 (=> (not res!665417) (not e!561409))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62952 (_ BitVec 32)) Bool)

(assert (=> b!994912 (= res!665417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!994913 () Bool)

(declare-fun res!665421 () Bool)

(assert (=> b!994913 (=> (not res!665421) (not e!561407))))

(assert (=> b!994913 (= res!665421 (validKeyInArray!0 k!2224))))

(declare-fun b!994914 () Bool)

(assert (=> b!994914 (= e!561409 (bvsgt #b00000000000000000000000000000000 (size!30817 a!3219)))))

(assert (= (and start!85746 res!665416) b!994911))

(assert (= (and b!994911 res!665418) b!994908))

(assert (= (and b!994908 res!665419) b!994913))

(assert (= (and b!994913 res!665421) b!994910))

(assert (= (and b!994910 res!665420) b!994909))

(assert (= (and b!994909 res!665415) b!994912))

(assert (= (and b!994912 res!665417) b!994914))

(declare-fun m!922435 () Bool)

(assert (=> b!994913 m!922435))

(declare-fun m!922437 () Bool)

(assert (=> b!994910 m!922437))

(declare-fun m!922439 () Bool)

(assert (=> b!994908 m!922439))

(assert (=> b!994908 m!922439))

(declare-fun m!922441 () Bool)

(assert (=> b!994908 m!922441))

(declare-fun m!922443 () Bool)

(assert (=> b!994909 m!922443))

(declare-fun m!922445 () Bool)

(assert (=> b!994912 m!922445))

(declare-fun m!922447 () Bool)

(assert (=> start!85746 m!922447))

(declare-fun m!922449 () Bool)

(assert (=> start!85746 m!922449))

(push 1)

