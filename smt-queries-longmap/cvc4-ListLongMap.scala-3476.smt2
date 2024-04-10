; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48202 () Bool)

(assert start!48202)

(declare-fun b!530713 () Bool)

(declare-fun e!309171 () Bool)

(assert (=> b!530713 (= e!309171 false)))

(declare-datatypes ((SeekEntryResult!4618 0))(
  ( (MissingZero!4618 (index!20696 (_ BitVec 32))) (Found!4618 (index!20697 (_ BitVec 32))) (Intermediate!4618 (undefined!5430 Bool) (index!20698 (_ BitVec 32)) (x!49680 (_ BitVec 32))) (Undefined!4618) (MissingVacant!4618 (index!20699 (_ BitVec 32))) )
))
(declare-fun lt!244783 () SeekEntryResult!4618)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((array!33627 0))(
  ( (array!33628 (arr!16160 (Array (_ BitVec 32) (_ BitVec 64))) (size!16524 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33627)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33627 (_ BitVec 32)) SeekEntryResult!4618)

(assert (=> b!530713 (= lt!244783 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!530714 () Bool)

(declare-fun res!326422 () Bool)

(assert (=> b!530714 (=> (not res!326422) (not e!309171))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530714 (= res!326422 (and (= (size!16524 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16524 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16524 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530715 () Bool)

(declare-fun res!326420 () Bool)

(assert (=> b!530715 (=> (not res!326420) (not e!309171))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530715 (= res!326420 (validKeyInArray!0 k!1998))))

(declare-fun b!530716 () Bool)

(declare-fun res!326423 () Bool)

(assert (=> b!530716 (=> (not res!326423) (not e!309171))))

(assert (=> b!530716 (= res!326423 (validKeyInArray!0 (select (arr!16160 a!3154) j!147)))))

(declare-fun b!530717 () Bool)

(declare-fun res!326421 () Bool)

(assert (=> b!530717 (=> (not res!326421) (not e!309171))))

(declare-fun arrayContainsKey!0 (array!33627 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530717 (= res!326421 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun res!326419 () Bool)

(assert (=> start!48202 (=> (not res!326419) (not e!309171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48202 (= res!326419 (validMask!0 mask!3216))))

(assert (=> start!48202 e!309171))

(assert (=> start!48202 true))

(declare-fun array_inv!11956 (array!33627) Bool)

(assert (=> start!48202 (array_inv!11956 a!3154)))

(assert (= (and start!48202 res!326419) b!530714))

(assert (= (and b!530714 res!326422) b!530716))

(assert (= (and b!530716 res!326423) b!530715))

(assert (= (and b!530715 res!326420) b!530717))

(assert (= (and b!530717 res!326421) b!530713))

(declare-fun m!511267 () Bool)

(assert (=> b!530717 m!511267))

(declare-fun m!511269 () Bool)

(assert (=> b!530716 m!511269))

(assert (=> b!530716 m!511269))

(declare-fun m!511271 () Bool)

(assert (=> b!530716 m!511271))

(declare-fun m!511273 () Bool)

(assert (=> b!530713 m!511273))

(declare-fun m!511275 () Bool)

(assert (=> b!530715 m!511275))

(declare-fun m!511277 () Bool)

(assert (=> start!48202 m!511277))

(declare-fun m!511279 () Bool)

(assert (=> start!48202 m!511279))

(push 1)

(assert (not b!530717))

(assert (not b!530716))

(assert (not start!48202))

(assert (not b!530715))

(assert (not b!530713))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

