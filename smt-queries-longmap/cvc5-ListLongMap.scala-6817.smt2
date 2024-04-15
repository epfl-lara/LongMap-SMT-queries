; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85720 () Bool)

(assert start!85720)

(declare-fun b!994539 () Bool)

(declare-fun res!665172 () Bool)

(declare-fun e!561214 () Bool)

(assert (=> b!994539 (=> (not res!665172) (not e!561214))))

(declare-datatypes ((array!62873 0))(
  ( (array!62874 (arr!30275 (Array (_ BitVec 32) (_ BitVec 64))) (size!30779 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62873)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994539 (= res!665172 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun res!665170 () Bool)

(assert (=> start!85720 (=> (not res!665170) (not e!561214))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85720 (= res!665170 (validMask!0 mask!3464))))

(assert (=> start!85720 e!561214))

(declare-fun array_inv!23418 (array!62873) Bool)

(assert (=> start!85720 (array_inv!23418 a!3219)))

(assert (=> start!85720 true))

(declare-fun b!994540 () Bool)

(declare-fun res!665171 () Bool)

(assert (=> b!994540 (=> (not res!665171) (not e!561214))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994540 (= res!665171 (and (= (size!30779 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30779 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30779 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994541 () Bool)

(declare-fun res!665173 () Bool)

(assert (=> b!994541 (=> (not res!665173) (not e!561214))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994541 (= res!665173 (validKeyInArray!0 k!2224))))

(declare-fun b!994542 () Bool)

(assert (=> b!994542 (= e!561214 false)))

(declare-datatypes ((SeekEntryResult!9232 0))(
  ( (MissingZero!9232 (index!39299 (_ BitVec 32))) (Found!9232 (index!39300 (_ BitVec 32))) (Intermediate!9232 (undefined!10044 Bool) (index!39301 (_ BitVec 32)) (x!86756 (_ BitVec 32))) (Undefined!9232) (MissingVacant!9232 (index!39302 (_ BitVec 32))) )
))
(declare-fun lt!440527 () SeekEntryResult!9232)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62873 (_ BitVec 32)) SeekEntryResult!9232)

(assert (=> b!994542 (= lt!440527 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!994543 () Bool)

(declare-fun res!665174 () Bool)

(assert (=> b!994543 (=> (not res!665174) (not e!561214))))

(assert (=> b!994543 (= res!665174 (validKeyInArray!0 (select (arr!30275 a!3219) j!170)))))

(assert (= (and start!85720 res!665170) b!994540))

(assert (= (and b!994540 res!665171) b!994543))

(assert (= (and b!994543 res!665174) b!994541))

(assert (= (and b!994541 res!665173) b!994539))

(assert (= (and b!994539 res!665172) b!994542))

(declare-fun m!921575 () Bool)

(assert (=> b!994542 m!921575))

(declare-fun m!921577 () Bool)

(assert (=> b!994539 m!921577))

(declare-fun m!921579 () Bool)

(assert (=> b!994541 m!921579))

(declare-fun m!921581 () Bool)

(assert (=> b!994543 m!921581))

(assert (=> b!994543 m!921581))

(declare-fun m!921583 () Bool)

(assert (=> b!994543 m!921583))

(declare-fun m!921585 () Bool)

(assert (=> start!85720 m!921585))

(declare-fun m!921587 () Bool)

(assert (=> start!85720 m!921587))

(push 1)

(assert (not b!994539))

(assert (not b!994542))

(assert (not b!994543))

(assert (not start!85720))

(assert (not b!994541))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

