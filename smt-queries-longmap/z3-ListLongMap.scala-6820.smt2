; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85734 () Bool)

(assert start!85734)

(declare-fun b!994648 () Bool)

(declare-fun res!665279 () Bool)

(declare-fun e!561260 () Bool)

(assert (=> b!994648 (=> (not res!665279) (not e!561260))))

(declare-datatypes ((array!62887 0))(
  ( (array!62888 (arr!30282 (Array (_ BitVec 32) (_ BitVec 64))) (size!30786 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62887)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994648 (= res!665279 (validKeyInArray!0 (select (arr!30282 a!3219) j!170)))))

(declare-fun b!994649 () Bool)

(declare-fun res!665282 () Bool)

(assert (=> b!994649 (=> (not res!665282) (not e!561260))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994649 (= res!665282 (and (= (size!30786 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30786 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30786 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994650 () Bool)

(declare-fun res!665285 () Bool)

(declare-fun e!561258 () Bool)

(assert (=> b!994650 (=> (not res!665285) (not e!561258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62887 (_ BitVec 32)) Bool)

(assert (=> b!994650 (= res!665285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!665284 () Bool)

(assert (=> start!85734 (=> (not res!665284) (not e!561260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85734 (= res!665284 (validMask!0 mask!3464))))

(assert (=> start!85734 e!561260))

(declare-fun array_inv!23425 (array!62887) Bool)

(assert (=> start!85734 (array_inv!23425 a!3219)))

(assert (=> start!85734 true))

(declare-fun b!994651 () Bool)

(declare-fun res!665280 () Bool)

(assert (=> b!994651 (=> (not res!665280) (not e!561260))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!994651 (= res!665280 (validKeyInArray!0 k0!2224))))

(declare-fun b!994652 () Bool)

(assert (=> b!994652 (= e!561260 e!561258)))

(declare-fun res!665283 () Bool)

(assert (=> b!994652 (=> (not res!665283) (not e!561258))))

(declare-datatypes ((SeekEntryResult!9239 0))(
  ( (MissingZero!9239 (index!39327 (_ BitVec 32))) (Found!9239 (index!39328 (_ BitVec 32))) (Intermediate!9239 (undefined!10051 Bool) (index!39329 (_ BitVec 32)) (x!86787 (_ BitVec 32))) (Undefined!9239) (MissingVacant!9239 (index!39330 (_ BitVec 32))) )
))
(declare-fun lt!440548 () SeekEntryResult!9239)

(assert (=> b!994652 (= res!665283 (or (= lt!440548 (MissingVacant!9239 i!1194)) (= lt!440548 (MissingZero!9239 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62887 (_ BitVec 32)) SeekEntryResult!9239)

(assert (=> b!994652 (= lt!440548 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!994653 () Bool)

(assert (=> b!994653 (= e!561258 (bvsgt #b00000000000000000000000000000000 (size!30786 a!3219)))))

(declare-fun b!994654 () Bool)

(declare-fun res!665281 () Bool)

(assert (=> b!994654 (=> (not res!665281) (not e!561260))))

(declare-fun arrayContainsKey!0 (array!62887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994654 (= res!665281 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!85734 res!665284) b!994649))

(assert (= (and b!994649 res!665282) b!994648))

(assert (= (and b!994648 res!665279) b!994651))

(assert (= (and b!994651 res!665280) b!994654))

(assert (= (and b!994654 res!665281) b!994652))

(assert (= (and b!994652 res!665283) b!994650))

(assert (= (and b!994650 res!665285) b!994653))

(declare-fun m!921673 () Bool)

(assert (=> b!994654 m!921673))

(declare-fun m!921675 () Bool)

(assert (=> start!85734 m!921675))

(declare-fun m!921677 () Bool)

(assert (=> start!85734 m!921677))

(declare-fun m!921679 () Bool)

(assert (=> b!994648 m!921679))

(assert (=> b!994648 m!921679))

(declare-fun m!921681 () Bool)

(assert (=> b!994648 m!921681))

(declare-fun m!921683 () Bool)

(assert (=> b!994652 m!921683))

(declare-fun m!921685 () Bool)

(assert (=> b!994651 m!921685))

(declare-fun m!921687 () Bool)

(assert (=> b!994650 m!921687))

(check-sat (not b!994652) (not b!994651) (not b!994650) (not start!85734) (not b!994648) (not b!994654))
(check-sat)
