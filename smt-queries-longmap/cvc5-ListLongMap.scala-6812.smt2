; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85694 () Bool)

(assert start!85694)

(declare-fun res!665002 () Bool)

(declare-fun e!561244 () Bool)

(assert (=> start!85694 (=> (not res!665002) (not e!561244))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85694 (= res!665002 (validMask!0 mask!3464))))

(assert (=> start!85694 e!561244))

(declare-datatypes ((array!62900 0))(
  ( (array!62901 (arr!30289 (Array (_ BitVec 32) (_ BitVec 64))) (size!30791 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62900)

(declare-fun array_inv!23413 (array!62900) Bool)

(assert (=> start!85694 (array_inv!23413 a!3219)))

(assert (=> start!85694 true))

(declare-fun b!994493 () Bool)

(declare-fun res!665001 () Bool)

(assert (=> b!994493 (=> (not res!665001) (not e!561244))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!994493 (= res!665001 (and (= (size!30791 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30791 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30791 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994494 () Bool)

(declare-fun res!665004 () Bool)

(assert (=> b!994494 (=> (not res!665004) (not e!561244))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62900 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994494 (= res!665004 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994495 () Bool)

(declare-fun res!665003 () Bool)

(assert (=> b!994495 (=> (not res!665003) (not e!561244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994495 (= res!665003 (validKeyInArray!0 (select (arr!30289 a!3219) j!170)))))

(declare-fun b!994496 () Bool)

(assert (=> b!994496 (= e!561244 false)))

(declare-datatypes ((SeekEntryResult!9221 0))(
  ( (MissingZero!9221 (index!39255 (_ BitVec 32))) (Found!9221 (index!39256 (_ BitVec 32))) (Intermediate!9221 (undefined!10033 Bool) (index!39257 (_ BitVec 32)) (x!86710 (_ BitVec 32))) (Undefined!9221) (MissingVacant!9221 (index!39258 (_ BitVec 32))) )
))
(declare-fun lt!440717 () SeekEntryResult!9221)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62900 (_ BitVec 32)) SeekEntryResult!9221)

(assert (=> b!994496 (= lt!440717 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!994497 () Bool)

(declare-fun res!665000 () Bool)

(assert (=> b!994497 (=> (not res!665000) (not e!561244))))

(assert (=> b!994497 (= res!665000 (validKeyInArray!0 k!2224))))

(assert (= (and start!85694 res!665002) b!994493))

(assert (= (and b!994493 res!665001) b!994495))

(assert (= (and b!994495 res!665003) b!994497))

(assert (= (and b!994497 res!665000) b!994494))

(assert (= (and b!994494 res!665004) b!994496))

(declare-fun m!922067 () Bool)

(assert (=> b!994494 m!922067))

(declare-fun m!922069 () Bool)

(assert (=> b!994495 m!922069))

(assert (=> b!994495 m!922069))

(declare-fun m!922071 () Bool)

(assert (=> b!994495 m!922071))

(declare-fun m!922073 () Bool)

(assert (=> b!994496 m!922073))

(declare-fun m!922075 () Bool)

(assert (=> start!85694 m!922075))

(declare-fun m!922077 () Bool)

(assert (=> start!85694 m!922077))

(declare-fun m!922079 () Bool)

(assert (=> b!994497 m!922079))

(push 1)

(assert (not b!994495))

(assert (not b!994496))

(assert (not b!994494))

(assert (not start!85694))

(assert (not b!994497))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

