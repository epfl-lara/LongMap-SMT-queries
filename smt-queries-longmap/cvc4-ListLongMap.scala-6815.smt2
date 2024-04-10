; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85716 () Bool)

(assert start!85716)

(declare-fun b!994667 () Bool)

(declare-fun e!561309 () Bool)

(assert (=> b!994667 (= e!561309 false)))

(declare-datatypes ((array!62922 0))(
  ( (array!62923 (arr!30300 (Array (_ BitVec 32) (_ BitVec 64))) (size!30802 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62922)

(declare-fun k!2224 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9232 0))(
  ( (MissingZero!9232 (index!39299 (_ BitVec 32))) (Found!9232 (index!39300 (_ BitVec 32))) (Intermediate!9232 (undefined!10044 Bool) (index!39301 (_ BitVec 32)) (x!86745 (_ BitVec 32))) (Undefined!9232) (MissingVacant!9232 (index!39302 (_ BitVec 32))) )
))
(declare-fun lt!440741 () SeekEntryResult!9232)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62922 (_ BitVec 32)) SeekEntryResult!9232)

(assert (=> b!994667 (= lt!440741 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!994668 () Bool)

(declare-fun res!665174 () Bool)

(assert (=> b!994668 (=> (not res!665174) (not e!561309))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994668 (= res!665174 (and (= (size!30802 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30802 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30802 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994669 () Bool)

(declare-fun res!665175 () Bool)

(assert (=> b!994669 (=> (not res!665175) (not e!561309))))

(declare-fun arrayContainsKey!0 (array!62922 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994669 (= res!665175 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994670 () Bool)

(declare-fun res!665176 () Bool)

(assert (=> b!994670 (=> (not res!665176) (not e!561309))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994670 (= res!665176 (validKeyInArray!0 (select (arr!30300 a!3219) j!170)))))

(declare-fun b!994671 () Bool)

(declare-fun res!665178 () Bool)

(assert (=> b!994671 (=> (not res!665178) (not e!561309))))

(assert (=> b!994671 (= res!665178 (validKeyInArray!0 k!2224))))

(declare-fun res!665177 () Bool)

(assert (=> start!85716 (=> (not res!665177) (not e!561309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85716 (= res!665177 (validMask!0 mask!3464))))

(assert (=> start!85716 e!561309))

(declare-fun array_inv!23424 (array!62922) Bool)

(assert (=> start!85716 (array_inv!23424 a!3219)))

(assert (=> start!85716 true))

(assert (= (and start!85716 res!665177) b!994668))

(assert (= (and b!994668 res!665174) b!994670))

(assert (= (and b!994670 res!665176) b!994671))

(assert (= (and b!994671 res!665178) b!994669))

(assert (= (and b!994669 res!665175) b!994667))

(declare-fun m!922221 () Bool)

(assert (=> b!994670 m!922221))

(assert (=> b!994670 m!922221))

(declare-fun m!922223 () Bool)

(assert (=> b!994670 m!922223))

(declare-fun m!922225 () Bool)

(assert (=> b!994671 m!922225))

(declare-fun m!922227 () Bool)

(assert (=> b!994667 m!922227))

(declare-fun m!922229 () Bool)

(assert (=> start!85716 m!922229))

(declare-fun m!922231 () Bool)

(assert (=> start!85716 m!922231))

(declare-fun m!922233 () Bool)

(assert (=> b!994669 m!922233))

(push 1)

(assert (not b!994669))

(assert (not b!994667))

(assert (not b!994670))

(assert (not b!994671))

(assert (not start!85716))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

