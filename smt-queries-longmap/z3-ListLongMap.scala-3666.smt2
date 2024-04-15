; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50600 () Bool)

(assert start!50600)

(declare-fun b!552823 () Bool)

(declare-fun res!345378 () Bool)

(declare-fun e!318918 () Bool)

(assert (=> b!552823 (=> (not res!345378) (not e!318918))))

(declare-datatypes ((array!34834 0))(
  ( (array!34835 (arr!16727 (Array (_ BitVec 32) (_ BitVec 64))) (size!17092 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34834)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34834 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552823 (= res!345378 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!552824 () Bool)

(declare-fun e!318921 () Bool)

(declare-datatypes ((SeekEntryResult!5173 0))(
  ( (MissingZero!5173 (index!22919 (_ BitVec 32))) (Found!5173 (index!22920 (_ BitVec 32))) (Intermediate!5173 (undefined!5985 Bool) (index!22921 (_ BitVec 32)) (x!51858 (_ BitVec 32))) (Undefined!5173) (MissingVacant!5173 (index!22922 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34834 (_ BitVec 32)) SeekEntryResult!5173)

(assert (=> b!552824 (= e!318921 (= (seekEntryOrOpen!0 (select (arr!16727 a!3118) j!142) a!3118 mask!3119) (Found!5173 j!142)))))

(declare-fun b!552825 () Bool)

(declare-fun res!345379 () Bool)

(assert (=> b!552825 (=> (not res!345379) (not e!318918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552825 (= res!345379 (validKeyInArray!0 k0!1914))))

(declare-fun b!552826 () Bool)

(declare-fun res!345384 () Bool)

(declare-fun e!318920 () Bool)

(assert (=> b!552826 (=> (not res!345384) (not e!318920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34834 (_ BitVec 32)) Bool)

(assert (=> b!552826 (= res!345384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552827 () Bool)

(declare-fun res!345386 () Bool)

(assert (=> b!552827 (=> (not res!345386) (not e!318918))))

(assert (=> b!552827 (= res!345386 (validKeyInArray!0 (select (arr!16727 a!3118) j!142)))))

(declare-fun res!345383 () Bool)

(assert (=> start!50600 (=> (not res!345383) (not e!318918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50600 (= res!345383 (validMask!0 mask!3119))))

(assert (=> start!50600 e!318918))

(assert (=> start!50600 true))

(declare-fun array_inv!12610 (array!34834) Bool)

(assert (=> start!50600 (array_inv!12610 a!3118)))

(declare-fun b!552828 () Bool)

(assert (=> b!552828 (= e!318920 (not true))))

(assert (=> b!552828 e!318921))

(declare-fun res!345382 () Bool)

(assert (=> b!552828 (=> (not res!345382) (not e!318921))))

(assert (=> b!552828 (= res!345382 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17106 0))(
  ( (Unit!17107) )
))
(declare-fun lt!251131 () Unit!17106)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34834 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17106)

(assert (=> b!552828 (= lt!251131 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552829 () Bool)

(declare-fun res!345377 () Bool)

(assert (=> b!552829 (=> (not res!345377) (not e!318918))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!552829 (= res!345377 (and (= (size!17092 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17092 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17092 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552830 () Bool)

(declare-fun res!345385 () Bool)

(assert (=> b!552830 (=> (not res!345385) (not e!318920))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34834 (_ BitVec 32)) SeekEntryResult!5173)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552830 (= res!345385 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16727 a!3118) j!142) mask!3119) (select (arr!16727 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16727 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16727 a!3118) i!1132 k0!1914) j!142) (array!34835 (store (arr!16727 a!3118) i!1132 k0!1914) (size!17092 a!3118)) mask!3119)))))

(declare-fun b!552831 () Bool)

(declare-fun res!345381 () Bool)

(assert (=> b!552831 (=> (not res!345381) (not e!318920))))

(declare-datatypes ((List!10846 0))(
  ( (Nil!10843) (Cons!10842 (h!11827 (_ BitVec 64)) (t!17065 List!10846)) )
))
(declare-fun arrayNoDuplicates!0 (array!34834 (_ BitVec 32) List!10846) Bool)

(assert (=> b!552831 (= res!345381 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10843))))

(declare-fun b!552832 () Bool)

(assert (=> b!552832 (= e!318918 e!318920)))

(declare-fun res!345380 () Bool)

(assert (=> b!552832 (=> (not res!345380) (not e!318920))))

(declare-fun lt!251130 () SeekEntryResult!5173)

(assert (=> b!552832 (= res!345380 (or (= lt!251130 (MissingZero!5173 i!1132)) (= lt!251130 (MissingVacant!5173 i!1132))))))

(assert (=> b!552832 (= lt!251130 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!50600 res!345383) b!552829))

(assert (= (and b!552829 res!345377) b!552827))

(assert (= (and b!552827 res!345386) b!552825))

(assert (= (and b!552825 res!345379) b!552823))

(assert (= (and b!552823 res!345378) b!552832))

(assert (= (and b!552832 res!345380) b!552826))

(assert (= (and b!552826 res!345384) b!552831))

(assert (= (and b!552831 res!345381) b!552830))

(assert (= (and b!552830 res!345385) b!552828))

(assert (= (and b!552828 res!345382) b!552824))

(declare-fun m!529337 () Bool)

(assert (=> b!552823 m!529337))

(declare-fun m!529339 () Bool)

(assert (=> b!552825 m!529339))

(declare-fun m!529341 () Bool)

(assert (=> b!552831 m!529341))

(declare-fun m!529343 () Bool)

(assert (=> b!552824 m!529343))

(assert (=> b!552824 m!529343))

(declare-fun m!529345 () Bool)

(assert (=> b!552824 m!529345))

(declare-fun m!529347 () Bool)

(assert (=> b!552828 m!529347))

(declare-fun m!529349 () Bool)

(assert (=> b!552828 m!529349))

(assert (=> b!552827 m!529343))

(assert (=> b!552827 m!529343))

(declare-fun m!529351 () Bool)

(assert (=> b!552827 m!529351))

(declare-fun m!529353 () Bool)

(assert (=> b!552832 m!529353))

(declare-fun m!529355 () Bool)

(assert (=> start!50600 m!529355))

(declare-fun m!529357 () Bool)

(assert (=> start!50600 m!529357))

(assert (=> b!552830 m!529343))

(declare-fun m!529359 () Bool)

(assert (=> b!552830 m!529359))

(assert (=> b!552830 m!529343))

(declare-fun m!529361 () Bool)

(assert (=> b!552830 m!529361))

(declare-fun m!529363 () Bool)

(assert (=> b!552830 m!529363))

(assert (=> b!552830 m!529361))

(declare-fun m!529365 () Bool)

(assert (=> b!552830 m!529365))

(assert (=> b!552830 m!529359))

(assert (=> b!552830 m!529343))

(declare-fun m!529367 () Bool)

(assert (=> b!552830 m!529367))

(declare-fun m!529369 () Bool)

(assert (=> b!552830 m!529369))

(assert (=> b!552830 m!529361))

(assert (=> b!552830 m!529363))

(declare-fun m!529371 () Bool)

(assert (=> b!552826 m!529371))

(check-sat (not b!552824) (not b!552827) (not b!552823) (not b!552830) (not b!552826) (not b!552831) (not b!552828) (not b!552825) (not start!50600) (not b!552832))
(check-sat)
