; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85726 () Bool)

(assert start!85726)

(declare-fun b!994742 () Bool)

(declare-fun e!561339 () Bool)

(assert (=> b!994742 (= e!561339 false)))

(declare-datatypes ((array!62932 0))(
  ( (array!62933 (arr!30305 (Array (_ BitVec 32) (_ BitVec 64))) (size!30807 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62932)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9237 0))(
  ( (MissingZero!9237 (index!39319 (_ BitVec 32))) (Found!9237 (index!39320 (_ BitVec 32))) (Intermediate!9237 (undefined!10049 Bool) (index!39321 (_ BitVec 32)) (x!86766 (_ BitVec 32))) (Undefined!9237) (MissingVacant!9237 (index!39322 (_ BitVec 32))) )
))
(declare-fun lt!440756 () SeekEntryResult!9237)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62932 (_ BitVec 32)) SeekEntryResult!9237)

(assert (=> b!994742 (= lt!440756 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!994743 () Bool)

(declare-fun res!665253 () Bool)

(assert (=> b!994743 (=> (not res!665253) (not e!561339))))

(declare-fun arrayContainsKey!0 (array!62932 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994743 (= res!665253 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994744 () Bool)

(declare-fun res!665252 () Bool)

(assert (=> b!994744 (=> (not res!665252) (not e!561339))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994744 (= res!665252 (and (= (size!30807 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30807 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30807 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!665250 () Bool)

(assert (=> start!85726 (=> (not res!665250) (not e!561339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85726 (= res!665250 (validMask!0 mask!3464))))

(assert (=> start!85726 e!561339))

(declare-fun array_inv!23429 (array!62932) Bool)

(assert (=> start!85726 (array_inv!23429 a!3219)))

(assert (=> start!85726 true))

(declare-fun b!994745 () Bool)

(declare-fun res!665249 () Bool)

(assert (=> b!994745 (=> (not res!665249) (not e!561339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994745 (= res!665249 (validKeyInArray!0 k0!2224))))

(declare-fun b!994746 () Bool)

(declare-fun res!665251 () Bool)

(assert (=> b!994746 (=> (not res!665251) (not e!561339))))

(assert (=> b!994746 (= res!665251 (validKeyInArray!0 (select (arr!30305 a!3219) j!170)))))

(assert (= (and start!85726 res!665250) b!994744))

(assert (= (and b!994744 res!665252) b!994746))

(assert (= (and b!994746 res!665251) b!994745))

(assert (= (and b!994745 res!665249) b!994743))

(assert (= (and b!994743 res!665253) b!994742))

(declare-fun m!922291 () Bool)

(assert (=> start!85726 m!922291))

(declare-fun m!922293 () Bool)

(assert (=> start!85726 m!922293))

(declare-fun m!922295 () Bool)

(assert (=> b!994745 m!922295))

(declare-fun m!922297 () Bool)

(assert (=> b!994746 m!922297))

(assert (=> b!994746 m!922297))

(declare-fun m!922299 () Bool)

(assert (=> b!994746 m!922299))

(declare-fun m!922301 () Bool)

(assert (=> b!994742 m!922301))

(declare-fun m!922303 () Bool)

(assert (=> b!994743 m!922303))

(check-sat (not b!994745) (not b!994742) (not b!994746) (not start!85726) (not b!994743))
