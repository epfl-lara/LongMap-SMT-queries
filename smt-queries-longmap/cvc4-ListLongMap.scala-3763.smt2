; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51620 () Bool)

(assert start!51620)

(declare-fun b!564550 () Bool)

(declare-fun res!355600 () Bool)

(declare-fun e!325215 () Bool)

(assert (=> b!564550 (=> (not res!355600) (not e!325215))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564550 (= res!355600 (validKeyInArray!0 k!1914))))

(declare-fun b!564551 () Bool)

(declare-fun res!355599 () Bool)

(declare-fun e!325214 () Bool)

(assert (=> b!564551 (=> (not res!355599) (not e!325214))))

(declare-datatypes ((array!35432 0))(
  ( (array!35433 (arr!17015 (Array (_ BitVec 32) (_ BitVec 64))) (size!17379 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35432)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35432 (_ BitVec 32)) Bool)

(assert (=> b!564551 (= res!355599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564552 () Bool)

(declare-fun res!355603 () Bool)

(assert (=> b!564552 (=> (not res!355603) (not e!325215))))

(declare-fun arrayContainsKey!0 (array!35432 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564552 (= res!355603 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564553 () Bool)

(assert (=> b!564553 (= e!325214 false)))

(declare-fun lt!257620 () Bool)

(declare-datatypes ((List!11002 0))(
  ( (Nil!10999) (Cons!10998 (h!12004 (_ BitVec 64)) (t!17222 List!11002)) )
))
(declare-fun arrayNoDuplicates!0 (array!35432 (_ BitVec 32) List!11002) Bool)

(assert (=> b!564553 (= lt!257620 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10999))))

(declare-fun b!564554 () Bool)

(declare-fun res!355602 () Bool)

(assert (=> b!564554 (=> (not res!355602) (not e!325215))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!564554 (= res!355602 (validKeyInArray!0 (select (arr!17015 a!3118) j!142)))))

(declare-fun b!564555 () Bool)

(declare-fun res!355597 () Bool)

(assert (=> b!564555 (=> (not res!355597) (not e!325215))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564555 (= res!355597 (and (= (size!17379 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17379 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17379 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!355601 () Bool)

(assert (=> start!51620 (=> (not res!355601) (not e!325215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51620 (= res!355601 (validMask!0 mask!3119))))

(assert (=> start!51620 e!325215))

(assert (=> start!51620 true))

(declare-fun array_inv!12874 (array!35432) Bool)

(assert (=> start!51620 (array_inv!12874 a!3118)))

(declare-fun b!564556 () Bool)

(assert (=> b!564556 (= e!325215 e!325214)))

(declare-fun res!355598 () Bool)

(assert (=> b!564556 (=> (not res!355598) (not e!325214))))

(declare-datatypes ((SeekEntryResult!5420 0))(
  ( (MissingZero!5420 (index!23907 (_ BitVec 32))) (Found!5420 (index!23908 (_ BitVec 32))) (Intermediate!5420 (undefined!6232 Bool) (index!23909 (_ BitVec 32)) (x!52934 (_ BitVec 32))) (Undefined!5420) (MissingVacant!5420 (index!23910 (_ BitVec 32))) )
))
(declare-fun lt!257619 () SeekEntryResult!5420)

(assert (=> b!564556 (= res!355598 (or (= lt!257619 (MissingZero!5420 i!1132)) (= lt!257619 (MissingVacant!5420 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35432 (_ BitVec 32)) SeekEntryResult!5420)

(assert (=> b!564556 (= lt!257619 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!51620 res!355601) b!564555))

(assert (= (and b!564555 res!355597) b!564554))

(assert (= (and b!564554 res!355602) b!564550))

(assert (= (and b!564550 res!355600) b!564552))

(assert (= (and b!564552 res!355603) b!564556))

(assert (= (and b!564556 res!355598) b!564551))

(assert (= (and b!564551 res!355599) b!564553))

(declare-fun m!543119 () Bool)

(assert (=> b!564554 m!543119))

(assert (=> b!564554 m!543119))

(declare-fun m!543121 () Bool)

(assert (=> b!564554 m!543121))

(declare-fun m!543123 () Bool)

(assert (=> b!564551 m!543123))

(declare-fun m!543125 () Bool)

(assert (=> b!564550 m!543125))

(declare-fun m!543127 () Bool)

(assert (=> b!564552 m!543127))

(declare-fun m!543129 () Bool)

(assert (=> start!51620 m!543129))

(declare-fun m!543131 () Bool)

(assert (=> start!51620 m!543131))

(declare-fun m!543133 () Bool)

(assert (=> b!564556 m!543133))

(declare-fun m!543135 () Bool)

(assert (=> b!564553 m!543135))

(push 1)

(assert (not b!564556))

(assert (not start!51620))

(assert (not b!564550))

(assert (not b!564551))

(assert (not b!564552))

(assert (not b!564554))

(assert (not b!564553))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

