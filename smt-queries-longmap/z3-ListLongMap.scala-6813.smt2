; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85876 () Bool)

(assert start!85876)

(declare-fun res!665412 () Bool)

(declare-fun e!561866 () Bool)

(assert (=> start!85876 (=> (not res!665412) (not e!561866))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85876 (= res!665412 (validMask!0 mask!3464))))

(assert (=> start!85876 e!561866))

(declare-datatypes ((array!62952 0))(
  ( (array!62953 (arr!30310 (Array (_ BitVec 32) (_ BitVec 64))) (size!30813 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62952)

(declare-fun array_inv!23446 (array!62952) Bool)

(assert (=> start!85876 (array_inv!23446 a!3219)))

(assert (=> start!85876 true))

(declare-fun b!995471 () Bool)

(declare-fun res!665414 () Bool)

(assert (=> b!995471 (=> (not res!665414) (not e!561866))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62952 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995471 (= res!665414 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995472 () Bool)

(assert (=> b!995472 (= e!561866 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!995473 () Bool)

(declare-fun res!665416 () Bool)

(assert (=> b!995473 (=> (not res!665416) (not e!561866))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9178 0))(
  ( (MissingZero!9178 (index!39083 (_ BitVec 32))) (Found!9178 (index!39084 (_ BitVec 32))) (Intermediate!9178 (undefined!9990 Bool) (index!39085 (_ BitVec 32)) (x!86689 (_ BitVec 32))) (Undefined!9178) (MissingVacant!9178 (index!39086 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62952 (_ BitVec 32)) SeekEntryResult!9178)

(assert (=> b!995473 (= res!665416 (not (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) (MissingVacant!9178 i!1194))))))

(declare-fun b!995474 () Bool)

(declare-fun res!665413 () Bool)

(assert (=> b!995474 (=> (not res!665413) (not e!561866))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995474 (= res!665413 (validKeyInArray!0 (select (arr!30310 a!3219) j!170)))))

(declare-fun b!995475 () Bool)

(declare-fun res!665415 () Bool)

(assert (=> b!995475 (=> (not res!665415) (not e!561866))))

(assert (=> b!995475 (= res!665415 (validKeyInArray!0 k0!2224))))

(declare-fun b!995476 () Bool)

(declare-fun res!665417 () Bool)

(assert (=> b!995476 (=> (not res!665417) (not e!561866))))

(assert (=> b!995476 (= res!665417 (and (= (size!30813 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30813 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30813 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!85876 res!665412) b!995476))

(assert (= (and b!995476 res!665417) b!995474))

(assert (= (and b!995474 res!665413) b!995475))

(assert (= (and b!995475 res!665415) b!995471))

(assert (= (and b!995471 res!665414) b!995473))

(assert (= (and b!995473 res!665416) b!995472))

(declare-fun m!923447 () Bool)

(assert (=> start!85876 m!923447))

(declare-fun m!923449 () Bool)

(assert (=> start!85876 m!923449))

(declare-fun m!923451 () Bool)

(assert (=> b!995475 m!923451))

(declare-fun m!923453 () Bool)

(assert (=> b!995474 m!923453))

(assert (=> b!995474 m!923453))

(declare-fun m!923455 () Bool)

(assert (=> b!995474 m!923455))

(declare-fun m!923457 () Bool)

(assert (=> b!995473 m!923457))

(declare-fun m!923459 () Bool)

(assert (=> b!995471 m!923459))

(check-sat (not b!995471) (not b!995473) (not b!995475) (not start!85876) (not b!995474))
(check-sat)
