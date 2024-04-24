; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50382 () Bool)

(assert start!50382)

(declare-fun b!550972 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!318045 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!34725 0))(
  ( (array!34726 (arr!16675 (Array (_ BitVec 32) (_ BitVec 64))) (size!17039 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34725)

(declare-datatypes ((SeekEntryResult!5080 0))(
  ( (MissingZero!5080 (index!22547 (_ BitVec 32))) (Found!5080 (index!22548 (_ BitVec 32))) (Intermediate!5080 (undefined!5892 Bool) (index!22549 (_ BitVec 32)) (x!51627 (_ BitVec 32))) (Undefined!5080) (MissingVacant!5080 (index!22550 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34725 (_ BitVec 32)) SeekEntryResult!5080)

(assert (=> b!550972 (= e!318045 (= (seekEntryOrOpen!0 (select (arr!16675 a!3118) j!142) a!3118 mask!3119) (Found!5080 j!142)))))

(declare-fun res!343828 () Bool)

(declare-fun e!318043 () Bool)

(assert (=> start!50382 (=> (not res!343828) (not e!318043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50382 (= res!343828 (validMask!0 mask!3119))))

(assert (=> start!50382 e!318043))

(assert (=> start!50382 true))

(declare-fun array_inv!12534 (array!34725) Bool)

(assert (=> start!50382 (array_inv!12534 a!3118)))

(declare-fun b!550973 () Bool)

(declare-fun res!343835 () Bool)

(assert (=> b!550973 (=> (not res!343835) (not e!318043))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550973 (= res!343835 (validKeyInArray!0 k0!1914))))

(declare-fun b!550974 () Bool)

(declare-fun e!318042 () Bool)

(assert (=> b!550974 (= e!318042 (not true))))

(assert (=> b!550974 e!318045))

(declare-fun res!343837 () Bool)

(assert (=> b!550974 (=> (not res!343837) (not e!318045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34725 (_ BitVec 32)) Bool)

(assert (=> b!550974 (= res!343837 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17005 0))(
  ( (Unit!17006) )
))
(declare-fun lt!250728 () Unit!17005)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17005)

(assert (=> b!550974 (= lt!250728 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550975 () Bool)

(declare-fun res!343832 () Bool)

(assert (=> b!550975 (=> (not res!343832) (not e!318042))))

(declare-datatypes ((List!10662 0))(
  ( (Nil!10659) (Cons!10658 (h!11637 (_ BitVec 64)) (t!16882 List!10662)) )
))
(declare-fun arrayNoDuplicates!0 (array!34725 (_ BitVec 32) List!10662) Bool)

(assert (=> b!550975 (= res!343832 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10659))))

(declare-fun b!550976 () Bool)

(declare-fun res!343836 () Bool)

(assert (=> b!550976 (=> (not res!343836) (not e!318043))))

(assert (=> b!550976 (= res!343836 (validKeyInArray!0 (select (arr!16675 a!3118) j!142)))))

(declare-fun b!550977 () Bool)

(declare-fun res!343833 () Bool)

(assert (=> b!550977 (=> (not res!343833) (not e!318043))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!550977 (= res!343833 (and (= (size!17039 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17039 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17039 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550978 () Bool)

(declare-fun res!343834 () Bool)

(assert (=> b!550978 (=> (not res!343834) (not e!318042))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34725 (_ BitVec 32)) SeekEntryResult!5080)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550978 (= res!343834 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16675 a!3118) j!142) mask!3119) (select (arr!16675 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16675 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16675 a!3118) i!1132 k0!1914) j!142) (array!34726 (store (arr!16675 a!3118) i!1132 k0!1914) (size!17039 a!3118)) mask!3119)))))

(declare-fun b!550979 () Bool)

(declare-fun res!343830 () Bool)

(assert (=> b!550979 (=> (not res!343830) (not e!318043))))

(declare-fun arrayContainsKey!0 (array!34725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550979 (= res!343830 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550980 () Bool)

(declare-fun res!343829 () Bool)

(assert (=> b!550980 (=> (not res!343829) (not e!318042))))

(assert (=> b!550980 (= res!343829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!550981 () Bool)

(assert (=> b!550981 (= e!318043 e!318042)))

(declare-fun res!343831 () Bool)

(assert (=> b!550981 (=> (not res!343831) (not e!318042))))

(declare-fun lt!250729 () SeekEntryResult!5080)

(assert (=> b!550981 (= res!343831 (or (= lt!250729 (MissingZero!5080 i!1132)) (= lt!250729 (MissingVacant!5080 i!1132))))))

(assert (=> b!550981 (= lt!250729 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!50382 res!343828) b!550977))

(assert (= (and b!550977 res!343833) b!550976))

(assert (= (and b!550976 res!343836) b!550973))

(assert (= (and b!550973 res!343835) b!550979))

(assert (= (and b!550979 res!343830) b!550981))

(assert (= (and b!550981 res!343831) b!550980))

(assert (= (and b!550980 res!343829) b!550975))

(assert (= (and b!550975 res!343832) b!550978))

(assert (= (and b!550978 res!343834) b!550974))

(assert (= (and b!550974 res!343837) b!550972))

(declare-fun m!528107 () Bool)

(assert (=> b!550973 m!528107))

(declare-fun m!528109 () Bool)

(assert (=> b!550980 m!528109))

(declare-fun m!528111 () Bool)

(assert (=> b!550981 m!528111))

(declare-fun m!528113 () Bool)

(assert (=> b!550972 m!528113))

(assert (=> b!550972 m!528113))

(declare-fun m!528115 () Bool)

(assert (=> b!550972 m!528115))

(declare-fun m!528117 () Bool)

(assert (=> b!550975 m!528117))

(assert (=> b!550976 m!528113))

(assert (=> b!550976 m!528113))

(declare-fun m!528119 () Bool)

(assert (=> b!550976 m!528119))

(declare-fun m!528121 () Bool)

(assert (=> b!550979 m!528121))

(declare-fun m!528123 () Bool)

(assert (=> start!50382 m!528123))

(declare-fun m!528125 () Bool)

(assert (=> start!50382 m!528125))

(declare-fun m!528127 () Bool)

(assert (=> b!550974 m!528127))

(declare-fun m!528129 () Bool)

(assert (=> b!550974 m!528129))

(assert (=> b!550978 m!528113))

(declare-fun m!528131 () Bool)

(assert (=> b!550978 m!528131))

(assert (=> b!550978 m!528113))

(declare-fun m!528133 () Bool)

(assert (=> b!550978 m!528133))

(declare-fun m!528135 () Bool)

(assert (=> b!550978 m!528135))

(assert (=> b!550978 m!528133))

(declare-fun m!528137 () Bool)

(assert (=> b!550978 m!528137))

(assert (=> b!550978 m!528131))

(assert (=> b!550978 m!528113))

(declare-fun m!528139 () Bool)

(assert (=> b!550978 m!528139))

(declare-fun m!528141 () Bool)

(assert (=> b!550978 m!528141))

(assert (=> b!550978 m!528133))

(assert (=> b!550978 m!528135))

(check-sat (not b!550979) (not b!550972) (not b!550980) (not b!550975) (not b!550978) (not start!50382) (not b!550973) (not b!550981) (not b!550976) (not b!550974))
(check-sat)
