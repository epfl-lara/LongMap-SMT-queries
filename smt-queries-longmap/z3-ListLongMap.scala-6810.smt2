; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85658 () Bool)

(assert start!85658)

(declare-fun b!994195 () Bool)

(declare-fun e!561076 () Bool)

(declare-datatypes ((array!62825 0))(
  ( (array!62826 (arr!30252 (Array (_ BitVec 32) (_ BitVec 64))) (size!30756 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62825)

(assert (=> b!994195 (= e!561076 (and (bvslt #b00000000000000000000000000000000 (size!30756 a!3219)) (bvsge (size!30756 a!3219) #b01111111111111111111111111111111)))))

(declare-fun b!994194 () Bool)

(declare-fun res!664825 () Bool)

(assert (=> b!994194 (=> (not res!664825) (not e!561076))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994194 (= res!664825 (validKeyInArray!0 k0!2224))))

(declare-fun b!994193 () Bool)

(declare-fun res!664824 () Bool)

(assert (=> b!994193 (=> (not res!664824) (not e!561076))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!994193 (= res!664824 (validKeyInArray!0 (select (arr!30252 a!3219) j!170)))))

(declare-fun b!994192 () Bool)

(declare-fun res!664826 () Bool)

(assert (=> b!994192 (=> (not res!664826) (not e!561076))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(assert (=> b!994192 (= res!664826 (and (= (size!30756 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30756 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30756 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!664823 () Bool)

(assert (=> start!85658 (=> (not res!664823) (not e!561076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85658 (= res!664823 (validMask!0 mask!3464))))

(assert (=> start!85658 e!561076))

(declare-fun array_inv!23395 (array!62825) Bool)

(assert (=> start!85658 (array_inv!23395 a!3219)))

(assert (=> start!85658 true))

(assert (= (and start!85658 res!664823) b!994192))

(assert (= (and b!994192 res!664826) b!994193))

(assert (= (and b!994193 res!664824) b!994194))

(assert (= (and b!994194 res!664825) b!994195))

(declare-fun m!921271 () Bool)

(assert (=> b!994194 m!921271))

(declare-fun m!921273 () Bool)

(assert (=> b!994193 m!921273))

(assert (=> b!994193 m!921273))

(declare-fun m!921275 () Bool)

(assert (=> b!994193 m!921275))

(declare-fun m!921277 () Bool)

(assert (=> start!85658 m!921277))

(declare-fun m!921279 () Bool)

(assert (=> start!85658 m!921279))

(check-sat (not b!994194) (not b!994193) (not start!85658))
(check-sat)
(get-model)

(declare-fun d!118527 () Bool)

(assert (=> d!118527 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!994194 d!118527))

(declare-fun d!118529 () Bool)

(assert (=> d!118529 (= (validKeyInArray!0 (select (arr!30252 a!3219) j!170)) (and (not (= (select (arr!30252 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30252 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!994193 d!118529))

(declare-fun d!118531 () Bool)

(assert (=> d!118531 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!85658 d!118531))

(declare-fun d!118541 () Bool)

(assert (=> d!118541 (= (array_inv!23395 a!3219) (bvsge (size!30756 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!85658 d!118541))

(check-sat)
