; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85702 () Bool)

(assert start!85702)

(declare-fun b!994558 () Bool)

(declare-fun res!665067 () Bool)

(declare-fun e!561267 () Bool)

(assert (=> b!994558 (=> (not res!665067) (not e!561267))))

(declare-datatypes ((array!62908 0))(
  ( (array!62909 (arr!30293 (Array (_ BitVec 32) (_ BitVec 64))) (size!30795 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62908)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62908 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994558 (= res!665067 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994559 () Bool)

(declare-fun res!665066 () Bool)

(assert (=> b!994559 (=> (not res!665066) (not e!561267))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994559 (= res!665066 (validKeyInArray!0 (select (arr!30293 a!3219) j!170)))))

(declare-fun b!994560 () Bool)

(declare-fun res!665070 () Bool)

(assert (=> b!994560 (=> (not res!665070) (not e!561267))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994560 (= res!665070 (and (= (size!30795 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30795 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30795 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994561 () Bool)

(declare-fun res!665065 () Bool)

(assert (=> b!994561 (=> (not res!665065) (not e!561267))))

(assert (=> b!994561 (= res!665065 (validKeyInArray!0 k0!2224))))

(declare-fun b!994562 () Bool)

(declare-fun res!665068 () Bool)

(assert (=> b!994562 (=> (not res!665068) (not e!561267))))

(declare-datatypes ((SeekEntryResult!9225 0))(
  ( (MissingZero!9225 (index!39271 (_ BitVec 32))) (Found!9225 (index!39272 (_ BitVec 32))) (Intermediate!9225 (undefined!10037 Bool) (index!39273 (_ BitVec 32)) (x!86722 (_ BitVec 32))) (Undefined!9225) (MissingVacant!9225 (index!39274 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62908 (_ BitVec 32)) SeekEntryResult!9225)

(assert (=> b!994562 (= res!665068 (not (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) (MissingVacant!9225 i!1194))))))

(declare-fun res!665069 () Bool)

(assert (=> start!85702 (=> (not res!665069) (not e!561267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85702 (= res!665069 (validMask!0 mask!3464))))

(assert (=> start!85702 e!561267))

(declare-fun array_inv!23417 (array!62908) Bool)

(assert (=> start!85702 (array_inv!23417 a!3219)))

(assert (=> start!85702 true))

(declare-fun b!994563 () Bool)

(assert (=> b!994563 (= e!561267 (bvslt mask!3464 #b00000000000000000000000000000000))))

(assert (= (and start!85702 res!665069) b!994560))

(assert (= (and b!994560 res!665070) b!994559))

(assert (= (and b!994559 res!665066) b!994561))

(assert (= (and b!994561 res!665065) b!994558))

(assert (= (and b!994558 res!665067) b!994562))

(assert (= (and b!994562 res!665068) b!994563))

(declare-fun m!922123 () Bool)

(assert (=> start!85702 m!922123))

(declare-fun m!922125 () Bool)

(assert (=> start!85702 m!922125))

(declare-fun m!922127 () Bool)

(assert (=> b!994559 m!922127))

(assert (=> b!994559 m!922127))

(declare-fun m!922129 () Bool)

(assert (=> b!994559 m!922129))

(declare-fun m!922131 () Bool)

(assert (=> b!994558 m!922131))

(declare-fun m!922133 () Bool)

(assert (=> b!994561 m!922133))

(declare-fun m!922135 () Bool)

(assert (=> b!994562 m!922135))

(check-sat (not b!994561) (not b!994559) (not start!85702) (not b!994558) (not b!994562))
(check-sat)
