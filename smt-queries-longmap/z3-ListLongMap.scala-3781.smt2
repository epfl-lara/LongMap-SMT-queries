; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51786 () Bool)

(assert start!51786)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!566293 () Bool)

(declare-fun e!325950 () Bool)

(declare-datatypes ((array!35541 0))(
  ( (array!35542 (arr!17068 (Array (_ BitVec 32) (_ BitVec 64))) (size!17432 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35541)

(declare-datatypes ((SeekEntryResult!5473 0))(
  ( (MissingZero!5473 (index!24119 (_ BitVec 32))) (Found!5473 (index!24120 (_ BitVec 32))) (Intermediate!5473 (undefined!6285 Bool) (index!24121 (_ BitVec 32)) (x!53137 (_ BitVec 32))) (Undefined!5473) (MissingVacant!5473 (index!24122 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35541 (_ BitVec 32)) SeekEntryResult!5473)

(assert (=> b!566293 (= e!325950 (= (seekEntryOrOpen!0 (select (arr!17068 a!3118) j!142) a!3118 mask!3119) (Found!5473 j!142)))))

(declare-fun b!566294 () Bool)

(declare-fun res!357164 () Bool)

(declare-fun e!325952 () Bool)

(assert (=> b!566294 (=> (not res!357164) (not e!325952))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35541 (_ BitVec 32)) SeekEntryResult!5473)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566294 (= res!357164 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17068 a!3118) j!142) mask!3119) (select (arr!17068 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17068 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17068 a!3118) i!1132 k0!1914) j!142) (array!35542 (store (arr!17068 a!3118) i!1132 k0!1914) (size!17432 a!3118)) mask!3119)))))

(declare-fun b!566295 () Bool)

(declare-fun res!357157 () Bool)

(declare-fun e!325951 () Bool)

(assert (=> b!566295 (=> (not res!357157) (not e!325951))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566295 (= res!357157 (validKeyInArray!0 k0!1914))))

(declare-fun b!566296 () Bool)

(declare-fun res!357159 () Bool)

(assert (=> b!566296 (=> (not res!357159) (not e!325952))))

(declare-datatypes ((List!11055 0))(
  ( (Nil!11052) (Cons!11051 (h!12060 (_ BitVec 64)) (t!17275 List!11055)) )
))
(declare-fun arrayNoDuplicates!0 (array!35541 (_ BitVec 32) List!11055) Bool)

(assert (=> b!566296 (= res!357159 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11052))))

(declare-fun b!566297 () Bool)

(declare-fun res!357165 () Bool)

(assert (=> b!566297 (=> (not res!357165) (not e!325951))))

(assert (=> b!566297 (= res!357165 (and (= (size!17432 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17432 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17432 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!566298 () Bool)

(assert (=> b!566298 (= e!325952 (not true))))

(assert (=> b!566298 e!325950))

(declare-fun res!357163 () Bool)

(assert (=> b!566298 (=> (not res!357163) (not e!325950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35541 (_ BitVec 32)) Bool)

(assert (=> b!566298 (= res!357163 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17719 0))(
  ( (Unit!17720) )
))
(declare-fun lt!258129 () Unit!17719)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35541 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17719)

(assert (=> b!566298 (= lt!258129 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566299 () Bool)

(declare-fun res!357160 () Bool)

(assert (=> b!566299 (=> (not res!357160) (not e!325952))))

(assert (=> b!566299 (= res!357160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!357161 () Bool)

(assert (=> start!51786 (=> (not res!357161) (not e!325951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51786 (= res!357161 (validMask!0 mask!3119))))

(assert (=> start!51786 e!325951))

(assert (=> start!51786 true))

(declare-fun array_inv!12927 (array!35541) Bool)

(assert (=> start!51786 (array_inv!12927 a!3118)))

(declare-fun b!566300 () Bool)

(declare-fun res!357166 () Bool)

(assert (=> b!566300 (=> (not res!357166) (not e!325951))))

(declare-fun arrayContainsKey!0 (array!35541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566300 (= res!357166 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!566301 () Bool)

(assert (=> b!566301 (= e!325951 e!325952)))

(declare-fun res!357158 () Bool)

(assert (=> b!566301 (=> (not res!357158) (not e!325952))))

(declare-fun lt!258130 () SeekEntryResult!5473)

(assert (=> b!566301 (= res!357158 (or (= lt!258130 (MissingZero!5473 i!1132)) (= lt!258130 (MissingVacant!5473 i!1132))))))

(assert (=> b!566301 (= lt!258130 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!566302 () Bool)

(declare-fun res!357162 () Bool)

(assert (=> b!566302 (=> (not res!357162) (not e!325951))))

(assert (=> b!566302 (= res!357162 (validKeyInArray!0 (select (arr!17068 a!3118) j!142)))))

(assert (= (and start!51786 res!357161) b!566297))

(assert (= (and b!566297 res!357165) b!566302))

(assert (= (and b!566302 res!357162) b!566295))

(assert (= (and b!566295 res!357157) b!566300))

(assert (= (and b!566300 res!357166) b!566301))

(assert (= (and b!566301 res!357158) b!566299))

(assert (= (and b!566299 res!357160) b!566296))

(assert (= (and b!566296 res!357159) b!566294))

(assert (= (and b!566294 res!357164) b!566298))

(assert (= (and b!566298 res!357163) b!566293))

(declare-fun m!545021 () Bool)

(assert (=> b!566293 m!545021))

(assert (=> b!566293 m!545021))

(declare-fun m!545023 () Bool)

(assert (=> b!566293 m!545023))

(declare-fun m!545025 () Bool)

(assert (=> b!566300 m!545025))

(assert (=> b!566302 m!545021))

(assert (=> b!566302 m!545021))

(declare-fun m!545027 () Bool)

(assert (=> b!566302 m!545027))

(declare-fun m!545029 () Bool)

(assert (=> b!566295 m!545029))

(declare-fun m!545031 () Bool)

(assert (=> b!566296 m!545031))

(declare-fun m!545033 () Bool)

(assert (=> start!51786 m!545033))

(declare-fun m!545035 () Bool)

(assert (=> start!51786 m!545035))

(declare-fun m!545037 () Bool)

(assert (=> b!566298 m!545037))

(declare-fun m!545039 () Bool)

(assert (=> b!566298 m!545039))

(assert (=> b!566294 m!545021))

(declare-fun m!545041 () Bool)

(assert (=> b!566294 m!545041))

(assert (=> b!566294 m!545021))

(declare-fun m!545043 () Bool)

(assert (=> b!566294 m!545043))

(declare-fun m!545045 () Bool)

(assert (=> b!566294 m!545045))

(assert (=> b!566294 m!545043))

(declare-fun m!545047 () Bool)

(assert (=> b!566294 m!545047))

(assert (=> b!566294 m!545041))

(assert (=> b!566294 m!545021))

(declare-fun m!545049 () Bool)

(assert (=> b!566294 m!545049))

(declare-fun m!545051 () Bool)

(assert (=> b!566294 m!545051))

(assert (=> b!566294 m!545043))

(assert (=> b!566294 m!545045))

(declare-fun m!545053 () Bool)

(assert (=> b!566301 m!545053))

(declare-fun m!545055 () Bool)

(assert (=> b!566299 m!545055))

(check-sat (not start!51786) (not b!566293) (not b!566298) (not b!566295) (not b!566300) (not b!566299) (not b!566294) (not b!566296) (not b!566301) (not b!566302))
(check-sat)
