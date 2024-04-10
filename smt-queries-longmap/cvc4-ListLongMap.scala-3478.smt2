; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48214 () Bool)

(assert start!48214)

(declare-fun b!530803 () Bool)

(declare-fun res!326513 () Bool)

(declare-fun e!309206 () Bool)

(assert (=> b!530803 (=> (not res!326513) (not e!309206))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530803 (= res!326513 (validKeyInArray!0 k!1998))))

(declare-fun b!530804 () Bool)

(declare-fun res!326512 () Bool)

(assert (=> b!530804 (=> (not res!326512) (not e!309206))))

(declare-datatypes ((array!33639 0))(
  ( (array!33640 (arr!16166 (Array (_ BitVec 32) (_ BitVec 64))) (size!16530 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33639)

(declare-fun arrayContainsKey!0 (array!33639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530804 (= res!326512 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun res!326509 () Bool)

(assert (=> start!48214 (=> (not res!326509) (not e!309206))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48214 (= res!326509 (validMask!0 mask!3216))))

(assert (=> start!48214 e!309206))

(assert (=> start!48214 true))

(declare-fun array_inv!11962 (array!33639) Bool)

(assert (=> start!48214 (array_inv!11962 a!3154)))

(declare-fun b!530805 () Bool)

(assert (=> b!530805 (= e!309206 false)))

(declare-datatypes ((SeekEntryResult!4624 0))(
  ( (MissingZero!4624 (index!20720 (_ BitVec 32))) (Found!4624 (index!20721 (_ BitVec 32))) (Intermediate!4624 (undefined!5436 Bool) (index!20722 (_ BitVec 32)) (x!49702 (_ BitVec 32))) (Undefined!4624) (MissingVacant!4624 (index!20723 (_ BitVec 32))) )
))
(declare-fun lt!244801 () SeekEntryResult!4624)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33639 (_ BitVec 32)) SeekEntryResult!4624)

(assert (=> b!530805 (= lt!244801 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!530806 () Bool)

(declare-fun res!326511 () Bool)

(assert (=> b!530806 (=> (not res!326511) (not e!309206))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530806 (= res!326511 (and (= (size!16530 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16530 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16530 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530807 () Bool)

(declare-fun res!326510 () Bool)

(assert (=> b!530807 (=> (not res!326510) (not e!309206))))

(assert (=> b!530807 (= res!326510 (validKeyInArray!0 (select (arr!16166 a!3154) j!147)))))

(assert (= (and start!48214 res!326509) b!530806))

(assert (= (and b!530806 res!326511) b!530807))

(assert (= (and b!530807 res!326510) b!530803))

(assert (= (and b!530803 res!326513) b!530804))

(assert (= (and b!530804 res!326512) b!530805))

(declare-fun m!511351 () Bool)

(assert (=> b!530805 m!511351))

(declare-fun m!511353 () Bool)

(assert (=> b!530804 m!511353))

(declare-fun m!511355 () Bool)

(assert (=> b!530803 m!511355))

(declare-fun m!511357 () Bool)

(assert (=> b!530807 m!511357))

(assert (=> b!530807 m!511357))

(declare-fun m!511359 () Bool)

(assert (=> b!530807 m!511359))

(declare-fun m!511361 () Bool)

(assert (=> start!48214 m!511361))

(declare-fun m!511363 () Bool)

(assert (=> start!48214 m!511363))

(push 1)

(assert (not start!48214))

(assert (not b!530804))

(assert (not b!530805))

(assert (not b!530803))

(assert (not b!530807))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

