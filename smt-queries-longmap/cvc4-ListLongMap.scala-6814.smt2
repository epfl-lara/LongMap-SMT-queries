; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85710 () Bool)

(assert start!85710)

(declare-fun b!994622 () Bool)

(declare-fun res!665133 () Bool)

(declare-fun e!561291 () Bool)

(assert (=> b!994622 (=> (not res!665133) (not e!561291))))

(declare-datatypes ((array!62916 0))(
  ( (array!62917 (arr!30297 (Array (_ BitVec 32) (_ BitVec 64))) (size!30799 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62916)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994622 (= res!665133 (validKeyInArray!0 (select (arr!30297 a!3219) j!170)))))

(declare-fun b!994623 () Bool)

(declare-fun res!665131 () Bool)

(assert (=> b!994623 (=> (not res!665131) (not e!561291))))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!994623 (= res!665131 (validKeyInArray!0 k!2224))))

(declare-fun b!994625 () Bool)

(assert (=> b!994625 (= e!561291 false)))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9229 0))(
  ( (MissingZero!9229 (index!39287 (_ BitVec 32))) (Found!9229 (index!39288 (_ BitVec 32))) (Intermediate!9229 (undefined!10041 Bool) (index!39289 (_ BitVec 32)) (x!86734 (_ BitVec 32))) (Undefined!9229) (MissingVacant!9229 (index!39290 (_ BitVec 32))) )
))
(declare-fun lt!440732 () SeekEntryResult!9229)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62916 (_ BitVec 32)) SeekEntryResult!9229)

(assert (=> b!994625 (= lt!440732 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!994626 () Bool)

(declare-fun res!665129 () Bool)

(assert (=> b!994626 (=> (not res!665129) (not e!561291))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994626 (= res!665129 (and (= (size!30799 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30799 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30799 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994624 () Bool)

(declare-fun res!665130 () Bool)

(assert (=> b!994624 (=> (not res!665130) (not e!561291))))

(declare-fun arrayContainsKey!0 (array!62916 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994624 (= res!665130 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun res!665132 () Bool)

(assert (=> start!85710 (=> (not res!665132) (not e!561291))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85710 (= res!665132 (validMask!0 mask!3464))))

(assert (=> start!85710 e!561291))

(declare-fun array_inv!23421 (array!62916) Bool)

(assert (=> start!85710 (array_inv!23421 a!3219)))

(assert (=> start!85710 true))

(assert (= (and start!85710 res!665132) b!994626))

(assert (= (and b!994626 res!665129) b!994622))

(assert (= (and b!994622 res!665133) b!994623))

(assert (= (and b!994623 res!665131) b!994624))

(assert (= (and b!994624 res!665130) b!994625))

(declare-fun m!922179 () Bool)

(assert (=> start!85710 m!922179))

(declare-fun m!922181 () Bool)

(assert (=> start!85710 m!922181))

(declare-fun m!922183 () Bool)

(assert (=> b!994624 m!922183))

(declare-fun m!922185 () Bool)

(assert (=> b!994625 m!922185))

(declare-fun m!922187 () Bool)

(assert (=> b!994622 m!922187))

(assert (=> b!994622 m!922187))

(declare-fun m!922189 () Bool)

(assert (=> b!994622 m!922189))

(declare-fun m!922191 () Bool)

(assert (=> b!994623 m!922191))

(push 1)

(assert (not start!85710))

(assert (not b!994624))

(assert (not b!994622))

(assert (not b!994623))

(assert (not b!994625))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

