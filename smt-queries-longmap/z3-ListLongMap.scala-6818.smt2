; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85732 () Bool)

(assert start!85732)

(declare-fun res!665294 () Bool)

(declare-fun e!561358 () Bool)

(assert (=> start!85732 (=> (not res!665294) (not e!561358))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85732 (= res!665294 (validMask!0 mask!3464))))

(assert (=> start!85732 e!561358))

(declare-datatypes ((array!62938 0))(
  ( (array!62939 (arr!30308 (Array (_ BitVec 32) (_ BitVec 64))) (size!30810 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62938)

(declare-fun array_inv!23432 (array!62938) Bool)

(assert (=> start!85732 (array_inv!23432 a!3219)))

(assert (=> start!85732 true))

(declare-fun b!994787 () Bool)

(declare-fun res!665296 () Bool)

(assert (=> b!994787 (=> (not res!665296) (not e!561358))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994787 (= res!665296 (validKeyInArray!0 k0!2224))))

(declare-fun b!994788 () Bool)

(declare-fun res!665298 () Bool)

(assert (=> b!994788 (=> (not res!665298) (not e!561358))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994788 (= res!665298 (and (= (size!30810 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30810 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30810 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994789 () Bool)

(declare-fun res!665297 () Bool)

(assert (=> b!994789 (=> (not res!665297) (not e!561358))))

(assert (=> b!994789 (= res!665297 (validKeyInArray!0 (select (arr!30308 a!3219) j!170)))))

(declare-fun b!994790 () Bool)

(declare-fun res!665295 () Bool)

(assert (=> b!994790 (=> (not res!665295) (not e!561358))))

(declare-fun arrayContainsKey!0 (array!62938 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994790 (= res!665295 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994791 () Bool)

(assert (=> b!994791 (= e!561358 false)))

(declare-datatypes ((SeekEntryResult!9240 0))(
  ( (MissingZero!9240 (index!39331 (_ BitVec 32))) (Found!9240 (index!39332 (_ BitVec 32))) (Intermediate!9240 (undefined!10052 Bool) (index!39333 (_ BitVec 32)) (x!86777 (_ BitVec 32))) (Undefined!9240) (MissingVacant!9240 (index!39334 (_ BitVec 32))) )
))
(declare-fun lt!440765 () SeekEntryResult!9240)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62938 (_ BitVec 32)) SeekEntryResult!9240)

(assert (=> b!994791 (= lt!440765 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!85732 res!665294) b!994788))

(assert (= (and b!994788 res!665298) b!994789))

(assert (= (and b!994789 res!665297) b!994787))

(assert (= (and b!994787 res!665296) b!994790))

(assert (= (and b!994790 res!665295) b!994791))

(declare-fun m!922333 () Bool)

(assert (=> b!994787 m!922333))

(declare-fun m!922335 () Bool)

(assert (=> start!85732 m!922335))

(declare-fun m!922337 () Bool)

(assert (=> start!85732 m!922337))

(declare-fun m!922339 () Bool)

(assert (=> b!994789 m!922339))

(assert (=> b!994789 m!922339))

(declare-fun m!922341 () Bool)

(assert (=> b!994789 m!922341))

(declare-fun m!922343 () Bool)

(assert (=> b!994790 m!922343))

(declare-fun m!922345 () Bool)

(assert (=> b!994791 m!922345))

(check-sat (not b!994791) (not b!994790) (not b!994789) (not start!85732) (not b!994787))
(check-sat)
