; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48174 () Bool)

(assert start!48174)

(declare-fun b!530315 () Bool)

(declare-fun res!326165 () Bool)

(declare-fun e!308948 () Bool)

(assert (=> b!530315 (=> (not res!326165) (not e!308948))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(declare-datatypes ((array!33609 0))(
  ( (array!33610 (arr!16151 (Array (_ BitVec 32) (_ BitVec 64))) (size!16516 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33609)

(declare-datatypes ((SeekEntryResult!4606 0))(
  ( (MissingZero!4606 (index!20648 (_ BitVec 32))) (Found!4606 (index!20649 (_ BitVec 32))) (Intermediate!4606 (undefined!5418 Bool) (index!20650 (_ BitVec 32)) (x!49647 (_ BitVec 32))) (Undefined!4606) (MissingVacant!4606 (index!20651 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33609 (_ BitVec 32)) SeekEntryResult!4606)

(assert (=> b!530315 (= res!326165 (not (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) (MissingZero!4606 i!1153))))))

(declare-fun b!530316 () Bool)

(assert (=> b!530316 (= e!308948 (bvslt mask!3216 #b00000000000000000000000000000000))))

(declare-fun b!530318 () Bool)

(declare-fun res!326164 () Bool)

(assert (=> b!530318 (=> (not res!326164) (not e!308948))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!530318 (= res!326164 (and (= (size!16516 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16516 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16516 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530319 () Bool)

(declare-fun res!326167 () Bool)

(assert (=> b!530319 (=> (not res!326167) (not e!308948))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530319 (= res!326167 (validKeyInArray!0 k0!1998))))

(declare-fun b!530320 () Bool)

(declare-fun res!326168 () Bool)

(assert (=> b!530320 (=> (not res!326168) (not e!308948))))

(declare-fun arrayContainsKey!0 (array!33609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530320 (= res!326168 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530317 () Bool)

(declare-fun res!326166 () Bool)

(assert (=> b!530317 (=> (not res!326166) (not e!308948))))

(assert (=> b!530317 (= res!326166 (validKeyInArray!0 (select (arr!16151 a!3154) j!147)))))

(declare-fun res!326163 () Bool)

(assert (=> start!48174 (=> (not res!326163) (not e!308948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48174 (= res!326163 (validMask!0 mask!3216))))

(assert (=> start!48174 e!308948))

(assert (=> start!48174 true))

(declare-fun array_inv!12034 (array!33609) Bool)

(assert (=> start!48174 (array_inv!12034 a!3154)))

(assert (= (and start!48174 res!326163) b!530318))

(assert (= (and b!530318 res!326164) b!530317))

(assert (= (and b!530317 res!326166) b!530319))

(assert (= (and b!530319 res!326167) b!530320))

(assert (= (and b!530320 res!326168) b!530315))

(assert (= (and b!530315 res!326165) b!530316))

(declare-fun m!510403 () Bool)

(assert (=> start!48174 m!510403))

(declare-fun m!510405 () Bool)

(assert (=> start!48174 m!510405))

(declare-fun m!510407 () Bool)

(assert (=> b!530319 m!510407))

(declare-fun m!510409 () Bool)

(assert (=> b!530320 m!510409))

(declare-fun m!510411 () Bool)

(assert (=> b!530315 m!510411))

(declare-fun m!510413 () Bool)

(assert (=> b!530317 m!510413))

(assert (=> b!530317 m!510413))

(declare-fun m!510415 () Bool)

(assert (=> b!530317 m!510415))

(check-sat (not b!530317) (not start!48174) (not b!530320) (not b!530319) (not b!530315))
(check-sat)
