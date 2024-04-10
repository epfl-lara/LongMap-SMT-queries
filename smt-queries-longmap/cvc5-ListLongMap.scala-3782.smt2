; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51746 () Bool)

(assert start!51746)

(declare-fun b!566183 () Bool)

(declare-fun e!325859 () Bool)

(assert (=> b!566183 (= e!325859 (not true))))

(declare-fun e!325860 () Bool)

(assert (=> b!566183 e!325860))

(declare-fun res!357157 () Bool)

(assert (=> b!566183 (=> (not res!357157) (not e!325860))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((array!35554 0))(
  ( (array!35555 (arr!17076 (Array (_ BitVec 32) (_ BitVec 64))) (size!17440 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35554)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35554 (_ BitVec 32)) Bool)

(assert (=> b!566183 (= res!357157 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17752 0))(
  ( (Unit!17753) )
))
(declare-fun lt!258036 () Unit!17752)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35554 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17752)

(assert (=> b!566183 (= lt!258036 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566184 () Bool)

(declare-fun res!357161 () Bool)

(assert (=> b!566184 (=> (not res!357161) (not e!325859))))

(declare-datatypes ((List!11156 0))(
  ( (Nil!11153) (Cons!11152 (h!12158 (_ BitVec 64)) (t!17384 List!11156)) )
))
(declare-fun arrayNoDuplicates!0 (array!35554 (_ BitVec 32) List!11156) Bool)

(assert (=> b!566184 (= res!357161 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11153))))

(declare-fun b!566185 () Bool)

(declare-datatypes ((SeekEntryResult!5525 0))(
  ( (MissingZero!5525 (index!24327 (_ BitVec 32))) (Found!5525 (index!24328 (_ BitVec 32))) (Intermediate!5525 (undefined!6337 Bool) (index!24329 (_ BitVec 32)) (x!53194 (_ BitVec 32))) (Undefined!5525) (MissingVacant!5525 (index!24330 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35554 (_ BitVec 32)) SeekEntryResult!5525)

(assert (=> b!566185 (= e!325860 (= (seekEntryOrOpen!0 (select (arr!17076 a!3118) j!142) a!3118 mask!3119) (Found!5525 j!142)))))

(declare-fun b!566186 () Bool)

(declare-fun res!357153 () Bool)

(assert (=> b!566186 (=> (not res!357153) (not e!325859))))

(assert (=> b!566186 (= res!357153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!566187 () Bool)

(declare-fun res!357156 () Bool)

(declare-fun e!325857 () Bool)

(assert (=> b!566187 (=> (not res!357156) (not e!325857))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566187 (= res!357156 (validKeyInArray!0 k!1914))))

(declare-fun b!566188 () Bool)

(declare-fun res!357155 () Bool)

(assert (=> b!566188 (=> (not res!357155) (not e!325857))))

(declare-fun arrayContainsKey!0 (array!35554 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566188 (= res!357155 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!566189 () Bool)

(declare-fun res!357158 () Bool)

(assert (=> b!566189 (=> (not res!357158) (not e!325857))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!566189 (= res!357158 (and (= (size!17440 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17440 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17440 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!357154 () Bool)

(assert (=> start!51746 (=> (not res!357154) (not e!325857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51746 (= res!357154 (validMask!0 mask!3119))))

(assert (=> start!51746 e!325857))

(assert (=> start!51746 true))

(declare-fun array_inv!12872 (array!35554) Bool)

(assert (=> start!51746 (array_inv!12872 a!3118)))

(declare-fun b!566190 () Bool)

(declare-fun res!357160 () Bool)

(assert (=> b!566190 (=> (not res!357160) (not e!325857))))

(assert (=> b!566190 (= res!357160 (validKeyInArray!0 (select (arr!17076 a!3118) j!142)))))

(declare-fun b!566191 () Bool)

(declare-fun res!357152 () Bool)

(assert (=> b!566191 (=> (not res!357152) (not e!325859))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35554 (_ BitVec 32)) SeekEntryResult!5525)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566191 (= res!357152 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17076 a!3118) j!142) mask!3119) (select (arr!17076 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17076 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17076 a!3118) i!1132 k!1914) j!142) (array!35555 (store (arr!17076 a!3118) i!1132 k!1914) (size!17440 a!3118)) mask!3119)))))

(declare-fun b!566192 () Bool)

(assert (=> b!566192 (= e!325857 e!325859)))

(declare-fun res!357159 () Bool)

(assert (=> b!566192 (=> (not res!357159) (not e!325859))))

(declare-fun lt!258037 () SeekEntryResult!5525)

(assert (=> b!566192 (= res!357159 (or (= lt!258037 (MissingZero!5525 i!1132)) (= lt!258037 (MissingVacant!5525 i!1132))))))

(assert (=> b!566192 (= lt!258037 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!51746 res!357154) b!566189))

(assert (= (and b!566189 res!357158) b!566190))

(assert (= (and b!566190 res!357160) b!566187))

(assert (= (and b!566187 res!357156) b!566188))

(assert (= (and b!566188 res!357155) b!566192))

(assert (= (and b!566192 res!357159) b!566186))

(assert (= (and b!566186 res!357153) b!566184))

(assert (= (and b!566184 res!357161) b!566191))

(assert (= (and b!566191 res!357152) b!566183))

(assert (= (and b!566183 res!357157) b!566185))

(declare-fun m!544791 () Bool)

(assert (=> b!566185 m!544791))

(assert (=> b!566185 m!544791))

(declare-fun m!544793 () Bool)

(assert (=> b!566185 m!544793))

(assert (=> b!566191 m!544791))

(declare-fun m!544795 () Bool)

(assert (=> b!566191 m!544795))

(assert (=> b!566191 m!544791))

(declare-fun m!544797 () Bool)

(assert (=> b!566191 m!544797))

(declare-fun m!544799 () Bool)

(assert (=> b!566191 m!544799))

(assert (=> b!566191 m!544797))

(declare-fun m!544801 () Bool)

(assert (=> b!566191 m!544801))

(assert (=> b!566191 m!544795))

(assert (=> b!566191 m!544791))

(declare-fun m!544803 () Bool)

(assert (=> b!566191 m!544803))

(declare-fun m!544805 () Bool)

(assert (=> b!566191 m!544805))

(assert (=> b!566191 m!544797))

(assert (=> b!566191 m!544799))

(declare-fun m!544807 () Bool)

(assert (=> b!566183 m!544807))

(declare-fun m!544809 () Bool)

(assert (=> b!566183 m!544809))

(declare-fun m!544811 () Bool)

(assert (=> start!51746 m!544811))

(declare-fun m!544813 () Bool)

(assert (=> start!51746 m!544813))

(assert (=> b!566190 m!544791))

(assert (=> b!566190 m!544791))

(declare-fun m!544815 () Bool)

(assert (=> b!566190 m!544815))

(declare-fun m!544817 () Bool)

(assert (=> b!566186 m!544817))

(declare-fun m!544819 () Bool)

(assert (=> b!566188 m!544819))

(declare-fun m!544821 () Bool)

(assert (=> b!566192 m!544821))

(declare-fun m!544823 () Bool)

(assert (=> b!566187 m!544823))

(declare-fun m!544825 () Bool)

(assert (=> b!566184 m!544825))

(push 1)

