; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85730 () Bool)

(assert start!85730)

(declare-fun b!994772 () Bool)

(declare-fun res!665282 () Bool)

(declare-fun e!561351 () Bool)

(assert (=> b!994772 (=> (not res!665282) (not e!561351))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994772 (= res!665282 (validKeyInArray!0 k!2224))))

(declare-fun b!994774 () Bool)

(assert (=> b!994774 (= e!561351 false)))

(declare-datatypes ((array!62936 0))(
  ( (array!62937 (arr!30307 (Array (_ BitVec 32) (_ BitVec 64))) (size!30809 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62936)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9239 0))(
  ( (MissingZero!9239 (index!39327 (_ BitVec 32))) (Found!9239 (index!39328 (_ BitVec 32))) (Intermediate!9239 (undefined!10051 Bool) (index!39329 (_ BitVec 32)) (x!86776 (_ BitVec 32))) (Undefined!9239) (MissingVacant!9239 (index!39330 (_ BitVec 32))) )
))
(declare-fun lt!440762 () SeekEntryResult!9239)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62936 (_ BitVec 32)) SeekEntryResult!9239)

(assert (=> b!994774 (= lt!440762 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!994775 () Bool)

(declare-fun res!665279 () Bool)

(assert (=> b!994775 (=> (not res!665279) (not e!561351))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994775 (= res!665279 (and (= (size!30809 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30809 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30809 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994776 () Bool)

(declare-fun res!665283 () Bool)

(assert (=> b!994776 (=> (not res!665283) (not e!561351))))

(assert (=> b!994776 (= res!665283 (validKeyInArray!0 (select (arr!30307 a!3219) j!170)))))

(declare-fun res!665281 () Bool)

(assert (=> start!85730 (=> (not res!665281) (not e!561351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85730 (= res!665281 (validMask!0 mask!3464))))

(assert (=> start!85730 e!561351))

(declare-fun array_inv!23431 (array!62936) Bool)

(assert (=> start!85730 (array_inv!23431 a!3219)))

(assert (=> start!85730 true))

(declare-fun b!994773 () Bool)

(declare-fun res!665280 () Bool)

(assert (=> b!994773 (=> (not res!665280) (not e!561351))))

(declare-fun arrayContainsKey!0 (array!62936 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994773 (= res!665280 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!85730 res!665281) b!994775))

(assert (= (and b!994775 res!665279) b!994776))

(assert (= (and b!994776 res!665283) b!994772))

(assert (= (and b!994772 res!665282) b!994773))

(assert (= (and b!994773 res!665280) b!994774))

(declare-fun m!922319 () Bool)

(assert (=> start!85730 m!922319))

(declare-fun m!922321 () Bool)

(assert (=> start!85730 m!922321))

(declare-fun m!922323 () Bool)

(assert (=> b!994776 m!922323))

(assert (=> b!994776 m!922323))

(declare-fun m!922325 () Bool)

(assert (=> b!994776 m!922325))

(declare-fun m!922327 () Bool)

(assert (=> b!994772 m!922327))

(declare-fun m!922329 () Bool)

(assert (=> b!994774 m!922329))

(declare-fun m!922331 () Bool)

(assert (=> b!994773 m!922331))

(push 1)

(assert (not b!994776))

(assert (not start!85730))

(assert (not b!994774))

(assert (not b!994772))

(assert (not b!994773))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

