; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85844 () Bool)

(assert start!85844)

(declare-fun b!995344 () Bool)

(declare-fun e!561813 () Bool)

(declare-datatypes ((array!62933 0))(
  ( (array!62934 (arr!30301 (Array (_ BitVec 32) (_ BitVec 64))) (size!30804 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62933)

(assert (=> b!995344 (= e!561813 (and (bvslt #b00000000000000000000000000000000 (size!30804 a!3219)) (bvsge (size!30804 a!3219) #b01111111111111111111111111111111)))))

(declare-fun b!995341 () Bool)

(declare-fun res!665284 () Bool)

(assert (=> b!995341 (=> (not res!665284) (not e!561813))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995341 (= res!665284 (and (= (size!30804 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30804 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30804 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995342 () Bool)

(declare-fun res!665285 () Bool)

(assert (=> b!995342 (=> (not res!665285) (not e!561813))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995342 (= res!665285 (validKeyInArray!0 (select (arr!30301 a!3219) j!170)))))

(declare-fun b!995343 () Bool)

(declare-fun res!665282 () Bool)

(assert (=> b!995343 (=> (not res!665282) (not e!561813))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!995343 (= res!665282 (validKeyInArray!0 k0!2224))))

(declare-fun res!665283 () Bool)

(assert (=> start!85844 (=> (not res!665283) (not e!561813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85844 (= res!665283 (validMask!0 mask!3464))))

(assert (=> start!85844 e!561813))

(declare-fun array_inv!23437 (array!62933) Bool)

(assert (=> start!85844 (array_inv!23437 a!3219)))

(assert (=> start!85844 true))

(assert (= (and start!85844 res!665283) b!995341))

(assert (= (and b!995341 res!665284) b!995342))

(assert (= (and b!995342 res!665285) b!995343))

(assert (= (and b!995343 res!665282) b!995344))

(declare-fun m!923339 () Bool)

(assert (=> b!995342 m!923339))

(assert (=> b!995342 m!923339))

(declare-fun m!923341 () Bool)

(assert (=> b!995342 m!923341))

(declare-fun m!923343 () Bool)

(assert (=> b!995343 m!923343))

(declare-fun m!923345 () Bool)

(assert (=> start!85844 m!923345))

(declare-fun m!923347 () Bool)

(assert (=> start!85844 m!923347))

(check-sat (not start!85844) (not b!995342) (not b!995343))
(check-sat)
(get-model)

(declare-fun d!119051 () Bool)

(assert (=> d!119051 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!85844 d!119051))

(declare-fun d!119065 () Bool)

(assert (=> d!119065 (= (array_inv!23437 a!3219) (bvsge (size!30804 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!85844 d!119065))

(declare-fun d!119067 () Bool)

(assert (=> d!119067 (= (validKeyInArray!0 (select (arr!30301 a!3219) j!170)) (and (not (= (select (arr!30301 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30301 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!995342 d!119067))

(declare-fun d!119069 () Bool)

(assert (=> d!119069 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!995343 d!119069))

(check-sat)
