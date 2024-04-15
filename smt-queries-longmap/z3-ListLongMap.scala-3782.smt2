; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51734 () Bool)

(assert start!51734)

(declare-fun b!565912 () Bool)

(declare-fun e!325684 () Bool)

(assert (=> b!565912 (= e!325684 (not true))))

(declare-fun e!325683 () Bool)

(assert (=> b!565912 e!325683))

(declare-fun res!357028 () Bool)

(assert (=> b!565912 (=> (not res!357028) (not e!325683))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35551 0))(
  ( (array!35552 (arr!17075 (Array (_ BitVec 32) (_ BitVec 64))) (size!17440 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35551)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35551 (_ BitVec 32)) Bool)

(assert (=> b!565912 (= res!357028 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17730 0))(
  ( (Unit!17731) )
))
(declare-fun lt!257803 () Unit!17730)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35551 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17730)

(assert (=> b!565912 (= lt!257803 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565913 () Bool)

(declare-fun e!325685 () Bool)

(assert (=> b!565913 (= e!325685 e!325684)))

(declare-fun res!357026 () Bool)

(assert (=> b!565913 (=> (not res!357026) (not e!325684))))

(declare-datatypes ((SeekEntryResult!5521 0))(
  ( (MissingZero!5521 (index!24311 (_ BitVec 32))) (Found!5521 (index!24312 (_ BitVec 32))) (Intermediate!5521 (undefined!6333 Bool) (index!24313 (_ BitVec 32)) (x!53185 (_ BitVec 32))) (Undefined!5521) (MissingVacant!5521 (index!24314 (_ BitVec 32))) )
))
(declare-fun lt!257802 () SeekEntryResult!5521)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!565913 (= res!357026 (or (= lt!257802 (MissingZero!5521 i!1132)) (= lt!257802 (MissingVacant!5521 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35551 (_ BitVec 32)) SeekEntryResult!5521)

(assert (=> b!565913 (= lt!257802 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!565914 () Bool)

(declare-fun res!357030 () Bool)

(assert (=> b!565914 (=> (not res!357030) (not e!325685))))

(declare-fun arrayContainsKey!0 (array!35551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565914 (= res!357030 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565915 () Bool)

(assert (=> b!565915 (= e!325683 (= (seekEntryOrOpen!0 (select (arr!17075 a!3118) j!142) a!3118 mask!3119) (Found!5521 j!142)))))

(declare-fun b!565916 () Bool)

(declare-fun res!357023 () Bool)

(assert (=> b!565916 (=> (not res!357023) (not e!325685))))

(assert (=> b!565916 (= res!357023 (and (= (size!17440 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17440 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17440 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565917 () Bool)

(declare-fun res!357032 () Bool)

(assert (=> b!565917 (=> (not res!357032) (not e!325685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565917 (= res!357032 (validKeyInArray!0 k0!1914))))

(declare-fun b!565918 () Bool)

(declare-fun res!357027 () Bool)

(assert (=> b!565918 (=> (not res!357027) (not e!325684))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35551 (_ BitVec 32)) SeekEntryResult!5521)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565918 (= res!357027 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17075 a!3118) j!142) mask!3119) (select (arr!17075 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17075 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17075 a!3118) i!1132 k0!1914) j!142) (array!35552 (store (arr!17075 a!3118) i!1132 k0!1914) (size!17440 a!3118)) mask!3119)))))

(declare-fun b!565919 () Bool)

(declare-fun res!357024 () Bool)

(assert (=> b!565919 (=> (not res!357024) (not e!325685))))

(assert (=> b!565919 (= res!357024 (validKeyInArray!0 (select (arr!17075 a!3118) j!142)))))

(declare-fun b!565920 () Bool)

(declare-fun res!357029 () Bool)

(assert (=> b!565920 (=> (not res!357029) (not e!325684))))

(declare-datatypes ((List!11194 0))(
  ( (Nil!11191) (Cons!11190 (h!12196 (_ BitVec 64)) (t!17413 List!11194)) )
))
(declare-fun arrayNoDuplicates!0 (array!35551 (_ BitVec 32) List!11194) Bool)

(assert (=> b!565920 (= res!357029 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11191))))

(declare-fun b!565921 () Bool)

(declare-fun res!357031 () Bool)

(assert (=> b!565921 (=> (not res!357031) (not e!325684))))

(assert (=> b!565921 (= res!357031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!357025 () Bool)

(assert (=> start!51734 (=> (not res!357025) (not e!325685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51734 (= res!357025 (validMask!0 mask!3119))))

(assert (=> start!51734 e!325685))

(assert (=> start!51734 true))

(declare-fun array_inv!12958 (array!35551) Bool)

(assert (=> start!51734 (array_inv!12958 a!3118)))

(assert (= (and start!51734 res!357025) b!565916))

(assert (= (and b!565916 res!357023) b!565919))

(assert (= (and b!565919 res!357024) b!565917))

(assert (= (and b!565917 res!357032) b!565914))

(assert (= (and b!565914 res!357030) b!565913))

(assert (= (and b!565913 res!357026) b!565921))

(assert (= (and b!565921 res!357031) b!565920))

(assert (= (and b!565920 res!357029) b!565918))

(assert (= (and b!565918 res!357027) b!565912))

(assert (= (and b!565912 res!357028) b!565915))

(declare-fun m!544019 () Bool)

(assert (=> b!565920 m!544019))

(declare-fun m!544021 () Bool)

(assert (=> start!51734 m!544021))

(declare-fun m!544023 () Bool)

(assert (=> start!51734 m!544023))

(declare-fun m!544025 () Bool)

(assert (=> b!565915 m!544025))

(assert (=> b!565915 m!544025))

(declare-fun m!544027 () Bool)

(assert (=> b!565915 m!544027))

(declare-fun m!544029 () Bool)

(assert (=> b!565917 m!544029))

(declare-fun m!544031 () Bool)

(assert (=> b!565912 m!544031))

(declare-fun m!544033 () Bool)

(assert (=> b!565912 m!544033))

(assert (=> b!565919 m!544025))

(assert (=> b!565919 m!544025))

(declare-fun m!544035 () Bool)

(assert (=> b!565919 m!544035))

(declare-fun m!544037 () Bool)

(assert (=> b!565921 m!544037))

(declare-fun m!544039 () Bool)

(assert (=> b!565913 m!544039))

(assert (=> b!565918 m!544025))

(declare-fun m!544041 () Bool)

(assert (=> b!565918 m!544041))

(assert (=> b!565918 m!544025))

(declare-fun m!544043 () Bool)

(assert (=> b!565918 m!544043))

(declare-fun m!544045 () Bool)

(assert (=> b!565918 m!544045))

(assert (=> b!565918 m!544043))

(declare-fun m!544047 () Bool)

(assert (=> b!565918 m!544047))

(assert (=> b!565918 m!544041))

(assert (=> b!565918 m!544025))

(declare-fun m!544049 () Bool)

(assert (=> b!565918 m!544049))

(declare-fun m!544051 () Bool)

(assert (=> b!565918 m!544051))

(assert (=> b!565918 m!544043))

(assert (=> b!565918 m!544045))

(declare-fun m!544053 () Bool)

(assert (=> b!565914 m!544053))

(check-sat (not b!565919) (not b!565915) (not b!565912) (not start!51734) (not b!565920) (not b!565913) (not b!565917) (not b!565921) (not b!565918) (not b!565914))
(check-sat)
