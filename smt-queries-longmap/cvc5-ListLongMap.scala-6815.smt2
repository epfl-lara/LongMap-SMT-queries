; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85892 () Bool)

(assert start!85892)

(declare-fun res!665542 () Bool)

(declare-fun e!561914 () Bool)

(assert (=> start!85892 (=> (not res!665542) (not e!561914))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85892 (= res!665542 (validMask!0 mask!3464))))

(assert (=> start!85892 e!561914))

(declare-datatypes ((array!62968 0))(
  ( (array!62969 (arr!30318 (Array (_ BitVec 32) (_ BitVec 64))) (size!30821 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62968)

(declare-fun array_inv!23454 (array!62968) Bool)

(assert (=> start!85892 (array_inv!23454 a!3219)))

(assert (=> start!85892 true))

(declare-fun b!995598 () Bool)

(declare-fun res!665543 () Bool)

(assert (=> b!995598 (=> (not res!665543) (not e!561914))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995598 (= res!665543 (and (= (size!30821 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30821 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30821 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995599 () Bool)

(declare-fun res!665539 () Bool)

(assert (=> b!995599 (=> (not res!665539) (not e!561914))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995599 (= res!665539 (validKeyInArray!0 (select (arr!30318 a!3219) j!170)))))

(declare-fun b!995600 () Bool)

(declare-fun res!665540 () Bool)

(assert (=> b!995600 (=> (not res!665540) (not e!561914))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62968 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995600 (= res!665540 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995601 () Bool)

(declare-fun res!665541 () Bool)

(assert (=> b!995601 (=> (not res!665541) (not e!561914))))

(assert (=> b!995601 (= res!665541 (validKeyInArray!0 k!2224))))

(declare-fun b!995602 () Bool)

(assert (=> b!995602 (= e!561914 false)))

(declare-datatypes ((SeekEntryResult!9186 0))(
  ( (MissingZero!9186 (index!39115 (_ BitVec 32))) (Found!9186 (index!39116 (_ BitVec 32))) (Intermediate!9186 (undefined!9998 Bool) (index!39117 (_ BitVec 32)) (x!86713 (_ BitVec 32))) (Undefined!9186) (MissingVacant!9186 (index!39118 (_ BitVec 32))) )
))
(declare-fun lt!441107 () SeekEntryResult!9186)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62968 (_ BitVec 32)) SeekEntryResult!9186)

(assert (=> b!995602 (= lt!441107 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!85892 res!665542) b!995598))

(assert (= (and b!995598 res!665543) b!995599))

(assert (= (and b!995599 res!665539) b!995601))

(assert (= (and b!995601 res!665541) b!995600))

(assert (= (and b!995600 res!665540) b!995602))

(declare-fun m!923559 () Bool)

(assert (=> b!995602 m!923559))

(declare-fun m!923561 () Bool)

(assert (=> b!995599 m!923561))

(assert (=> b!995599 m!923561))

(declare-fun m!923563 () Bool)

(assert (=> b!995599 m!923563))

(declare-fun m!923565 () Bool)

(assert (=> start!85892 m!923565))

(declare-fun m!923567 () Bool)

(assert (=> start!85892 m!923567))

(declare-fun m!923569 () Bool)

(assert (=> b!995601 m!923569))

(declare-fun m!923571 () Bool)

(assert (=> b!995600 m!923571))

(push 1)

(assert (not start!85892))

(assert (not b!995600))

(assert (not b!995601))

(assert (not b!995602))

(assert (not b!995599))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

