; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48206 () Bool)

(assert start!48206)

(declare-fun res!326503 () Bool)

(declare-fun e!309168 () Bool)

(assert (=> start!48206 (=> (not res!326503) (not e!309168))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48206 (= res!326503 (validMask!0 mask!3216))))

(assert (=> start!48206 e!309168))

(assert (=> start!48206 true))

(declare-datatypes ((array!33630 0))(
  ( (array!33631 (arr!16161 (Array (_ BitVec 32) (_ BitVec 64))) (size!16525 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33630)

(declare-fun array_inv!12020 (array!33630) Bool)

(assert (=> start!48206 (array_inv!12020 a!3154)))

(declare-fun b!530742 () Bool)

(declare-fun res!326505 () Bool)

(assert (=> b!530742 (=> (not res!326505) (not e!309168))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530742 (= res!326505 (validKeyInArray!0 k!1998))))

(declare-fun b!530743 () Bool)

(declare-fun res!326502 () Bool)

(assert (=> b!530743 (=> (not res!326502) (not e!309168))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!530743 (= res!326502 (validKeyInArray!0 (select (arr!16161 a!3154) j!147)))))

(declare-fun b!530744 () Bool)

(declare-fun res!326504 () Bool)

(assert (=> b!530744 (=> (not res!326504) (not e!309168))))

(declare-fun arrayContainsKey!0 (array!33630 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530744 (= res!326504 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530745 () Bool)

(assert (=> b!530745 (= e!309168 false)))

(declare-datatypes ((SeekEntryResult!4575 0))(
  ( (MissingZero!4575 (index!20524 (_ BitVec 32))) (Found!4575 (index!20525 (_ BitVec 32))) (Intermediate!4575 (undefined!5387 Bool) (index!20526 (_ BitVec 32)) (x!49650 (_ BitVec 32))) (Undefined!4575) (MissingVacant!4575 (index!20527 (_ BitVec 32))) )
))
(declare-fun lt!244813 () SeekEntryResult!4575)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33630 (_ BitVec 32)) SeekEntryResult!4575)

(assert (=> b!530745 (= lt!244813 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!530746 () Bool)

(declare-fun res!326506 () Bool)

(assert (=> b!530746 (=> (not res!326506) (not e!309168))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530746 (= res!326506 (and (= (size!16525 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16525 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16525 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48206 res!326503) b!530746))

(assert (= (and b!530746 res!326506) b!530743))

(assert (= (and b!530743 res!326502) b!530742))

(assert (= (and b!530742 res!326505) b!530744))

(assert (= (and b!530744 res!326504) b!530745))

(declare-fun m!511535 () Bool)

(assert (=> start!48206 m!511535))

(declare-fun m!511537 () Bool)

(assert (=> start!48206 m!511537))

(declare-fun m!511539 () Bool)

(assert (=> b!530743 m!511539))

(assert (=> b!530743 m!511539))

(declare-fun m!511541 () Bool)

(assert (=> b!530743 m!511541))

(declare-fun m!511543 () Bool)

(assert (=> b!530745 m!511543))

(declare-fun m!511545 () Bool)

(assert (=> b!530742 m!511545))

(declare-fun m!511547 () Bool)

(assert (=> b!530744 m!511547))

(push 1)

(assert (not b!530744))

(assert (not b!530743))

(assert (not b!530742))

(assert (not b!530745))

(assert (not start!48206))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

