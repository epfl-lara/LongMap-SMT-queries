; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52610 () Bool)

(assert start!52610)

(declare-fun b!574046 () Bool)

(declare-fun e!330257 () Bool)

(declare-fun e!330258 () Bool)

(assert (=> b!574046 (= e!330257 e!330258)))

(declare-fun res!363019 () Bool)

(assert (=> b!574046 (=> res!363019 e!330258)))

(declare-datatypes ((SeekEntryResult!5675 0))(
  ( (MissingZero!5675 (index!24927 (_ BitVec 32))) (Found!5675 (index!24928 (_ BitVec 32))) (Intermediate!5675 (undefined!6487 Bool) (index!24929 (_ BitVec 32)) (x!53810 (_ BitVec 32))) (Undefined!5675) (MissingVacant!5675 (index!24930 (_ BitVec 32))) )
))
(declare-fun lt!262148 () SeekEntryResult!5675)

(assert (=> b!574046 (= res!363019 (or (undefined!6487 lt!262148) (not (is-Intermediate!5675 lt!262148))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!574047 () Bool)

(declare-datatypes ((array!35881 0))(
  ( (array!35882 (arr!17226 (Array (_ BitVec 32) (_ BitVec 64))) (size!17590 (_ BitVec 32))) )
))
(declare-fun lt!262149 () array!35881)

(declare-fun lt!262153 () (_ BitVec 64))

(declare-fun e!330262 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35881 (_ BitVec 32)) SeekEntryResult!5675)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35881 (_ BitVec 32)) SeekEntryResult!5675)

(assert (=> b!574047 (= e!330262 (= (seekEntryOrOpen!0 lt!262153 lt!262149 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53810 lt!262148) (index!24929 lt!262148) (index!24929 lt!262148) lt!262153 lt!262149 mask!3119)))))

(declare-fun res!363009 () Bool)

(declare-fun e!330260 () Bool)

