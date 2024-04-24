; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48200 () Bool)

(assert start!48200)

(declare-fun b!530697 () Bool)

(declare-fun res!326461 () Bool)

(declare-fun e!309149 () Bool)

(assert (=> b!530697 (=> (not res!326461) (not e!309149))))

(declare-datatypes ((array!33624 0))(
  ( (array!33625 (arr!16158 (Array (_ BitVec 32) (_ BitVec 64))) (size!16522 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33624)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530697 (= res!326461 (validKeyInArray!0 (select (arr!16158 a!3154) j!147)))))

(declare-fun b!530698 () Bool)

(declare-fun res!326459 () Bool)

(assert (=> b!530698 (=> (not res!326459) (not e!309149))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!530698 (= res!326459 (validKeyInArray!0 k!1998))))

(declare-fun b!530699 () Bool)

(declare-fun res!326457 () Bool)

(assert (=> b!530699 (=> (not res!326457) (not e!309149))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530699 (= res!326457 (and (= (size!16522 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16522 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16522 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!326458 () Bool)

(assert (=> start!48200 (=> (not res!326458) (not e!309149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48200 (= res!326458 (validMask!0 mask!3216))))

(assert (=> start!48200 e!309149))

(assert (=> start!48200 true))

(declare-fun array_inv!12017 (array!33624) Bool)

(assert (=> start!48200 (array_inv!12017 a!3154)))

(declare-fun b!530700 () Bool)

(declare-fun res!326460 () Bool)

(assert (=> b!530700 (=> (not res!326460) (not e!309149))))

(declare-fun arrayContainsKey!0 (array!33624 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530700 (= res!326460 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530701 () Bool)

(assert (=> b!530701 (= e!309149 false)))

(declare-datatypes ((SeekEntryResult!4572 0))(
  ( (MissingZero!4572 (index!20512 (_ BitVec 32))) (Found!4572 (index!20513 (_ BitVec 32))) (Intermediate!4572 (undefined!5384 Bool) (index!20514 (_ BitVec 32)) (x!49639 (_ BitVec 32))) (Undefined!4572) (MissingVacant!4572 (index!20515 (_ BitVec 32))) )
))
(declare-fun lt!244804 () SeekEntryResult!4572)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33624 (_ BitVec 32)) SeekEntryResult!4572)

(assert (=> b!530701 (= lt!244804 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(assert (= (and start!48200 res!326458) b!530699))

(assert (= (and b!530699 res!326457) b!530697))

(assert (= (and b!530697 res!326461) b!530698))

(assert (= (and b!530698 res!326459) b!530700))

(assert (= (and b!530700 res!326460) b!530701))

(declare-fun m!511493 () Bool)

(assert (=> b!530701 m!511493))

(declare-fun m!511495 () Bool)

(assert (=> b!530697 m!511495))

(assert (=> b!530697 m!511495))

(declare-fun m!511497 () Bool)

(assert (=> b!530697 m!511497))

(declare-fun m!511499 () Bool)

(assert (=> start!48200 m!511499))

(declare-fun m!511501 () Bool)

(assert (=> start!48200 m!511501))

(declare-fun m!511503 () Bool)

(assert (=> b!530700 m!511503))

(declare-fun m!511505 () Bool)

(assert (=> b!530698 m!511505))

(push 1)

(assert (not b!530698))

(assert (not start!48200))

(assert (not b!530701))

(assert (not b!530700))

(assert (not b!530697))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

