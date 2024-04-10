; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85734 () Bool)

(assert start!85734)

(declare-fun b!994802 () Bool)

(declare-fun res!665311 () Bool)

(declare-fun e!561364 () Bool)

(assert (=> b!994802 (=> (not res!665311) (not e!561364))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994802 (= res!665311 (validKeyInArray!0 k!2224))))

(declare-fun b!994803 () Bool)

(declare-fun res!665312 () Bool)

(assert (=> b!994803 (=> (not res!665312) (not e!561364))))

(declare-datatypes ((array!62940 0))(
  ( (array!62941 (arr!30309 (Array (_ BitVec 32) (_ BitVec 64))) (size!30811 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62940)

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!994803 (= res!665312 (validKeyInArray!0 (select (arr!30309 a!3219) j!170)))))

(declare-fun res!665310 () Bool)

(assert (=> start!85734 (=> (not res!665310) (not e!561364))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85734 (= res!665310 (validMask!0 mask!3464))))

(assert (=> start!85734 e!561364))

(declare-fun array_inv!23433 (array!62940) Bool)

(assert (=> start!85734 (array_inv!23433 a!3219)))

(assert (=> start!85734 true))

(declare-fun b!994804 () Bool)

(assert (=> b!994804 (= e!561364 false)))

(declare-datatypes ((SeekEntryResult!9241 0))(
  ( (MissingZero!9241 (index!39335 (_ BitVec 32))) (Found!9241 (index!39336 (_ BitVec 32))) (Intermediate!9241 (undefined!10053 Bool) (index!39337 (_ BitVec 32)) (x!86778 (_ BitVec 32))) (Undefined!9241) (MissingVacant!9241 (index!39338 (_ BitVec 32))) )
))
(declare-fun lt!440768 () SeekEntryResult!9241)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62940 (_ BitVec 32)) SeekEntryResult!9241)

(assert (=> b!994804 (= lt!440768 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!994805 () Bool)

(declare-fun res!665309 () Bool)

(assert (=> b!994805 (=> (not res!665309) (not e!561364))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994805 (= res!665309 (and (= (size!30811 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30811 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30811 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994806 () Bool)

(declare-fun res!665313 () Bool)

(assert (=> b!994806 (=> (not res!665313) (not e!561364))))

(declare-fun arrayContainsKey!0 (array!62940 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994806 (= res!665313 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!85734 res!665310) b!994805))

(assert (= (and b!994805 res!665309) b!994803))

(assert (= (and b!994803 res!665312) b!994802))

(assert (= (and b!994802 res!665311) b!994806))

(assert (= (and b!994806 res!665313) b!994804))

(declare-fun m!922347 () Bool)

(assert (=> b!994802 m!922347))

(declare-fun m!922349 () Bool)

(assert (=> b!994804 m!922349))

(declare-fun m!922351 () Bool)

(assert (=> start!85734 m!922351))

(declare-fun m!922353 () Bool)

(assert (=> start!85734 m!922353))

(declare-fun m!922355 () Bool)

(assert (=> b!994803 m!922355))

(assert (=> b!994803 m!922355))

(declare-fun m!922357 () Bool)

(assert (=> b!994803 m!922357))

(declare-fun m!922359 () Bool)

(assert (=> b!994806 m!922359))

(push 1)

(assert (not b!994802))

(assert (not b!994806))

(assert (not b!994804))

(assert (not b!994803))

(assert (not start!85734))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

