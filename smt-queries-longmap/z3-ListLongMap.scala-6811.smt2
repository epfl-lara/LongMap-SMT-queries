; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85864 () Bool)

(assert start!85864)

(declare-fun res!665323 () Bool)

(declare-fun e!561830 () Bool)

(assert (=> start!85864 (=> (not res!665323) (not e!561830))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85864 (= res!665323 (validMask!0 mask!3464))))

(assert (=> start!85864 e!561830))

(declare-datatypes ((array!62940 0))(
  ( (array!62941 (arr!30304 (Array (_ BitVec 32) (_ BitVec 64))) (size!30807 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62940)

(declare-fun array_inv!23440 (array!62940) Bool)

(assert (=> start!85864 (array_inv!23440 a!3219)))

(assert (=> start!85864 true))

(declare-fun b!995379 () Bool)

(declare-fun res!665321 () Bool)

(assert (=> b!995379 (=> (not res!665321) (not e!561830))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995379 (= res!665321 (and (= (size!30807 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30807 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30807 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995380 () Bool)

(declare-fun res!665322 () Bool)

(assert (=> b!995380 (=> (not res!665322) (not e!561830))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995380 (= res!665322 (validKeyInArray!0 (select (arr!30304 a!3219) j!170)))))

(declare-fun b!995381 () Bool)

(declare-fun res!665324 () Bool)

(assert (=> b!995381 (=> (not res!665324) (not e!561830))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!995381 (= res!665324 (validKeyInArray!0 k0!2224))))

(declare-fun b!995382 () Bool)

(declare-fun res!665320 () Bool)

(assert (=> b!995382 (=> (not res!665320) (not e!561830))))

(declare-fun arrayContainsKey!0 (array!62940 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995382 (= res!665320 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995383 () Bool)

(assert (=> b!995383 (= e!561830 (bvslt mask!3464 #b00000000000000000000000000000000))))

(assert (= (and start!85864 res!665323) b!995379))

(assert (= (and b!995379 res!665321) b!995380))

(assert (= (and b!995380 res!665322) b!995381))

(assert (= (and b!995381 res!665324) b!995382))

(assert (= (and b!995382 res!665320) b!995383))

(declare-fun m!923369 () Bool)

(assert (=> start!85864 m!923369))

(declare-fun m!923371 () Bool)

(assert (=> start!85864 m!923371))

(declare-fun m!923373 () Bool)

(assert (=> b!995380 m!923373))

(assert (=> b!995380 m!923373))

(declare-fun m!923375 () Bool)

(assert (=> b!995380 m!923375))

(declare-fun m!923377 () Bool)

(assert (=> b!995381 m!923377))

(declare-fun m!923379 () Bool)

(assert (=> b!995382 m!923379))

(check-sat (not start!85864) (not b!995380) (not b!995381) (not b!995382))
(check-sat)
