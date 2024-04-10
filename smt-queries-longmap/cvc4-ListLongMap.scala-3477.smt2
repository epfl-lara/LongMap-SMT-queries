; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48208 () Bool)

(assert start!48208)

(declare-fun b!530758 () Bool)

(declare-fun res!326464 () Bool)

(declare-fun e!309189 () Bool)

(assert (=> b!530758 (=> (not res!326464) (not e!309189))))

(declare-datatypes ((array!33633 0))(
  ( (array!33634 (arr!16163 (Array (_ BitVec 32) (_ BitVec 64))) (size!16527 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33633)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530758 (= res!326464 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530759 () Bool)

(declare-fun res!326466 () Bool)

(assert (=> b!530759 (=> (not res!326466) (not e!309189))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530759 (= res!326466 (and (= (size!16527 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16527 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16527 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530760 () Bool)

(declare-fun res!326467 () Bool)

(assert (=> b!530760 (=> (not res!326467) (not e!309189))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530760 (= res!326467 (validKeyInArray!0 k!1998))))

(declare-fun b!530761 () Bool)

(declare-fun res!326468 () Bool)

(assert (=> b!530761 (=> (not res!326468) (not e!309189))))

(assert (=> b!530761 (= res!326468 (validKeyInArray!0 (select (arr!16163 a!3154) j!147)))))

(declare-fun res!326465 () Bool)

(assert (=> start!48208 (=> (not res!326465) (not e!309189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48208 (= res!326465 (validMask!0 mask!3216))))

(assert (=> start!48208 e!309189))

(assert (=> start!48208 true))

(declare-fun array_inv!11959 (array!33633) Bool)

(assert (=> start!48208 (array_inv!11959 a!3154)))

(declare-fun b!530762 () Bool)

(assert (=> b!530762 (= e!309189 false)))

(declare-datatypes ((SeekEntryResult!4621 0))(
  ( (MissingZero!4621 (index!20708 (_ BitVec 32))) (Found!4621 (index!20709 (_ BitVec 32))) (Intermediate!4621 (undefined!5433 Bool) (index!20710 (_ BitVec 32)) (x!49691 (_ BitVec 32))) (Undefined!4621) (MissingVacant!4621 (index!20711 (_ BitVec 32))) )
))
(declare-fun lt!244792 () SeekEntryResult!4621)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33633 (_ BitVec 32)) SeekEntryResult!4621)

(assert (=> b!530762 (= lt!244792 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(assert (= (and start!48208 res!326465) b!530759))

(assert (= (and b!530759 res!326466) b!530761))

(assert (= (and b!530761 res!326468) b!530760))

(assert (= (and b!530760 res!326467) b!530758))

(assert (= (and b!530758 res!326464) b!530762))

(declare-fun m!511309 () Bool)

(assert (=> b!530758 m!511309))

(declare-fun m!511311 () Bool)

(assert (=> b!530761 m!511311))

(assert (=> b!530761 m!511311))

(declare-fun m!511313 () Bool)

(assert (=> b!530761 m!511313))

(declare-fun m!511315 () Bool)

(assert (=> start!48208 m!511315))

(declare-fun m!511317 () Bool)

(assert (=> start!48208 m!511317))

(declare-fun m!511319 () Bool)

(assert (=> b!530762 m!511319))

(declare-fun m!511321 () Bool)

(assert (=> b!530760 m!511321))

(push 1)

(assert (not b!530758))

(assert (not b!530760))

(assert (not b!530761))

(assert (not b!530762))

(assert (not start!48208))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

