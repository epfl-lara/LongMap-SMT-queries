; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85724 () Bool)

(assert start!85724)

(declare-fun res!665236 () Bool)

(declare-fun e!561334 () Bool)

(assert (=> start!85724 (=> (not res!665236) (not e!561334))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85724 (= res!665236 (validMask!0 mask!3464))))

(assert (=> start!85724 e!561334))

(declare-datatypes ((array!62930 0))(
  ( (array!62931 (arr!30304 (Array (_ BitVec 32) (_ BitVec 64))) (size!30806 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62930)

(declare-fun array_inv!23428 (array!62930) Bool)

(assert (=> start!85724 (array_inv!23428 a!3219)))

(assert (=> start!85724 true))

(declare-fun b!994727 () Bool)

(declare-fun res!665234 () Bool)

(assert (=> b!994727 (=> (not res!665234) (not e!561334))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994727 (= res!665234 (validKeyInArray!0 k!2224))))

(declare-fun b!994728 () Bool)

(declare-fun res!665238 () Bool)

(assert (=> b!994728 (=> (not res!665238) (not e!561334))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994728 (= res!665238 (and (= (size!30806 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30806 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30806 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994729 () Bool)

(declare-fun res!665235 () Bool)

(assert (=> b!994729 (=> (not res!665235) (not e!561334))))

(assert (=> b!994729 (= res!665235 (validKeyInArray!0 (select (arr!30304 a!3219) j!170)))))

(declare-fun b!994730 () Bool)

(declare-fun res!665237 () Bool)

(assert (=> b!994730 (=> (not res!665237) (not e!561334))))

(declare-fun arrayContainsKey!0 (array!62930 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994730 (= res!665237 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994731 () Bool)

(assert (=> b!994731 (= e!561334 false)))

(declare-datatypes ((SeekEntryResult!9236 0))(
  ( (MissingZero!9236 (index!39315 (_ BitVec 32))) (Found!9236 (index!39316 (_ BitVec 32))) (Intermediate!9236 (undefined!10048 Bool) (index!39317 (_ BitVec 32)) (x!86765 (_ BitVec 32))) (Undefined!9236) (MissingVacant!9236 (index!39318 (_ BitVec 32))) )
))
(declare-fun lt!440753 () SeekEntryResult!9236)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62930 (_ BitVec 32)) SeekEntryResult!9236)

(assert (=> b!994731 (= lt!440753 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!85724 res!665236) b!994728))

(assert (= (and b!994728 res!665238) b!994729))

(assert (= (and b!994729 res!665235) b!994727))

(assert (= (and b!994727 res!665234) b!994730))

(assert (= (and b!994730 res!665237) b!994731))

(declare-fun m!922277 () Bool)

(assert (=> b!994729 m!922277))

(assert (=> b!994729 m!922277))

(declare-fun m!922279 () Bool)

(assert (=> b!994729 m!922279))

(declare-fun m!922281 () Bool)

(assert (=> b!994731 m!922281))

(declare-fun m!922283 () Bool)

(assert (=> start!85724 m!922283))

(declare-fun m!922285 () Bool)

(assert (=> start!85724 m!922285))

(declare-fun m!922287 () Bool)

(assert (=> b!994727 m!922287))

(declare-fun m!922289 () Bool)

(assert (=> b!994730 m!922289))

(push 1)

(assert (not b!994731))

(assert (not b!994727))

(assert (not start!85724))

(assert (not b!994729))

(assert (not b!994730))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

