; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50240 () Bool)

(assert start!50240)

(declare-fun b!549957 () Bool)

(declare-fun e!317527 () Bool)

(assert (=> b!549957 (= e!317527 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((array!34693 0))(
  ( (array!34694 (arr!16662 (Array (_ BitVec 32) (_ BitVec 64))) (size!17026 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34693)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34693 (_ BitVec 32)) Bool)

(assert (=> b!549957 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!16996 0))(
  ( (Unit!16997) )
))
(declare-fun lt!250380 () Unit!16996)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34693 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16996)

(assert (=> b!549957 (= lt!250380 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!549958 () Bool)

(declare-fun res!343109 () Bool)

(declare-fun e!317529 () Bool)

(assert (=> b!549958 (=> (not res!343109) (not e!317529))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549958 (= res!343109 (validKeyInArray!0 (select (arr!16662 a!3118) j!142)))))

(declare-fun b!549960 () Bool)

(declare-fun res!343106 () Bool)

(assert (=> b!549960 (=> (not res!343106) (not e!317529))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549960 (= res!343106 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549961 () Bool)

(declare-fun res!343102 () Bool)

(assert (=> b!549961 (=> (not res!343102) (not e!317527))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5111 0))(
  ( (MissingZero!5111 (index!22671 (_ BitVec 32))) (Found!5111 (index!22672 (_ BitVec 32))) (Intermediate!5111 (undefined!5923 Bool) (index!22673 (_ BitVec 32)) (x!51601 (_ BitVec 32))) (Undefined!5111) (MissingVacant!5111 (index!22674 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34693 (_ BitVec 32)) SeekEntryResult!5111)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549961 (= res!343102 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16662 a!3118) j!142) mask!3119) (select (arr!16662 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16662 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16662 a!3118) i!1132 k!1914) j!142) (array!34694 (store (arr!16662 a!3118) i!1132 k!1914) (size!17026 a!3118)) mask!3119)))))

(declare-fun b!549962 () Bool)

(assert (=> b!549962 (= e!317529 e!317527)))

(declare-fun res!343104 () Bool)

(assert (=> b!549962 (=> (not res!343104) (not e!317527))))

(declare-fun lt!250381 () SeekEntryResult!5111)

(assert (=> b!549962 (= res!343104 (or (= lt!250381 (MissingZero!5111 i!1132)) (= lt!250381 (MissingVacant!5111 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34693 (_ BitVec 32)) SeekEntryResult!5111)

(assert (=> b!549962 (= lt!250381 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!549963 () Bool)

(declare-fun res!343103 () Bool)

(assert (=> b!549963 (=> (not res!343103) (not e!317527))))

(declare-datatypes ((List!10742 0))(
  ( (Nil!10739) (Cons!10738 (h!11711 (_ BitVec 64)) (t!16970 List!10742)) )
))
(declare-fun arrayNoDuplicates!0 (array!34693 (_ BitVec 32) List!10742) Bool)

(assert (=> b!549963 (= res!343103 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10739))))

(declare-fun b!549959 () Bool)

(declare-fun res!343107 () Bool)

(assert (=> b!549959 (=> (not res!343107) (not e!317529))))

(assert (=> b!549959 (= res!343107 (and (= (size!17026 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17026 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17026 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!343105 () Bool)

(assert (=> start!50240 (=> (not res!343105) (not e!317529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50240 (= res!343105 (validMask!0 mask!3119))))

(assert (=> start!50240 e!317529))

(assert (=> start!50240 true))

(declare-fun array_inv!12458 (array!34693) Bool)

(assert (=> start!50240 (array_inv!12458 a!3118)))

(declare-fun b!549964 () Bool)

(declare-fun res!343101 () Bool)

(assert (=> b!549964 (=> (not res!343101) (not e!317527))))

(assert (=> b!549964 (= res!343101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549965 () Bool)

(declare-fun res!343108 () Bool)

(assert (=> b!549965 (=> (not res!343108) (not e!317529))))

(assert (=> b!549965 (= res!343108 (validKeyInArray!0 k!1914))))

(assert (= (and start!50240 res!343105) b!549959))

(assert (= (and b!549959 res!343107) b!549958))

(assert (= (and b!549958 res!343109) b!549965))

(assert (= (and b!549965 res!343108) b!549960))

(assert (= (and b!549960 res!343106) b!549962))

(assert (= (and b!549962 res!343104) b!549964))

(assert (= (and b!549964 res!343101) b!549963))

(assert (= (and b!549963 res!343103) b!549961))

(assert (= (and b!549961 res!343102) b!549957))

(declare-fun m!526935 () Bool)

(assert (=> start!50240 m!526935))

(declare-fun m!526937 () Bool)

(assert (=> start!50240 m!526937))

(declare-fun m!526939 () Bool)

(assert (=> b!549961 m!526939))

(declare-fun m!526941 () Bool)

(assert (=> b!549961 m!526941))

(assert (=> b!549961 m!526939))

(declare-fun m!526943 () Bool)

(assert (=> b!549961 m!526943))

(declare-fun m!526945 () Bool)

(assert (=> b!549961 m!526945))

(assert (=> b!549961 m!526943))

(declare-fun m!526947 () Bool)

(assert (=> b!549961 m!526947))

(assert (=> b!549961 m!526941))

(assert (=> b!549961 m!526939))

(declare-fun m!526949 () Bool)

(assert (=> b!549961 m!526949))

(declare-fun m!526951 () Bool)

(assert (=> b!549961 m!526951))

(assert (=> b!549961 m!526943))

(assert (=> b!549961 m!526945))

(declare-fun m!526953 () Bool)

(assert (=> b!549962 m!526953))

(declare-fun m!526955 () Bool)

(assert (=> b!549963 m!526955))

(declare-fun m!526957 () Bool)

(assert (=> b!549960 m!526957))

(declare-fun m!526959 () Bool)

(assert (=> b!549957 m!526959))

(declare-fun m!526961 () Bool)

(assert (=> b!549957 m!526961))

(declare-fun m!526963 () Bool)

(assert (=> b!549965 m!526963))

(declare-fun m!526965 () Bool)

(assert (=> b!549964 m!526965))

(assert (=> b!549958 m!526939))

(assert (=> b!549958 m!526939))

(declare-fun m!526967 () Bool)

(assert (=> b!549958 m!526967))

(push 1)

