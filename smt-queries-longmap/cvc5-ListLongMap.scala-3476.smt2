; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48194 () Bool)

(assert start!48194)

(declare-fun res!326413 () Bool)

(declare-fun e!309131 () Bool)

(assert (=> start!48194 (=> (not res!326413) (not e!309131))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48194 (= res!326413 (validMask!0 mask!3216))))

(assert (=> start!48194 e!309131))

(assert (=> start!48194 true))

(declare-datatypes ((array!33618 0))(
  ( (array!33619 (arr!16155 (Array (_ BitVec 32) (_ BitVec 64))) (size!16519 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33618)

(declare-fun array_inv!12014 (array!33618) Bool)

(assert (=> start!48194 (array_inv!12014 a!3154)))

(declare-fun b!530652 () Bool)

(declare-fun res!326415 () Bool)

(assert (=> b!530652 (=> (not res!326415) (not e!309131))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33618 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530652 (= res!326415 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530653 () Bool)

(assert (=> b!530653 (= e!309131 false)))

(declare-datatypes ((SeekEntryResult!4569 0))(
  ( (MissingZero!4569 (index!20500 (_ BitVec 32))) (Found!4569 (index!20501 (_ BitVec 32))) (Intermediate!4569 (undefined!5381 Bool) (index!20502 (_ BitVec 32)) (x!49628 (_ BitVec 32))) (Undefined!4569) (MissingVacant!4569 (index!20503 (_ BitVec 32))) )
))
(declare-fun lt!244795 () SeekEntryResult!4569)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33618 (_ BitVec 32)) SeekEntryResult!4569)

(assert (=> b!530653 (= lt!244795 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!530654 () Bool)

(declare-fun res!326412 () Bool)

(assert (=> b!530654 (=> (not res!326412) (not e!309131))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530654 (= res!326412 (validKeyInArray!0 k!1998))))

(declare-fun b!530655 () Bool)

(declare-fun res!326414 () Bool)

(assert (=> b!530655 (=> (not res!326414) (not e!309131))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!530655 (= res!326414 (validKeyInArray!0 (select (arr!16155 a!3154) j!147)))))

(declare-fun b!530656 () Bool)

(declare-fun res!326416 () Bool)

(assert (=> b!530656 (=> (not res!326416) (not e!309131))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530656 (= res!326416 (and (= (size!16519 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16519 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16519 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48194 res!326413) b!530656))

(assert (= (and b!530656 res!326416) b!530655))

(assert (= (and b!530655 res!326414) b!530654))

(assert (= (and b!530654 res!326412) b!530652))

(assert (= (and b!530652 res!326415) b!530653))

(declare-fun m!511451 () Bool)

(assert (=> b!530652 m!511451))

(declare-fun m!511453 () Bool)

(assert (=> b!530655 m!511453))

(assert (=> b!530655 m!511453))

(declare-fun m!511455 () Bool)

(assert (=> b!530655 m!511455))

(declare-fun m!511457 () Bool)

(assert (=> start!48194 m!511457))

(declare-fun m!511459 () Bool)

(assert (=> start!48194 m!511459))

(declare-fun m!511461 () Bool)

(assert (=> b!530653 m!511461))

(declare-fun m!511463 () Bool)

(assert (=> b!530654 m!511463))

(push 1)

(assert (not b!530653))

(assert (not b!530654))

(assert (not b!530652))

(assert (not start!48194))

(assert (not b!530655))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

