; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85700 () Bool)

(assert start!85700)

(declare-fun res!665052 () Bool)

(declare-fun e!561262 () Bool)

(assert (=> start!85700 (=> (not res!665052) (not e!561262))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85700 (= res!665052 (validMask!0 mask!3464))))

(assert (=> start!85700 e!561262))

(declare-datatypes ((array!62906 0))(
  ( (array!62907 (arr!30292 (Array (_ BitVec 32) (_ BitVec 64))) (size!30794 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62906)

(declare-fun array_inv!23416 (array!62906) Bool)

(assert (=> start!85700 (array_inv!23416 a!3219)))

(assert (=> start!85700 true))

(declare-fun b!994540 () Bool)

(declare-fun res!665047 () Bool)

(assert (=> b!994540 (=> (not res!665047) (not e!561262))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994540 (= res!665047 (validKeyInArray!0 k!2224))))

(declare-fun b!994541 () Bool)

(declare-fun res!665051 () Bool)

(assert (=> b!994541 (=> (not res!665051) (not e!561262))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!994541 (= res!665051 (validKeyInArray!0 (select (arr!30292 a!3219) j!170)))))

(declare-fun b!994542 () Bool)

(declare-fun res!665049 () Bool)

(assert (=> b!994542 (=> (not res!665049) (not e!561262))))

(declare-fun arrayContainsKey!0 (array!62906 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994542 (= res!665049 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994543 () Bool)

(declare-fun res!665048 () Bool)

(assert (=> b!994543 (=> (not res!665048) (not e!561262))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994543 (= res!665048 (and (= (size!30794 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30794 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30794 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994544 () Bool)

(declare-fun res!665050 () Bool)

(assert (=> b!994544 (=> (not res!665050) (not e!561262))))

(declare-datatypes ((SeekEntryResult!9224 0))(
  ( (MissingZero!9224 (index!39267 (_ BitVec 32))) (Found!9224 (index!39268 (_ BitVec 32))) (Intermediate!9224 (undefined!10036 Bool) (index!39269 (_ BitVec 32)) (x!86721 (_ BitVec 32))) (Undefined!9224) (MissingVacant!9224 (index!39270 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62906 (_ BitVec 32)) SeekEntryResult!9224)

(assert (=> b!994544 (= res!665050 (not (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) (MissingVacant!9224 i!1194))))))

(declare-fun b!994545 () Bool)

(assert (=> b!994545 (= e!561262 (bvslt mask!3464 #b00000000000000000000000000000000))))

(assert (= (and start!85700 res!665052) b!994543))

(assert (= (and b!994543 res!665048) b!994541))

(assert (= (and b!994541 res!665051) b!994540))

(assert (= (and b!994540 res!665047) b!994542))

(assert (= (and b!994542 res!665049) b!994544))

(assert (= (and b!994544 res!665050) b!994545))

(declare-fun m!922109 () Bool)

(assert (=> start!85700 m!922109))

(declare-fun m!922111 () Bool)

(assert (=> start!85700 m!922111))

(declare-fun m!922113 () Bool)

(assert (=> b!994540 m!922113))

(declare-fun m!922115 () Bool)

(assert (=> b!994541 m!922115))

(assert (=> b!994541 m!922115))

(declare-fun m!922117 () Bool)

(assert (=> b!994541 m!922117))

(declare-fun m!922119 () Bool)

(assert (=> b!994542 m!922119))

(declare-fun m!922121 () Bool)

(assert (=> b!994544 m!922121))

(push 1)

(assert (not b!994540))

(assert (not b!994544))

(assert (not b!994542))

