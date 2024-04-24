; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51774 () Bool)

(assert start!51774)

(declare-fun b!566113 () Bool)

(declare-fun e!325879 () Bool)

(assert (=> b!566113 (= e!325879 (not true))))

(declare-fun e!325881 () Bool)

(assert (=> b!566113 e!325881))

(declare-fun res!356980 () Bool)

(assert (=> b!566113 (=> (not res!356980) (not e!325881))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35529 0))(
  ( (array!35530 (arr!17062 (Array (_ BitVec 32) (_ BitVec 64))) (size!17426 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35529)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35529 (_ BitVec 32)) Bool)

(assert (=> b!566113 (= res!356980 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17707 0))(
  ( (Unit!17708) )
))
(declare-fun lt!258093 () Unit!17707)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35529 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17707)

(assert (=> b!566113 (= lt!258093 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566114 () Bool)

(declare-fun res!356983 () Bool)

(assert (=> b!566114 (=> (not res!356983) (not e!325879))))

(assert (=> b!566114 (= res!356983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!566115 () Bool)

(declare-fun res!356977 () Bool)

(assert (=> b!566115 (=> (not res!356977) (not e!325879))))

(declare-datatypes ((List!11049 0))(
  ( (Nil!11046) (Cons!11045 (h!12054 (_ BitVec 64)) (t!17269 List!11049)) )
))
(declare-fun arrayNoDuplicates!0 (array!35529 (_ BitVec 32) List!11049) Bool)

(assert (=> b!566115 (= res!356977 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11046))))

(declare-fun b!566116 () Bool)

(declare-fun res!356982 () Bool)

(assert (=> b!566116 (=> (not res!356982) (not e!325879))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5467 0))(
  ( (MissingZero!5467 (index!24095 (_ BitVec 32))) (Found!5467 (index!24096 (_ BitVec 32))) (Intermediate!5467 (undefined!6279 Bool) (index!24097 (_ BitVec 32)) (x!53115 (_ BitVec 32))) (Undefined!5467) (MissingVacant!5467 (index!24098 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35529 (_ BitVec 32)) SeekEntryResult!5467)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566116 (= res!356982 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17062 a!3118) j!142) mask!3119) (select (arr!17062 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17062 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17062 a!3118) i!1132 k0!1914) j!142) (array!35530 (store (arr!17062 a!3118) i!1132 k0!1914) (size!17426 a!3118)) mask!3119)))))

(declare-fun b!566117 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35529 (_ BitVec 32)) SeekEntryResult!5467)

(assert (=> b!566117 (= e!325881 (= (seekEntryOrOpen!0 (select (arr!17062 a!3118) j!142) a!3118 mask!3119) (Found!5467 j!142)))))

(declare-fun b!566118 () Bool)

(declare-fun res!356986 () Bool)

(declare-fun e!325880 () Bool)

(assert (=> b!566118 (=> (not res!356986) (not e!325880))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566118 (= res!356986 (validKeyInArray!0 k0!1914))))

(declare-fun b!566119 () Bool)

(declare-fun res!356981 () Bool)

(assert (=> b!566119 (=> (not res!356981) (not e!325880))))

(assert (=> b!566119 (= res!356981 (validKeyInArray!0 (select (arr!17062 a!3118) j!142)))))

(declare-fun res!356985 () Bool)

(assert (=> start!51774 (=> (not res!356985) (not e!325880))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51774 (= res!356985 (validMask!0 mask!3119))))

(assert (=> start!51774 e!325880))

(assert (=> start!51774 true))

(declare-fun array_inv!12921 (array!35529) Bool)

(assert (=> start!51774 (array_inv!12921 a!3118)))

(declare-fun b!566120 () Bool)

(assert (=> b!566120 (= e!325880 e!325879)))

(declare-fun res!356979 () Bool)

(assert (=> b!566120 (=> (not res!356979) (not e!325879))))

(declare-fun lt!258094 () SeekEntryResult!5467)

(assert (=> b!566120 (= res!356979 (or (= lt!258094 (MissingZero!5467 i!1132)) (= lt!258094 (MissingVacant!5467 i!1132))))))

(assert (=> b!566120 (= lt!258094 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!566121 () Bool)

(declare-fun res!356978 () Bool)

(assert (=> b!566121 (=> (not res!356978) (not e!325880))))

(assert (=> b!566121 (= res!356978 (and (= (size!17426 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17426 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17426 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!566122 () Bool)

(declare-fun res!356984 () Bool)

(assert (=> b!566122 (=> (not res!356984) (not e!325880))))

(declare-fun arrayContainsKey!0 (array!35529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566122 (= res!356984 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51774 res!356985) b!566121))

(assert (= (and b!566121 res!356978) b!566119))

(assert (= (and b!566119 res!356981) b!566118))

(assert (= (and b!566118 res!356986) b!566122))

(assert (= (and b!566122 res!356984) b!566120))

(assert (= (and b!566120 res!356979) b!566114))

(assert (= (and b!566114 res!356983) b!566115))

(assert (= (and b!566115 res!356977) b!566116))

(assert (= (and b!566116 res!356982) b!566113))

(assert (= (and b!566113 res!356980) b!566117))

(declare-fun m!544805 () Bool)

(assert (=> b!566119 m!544805))

(assert (=> b!566119 m!544805))

(declare-fun m!544807 () Bool)

(assert (=> b!566119 m!544807))

(declare-fun m!544809 () Bool)

(assert (=> b!566113 m!544809))

(declare-fun m!544811 () Bool)

(assert (=> b!566113 m!544811))

(declare-fun m!544813 () Bool)

(assert (=> b!566115 m!544813))

(declare-fun m!544815 () Bool)

(assert (=> start!51774 m!544815))

(declare-fun m!544817 () Bool)

(assert (=> start!51774 m!544817))

(declare-fun m!544819 () Bool)

(assert (=> b!566114 m!544819))

(declare-fun m!544821 () Bool)

(assert (=> b!566118 m!544821))

(declare-fun m!544823 () Bool)

(assert (=> b!566120 m!544823))

(assert (=> b!566117 m!544805))

(assert (=> b!566117 m!544805))

(declare-fun m!544825 () Bool)

(assert (=> b!566117 m!544825))

(declare-fun m!544827 () Bool)

(assert (=> b!566122 m!544827))

(assert (=> b!566116 m!544805))

(declare-fun m!544829 () Bool)

(assert (=> b!566116 m!544829))

(assert (=> b!566116 m!544805))

(declare-fun m!544831 () Bool)

(assert (=> b!566116 m!544831))

(declare-fun m!544833 () Bool)

(assert (=> b!566116 m!544833))

(assert (=> b!566116 m!544831))

(declare-fun m!544835 () Bool)

(assert (=> b!566116 m!544835))

(assert (=> b!566116 m!544829))

(assert (=> b!566116 m!544805))

(declare-fun m!544837 () Bool)

(assert (=> b!566116 m!544837))

(declare-fun m!544839 () Bool)

(assert (=> b!566116 m!544839))

(assert (=> b!566116 m!544831))

(assert (=> b!566116 m!544833))

(check-sat (not b!566114) (not start!51774) (not b!566113) (not b!566117) (not b!566119) (not b!566122) (not b!566116) (not b!566115) (not b!566118) (not b!566120))
(check-sat)
