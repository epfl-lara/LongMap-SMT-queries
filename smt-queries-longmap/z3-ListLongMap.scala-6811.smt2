; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85690 () Bool)

(assert start!85690)

(declare-fun b!994463 () Bool)

(declare-fun res!664972 () Bool)

(declare-fun e!561232 () Bool)

(assert (=> b!994463 (=> (not res!664972) (not e!561232))))

(declare-datatypes ((array!62896 0))(
  ( (array!62897 (arr!30287 (Array (_ BitVec 32) (_ BitVec 64))) (size!30789 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62896)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994463 (= res!664972 (validKeyInArray!0 (select (arr!30287 a!3219) j!170)))))

(declare-fun b!994464 () Bool)

(declare-fun res!664974 () Bool)

(assert (=> b!994464 (=> (not res!664974) (not e!561232))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!994464 (= res!664974 (validKeyInArray!0 k0!2224))))

(declare-fun b!994465 () Bool)

(declare-fun mask!3464 () (_ BitVec 32))

(assert (=> b!994465 (= e!561232 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!994466 () Bool)

(declare-fun res!664973 () Bool)

(assert (=> b!994466 (=> (not res!664973) (not e!561232))))

(declare-fun arrayContainsKey!0 (array!62896 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994466 (= res!664973 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun res!664971 () Bool)

(assert (=> start!85690 (=> (not res!664971) (not e!561232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85690 (= res!664971 (validMask!0 mask!3464))))

(assert (=> start!85690 e!561232))

(declare-fun array_inv!23411 (array!62896) Bool)

(assert (=> start!85690 (array_inv!23411 a!3219)))

(assert (=> start!85690 true))

(declare-fun b!994467 () Bool)

(declare-fun res!664970 () Bool)

(assert (=> b!994467 (=> (not res!664970) (not e!561232))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994467 (= res!664970 (and (= (size!30789 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30789 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30789 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!85690 res!664971) b!994467))

(assert (= (and b!994467 res!664970) b!994463))

(assert (= (and b!994463 res!664972) b!994464))

(assert (= (and b!994464 res!664974) b!994466))

(assert (= (and b!994466 res!664973) b!994465))

(declare-fun m!922043 () Bool)

(assert (=> b!994463 m!922043))

(assert (=> b!994463 m!922043))

(declare-fun m!922045 () Bool)

(assert (=> b!994463 m!922045))

(declare-fun m!922047 () Bool)

(assert (=> b!994464 m!922047))

(declare-fun m!922049 () Bool)

(assert (=> b!994466 m!922049))

(declare-fun m!922051 () Bool)

(assert (=> start!85690 m!922051))

(declare-fun m!922053 () Bool)

(assert (=> start!85690 m!922053))

(check-sat (not b!994464) (not b!994463) (not start!85690) (not b!994466))
(check-sat)
