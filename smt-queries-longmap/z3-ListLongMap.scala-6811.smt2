; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85680 () Bool)

(assert start!85680)

(declare-fun b!994230 () Bool)

(declare-fun res!664865 () Bool)

(declare-fun e!561094 () Bool)

(assert (=> b!994230 (=> (not res!664865) (not e!561094))))

(declare-datatypes ((array!62833 0))(
  ( (array!62834 (arr!30255 (Array (_ BitVec 32) (_ BitVec 64))) (size!30759 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62833)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994230 (= res!664865 (validKeyInArray!0 (select (arr!30255 a!3219) j!170)))))

(declare-fun b!994231 () Bool)

(declare-fun res!664862 () Bool)

(assert (=> b!994231 (=> (not res!664862) (not e!561094))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994231 (= res!664862 (and (= (size!30759 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30759 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30759 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994233 () Bool)

(assert (=> b!994233 (= e!561094 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!994234 () Bool)

(declare-fun res!664864 () Bool)

(assert (=> b!994234 (=> (not res!664864) (not e!561094))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994234 (= res!664864 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994232 () Bool)

(declare-fun res!664863 () Bool)

(assert (=> b!994232 (=> (not res!664863) (not e!561094))))

(assert (=> b!994232 (= res!664863 (validKeyInArray!0 k0!2224))))

(declare-fun res!664861 () Bool)

(assert (=> start!85680 (=> (not res!664861) (not e!561094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85680 (= res!664861 (validMask!0 mask!3464))))

(assert (=> start!85680 e!561094))

(declare-fun array_inv!23398 (array!62833) Bool)

(assert (=> start!85680 (array_inv!23398 a!3219)))

(assert (=> start!85680 true))

(assert (= (and start!85680 res!664861) b!994231))

(assert (= (and b!994231 res!664862) b!994230))

(assert (= (and b!994230 res!664865) b!994232))

(assert (= (and b!994232 res!664863) b!994234))

(assert (= (and b!994234 res!664864) b!994233))

(declare-fun m!921301 () Bool)

(assert (=> b!994230 m!921301))

(assert (=> b!994230 m!921301))

(declare-fun m!921303 () Bool)

(assert (=> b!994230 m!921303))

(declare-fun m!921305 () Bool)

(assert (=> b!994234 m!921305))

(declare-fun m!921307 () Bool)

(assert (=> b!994232 m!921307))

(declare-fun m!921309 () Bool)

(assert (=> start!85680 m!921309))

(declare-fun m!921311 () Bool)

(assert (=> start!85680 m!921311))

(check-sat (not b!994230) (not start!85680) (not b!994234) (not b!994232))
(check-sat)
