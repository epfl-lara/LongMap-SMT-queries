; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50606 () Bool)

(assert start!50606)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!552913 () Bool)

(declare-datatypes ((array!34840 0))(
  ( (array!34841 (arr!16730 (Array (_ BitVec 32) (_ BitVec 64))) (size!17095 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34840)

(declare-fun e!318956 () Bool)

(declare-datatypes ((SeekEntryResult!5176 0))(
  ( (MissingZero!5176 (index!22931 (_ BitVec 32))) (Found!5176 (index!22932 (_ BitVec 32))) (Intermediate!5176 (undefined!5988 Bool) (index!22933 (_ BitVec 32)) (x!51869 (_ BitVec 32))) (Undefined!5176) (MissingVacant!5176 (index!22934 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34840 (_ BitVec 32)) SeekEntryResult!5176)

(assert (=> b!552913 (= e!318956 (= (seekEntryOrOpen!0 (select (arr!16730 a!3118) j!142) a!3118 mask!3119) (Found!5176 j!142)))))

(declare-fun res!345468 () Bool)

(declare-fun e!318960 () Bool)

(assert (=> start!50606 (=> (not res!345468) (not e!318960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50606 (= res!345468 (validMask!0 mask!3119))))

(assert (=> start!50606 e!318960))

(assert (=> start!50606 true))

(declare-fun array_inv!12613 (array!34840) Bool)

(assert (=> start!50606 (array_inv!12613 a!3118)))

(declare-fun b!552914 () Bool)

(declare-fun res!345472 () Bool)

(assert (=> b!552914 (=> (not res!345472) (not e!318960))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!552914 (= res!345472 (and (= (size!17095 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17095 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17095 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552915 () Bool)

(declare-fun e!318958 () Bool)

(declare-fun e!318959 () Bool)

(assert (=> b!552915 (= e!318958 e!318959)))

(declare-fun res!345469 () Bool)

(assert (=> b!552915 (=> (not res!345469) (not e!318959))))

(declare-fun lt!251157 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!251158 () SeekEntryResult!5176)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34840 (_ BitVec 32)) SeekEntryResult!5176)

(assert (=> b!552915 (= res!345469 (= lt!251158 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251157 (select (store (arr!16730 a!3118) i!1132 k0!1914) j!142) (array!34841 (store (arr!16730 a!3118) i!1132 k0!1914) (size!17095 a!3118)) mask!3119)))))

(declare-fun lt!251155 () (_ BitVec 32))

(assert (=> b!552915 (= lt!251158 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251155 (select (arr!16730 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552915 (= lt!251157 (toIndex!0 (select (store (arr!16730 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!552915 (= lt!251155 (toIndex!0 (select (arr!16730 a!3118) j!142) mask!3119))))

(declare-fun b!552916 () Bool)

(declare-fun res!345473 () Bool)

(assert (=> b!552916 (=> (not res!345473) (not e!318958))))

(declare-datatypes ((List!10849 0))(
  ( (Nil!10846) (Cons!10845 (h!11830 (_ BitVec 64)) (t!17068 List!10849)) )
))
(declare-fun arrayNoDuplicates!0 (array!34840 (_ BitVec 32) List!10849) Bool)

(assert (=> b!552916 (= res!345473 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10846))))

(declare-fun b!552917 () Bool)

(assert (=> b!552917 (= e!318960 e!318958)))

(declare-fun res!345470 () Bool)

(assert (=> b!552917 (=> (not res!345470) (not e!318958))))

(declare-fun lt!251154 () SeekEntryResult!5176)

(assert (=> b!552917 (= res!345470 (or (= lt!251154 (MissingZero!5176 i!1132)) (= lt!251154 (MissingVacant!5176 i!1132))))))

(assert (=> b!552917 (= lt!251154 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!552918 () Bool)

(declare-fun res!345476 () Bool)

(assert (=> b!552918 (=> (not res!345476) (not e!318960))))

(declare-fun arrayContainsKey!0 (array!34840 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552918 (= res!345476 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552919 () Bool)

(declare-fun res!345467 () Bool)

(assert (=> b!552919 (=> (not res!345467) (not e!318960))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552919 (= res!345467 (validKeyInArray!0 (select (arr!16730 a!3118) j!142)))))

(declare-fun b!552920 () Bool)

(declare-fun res!345471 () Bool)

(assert (=> b!552920 (=> (not res!345471) (not e!318960))))

(assert (=> b!552920 (= res!345471 (validKeyInArray!0 k0!1914))))

(declare-fun b!552921 () Bool)

(declare-fun res!345475 () Bool)

(assert (=> b!552921 (=> (not res!345475) (not e!318958))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34840 (_ BitVec 32)) Bool)

(assert (=> b!552921 (= res!345475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552922 () Bool)

(get-info :version)

(assert (=> b!552922 (= e!318959 (not (or (not ((_ is Intermediate!5176) lt!251158)) (not (undefined!5988 lt!251158)) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(assert (=> b!552922 e!318956))

(declare-fun res!345474 () Bool)

(assert (=> b!552922 (=> (not res!345474) (not e!318956))))

(assert (=> b!552922 (= res!345474 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17112 0))(
  ( (Unit!17113) )
))
(declare-fun lt!251156 () Unit!17112)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34840 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17112)

(assert (=> b!552922 (= lt!251156 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50606 res!345468) b!552914))

(assert (= (and b!552914 res!345472) b!552919))

(assert (= (and b!552919 res!345467) b!552920))

(assert (= (and b!552920 res!345471) b!552918))

(assert (= (and b!552918 res!345476) b!552917))

(assert (= (and b!552917 res!345470) b!552921))

(assert (= (and b!552921 res!345475) b!552916))

(assert (= (and b!552916 res!345473) b!552915))

(assert (= (and b!552915 res!345469) b!552922))

(assert (= (and b!552922 res!345474) b!552913))

(declare-fun m!529445 () Bool)

(assert (=> b!552920 m!529445))

(declare-fun m!529447 () Bool)

(assert (=> b!552918 m!529447))

(declare-fun m!529449 () Bool)

(assert (=> start!50606 m!529449))

(declare-fun m!529451 () Bool)

(assert (=> start!50606 m!529451))

(declare-fun m!529453 () Bool)

(assert (=> b!552921 m!529453))

(declare-fun m!529455 () Bool)

(assert (=> b!552913 m!529455))

(assert (=> b!552913 m!529455))

(declare-fun m!529457 () Bool)

(assert (=> b!552913 m!529457))

(assert (=> b!552915 m!529455))

(declare-fun m!529459 () Bool)

(assert (=> b!552915 m!529459))

(assert (=> b!552915 m!529455))

(declare-fun m!529461 () Bool)

(assert (=> b!552915 m!529461))

(assert (=> b!552915 m!529461))

(declare-fun m!529463 () Bool)

(assert (=> b!552915 m!529463))

(assert (=> b!552915 m!529455))

(declare-fun m!529465 () Bool)

(assert (=> b!552915 m!529465))

(declare-fun m!529467 () Bool)

(assert (=> b!552915 m!529467))

(assert (=> b!552915 m!529461))

(declare-fun m!529469 () Bool)

(assert (=> b!552915 m!529469))

(declare-fun m!529471 () Bool)

(assert (=> b!552916 m!529471))

(declare-fun m!529473 () Bool)

(assert (=> b!552917 m!529473))

(assert (=> b!552919 m!529455))

(assert (=> b!552919 m!529455))

(declare-fun m!529475 () Bool)

(assert (=> b!552919 m!529475))

(declare-fun m!529477 () Bool)

(assert (=> b!552922 m!529477))

(declare-fun m!529479 () Bool)

(assert (=> b!552922 m!529479))

(check-sat (not b!552920) (not b!552918) (not b!552921) (not b!552913) (not b!552922) (not b!552917) (not b!552916) (not b!552919) (not start!50606) (not b!552915))
(check-sat)
