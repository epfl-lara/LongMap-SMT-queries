; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52248 () Bool)

(assert start!52248)

(declare-fun b!570097 () Bool)

(declare-fun res!360015 () Bool)

(declare-fun e!327908 () Bool)

(assert (=> b!570097 (=> (not res!360015) (not e!327908))))

(declare-datatypes ((array!35718 0))(
  ( (array!35719 (arr!17149 (Array (_ BitVec 32) (_ BitVec 64))) (size!17513 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35718)

(declare-datatypes ((List!11136 0))(
  ( (Nil!11133) (Cons!11132 (h!12156 (_ BitVec 64)) (t!17356 List!11136)) )
))
(declare-fun arrayNoDuplicates!0 (array!35718 (_ BitVec 32) List!11136) Bool)

(assert (=> b!570097 (= res!360015 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11133))))

(declare-fun b!570098 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!327906 () Bool)

(declare-datatypes ((SeekEntryResult!5554 0))(
  ( (MissingZero!5554 (index!24443 (_ BitVec 32))) (Found!5554 (index!24444 (_ BitVec 32))) (Intermediate!5554 (undefined!6366 Bool) (index!24445 (_ BitVec 32)) (x!53464 (_ BitVec 32))) (Undefined!5554) (MissingVacant!5554 (index!24446 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35718 (_ BitVec 32)) SeekEntryResult!5554)

(assert (=> b!570098 (= e!327906 (= (seekEntryOrOpen!0 (select (arr!17149 a!3118) j!142) a!3118 mask!3119) (Found!5554 j!142)))))

(declare-fun b!570099 () Bool)

(declare-fun res!360018 () Bool)

(declare-fun e!327907 () Bool)

(assert (=> b!570099 (=> (not res!360018) (not e!327907))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!570099 (= res!360018 (and (= (size!17513 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17513 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17513 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570100 () Bool)

(declare-fun res!360019 () Bool)

(assert (=> b!570100 (=> (not res!360019) (not e!327908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35718 (_ BitVec 32)) Bool)

(assert (=> b!570100 (= res!360019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570101 () Bool)

(assert (=> b!570101 (= e!327908 (not true))))

(assert (=> b!570101 e!327906))

(declare-fun res!360016 () Bool)

(assert (=> b!570101 (=> (not res!360016) (not e!327906))))

(assert (=> b!570101 (= res!360016 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17881 0))(
  ( (Unit!17882) )
))
(declare-fun lt!259908 () Unit!17881)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35718 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17881)

(assert (=> b!570101 (= lt!259908 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570102 () Bool)

(declare-fun res!360010 () Bool)

(assert (=> b!570102 (=> (not res!360010) (not e!327908))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35718 (_ BitVec 32)) SeekEntryResult!5554)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570102 (= res!360010 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17149 a!3118) j!142) mask!3119) (select (arr!17149 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17149 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17149 a!3118) i!1132 k0!1914) j!142) (array!35719 (store (arr!17149 a!3118) i!1132 k0!1914) (size!17513 a!3118)) mask!3119)))))

(declare-fun res!360014 () Bool)

(assert (=> start!52248 (=> (not res!360014) (not e!327907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52248 (= res!360014 (validMask!0 mask!3119))))

(assert (=> start!52248 e!327907))

(assert (=> start!52248 true))

(declare-fun array_inv!13008 (array!35718) Bool)

(assert (=> start!52248 (array_inv!13008 a!3118)))

(declare-fun b!570103 () Bool)

(declare-fun res!360017 () Bool)

(assert (=> b!570103 (=> (not res!360017) (not e!327907))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570103 (= res!360017 (validKeyInArray!0 k0!1914))))

(declare-fun b!570104 () Bool)

(declare-fun res!360011 () Bool)

(assert (=> b!570104 (=> (not res!360011) (not e!327907))))

(declare-fun arrayContainsKey!0 (array!35718 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570104 (= res!360011 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570105 () Bool)

(declare-fun res!360013 () Bool)

(assert (=> b!570105 (=> (not res!360013) (not e!327907))))

(assert (=> b!570105 (= res!360013 (validKeyInArray!0 (select (arr!17149 a!3118) j!142)))))

(declare-fun b!570106 () Bool)

(assert (=> b!570106 (= e!327907 e!327908)))

(declare-fun res!360012 () Bool)

(assert (=> b!570106 (=> (not res!360012) (not e!327908))))

(declare-fun lt!259909 () SeekEntryResult!5554)

(assert (=> b!570106 (= res!360012 (or (= lt!259909 (MissingZero!5554 i!1132)) (= lt!259909 (MissingVacant!5554 i!1132))))))

(assert (=> b!570106 (= lt!259909 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!52248 res!360014) b!570099))

(assert (= (and b!570099 res!360018) b!570105))

(assert (= (and b!570105 res!360013) b!570103))

(assert (= (and b!570103 res!360017) b!570104))

(assert (= (and b!570104 res!360011) b!570106))

(assert (= (and b!570106 res!360012) b!570100))

(assert (= (and b!570100 res!360019) b!570097))

(assert (= (and b!570097 res!360015) b!570102))

(assert (= (and b!570102 res!360010) b!570101))

(assert (= (and b!570101 res!360016) b!570098))

(declare-fun m!549131 () Bool)

(assert (=> b!570105 m!549131))

(assert (=> b!570105 m!549131))

(declare-fun m!549133 () Bool)

(assert (=> b!570105 m!549133))

(declare-fun m!549135 () Bool)

(assert (=> b!570100 m!549135))

(declare-fun m!549137 () Bool)

(assert (=> b!570104 m!549137))

(assert (=> b!570098 m!549131))

(assert (=> b!570098 m!549131))

(declare-fun m!549139 () Bool)

(assert (=> b!570098 m!549139))

(assert (=> b!570102 m!549131))

(declare-fun m!549141 () Bool)

(assert (=> b!570102 m!549141))

(assert (=> b!570102 m!549131))

(declare-fun m!549143 () Bool)

(assert (=> b!570102 m!549143))

(declare-fun m!549145 () Bool)

(assert (=> b!570102 m!549145))

(assert (=> b!570102 m!549143))

(declare-fun m!549147 () Bool)

(assert (=> b!570102 m!549147))

(assert (=> b!570102 m!549141))

(assert (=> b!570102 m!549131))

(declare-fun m!549149 () Bool)

(assert (=> b!570102 m!549149))

(declare-fun m!549151 () Bool)

(assert (=> b!570102 m!549151))

(assert (=> b!570102 m!549143))

(assert (=> b!570102 m!549145))

(declare-fun m!549153 () Bool)

(assert (=> b!570101 m!549153))

(declare-fun m!549155 () Bool)

(assert (=> b!570101 m!549155))

(declare-fun m!549157 () Bool)

(assert (=> b!570097 m!549157))

(declare-fun m!549159 () Bool)

(assert (=> b!570106 m!549159))

(declare-fun m!549161 () Bool)

(assert (=> b!570103 m!549161))

(declare-fun m!549163 () Bool)

(assert (=> start!52248 m!549163))

(declare-fun m!549165 () Bool)

(assert (=> start!52248 m!549165))

(check-sat (not b!570103) (not b!570106) (not b!570105) (not start!52248) (not b!570104) (not b!570102) (not b!570101) (not b!570098) (not b!570097) (not b!570100))
(check-sat)