(assert (=> start!52610 (=> (not res!363009) (not e!330260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52610 (= res!363009 (validMask!0 mask!3119))))

(assert (=> start!52610 e!330260))

(assert (=> start!52610 true))

(declare-fun a!3118 () array!35881)

(declare-fun array_inv!13022 (array!35881) Bool)

(assert (=> start!52610 (array_inv!13022 a!3118)))

(declare-fun b!574048 () Bool)

(declare-fun res!363013 () Bool)

(assert (=> b!574048 (=> (not res!363013) (not e!330260))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!574048 (= res!363013 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!574049 () Bool)

(declare-fun res!363016 () Bool)

(declare-fun e!330261 () Bool)

(assert (=> b!574049 (=> (not res!363016) (not e!330261))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35881 (_ BitVec 32)) Bool)

(assert (=> b!574049 (= res!363016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!574050 () Bool)

(declare-fun res!363017 () Bool)

(assert (=> b!574050 (=> (not res!363017) (not e!330260))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!574050 (= res!363017 (and (= (size!17590 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17590 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17590 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!574051 () Bool)

(declare-fun res!363010 () Bool)

(assert (=> b!574051 (=> (not res!363010) (not e!330260))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!574051 (= res!363010 (validKeyInArray!0 (select (arr!17226 a!3118) j!142)))))

(declare-fun b!574052 () Bool)

(declare-fun res!363015 () Bool)

(assert (=> b!574052 (=> (not res!363015) (not e!330260))))

(assert (=> b!574052 (= res!363015 (validKeyInArray!0 k!1914))))

(declare-fun b!574053 () Bool)

(declare-fun e!330263 () Bool)

(assert (=> b!574053 (= e!330258 e!330263)))

(declare-fun res!363008 () Bool)

(assert (=> b!574053 (=> res!363008 e!330263)))

(declare-fun lt!262147 () (_ BitVec 64))

(assert (=> b!574053 (= res!363008 (or (= lt!262147 (select (arr!17226 a!3118) j!142)) (= lt!262147 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!574053 (= lt!262147 (select (arr!17226 a!3118) (index!24929 lt!262148)))))

(declare-fun b!574054 () Bool)

(declare-fun res!363011 () Bool)

(assert (=> b!574054 (=> (not res!363011) (not e!330261))))

(declare-datatypes ((List!11306 0))(
  ( (Nil!11303) (Cons!11302 (h!12335 (_ BitVec 64)) (t!17534 List!11306)) )
))
(declare-fun arrayNoDuplicates!0 (array!35881 (_ BitVec 32) List!11306) Bool)

(assert (=> b!574054 (= res!363011 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11303))))

(declare-fun b!574055 () Bool)

(assert (=> b!574055 (= e!330263 e!330262)))

(declare-fun res!363012 () Bool)

(assert (=> b!574055 (=> (not res!363012) (not e!330262))))

(declare-fun lt!262152 () SeekEntryResult!5675)

(assert (=> b!574055 (= res!363012 (= lt!262152 (seekKeyOrZeroReturnVacant!0 (x!53810 lt!262148) (index!24929 lt!262148) (index!24929 lt!262148) (select (arr!17226 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!574056 () Bool)

(declare-fun e!330264 () Bool)

(assert (=> b!574056 (= e!330264 (not true))))

(assert (=> b!574056 e!330257))

(declare-fun res!363018 () Bool)

(assert (=> b!574056 (=> (not res!363018) (not e!330257))))

(assert (=> b!574056 (= res!363018 (= lt!262152 (Found!5675 j!142)))))

(assert (=> b!574056 (= lt!262152 (seekEntryOrOpen!0 (select (arr!17226 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!574056 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18052 0))(
  ( (Unit!18053) )
))
(declare-fun lt!262151 () Unit!18052)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35881 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18052)

(assert (=> b!574056 (= lt!262151 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!574057 () Bool)

(assert (=> b!574057 (= e!330260 e!330261)))

(declare-fun res!363014 () Bool)

(assert (=> b!574057 (=> (not res!363014) (not e!330261))))

(declare-fun lt!262145 () SeekEntryResult!5675)

(assert (=> b!574057 (= res!363014 (or (= lt!262145 (MissingZero!5675 i!1132)) (= lt!262145 (MissingVacant!5675 i!1132))))))

(assert (=> b!574057 (= lt!262145 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!574058 () Bool)

(assert (=> b!574058 (= e!330261 e!330264)))

(declare-fun res!363020 () Bool)

(assert (=> b!574058 (=> (not res!363020) (not e!330264))))

(declare-fun lt!262146 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35881 (_ BitVec 32)) SeekEntryResult!5675)

(assert (=> b!574058 (= res!363020 (= lt!262148 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262146 lt!262153 lt!262149 mask!3119)))))

(declare-fun lt!262150 () (_ BitVec 32))

(assert (=> b!574058 (= lt!262148 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262150 (select (arr!17226 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!574058 (= lt!262146 (toIndex!0 lt!262153 mask!3119))))

(assert (=> b!574058 (= lt!262153 (select (store (arr!17226 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!574058 (= lt!262150 (toIndex!0 (select (arr!17226 a!3118) j!142) mask!3119))))

(assert (=> b!574058 (= lt!262149 (array!35882 (store (arr!17226 a!3118) i!1132 k!1914) (size!17590 a!3118)))))

(assert (= (and start!52610 res!363009) b!574050))

(assert (= (and b!574050 res!363017) b!574051))

(assert (= (and b!574051 res!363010) b!574052))

(assert (= (and b!574052 res!363015) b!574048))

(assert (= (and b!574048 res!363013) b!574057))

(assert (= (and b!574057 res!363014) b!574049))

(assert (= (and b!574049 res!363016) b!574054))

(assert (= (and b!574054 res!363011) b!574058))

(assert (= (and b!574058 res!363020) b!574056))

(assert (= (and b!574056 res!363018) b!574046))

(assert (= (and b!574046 (not res!363019)) b!574053))

(assert (= (and b!574053 (not res!363008)) b!574055))

(assert (= (and b!574055 res!363012) b!574047))

(declare-fun m!552945 () Bool)

(assert (=> b!574057 m!552945))

(declare-fun m!552947 () Bool)

(assert (=> b!574048 m!552947))

(declare-fun m!552949 () Bool)

(assert (=> b!574055 m!552949))

(assert (=> b!574055 m!552949))

(declare-fun m!552951 () Bool)

(assert (=> b!574055 m!552951))

(assert (=> b!574058 m!552949))

(declare-fun m!552953 () Bool)

(assert (=> b!574058 m!552953))

(declare-fun m!552955 () Bool)

(assert (=> b!574058 m!552955))

(assert (=> b!574058 m!552949))

(declare-fun m!552957 () Bool)

(assert (=> b!574058 m!552957))

(assert (=> b!574058 m!552949))

(declare-fun m!552959 () Bool)

(assert (=> b!574058 m!552959))

(declare-fun m!552961 () Bool)

(assert (=> b!574058 m!552961))

(declare-fun m!552963 () Bool)

(assert (=> b!574058 m!552963))

(declare-fun m!552965 () Bool)

(assert (=> b!574054 m!552965))

(assert (=> b!574053 m!552949))

(declare-fun m!552967 () Bool)

(assert (=> b!574053 m!552967))

(declare-fun m!552969 () Bool)

(assert (=> b!574049 m!552969))

(assert (=> b!574056 m!552949))

(assert (=> b!574056 m!552949))

(declare-fun m!552971 () Bool)

(assert (=> b!574056 m!552971))

(declare-fun m!552973 () Bool)

(assert (=> b!574056 m!552973))

(declare-fun m!552975 () Bool)

(assert (=> b!574056 m!552975))

(declare-fun m!552977 () Bool)

(assert (=> start!52610 m!552977))

(declare-fun m!552979 () Bool)

(assert (=> start!52610 m!552979))

(declare-fun m!552981 () Bool)

(assert (=> b!574047 m!552981))

(declare-fun m!552983 () Bool)

(assert (=> b!574047 m!552983))

(declare-fun m!552985 () Bool)

(assert (=> b!574052 m!552985))

(assert (=> b!574051 m!552949))

(assert (=> b!574051 m!552949))

(declare-fun m!552987 () Bool)

(assert (=> b!574051 m!552987))

(push 1)

