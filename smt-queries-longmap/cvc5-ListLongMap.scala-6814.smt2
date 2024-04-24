; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85886 () Bool)

(assert start!85886)

(declare-fun b!995553 () Bool)

(declare-fun res!665496 () Bool)

(declare-fun e!561897 () Bool)

(assert (=> b!995553 (=> (not res!665496) (not e!561897))))

(declare-datatypes ((array!62962 0))(
  ( (array!62963 (arr!30315 (Array (_ BitVec 32) (_ BitVec 64))) (size!30818 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62962)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995553 (= res!665496 (and (= (size!30818 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30818 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30818 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995554 () Bool)

(declare-fun res!665494 () Bool)

(assert (=> b!995554 (=> (not res!665494) (not e!561897))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995554 (= res!665494 (validKeyInArray!0 k!2224))))

(declare-fun b!995555 () Bool)

(declare-fun res!665495 () Bool)

(assert (=> b!995555 (=> (not res!665495) (not e!561897))))

(assert (=> b!995555 (= res!665495 (validKeyInArray!0 (select (arr!30315 a!3219) j!170)))))

(declare-fun res!665498 () Bool)

(assert (=> start!85886 (=> (not res!665498) (not e!561897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85886 (= res!665498 (validMask!0 mask!3464))))

(assert (=> start!85886 e!561897))

(declare-fun array_inv!23451 (array!62962) Bool)

(assert (=> start!85886 (array_inv!23451 a!3219)))

(assert (=> start!85886 true))

(declare-fun b!995556 () Bool)

(declare-fun res!665497 () Bool)

(assert (=> b!995556 (=> (not res!665497) (not e!561897))))

(declare-fun arrayContainsKey!0 (array!62962 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995556 (= res!665497 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995557 () Bool)

(assert (=> b!995557 (= e!561897 false)))

(declare-datatypes ((SeekEntryResult!9183 0))(
  ( (MissingZero!9183 (index!39103 (_ BitVec 32))) (Found!9183 (index!39104 (_ BitVec 32))) (Intermediate!9183 (undefined!9995 Bool) (index!39105 (_ BitVec 32)) (x!86702 (_ BitVec 32))) (Undefined!9183) (MissingVacant!9183 (index!39106 (_ BitVec 32))) )
))
(declare-fun lt!441098 () SeekEntryResult!9183)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62962 (_ BitVec 32)) SeekEntryResult!9183)

(assert (=> b!995557 (= lt!441098 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!85886 res!665498) b!995553))

(assert (= (and b!995553 res!665496) b!995555))

(assert (= (and b!995555 res!665495) b!995554))

(assert (= (and b!995554 res!665494) b!995556))

(assert (= (and b!995556 res!665497) b!995557))

(declare-fun m!923517 () Bool)

(assert (=> b!995556 m!923517))

(declare-fun m!923519 () Bool)

(assert (=> b!995555 m!923519))

(assert (=> b!995555 m!923519))

(declare-fun m!923521 () Bool)

(assert (=> b!995555 m!923521))

(declare-fun m!923523 () Bool)

(assert (=> b!995557 m!923523))

(declare-fun m!923525 () Bool)

(assert (=> start!85886 m!923525))

(declare-fun m!923527 () Bool)

(assert (=> start!85886 m!923527))

(declare-fun m!923529 () Bool)

(assert (=> b!995554 m!923529))

(push 1)

(assert (not b!995557))

(assert (not b!995555))

(assert (not b!995556))

(assert (not b!995554))

(assert (not start!85886))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

