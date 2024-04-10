; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44290 () Bool)

(assert start!44290)

(declare-fun b!487048 () Bool)

(declare-fun res!290438 () Bool)

(declare-fun e!286631 () Bool)

(assert (=> b!487048 (=> (not res!290438) (not e!286631))))

(declare-datatypes ((array!31541 0))(
  ( (array!31542 (arr!15164 (Array (_ BitVec 32) (_ BitVec 64))) (size!15528 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31541)

(declare-datatypes ((List!9322 0))(
  ( (Nil!9319) (Cons!9318 (h!10174 (_ BitVec 64)) (t!15550 List!9322)) )
))
(declare-fun arrayNoDuplicates!0 (array!31541 (_ BitVec 32) List!9322) Bool)

(assert (=> b!487048 (= res!290438 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9319))))

(declare-fun b!487049 () Bool)

(declare-fun res!290439 () Bool)

(declare-fun e!286630 () Bool)

(assert (=> b!487049 (=> (not res!290439) (not e!286630))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487049 (= res!290439 (validKeyInArray!0 (select (arr!15164 a!3235) j!176)))))

(declare-fun b!487050 () Bool)

(declare-fun res!290434 () Bool)

(assert (=> b!487050 (=> (not res!290434) (not e!286630))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!487050 (= res!290434 (validKeyInArray!0 k!2280))))

(declare-fun b!487051 () Bool)

(assert (=> b!487051 (= e!286631 (not true))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31541 (_ BitVec 32)) Bool)

(assert (=> b!487051 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14208 0))(
  ( (Unit!14209) )
))
(declare-fun lt!219928 () Unit!14208)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31541 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14208)

(assert (=> b!487051 (= lt!219928 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487053 () Bool)

(declare-fun res!290437 () Bool)

(assert (=> b!487053 (=> (not res!290437) (not e!286631))))

(assert (=> b!487053 (= res!290437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487054 () Bool)

(declare-fun res!290436 () Bool)

(assert (=> b!487054 (=> (not res!290436) (not e!286630))))

(declare-fun arrayContainsKey!0 (array!31541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487054 (= res!290436 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487055 () Bool)

(assert (=> b!487055 (= e!286630 e!286631)))

(declare-fun res!290440 () Bool)

(assert (=> b!487055 (=> (not res!290440) (not e!286631))))

(declare-datatypes ((SeekEntryResult!3631 0))(
  ( (MissingZero!3631 (index!16703 (_ BitVec 32))) (Found!3631 (index!16704 (_ BitVec 32))) (Intermediate!3631 (undefined!4443 Bool) (index!16705 (_ BitVec 32)) (x!45827 (_ BitVec 32))) (Undefined!3631) (MissingVacant!3631 (index!16706 (_ BitVec 32))) )
))
(declare-fun lt!219927 () SeekEntryResult!3631)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487055 (= res!290440 (or (= lt!219927 (MissingZero!3631 i!1204)) (= lt!219927 (MissingVacant!3631 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31541 (_ BitVec 32)) SeekEntryResult!3631)

(assert (=> b!487055 (= lt!219927 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!487052 () Bool)

(declare-fun res!290441 () Bool)

(assert (=> b!487052 (=> (not res!290441) (not e!286630))))

(assert (=> b!487052 (= res!290441 (and (= (size!15528 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15528 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15528 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!290435 () Bool)

(assert (=> start!44290 (=> (not res!290435) (not e!286630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44290 (= res!290435 (validMask!0 mask!3524))))

(assert (=> start!44290 e!286630))

(assert (=> start!44290 true))

(declare-fun array_inv!10960 (array!31541) Bool)

(assert (=> start!44290 (array_inv!10960 a!3235)))

(assert (= (and start!44290 res!290435) b!487052))

(assert (= (and b!487052 res!290441) b!487049))

(assert (= (and b!487049 res!290439) b!487050))

(assert (= (and b!487050 res!290434) b!487054))

(assert (= (and b!487054 res!290436) b!487055))

(assert (= (and b!487055 res!290440) b!487053))

(assert (= (and b!487053 res!290437) b!487048))

(assert (= (and b!487048 res!290438) b!487051))

(declare-fun m!466901 () Bool)

(assert (=> b!487051 m!466901))

(declare-fun m!466903 () Bool)

(assert (=> b!487051 m!466903))

(declare-fun m!466905 () Bool)

(assert (=> b!487055 m!466905))

(declare-fun m!466907 () Bool)

(assert (=> b!487053 m!466907))

(declare-fun m!466909 () Bool)

(assert (=> start!44290 m!466909))

(declare-fun m!466911 () Bool)

(assert (=> start!44290 m!466911))

(declare-fun m!466913 () Bool)

(assert (=> b!487050 m!466913))

(declare-fun m!466915 () Bool)

(assert (=> b!487054 m!466915))

(declare-fun m!466917 () Bool)

(assert (=> b!487049 m!466917))

(assert (=> b!487049 m!466917))

(declare-fun m!466919 () Bool)

(assert (=> b!487049 m!466919))

(declare-fun m!466921 () Bool)

(assert (=> b!487048 m!466921))

(push 1)

(assert (not b!487049))

(assert (not b!487053))

(assert (not b!487048))

(assert (not b!487050))

(assert (not b!487055))

(assert (not b!487054))

(assert (not b!487051))

(assert (not start!44290))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

