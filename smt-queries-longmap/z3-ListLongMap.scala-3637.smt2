; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50200 () Bool)

(assert start!50200)

(declare-fun b!549457 () Bool)

(declare-fun res!342606 () Bool)

(declare-fun e!317347 () Bool)

(assert (=> b!549457 (=> (not res!342606) (not e!317347))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549457 (= res!342606 (validKeyInArray!0 k0!1914))))

(declare-fun b!549458 () Bool)

(declare-fun res!342607 () Bool)

(declare-fun e!317348 () Bool)

(assert (=> b!549458 (=> (not res!342607) (not e!317348))))

(declare-datatypes ((array!34653 0))(
  ( (array!34654 (arr!16642 (Array (_ BitVec 32) (_ BitVec 64))) (size!17006 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34653)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34653 (_ BitVec 32)) Bool)

(assert (=> b!549458 (= res!342607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549459 () Bool)

(declare-fun res!342608 () Bool)

(assert (=> b!549459 (=> (not res!342608) (not e!317348))))

(declare-datatypes ((List!10722 0))(
  ( (Nil!10719) (Cons!10718 (h!11691 (_ BitVec 64)) (t!16950 List!10722)) )
))
(declare-fun arrayNoDuplicates!0 (array!34653 (_ BitVec 32) List!10722) Bool)

(assert (=> b!549459 (= res!342608 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10719))))

(declare-fun b!549460 () Bool)

(assert (=> b!549460 (= e!317347 e!317348)))

(declare-fun res!342605 () Bool)

(assert (=> b!549460 (=> (not res!342605) (not e!317348))))

(declare-datatypes ((SeekEntryResult!5091 0))(
  ( (MissingZero!5091 (index!22591 (_ BitVec 32))) (Found!5091 (index!22592 (_ BitVec 32))) (Intermediate!5091 (undefined!5903 Bool) (index!22593 (_ BitVec 32)) (x!51525 (_ BitVec 32))) (Undefined!5091) (MissingVacant!5091 (index!22594 (_ BitVec 32))) )
))
(declare-fun lt!250141 () SeekEntryResult!5091)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549460 (= res!342605 (or (= lt!250141 (MissingZero!5091 i!1132)) (= lt!250141 (MissingVacant!5091 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34653 (_ BitVec 32)) SeekEntryResult!5091)

(assert (=> b!549460 (= lt!250141 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549461 () Bool)

(declare-fun res!342604 () Bool)

(assert (=> b!549461 (=> (not res!342604) (not e!317347))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!549461 (= res!342604 (validKeyInArray!0 (select (arr!16642 a!3118) j!142)))))

(declare-fun res!342602 () Bool)

(assert (=> start!50200 (=> (not res!342602) (not e!317347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50200 (= res!342602 (validMask!0 mask!3119))))

(assert (=> start!50200 e!317347))

(assert (=> start!50200 true))

(declare-fun array_inv!12438 (array!34653) Bool)

(assert (=> start!50200 (array_inv!12438 a!3118)))

(declare-fun b!549462 () Bool)

(declare-fun res!342601 () Bool)

(assert (=> b!549462 (=> (not res!342601) (not e!317347))))

(declare-fun arrayContainsKey!0 (array!34653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549462 (= res!342601 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549463 () Bool)

(assert (=> b!549463 (= e!317348 false)))

(declare-fun lt!250142 () (_ BitVec 32))

(declare-fun lt!250144 () SeekEntryResult!5091)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34653 (_ BitVec 32)) SeekEntryResult!5091)

(assert (=> b!549463 (= lt!250144 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250142 (select (store (arr!16642 a!3118) i!1132 k0!1914) j!142) (array!34654 (store (arr!16642 a!3118) i!1132 k0!1914) (size!17006 a!3118)) mask!3119))))

(declare-fun lt!250143 () (_ BitVec 32))

(declare-fun lt!250140 () SeekEntryResult!5091)

(assert (=> b!549463 (= lt!250140 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250143 (select (arr!16642 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549463 (= lt!250142 (toIndex!0 (select (store (arr!16642 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!549463 (= lt!250143 (toIndex!0 (select (arr!16642 a!3118) j!142) mask!3119))))

(declare-fun b!549464 () Bool)

(declare-fun res!342603 () Bool)

(assert (=> b!549464 (=> (not res!342603) (not e!317347))))

(assert (=> b!549464 (= res!342603 (and (= (size!17006 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17006 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17006 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50200 res!342602) b!549464))

(assert (= (and b!549464 res!342603) b!549461))

(assert (= (and b!549461 res!342604) b!549457))

(assert (= (and b!549457 res!342606) b!549462))

(assert (= (and b!549462 res!342601) b!549460))

(assert (= (and b!549460 res!342605) b!549458))

(assert (= (and b!549458 res!342607) b!549459))

(assert (= (and b!549459 res!342608) b!549463))

(declare-fun m!526311 () Bool)

(assert (=> start!50200 m!526311))

(declare-fun m!526313 () Bool)

(assert (=> start!50200 m!526313))

(declare-fun m!526315 () Bool)

(assert (=> b!549457 m!526315))

(declare-fun m!526317 () Bool)

(assert (=> b!549458 m!526317))

(declare-fun m!526319 () Bool)

(assert (=> b!549459 m!526319))

(declare-fun m!526321 () Bool)

(assert (=> b!549461 m!526321))

(assert (=> b!549461 m!526321))

(declare-fun m!526323 () Bool)

(assert (=> b!549461 m!526323))

(declare-fun m!526325 () Bool)

(assert (=> b!549460 m!526325))

(declare-fun m!526327 () Bool)

(assert (=> b!549462 m!526327))

(assert (=> b!549463 m!526321))

(declare-fun m!526329 () Bool)

(assert (=> b!549463 m!526329))

(assert (=> b!549463 m!526321))

(declare-fun m!526331 () Bool)

(assert (=> b!549463 m!526331))

(assert (=> b!549463 m!526331))

(declare-fun m!526333 () Bool)

(assert (=> b!549463 m!526333))

(declare-fun m!526335 () Bool)

(assert (=> b!549463 m!526335))

(assert (=> b!549463 m!526321))

(declare-fun m!526337 () Bool)

(assert (=> b!549463 m!526337))

(assert (=> b!549463 m!526331))

(declare-fun m!526339 () Bool)

(assert (=> b!549463 m!526339))

(check-sat (not b!549461) (not b!549459) (not b!549462) (not b!549460) (not b!549458) (not b!549463) (not b!549457) (not start!50200))
(check-sat)
