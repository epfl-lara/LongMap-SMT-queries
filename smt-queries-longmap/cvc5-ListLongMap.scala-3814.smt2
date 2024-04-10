; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52304 () Bool)

(assert start!52304)

(declare-fun b!570820 () Bool)

(declare-fun e!328295 () Bool)

(declare-fun e!328292 () Bool)

(assert (=> b!570820 (= e!328295 e!328292)))

(declare-fun res!360604 () Bool)

(assert (=> b!570820 (=> res!360604 e!328292)))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5621 0))(
  ( (MissingZero!5621 (index!24711 (_ BitVec 32))) (Found!5621 (index!24712 (_ BitVec 32))) (Intermediate!5621 (undefined!6433 Bool) (index!24713 (_ BitVec 32)) (x!53585 (_ BitVec 32))) (Undefined!5621) (MissingVacant!5621 (index!24714 (_ BitVec 32))) )
))
(declare-fun lt!260242 () SeekEntryResult!5621)

(declare-datatypes ((array!35764 0))(
  ( (array!35765 (arr!17172 (Array (_ BitVec 32) (_ BitVec 64))) (size!17536 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35764)

(assert (=> b!570820 (= res!360604 (or (undefined!6433 lt!260242) (not (is-Intermediate!5621 lt!260242)) (= (select (arr!17172 a!3118) (index!24713 lt!260242)) (select (arr!17172 a!3118) j!142)) (= (select (arr!17172 a!3118) (index!24713 lt!260242)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!570821 () Bool)

(declare-fun e!328291 () Bool)

(declare-fun e!328296 () Bool)

(assert (=> b!570821 (= e!328291 e!328296)))

(declare-fun res!360607 () Bool)

(assert (=> b!570821 (=> (not res!360607) (not e!328296))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun lt!260240 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35764 (_ BitVec 32)) SeekEntryResult!5621)

(assert (=> b!570821 (= res!360607 (= lt!260242 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260240 (select (store (arr!17172 a!3118) i!1132 k!1914) j!142) (array!35765 (store (arr!17172 a!3118) i!1132 k!1914) (size!17536 a!3118)) mask!3119)))))

(declare-fun lt!260245 () (_ BitVec 32))

(assert (=> b!570821 (= lt!260242 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260245 (select (arr!17172 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570821 (= lt!260240 (toIndex!0 (select (store (arr!17172 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!570821 (= lt!260245 (toIndex!0 (select (arr!17172 a!3118) j!142) mask!3119))))

(declare-fun b!570823 () Bool)

(declare-fun res!360602 () Bool)

(declare-fun e!328294 () Bool)

(assert (=> b!570823 (=> (not res!360602) (not e!328294))))

(assert (=> b!570823 (= res!360602 (and (= (size!17536 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17536 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17536 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570824 () Bool)

(declare-fun res!360603 () Bool)

(assert (=> b!570824 (=> (not res!360603) (not e!328291))))

(declare-datatypes ((List!11252 0))(
  ( (Nil!11249) (Cons!11248 (h!12272 (_ BitVec 64)) (t!17480 List!11252)) )
))
(declare-fun arrayNoDuplicates!0 (array!35764 (_ BitVec 32) List!11252) Bool)

(assert (=> b!570824 (= res!360603 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11249))))

(declare-fun b!570825 () Bool)

(assert (=> b!570825 (= e!328296 (not true))))

(assert (=> b!570825 e!328295))

(declare-fun res!360605 () Bool)

(assert (=> b!570825 (=> (not res!360605) (not e!328295))))

(declare-fun lt!260241 () SeekEntryResult!5621)

(assert (=> b!570825 (= res!360605 (= lt!260241 (Found!5621 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35764 (_ BitVec 32)) SeekEntryResult!5621)

(assert (=> b!570825 (= lt!260241 (seekEntryOrOpen!0 (select (arr!17172 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35764 (_ BitVec 32)) Bool)

(assert (=> b!570825 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17944 0))(
  ( (Unit!17945) )
))
(declare-fun lt!260244 () Unit!17944)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35764 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17944)

(assert (=> b!570825 (= lt!260244 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570826 () Bool)

(declare-fun res!360606 () Bool)

(assert (=> b!570826 (=> (not res!360606) (not e!328291))))

(assert (=> b!570826 (= res!360606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570822 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35764 (_ BitVec 32)) SeekEntryResult!5621)

(assert (=> b!570822 (= e!328292 (= lt!260241 (seekKeyOrZeroReturnVacant!0 (x!53585 lt!260242) (index!24713 lt!260242) (index!24713 lt!260242) (select (arr!17172 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun res!360609 () Bool)

(assert (=> start!52304 (=> (not res!360609) (not e!328294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52304 (= res!360609 (validMask!0 mask!3119))))

(assert (=> start!52304 e!328294))

(assert (=> start!52304 true))

(declare-fun array_inv!12968 (array!35764) Bool)

(assert (=> start!52304 (array_inv!12968 a!3118)))

(declare-fun b!570827 () Bool)

(declare-fun res!360610 () Bool)

(assert (=> b!570827 (=> (not res!360610) (not e!328294))))

(declare-fun arrayContainsKey!0 (array!35764 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570827 (= res!360610 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570828 () Bool)

(declare-fun res!360608 () Bool)

(assert (=> b!570828 (=> (not res!360608) (not e!328294))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570828 (= res!360608 (validKeyInArray!0 (select (arr!17172 a!3118) j!142)))))

(declare-fun b!570829 () Bool)

(declare-fun res!360611 () Bool)

(assert (=> b!570829 (=> (not res!360611) (not e!328294))))

(assert (=> b!570829 (= res!360611 (validKeyInArray!0 k!1914))))

(declare-fun b!570830 () Bool)

(assert (=> b!570830 (= e!328294 e!328291)))

(declare-fun res!360601 () Bool)

(assert (=> b!570830 (=> (not res!360601) (not e!328291))))

(declare-fun lt!260243 () SeekEntryResult!5621)

(assert (=> b!570830 (= res!360601 (or (= lt!260243 (MissingZero!5621 i!1132)) (= lt!260243 (MissingVacant!5621 i!1132))))))

(assert (=> b!570830 (= lt!260243 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!52304 res!360609) b!570823))

(assert (= (and b!570823 res!360602) b!570828))

(assert (= (and b!570828 res!360608) b!570829))

(assert (= (and b!570829 res!360611) b!570827))

(assert (= (and b!570827 res!360610) b!570830))

(assert (= (and b!570830 res!360601) b!570826))

(assert (= (and b!570826 res!360606) b!570824))

(assert (= (and b!570824 res!360603) b!570821))

(assert (= (and b!570821 res!360607) b!570825))

(assert (= (and b!570825 res!360605) b!570820))

(assert (= (and b!570820 (not res!360604)) b!570822))

(declare-fun m!549729 () Bool)

(assert (=> b!570827 m!549729))

(declare-fun m!549731 () Bool)

(assert (=> start!52304 m!549731))

(declare-fun m!549733 () Bool)

(assert (=> start!52304 m!549733))

(declare-fun m!549735 () Bool)

(assert (=> b!570828 m!549735))

(assert (=> b!570828 m!549735))

(declare-fun m!549737 () Bool)

(assert (=> b!570828 m!549737))

(assert (=> b!570821 m!549735))

(declare-fun m!549739 () Bool)

(assert (=> b!570821 m!549739))

(assert (=> b!570821 m!549735))

(declare-fun m!549741 () Bool)

(assert (=> b!570821 m!549741))

(assert (=> b!570821 m!549735))

(declare-fun m!549743 () Bool)

(assert (=> b!570821 m!549743))

(declare-fun m!549745 () Bool)

(assert (=> b!570821 m!549745))

(assert (=> b!570821 m!549743))

(declare-fun m!549747 () Bool)

(assert (=> b!570821 m!549747))

(assert (=> b!570821 m!549743))

(declare-fun m!549749 () Bool)

(assert (=> b!570821 m!549749))

(declare-fun m!549751 () Bool)

(assert (=> b!570829 m!549751))

(declare-fun m!549753 () Bool)

(assert (=> b!570830 m!549753))

(declare-fun m!549755 () Bool)

(assert (=> b!570820 m!549755))

(assert (=> b!570820 m!549735))

(assert (=> b!570825 m!549735))

(assert (=> b!570825 m!549735))

(declare-fun m!549757 () Bool)

(assert (=> b!570825 m!549757))

(declare-fun m!549759 () Bool)

(assert (=> b!570825 m!549759))

(declare-fun m!549761 () Bool)

(assert (=> b!570825 m!549761))

(declare-fun m!549763 () Bool)

(assert (=> b!570824 m!549763))

(assert (=> b!570822 m!549735))

(assert (=> b!570822 m!549735))

(declare-fun m!549765 () Bool)

(assert (=> b!570822 m!549765))

(declare-fun m!549767 () Bool)

(assert (=> b!570826 m!549767))

(push 1)

