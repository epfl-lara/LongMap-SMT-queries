; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85670 () Bool)

(assert start!85670)

(declare-fun b!994422 () Bool)

(declare-fun res!664932 () Bool)

(declare-fun e!561214 () Bool)

(assert (=> b!994422 (=> (not res!664932) (not e!561214))))

(declare-datatypes ((array!62889 0))(
  ( (array!62890 (arr!30284 (Array (_ BitVec 32) (_ BitVec 64))) (size!30786 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62889)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994422 (= res!664932 (and (= (size!30786 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30786 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30786 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!664931 () Bool)

(assert (=> start!85670 (=> (not res!664931) (not e!561214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85670 (= res!664931 (validMask!0 mask!3464))))

(assert (=> start!85670 e!561214))

(declare-fun array_inv!23408 (array!62889) Bool)

(assert (=> start!85670 (array_inv!23408 a!3219)))

(assert (=> start!85670 true))

(declare-fun b!994423 () Bool)

(declare-fun res!664929 () Bool)

(assert (=> b!994423 (=> (not res!664929) (not e!561214))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994423 (= res!664929 (validKeyInArray!0 (select (arr!30284 a!3219) j!170)))))

(declare-fun b!994425 () Bool)

(assert (=> b!994425 (= e!561214 (and (bvslt #b00000000000000000000000000000000 (size!30786 a!3219)) (bvsge (size!30786 a!3219) #b01111111111111111111111111111111)))))

(declare-fun b!994424 () Bool)

(declare-fun res!664930 () Bool)

(assert (=> b!994424 (=> (not res!664930) (not e!561214))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!994424 (= res!664930 (validKeyInArray!0 k0!2224))))

(assert (= (and start!85670 res!664931) b!994422))

(assert (= (and b!994422 res!664932) b!994423))

(assert (= (and b!994423 res!664929) b!994424))

(assert (= (and b!994424 res!664930) b!994425))

(declare-fun m!922011 () Bool)

(assert (=> start!85670 m!922011))

(declare-fun m!922013 () Bool)

(assert (=> start!85670 m!922013))

(declare-fun m!922015 () Bool)

(assert (=> b!994423 m!922015))

(assert (=> b!994423 m!922015))

(declare-fun m!922017 () Bool)

(assert (=> b!994423 m!922017))

(declare-fun m!922019 () Bool)

(assert (=> b!994424 m!922019))

(check-sat (not b!994423) (not b!994424) (not start!85670))
(check-sat)
(get-model)

(declare-fun d!118703 () Bool)

(assert (=> d!118703 (= (validKeyInArray!0 (select (arr!30284 a!3219) j!170)) (and (not (= (select (arr!30284 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30284 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!994423 d!118703))

(declare-fun d!118705 () Bool)

(assert (=> d!118705 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!994424 d!118705))

(declare-fun d!118707 () Bool)

(assert (=> d!118707 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!85670 d!118707))

(declare-fun d!118719 () Bool)

(assert (=> d!118719 (= (array_inv!23408 a!3219) (bvsge (size!30786 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!85670 d!118719))

(check-sat)
