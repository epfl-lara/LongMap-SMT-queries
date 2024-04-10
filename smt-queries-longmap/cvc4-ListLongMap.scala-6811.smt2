; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85692 () Bool)

(assert start!85692)

(declare-fun b!994478 () Bool)

(declare-fun e!561238 () Bool)

(declare-fun mask!3464 () (_ BitVec 32))

(assert (=> b!994478 (= e!561238 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun res!664986 () Bool)

(assert (=> start!85692 (=> (not res!664986) (not e!561238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85692 (= res!664986 (validMask!0 mask!3464))))

(assert (=> start!85692 e!561238))

(declare-datatypes ((array!62898 0))(
  ( (array!62899 (arr!30288 (Array (_ BitVec 32) (_ BitVec 64))) (size!30790 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62898)

(declare-fun array_inv!23412 (array!62898) Bool)

(assert (=> start!85692 (array_inv!23412 a!3219)))

(assert (=> start!85692 true))

(declare-fun b!994479 () Bool)

(declare-fun res!664989 () Bool)

(assert (=> b!994479 (=> (not res!664989) (not e!561238))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994479 (= res!664989 (validKeyInArray!0 (select (arr!30288 a!3219) j!170)))))

(declare-fun b!994480 () Bool)

(declare-fun res!664987 () Bool)

(assert (=> b!994480 (=> (not res!664987) (not e!561238))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62898 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994480 (= res!664987 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994481 () Bool)

(declare-fun res!664985 () Bool)

(assert (=> b!994481 (=> (not res!664985) (not e!561238))))

(assert (=> b!994481 (= res!664985 (validKeyInArray!0 k!2224))))

(declare-fun b!994482 () Bool)

(declare-fun res!664988 () Bool)

(assert (=> b!994482 (=> (not res!664988) (not e!561238))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994482 (= res!664988 (and (= (size!30790 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30790 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30790 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!85692 res!664986) b!994482))

(assert (= (and b!994482 res!664988) b!994479))

(assert (= (and b!994479 res!664989) b!994481))

(assert (= (and b!994481 res!664985) b!994480))

(assert (= (and b!994480 res!664987) b!994478))

(declare-fun m!922055 () Bool)

(assert (=> start!85692 m!922055))

(declare-fun m!922057 () Bool)

(assert (=> start!85692 m!922057))

(declare-fun m!922059 () Bool)

(assert (=> b!994479 m!922059))

(assert (=> b!994479 m!922059))

(declare-fun m!922061 () Bool)

(assert (=> b!994479 m!922061))

(declare-fun m!922063 () Bool)

(assert (=> b!994480 m!922063))

(declare-fun m!922065 () Bool)

(assert (=> b!994481 m!922065))

(push 1)

(assert (not start!85692))

(assert (not b!994481))

(assert (not b!994480))

(assert (not b!994479))

(check-sat)

(pop 1)

(push 1)

(check-sat)

