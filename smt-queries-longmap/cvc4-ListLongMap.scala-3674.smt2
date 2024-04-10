; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50664 () Bool)

(assert start!50664)

(declare-fun b!553883 () Bool)

(declare-fun res!346296 () Bool)

(declare-fun e!319442 () Bool)

(assert (=> b!553883 (=> (not res!346296) (not e!319442))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34889 0))(
  ( (array!34890 (arr!16754 (Array (_ BitVec 32) (_ BitVec 64))) (size!17118 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34889)

(declare-datatypes ((SeekEntryResult!5203 0))(
  ( (MissingZero!5203 (index!23039 (_ BitVec 32))) (Found!5203 (index!23040 (_ BitVec 32))) (Intermediate!5203 (undefined!6015 Bool) (index!23041 (_ BitVec 32)) (x!51957 (_ BitVec 32))) (Undefined!5203) (MissingVacant!5203 (index!23042 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34889 (_ BitVec 32)) SeekEntryResult!5203)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553883 (= res!346296 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16754 a!3118) j!142) mask!3119) (select (arr!16754 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16754 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16754 a!3118) i!1132 k!1914) j!142) (array!34890 (store (arr!16754 a!3118) i!1132 k!1914) (size!17118 a!3118)) mask!3119)))))

(declare-fun b!553884 () Bool)

(declare-fun res!346303 () Bool)

(declare-fun e!319440 () Bool)

(assert (=> b!553884 (=> (not res!346303) (not e!319440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553884 (= res!346303 (validKeyInArray!0 (select (arr!16754 a!3118) j!142)))))

(declare-fun e!319441 () Bool)

(declare-fun b!553885 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34889 (_ BitVec 32)) SeekEntryResult!5203)

(assert (=> b!553885 (= e!319441 (= (seekEntryOrOpen!0 (select (arr!16754 a!3118) j!142) a!3118 mask!3119) (Found!5203 j!142)))))

(declare-fun b!553886 () Bool)

(declare-fun res!346299 () Bool)

(assert (=> b!553886 (=> (not res!346299) (not e!319440))))

(assert (=> b!553886 (= res!346299 (validKeyInArray!0 k!1914))))

(declare-fun b!553887 () Bool)

(declare-fun res!346295 () Bool)

(assert (=> b!553887 (=> (not res!346295) (not e!319442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34889 (_ BitVec 32)) Bool)

(assert (=> b!553887 (= res!346295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553889 () Bool)

(assert (=> b!553889 (= e!319442 (not true))))

(assert (=> b!553889 e!319441))

(declare-fun res!346302 () Bool)

(assert (=> b!553889 (=> (not res!346302) (not e!319441))))

(assert (=> b!553889 (= res!346302 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17180 0))(
  ( (Unit!17181) )
))
(declare-fun lt!251601 () Unit!17180)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34889 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17180)

(assert (=> b!553889 (= lt!251601 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553890 () Bool)

(declare-fun res!346297 () Bool)

(assert (=> b!553890 (=> (not res!346297) (not e!319442))))

(declare-datatypes ((List!10834 0))(
  ( (Nil!10831) (Cons!10830 (h!11815 (_ BitVec 64)) (t!17062 List!10834)) )
))
(declare-fun arrayNoDuplicates!0 (array!34889 (_ BitVec 32) List!10834) Bool)

(assert (=> b!553890 (= res!346297 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10831))))

(declare-fun b!553891 () Bool)

(declare-fun res!346301 () Bool)

(assert (=> b!553891 (=> (not res!346301) (not e!319440))))

(declare-fun arrayContainsKey!0 (array!34889 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553891 (= res!346301 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553892 () Bool)

(declare-fun res!346298 () Bool)

(assert (=> b!553892 (=> (not res!346298) (not e!319440))))

(assert (=> b!553892 (= res!346298 (and (= (size!17118 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17118 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17118 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!346300 () Bool)

(assert (=> start!50664 (=> (not res!346300) (not e!319440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50664 (= res!346300 (validMask!0 mask!3119))))

(assert (=> start!50664 e!319440))

(assert (=> start!50664 true))

(declare-fun array_inv!12550 (array!34889) Bool)

(assert (=> start!50664 (array_inv!12550 a!3118)))

(declare-fun b!553888 () Bool)

(assert (=> b!553888 (= e!319440 e!319442)))

(declare-fun res!346304 () Bool)

(assert (=> b!553888 (=> (not res!346304) (not e!319442))))

(declare-fun lt!251602 () SeekEntryResult!5203)

(assert (=> b!553888 (= res!346304 (or (= lt!251602 (MissingZero!5203 i!1132)) (= lt!251602 (MissingVacant!5203 i!1132))))))

(assert (=> b!553888 (= lt!251602 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!50664 res!346300) b!553892))

(assert (= (and b!553892 res!346298) b!553884))

(assert (= (and b!553884 res!346303) b!553886))

(assert (= (and b!553886 res!346299) b!553891))

(assert (= (and b!553891 res!346301) b!553888))

(assert (= (and b!553888 res!346304) b!553887))

(assert (= (and b!553887 res!346295) b!553890))

(assert (= (and b!553890 res!346297) b!553883))

(assert (= (and b!553883 res!346296) b!553889))

(assert (= (and b!553889 res!346302) b!553885))

(declare-fun m!531057 () Bool)

(assert (=> b!553889 m!531057))

(declare-fun m!531059 () Bool)

(assert (=> b!553889 m!531059))

(declare-fun m!531061 () Bool)

(assert (=> b!553886 m!531061))

(declare-fun m!531063 () Bool)

(assert (=> b!553883 m!531063))

(declare-fun m!531065 () Bool)

(assert (=> b!553883 m!531065))

(assert (=> b!553883 m!531063))

(declare-fun m!531067 () Bool)

(assert (=> b!553883 m!531067))

(declare-fun m!531069 () Bool)

(assert (=> b!553883 m!531069))

(assert (=> b!553883 m!531067))

(declare-fun m!531071 () Bool)

(assert (=> b!553883 m!531071))

(assert (=> b!553883 m!531065))

(assert (=> b!553883 m!531063))

(declare-fun m!531073 () Bool)

(assert (=> b!553883 m!531073))

(declare-fun m!531075 () Bool)

(assert (=> b!553883 m!531075))

(assert (=> b!553883 m!531067))

(assert (=> b!553883 m!531069))

(declare-fun m!531077 () Bool)

(assert (=> b!553888 m!531077))

(assert (=> b!553885 m!531063))

(assert (=> b!553885 m!531063))

(declare-fun m!531079 () Bool)

(assert (=> b!553885 m!531079))

(declare-fun m!531081 () Bool)

(assert (=> b!553891 m!531081))

(declare-fun m!531083 () Bool)

(assert (=> start!50664 m!531083))

(declare-fun m!531085 () Bool)

(assert (=> start!50664 m!531085))

(declare-fun m!531087 () Bool)

(assert (=> b!553890 m!531087))

(assert (=> b!553884 m!531063))

(assert (=> b!553884 m!531063))

(declare-fun m!531089 () Bool)

(assert (=> b!553884 m!531089))

(declare-fun m!531091 () Bool)

(assert (=> b!553887 m!531091))

(push 1)

