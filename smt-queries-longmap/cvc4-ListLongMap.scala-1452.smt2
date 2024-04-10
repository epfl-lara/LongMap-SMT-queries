; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28006 () Bool)

(assert start!28006)

(declare-fun res!149214 () Bool)

(declare-fun e!181987 () Bool)

(assert (=> start!28006 (=> (not res!149214) (not e!181987))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28006 (= res!149214 (validMask!0 mask!3809))))

(assert (=> start!28006 e!181987))

(assert (=> start!28006 true))

(declare-datatypes ((array!14410 0))(
  ( (array!14411 (arr!6835 (Array (_ BitVec 32) (_ BitVec 64))) (size!7187 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14410)

(declare-fun array_inv!4798 (array!14410) Bool)

(assert (=> start!28006 (array_inv!4798 a!3312)))

(declare-fun b!287322 () Bool)

(declare-fun res!149209 () Bool)

(assert (=> b!287322 (=> (not res!149209) (not e!181987))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287322 (= res!149209 (and (= (size!7187 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7187 a!3312))))))

(declare-fun b!287323 () Bool)

(declare-fun res!149211 () Bool)

(assert (=> b!287323 (=> (not res!149211) (not e!181987))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287323 (= res!149211 (validKeyInArray!0 k!2524))))

(declare-fun b!287324 () Bool)

(declare-fun e!181988 () Bool)

(assert (=> b!287324 (= e!181987 e!181988)))

(declare-fun res!149210 () Bool)

(assert (=> b!287324 (=> (not res!149210) (not e!181988))))

(declare-datatypes ((SeekEntryResult!1984 0))(
  ( (MissingZero!1984 (index!10106 (_ BitVec 32))) (Found!1984 (index!10107 (_ BitVec 32))) (Intermediate!1984 (undefined!2796 Bool) (index!10108 (_ BitVec 32)) (x!28321 (_ BitVec 32))) (Undefined!1984) (MissingVacant!1984 (index!10109 (_ BitVec 32))) )
))
(declare-fun lt!141463 () SeekEntryResult!1984)

(assert (=> b!287324 (= res!149210 (or (= lt!141463 (MissingZero!1984 i!1256)) (= lt!141463 (MissingVacant!1984 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14410 (_ BitVec 32)) SeekEntryResult!1984)

(assert (=> b!287324 (= lt!141463 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!287325 () Bool)

(declare-fun res!149212 () Bool)

(assert (=> b!287325 (=> (not res!149212) (not e!181988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14410 (_ BitVec 32)) Bool)

(assert (=> b!287325 (= res!149212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287326 () Bool)

(assert (=> b!287326 (= e!181988 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun lt!141462 () SeekEntryResult!1984)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14410 (_ BitVec 32)) SeekEntryResult!1984)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287326 (= lt!141462 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!287327 () Bool)

(declare-fun res!149213 () Bool)

(assert (=> b!287327 (=> (not res!149213) (not e!181987))))

(declare-fun arrayContainsKey!0 (array!14410 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287327 (= res!149213 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28006 res!149214) b!287322))

(assert (= (and b!287322 res!149209) b!287323))

(assert (= (and b!287323 res!149211) b!287327))

(assert (= (and b!287327 res!149213) b!287324))

(assert (= (and b!287324 res!149210) b!287325))

(assert (= (and b!287325 res!149212) b!287326))

(declare-fun m!301763 () Bool)

(assert (=> b!287323 m!301763))

(declare-fun m!301765 () Bool)

(assert (=> b!287324 m!301765))

(declare-fun m!301767 () Bool)

(assert (=> b!287325 m!301767))

(declare-fun m!301769 () Bool)

(assert (=> b!287327 m!301769))

(declare-fun m!301771 () Bool)

(assert (=> start!28006 m!301771))

(declare-fun m!301773 () Bool)

(assert (=> start!28006 m!301773))

(declare-fun m!301775 () Bool)

(assert (=> b!287326 m!301775))

(assert (=> b!287326 m!301775))

(declare-fun m!301777 () Bool)

(assert (=> b!287326 m!301777))

(push 1)

(assert (not b!287326))

(assert (not start!28006))

(assert (not b!287324))

(assert (not b!287325))

(assert (not b!287323))

(assert (not b!287327))

(check-sat)

