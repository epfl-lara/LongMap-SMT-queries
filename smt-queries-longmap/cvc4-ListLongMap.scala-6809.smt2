; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85666 () Bool)

(assert start!85666)

(declare-fun res!664908 () Bool)

(declare-fun e!561202 () Bool)

(assert (=> start!85666 (=> (not res!664908) (not e!561202))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85666 (= res!664908 (validMask!0 mask!3464))))

(assert (=> start!85666 e!561202))

(declare-datatypes ((array!62885 0))(
  ( (array!62886 (arr!30282 (Array (_ BitVec 32) (_ BitVec 64))) (size!30784 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62885)

(declare-fun array_inv!23406 (array!62885) Bool)

(assert (=> start!85666 (array_inv!23406 a!3219)))

(assert (=> start!85666 true))

(declare-fun b!994398 () Bool)

(declare-fun res!664907 () Bool)

(assert (=> b!994398 (=> (not res!664907) (not e!561202))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994398 (= res!664907 (and (= (size!30784 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30784 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30784 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994400 () Bool)

(declare-fun res!664906 () Bool)

(assert (=> b!994400 (=> (not res!664906) (not e!561202))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994400 (= res!664906 (validKeyInArray!0 k!2224))))

(declare-fun b!994401 () Bool)

(assert (=> b!994401 (= e!561202 (bvsge #b00000000000000000000000000000000 (size!30784 a!3219)))))

(declare-fun b!994399 () Bool)

(declare-fun res!664905 () Bool)

(assert (=> b!994399 (=> (not res!664905) (not e!561202))))

(assert (=> b!994399 (= res!664905 (validKeyInArray!0 (select (arr!30282 a!3219) j!170)))))

(assert (= (and start!85666 res!664908) b!994398))

(assert (= (and b!994398 res!664907) b!994399))

(assert (= (and b!994399 res!664905) b!994400))

(assert (= (and b!994400 res!664906) b!994401))

(declare-fun m!921991 () Bool)

(assert (=> start!85666 m!921991))

(declare-fun m!921993 () Bool)

(assert (=> start!85666 m!921993))

(declare-fun m!921995 () Bool)

(assert (=> b!994400 m!921995))

(declare-fun m!921997 () Bool)

(assert (=> b!994399 m!921997))

(assert (=> b!994399 m!921997))

(declare-fun m!921999 () Bool)

(assert (=> b!994399 m!921999))

(push 1)

(assert (not b!994399))

(assert (not b!994400))

(assert (not start!85666))

(check-sat)

(pop 1)

(push 1)

(check-sat)

