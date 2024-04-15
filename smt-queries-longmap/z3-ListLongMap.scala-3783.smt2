; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51740 () Bool)

(assert start!51740)

(declare-fun b!566002 () Bool)

(declare-fun res!357121 () Bool)

(declare-fun e!325722 () Bool)

(assert (=> b!566002 (=> (not res!357121) (not e!325722))))

(declare-datatypes ((array!35557 0))(
  ( (array!35558 (arr!17078 (Array (_ BitVec 32) (_ BitVec 64))) (size!17443 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35557)

(declare-datatypes ((List!11197 0))(
  ( (Nil!11194) (Cons!11193 (h!12199 (_ BitVec 64)) (t!17416 List!11197)) )
))
(declare-fun arrayNoDuplicates!0 (array!35557 (_ BitVec 32) List!11197) Bool)

(assert (=> b!566002 (= res!357121 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11194))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!325721 () Bool)

(declare-fun b!566003 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5524 0))(
  ( (MissingZero!5524 (index!24323 (_ BitVec 32))) (Found!5524 (index!24324 (_ BitVec 32))) (Intermediate!5524 (undefined!6336 Bool) (index!24325 (_ BitVec 32)) (x!53196 (_ BitVec 32))) (Undefined!5524) (MissingVacant!5524 (index!24326 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35557 (_ BitVec 32)) SeekEntryResult!5524)

(assert (=> b!566003 (= e!325721 (= (seekEntryOrOpen!0 (select (arr!17078 a!3118) j!142) a!3118 mask!3119) (Found!5524 j!142)))))

(declare-fun b!566004 () Bool)

(declare-fun res!357114 () Bool)

(declare-fun e!325719 () Bool)

(assert (=> b!566004 (=> (not res!357114) (not e!325719))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566004 (= res!357114 (validKeyInArray!0 (select (arr!17078 a!3118) j!142)))))

(declare-fun b!566005 () Bool)

(declare-fun res!357119 () Bool)

(assert (=> b!566005 (=> (not res!357119) (not e!325719))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!566005 (= res!357119 (validKeyInArray!0 k0!1914))))

(declare-fun b!566006 () Bool)

(declare-fun res!357118 () Bool)

(assert (=> b!566006 (=> (not res!357118) (not e!325719))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!566006 (= res!357118 (and (= (size!17443 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17443 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17443 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!566007 () Bool)

(declare-fun res!357115 () Bool)

(assert (=> b!566007 (=> (not res!357115) (not e!325722))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35557 (_ BitVec 32)) SeekEntryResult!5524)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566007 (= res!357115 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17078 a!3118) j!142) mask!3119) (select (arr!17078 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17078 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17078 a!3118) i!1132 k0!1914) j!142) (array!35558 (store (arr!17078 a!3118) i!1132 k0!1914) (size!17443 a!3118)) mask!3119)))))

(declare-fun b!566008 () Bool)

(assert (=> b!566008 (= e!325719 e!325722)))

(declare-fun res!357120 () Bool)

(assert (=> b!566008 (=> (not res!357120) (not e!325722))))

(declare-fun lt!257820 () SeekEntryResult!5524)

(assert (=> b!566008 (= res!357120 (or (= lt!257820 (MissingZero!5524 i!1132)) (= lt!257820 (MissingVacant!5524 i!1132))))))

(assert (=> b!566008 (= lt!257820 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!357116 () Bool)

(assert (=> start!51740 (=> (not res!357116) (not e!325719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51740 (= res!357116 (validMask!0 mask!3119))))

(assert (=> start!51740 e!325719))

(assert (=> start!51740 true))

(declare-fun array_inv!12961 (array!35557) Bool)

(assert (=> start!51740 (array_inv!12961 a!3118)))

(declare-fun b!566009 () Bool)

(declare-fun res!357117 () Bool)

(assert (=> b!566009 (=> (not res!357117) (not e!325722))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35557 (_ BitVec 32)) Bool)

(assert (=> b!566009 (= res!357117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!566010 () Bool)

(assert (=> b!566010 (= e!325722 (not true))))

(assert (=> b!566010 e!325721))

(declare-fun res!357122 () Bool)

(assert (=> b!566010 (=> (not res!357122) (not e!325721))))

(assert (=> b!566010 (= res!357122 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17736 0))(
  ( (Unit!17737) )
))
(declare-fun lt!257821 () Unit!17736)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35557 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17736)

(assert (=> b!566010 (= lt!257821 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566011 () Bool)

(declare-fun res!357113 () Bool)

(assert (=> b!566011 (=> (not res!357113) (not e!325719))))

(declare-fun arrayContainsKey!0 (array!35557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566011 (= res!357113 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51740 res!357116) b!566006))

(assert (= (and b!566006 res!357118) b!566004))

(assert (= (and b!566004 res!357114) b!566005))

(assert (= (and b!566005 res!357119) b!566011))

(assert (= (and b!566011 res!357113) b!566008))

(assert (= (and b!566008 res!357120) b!566009))

(assert (= (and b!566009 res!357117) b!566002))

(assert (= (and b!566002 res!357121) b!566007))

(assert (= (and b!566007 res!357115) b!566010))

(assert (= (and b!566010 res!357122) b!566003))

(declare-fun m!544127 () Bool)

(assert (=> b!566010 m!544127))

(declare-fun m!544129 () Bool)

(assert (=> b!566010 m!544129))

(declare-fun m!544131 () Bool)

(assert (=> b!566009 m!544131))

(declare-fun m!544133 () Bool)

(assert (=> b!566003 m!544133))

(assert (=> b!566003 m!544133))

(declare-fun m!544135 () Bool)

(assert (=> b!566003 m!544135))

(declare-fun m!544137 () Bool)

(assert (=> b!566011 m!544137))

(declare-fun m!544139 () Bool)

(assert (=> b!566008 m!544139))

(declare-fun m!544141 () Bool)

(assert (=> b!566002 m!544141))

(declare-fun m!544143 () Bool)

(assert (=> start!51740 m!544143))

(declare-fun m!544145 () Bool)

(assert (=> start!51740 m!544145))

(declare-fun m!544147 () Bool)

(assert (=> b!566005 m!544147))

(assert (=> b!566004 m!544133))

(assert (=> b!566004 m!544133))

(declare-fun m!544149 () Bool)

(assert (=> b!566004 m!544149))

(assert (=> b!566007 m!544133))

(declare-fun m!544151 () Bool)

(assert (=> b!566007 m!544151))

(assert (=> b!566007 m!544133))

(declare-fun m!544153 () Bool)

(assert (=> b!566007 m!544153))

(declare-fun m!544155 () Bool)

(assert (=> b!566007 m!544155))

(assert (=> b!566007 m!544153))

(declare-fun m!544157 () Bool)

(assert (=> b!566007 m!544157))

(assert (=> b!566007 m!544151))

(assert (=> b!566007 m!544133))

(declare-fun m!544159 () Bool)

(assert (=> b!566007 m!544159))

(declare-fun m!544161 () Bool)

(assert (=> b!566007 m!544161))

(assert (=> b!566007 m!544153))

(assert (=> b!566007 m!544155))

(check-sat (not start!51740) (not b!566004) (not b!566008) (not b!566003) (not b!566011) (not b!566009) (not b!566002) (not b!566007) (not b!566010) (not b!566005))
(check-sat)
