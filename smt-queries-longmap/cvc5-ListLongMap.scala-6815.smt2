; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85712 () Bool)

(assert start!85712)

(declare-fun b!994637 () Bool)

(declare-fun res!665144 () Bool)

(declare-fun e!561298 () Bool)

(assert (=> b!994637 (=> (not res!665144) (not e!561298))))

(declare-datatypes ((array!62918 0))(
  ( (array!62919 (arr!30298 (Array (_ BitVec 32) (_ BitVec 64))) (size!30800 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62918)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994637 (= res!665144 (and (= (size!30800 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30800 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30800 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994638 () Bool)

(declare-fun res!665145 () Bool)

(assert (=> b!994638 (=> (not res!665145) (not e!561298))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994638 (= res!665145 (validKeyInArray!0 (select (arr!30298 a!3219) j!170)))))

(declare-fun res!665146 () Bool)

(assert (=> start!85712 (=> (not res!665146) (not e!561298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85712 (= res!665146 (validMask!0 mask!3464))))

(assert (=> start!85712 e!561298))

(declare-fun array_inv!23422 (array!62918) Bool)

(assert (=> start!85712 (array_inv!23422 a!3219)))

(assert (=> start!85712 true))

(declare-fun b!994639 () Bool)

(declare-fun res!665148 () Bool)

(assert (=> b!994639 (=> (not res!665148) (not e!561298))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62918 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994639 (= res!665148 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994640 () Bool)

(declare-fun res!665147 () Bool)

(assert (=> b!994640 (=> (not res!665147) (not e!561298))))

(assert (=> b!994640 (= res!665147 (validKeyInArray!0 k!2224))))

(declare-fun b!994641 () Bool)

(assert (=> b!994641 (= e!561298 false)))

(declare-datatypes ((SeekEntryResult!9230 0))(
  ( (MissingZero!9230 (index!39291 (_ BitVec 32))) (Found!9230 (index!39292 (_ BitVec 32))) (Intermediate!9230 (undefined!10042 Bool) (index!39293 (_ BitVec 32)) (x!86743 (_ BitVec 32))) (Undefined!9230) (MissingVacant!9230 (index!39294 (_ BitVec 32))) )
))
(declare-fun lt!440735 () SeekEntryResult!9230)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62918 (_ BitVec 32)) SeekEntryResult!9230)

(assert (=> b!994641 (= lt!440735 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!85712 res!665146) b!994637))

(assert (= (and b!994637 res!665144) b!994638))

(assert (= (and b!994638 res!665145) b!994640))

(assert (= (and b!994640 res!665147) b!994639))

(assert (= (and b!994639 res!665148) b!994641))

(declare-fun m!922193 () Bool)

(assert (=> b!994641 m!922193))

(declare-fun m!922195 () Bool)

(assert (=> b!994639 m!922195))

(declare-fun m!922197 () Bool)

(assert (=> start!85712 m!922197))

(declare-fun m!922199 () Bool)

(assert (=> start!85712 m!922199))

(declare-fun m!922201 () Bool)

(assert (=> b!994640 m!922201))

(declare-fun m!922203 () Bool)

(assert (=> b!994638 m!922203))

(assert (=> b!994638 m!922203))

(declare-fun m!922205 () Bool)

(assert (=> b!994638 m!922205))

(push 1)

(assert (not b!994639))

(assert (not b!994641))

(assert (not b!994638))

(assert (not start!85712))

(assert (not b!994640))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

