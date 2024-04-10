; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85720 () Bool)

(assert start!85720)

(declare-fun b!994697 () Bool)

(declare-fun res!665204 () Bool)

(declare-fun e!561321 () Bool)

(assert (=> b!994697 (=> (not res!665204) (not e!561321))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-datatypes ((array!62926 0))(
  ( (array!62927 (arr!30302 (Array (_ BitVec 32) (_ BitVec 64))) (size!30804 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62926)

(assert (=> b!994697 (= res!665204 (and (= (size!30804 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30804 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30804 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994698 () Bool)

(declare-fun res!665206 () Bool)

(assert (=> b!994698 (=> (not res!665206) (not e!561321))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994698 (= res!665206 (validKeyInArray!0 k0!2224))))

(declare-fun b!994699 () Bool)

(assert (=> b!994699 (= e!561321 false)))

(declare-datatypes ((SeekEntryResult!9234 0))(
  ( (MissingZero!9234 (index!39307 (_ BitVec 32))) (Found!9234 (index!39308 (_ BitVec 32))) (Intermediate!9234 (undefined!10046 Bool) (index!39309 (_ BitVec 32)) (x!86755 (_ BitVec 32))) (Undefined!9234) (MissingVacant!9234 (index!39310 (_ BitVec 32))) )
))
(declare-fun lt!440747 () SeekEntryResult!9234)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62926 (_ BitVec 32)) SeekEntryResult!9234)

(assert (=> b!994699 (= lt!440747 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!994700 () Bool)

(declare-fun res!665208 () Bool)

(assert (=> b!994700 (=> (not res!665208) (not e!561321))))

(assert (=> b!994700 (= res!665208 (validKeyInArray!0 (select (arr!30302 a!3219) j!170)))))

(declare-fun res!665205 () Bool)

(assert (=> start!85720 (=> (not res!665205) (not e!561321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85720 (= res!665205 (validMask!0 mask!3464))))

(assert (=> start!85720 e!561321))

(declare-fun array_inv!23426 (array!62926) Bool)

(assert (=> start!85720 (array_inv!23426 a!3219)))

(assert (=> start!85720 true))

(declare-fun b!994701 () Bool)

(declare-fun res!665207 () Bool)

(assert (=> b!994701 (=> (not res!665207) (not e!561321))))

(declare-fun arrayContainsKey!0 (array!62926 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994701 (= res!665207 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!85720 res!665205) b!994697))

(assert (= (and b!994697 res!665204) b!994700))

(assert (= (and b!994700 res!665208) b!994698))

(assert (= (and b!994698 res!665206) b!994701))

(assert (= (and b!994701 res!665207) b!994699))

(declare-fun m!922249 () Bool)

(assert (=> b!994700 m!922249))

(assert (=> b!994700 m!922249))

(declare-fun m!922251 () Bool)

(assert (=> b!994700 m!922251))

(declare-fun m!922253 () Bool)

(assert (=> b!994699 m!922253))

(declare-fun m!922255 () Bool)

(assert (=> start!85720 m!922255))

(declare-fun m!922257 () Bool)

(assert (=> start!85720 m!922257))

(declare-fun m!922259 () Bool)

(assert (=> b!994698 m!922259))

(declare-fun m!922261 () Bool)

(assert (=> b!994701 m!922261))

(check-sat (not b!994699) (not b!994700) (not b!994698) (not start!85720) (not b!994701))
