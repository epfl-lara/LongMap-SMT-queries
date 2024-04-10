; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85714 () Bool)

(assert start!85714)

(declare-fun b!994652 () Bool)

(declare-fun res!665162 () Bool)

(declare-fun e!561304 () Bool)

(assert (=> b!994652 (=> (not res!665162) (not e!561304))))

(declare-datatypes ((array!62920 0))(
  ( (array!62921 (arr!30299 (Array (_ BitVec 32) (_ BitVec 64))) (size!30801 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62920)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994652 (= res!665162 (validKeyInArray!0 (select (arr!30299 a!3219) j!170)))))

(declare-fun b!994653 () Bool)

(declare-fun res!665160 () Bool)

(assert (=> b!994653 (=> (not res!665160) (not e!561304))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994653 (= res!665160 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun res!665163 () Bool)

(assert (=> start!85714 (=> (not res!665163) (not e!561304))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85714 (= res!665163 (validMask!0 mask!3464))))

(assert (=> start!85714 e!561304))

(declare-fun array_inv!23423 (array!62920) Bool)

(assert (=> start!85714 (array_inv!23423 a!3219)))

(assert (=> start!85714 true))

(declare-fun b!994654 () Bool)

(declare-fun res!665159 () Bool)

(assert (=> b!994654 (=> (not res!665159) (not e!561304))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994654 (= res!665159 (and (= (size!30801 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30801 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30801 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994655 () Bool)

(assert (=> b!994655 (= e!561304 false)))

(declare-datatypes ((SeekEntryResult!9231 0))(
  ( (MissingZero!9231 (index!39295 (_ BitVec 32))) (Found!9231 (index!39296 (_ BitVec 32))) (Intermediate!9231 (undefined!10043 Bool) (index!39297 (_ BitVec 32)) (x!86744 (_ BitVec 32))) (Undefined!9231) (MissingVacant!9231 (index!39298 (_ BitVec 32))) )
))
(declare-fun lt!440738 () SeekEntryResult!9231)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62920 (_ BitVec 32)) SeekEntryResult!9231)

(assert (=> b!994655 (= lt!440738 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!994656 () Bool)

(declare-fun res!665161 () Bool)

(assert (=> b!994656 (=> (not res!665161) (not e!561304))))

(assert (=> b!994656 (= res!665161 (validKeyInArray!0 k0!2224))))

(assert (= (and start!85714 res!665163) b!994654))

(assert (= (and b!994654 res!665159) b!994652))

(assert (= (and b!994652 res!665162) b!994656))

(assert (= (and b!994656 res!665161) b!994653))

(assert (= (and b!994653 res!665160) b!994655))

(declare-fun m!922207 () Bool)

(assert (=> start!85714 m!922207))

(declare-fun m!922209 () Bool)

(assert (=> start!85714 m!922209))

(declare-fun m!922211 () Bool)

(assert (=> b!994656 m!922211))

(declare-fun m!922213 () Bool)

(assert (=> b!994652 m!922213))

(assert (=> b!994652 m!922213))

(declare-fun m!922215 () Bool)

(assert (=> b!994652 m!922215))

(declare-fun m!922217 () Bool)

(assert (=> b!994653 m!922217))

(declare-fun m!922219 () Bool)

(assert (=> b!994655 m!922219))

(check-sat (not start!85714) (not b!994656) (not b!994652) (not b!994655) (not b!994653))
