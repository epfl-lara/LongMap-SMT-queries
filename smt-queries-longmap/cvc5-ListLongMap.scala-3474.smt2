; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48186 () Bool)

(assert start!48186)

(declare-fun b!530586 () Bool)

(declare-fun e!309123 () Bool)

(declare-fun mask!3216 () (_ BitVec 32))

(assert (=> b!530586 (= e!309123 (bvslt mask!3216 #b00000000000000000000000000000000))))

(declare-fun res!326292 () Bool)

(assert (=> start!48186 (=> (not res!326292) (not e!309123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48186 (= res!326292 (validMask!0 mask!3216))))

(assert (=> start!48186 e!309123))

(assert (=> start!48186 true))

(declare-datatypes ((array!33611 0))(
  ( (array!33612 (arr!16152 (Array (_ BitVec 32) (_ BitVec 64))) (size!16516 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33611)

(declare-fun array_inv!11948 (array!33611) Bool)

(assert (=> start!48186 (array_inv!11948 a!3154)))

(declare-fun b!530587 () Bool)

(declare-fun res!326294 () Bool)

(assert (=> b!530587 (=> (not res!326294) (not e!309123))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530587 (= res!326294 (validKeyInArray!0 k!1998))))

(declare-fun b!530588 () Bool)

(declare-fun res!326296 () Bool)

(assert (=> b!530588 (=> (not res!326296) (not e!309123))))

(declare-fun arrayContainsKey!0 (array!33611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530588 (= res!326296 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530589 () Bool)

(declare-fun res!326297 () Bool)

(assert (=> b!530589 (=> (not res!326297) (not e!309123))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!530589 (= res!326297 (validKeyInArray!0 (select (arr!16152 a!3154) j!147)))))

(declare-fun b!530590 () Bool)

(declare-fun res!326295 () Bool)

(assert (=> b!530590 (=> (not res!326295) (not e!309123))))

(declare-fun i!1153 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4610 0))(
  ( (MissingZero!4610 (index!20664 (_ BitVec 32))) (Found!4610 (index!20665 (_ BitVec 32))) (Intermediate!4610 (undefined!5422 Bool) (index!20666 (_ BitVec 32)) (x!49656 (_ BitVec 32))) (Undefined!4610) (MissingVacant!4610 (index!20667 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33611 (_ BitVec 32)) SeekEntryResult!4610)

(assert (=> b!530590 (= res!326295 (not (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) (MissingZero!4610 i!1153))))))

(declare-fun b!530591 () Bool)

(declare-fun res!326293 () Bool)

(assert (=> b!530591 (=> (not res!326293) (not e!309123))))

(assert (=> b!530591 (= res!326293 (and (= (size!16516 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16516 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16516 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48186 res!326292) b!530591))

(assert (= (and b!530591 res!326293) b!530589))

(assert (= (and b!530589 res!326297) b!530587))

(assert (= (and b!530587 res!326294) b!530588))

(assert (= (and b!530588 res!326296) b!530590))

(assert (= (and b!530590 res!326295) b!530586))

(declare-fun m!511155 () Bool)

(assert (=> b!530590 m!511155))

(declare-fun m!511157 () Bool)

(assert (=> start!48186 m!511157))

(declare-fun m!511159 () Bool)

(assert (=> start!48186 m!511159))

(declare-fun m!511161 () Bool)

(assert (=> b!530588 m!511161))

(declare-fun m!511163 () Bool)

(assert (=> b!530587 m!511163))

(declare-fun m!511165 () Bool)

(assert (=> b!530589 m!511165))

(assert (=> b!530589 m!511165))

(declare-fun m!511167 () Bool)

(assert (=> b!530589 m!511167))

(push 1)

(assert (not b!530590))

(assert (not b!530588))

(assert (not b!530589))

(assert (not start!48186))

(assert (not b!530587))

