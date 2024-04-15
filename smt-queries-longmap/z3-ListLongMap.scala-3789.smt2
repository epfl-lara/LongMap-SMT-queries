; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51896 () Bool)

(assert start!51896)

(declare-fun b!567142 () Bool)

(declare-fun res!357870 () Bool)

(declare-fun e!326335 () Bool)

(assert (=> b!567142 (=> (not res!357870) (not e!326335))))

(declare-datatypes ((array!35599 0))(
  ( (array!35600 (arr!17096 (Array (_ BitVec 32) (_ BitVec 64))) (size!17461 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35599)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567142 (= res!357870 (validKeyInArray!0 (select (arr!17096 a!3118) j!142)))))

(declare-fun b!567143 () Bool)

(declare-fun e!326336 () Bool)

(assert (=> b!567143 (= e!326336 (not true))))

(declare-fun e!326337 () Bool)

(assert (=> b!567143 e!326337))

(declare-fun res!357872 () Bool)

(assert (=> b!567143 (=> (not res!357872) (not e!326337))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35599 (_ BitVec 32)) Bool)

(assert (=> b!567143 (= res!357872 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17772 0))(
  ( (Unit!17773) )
))
(declare-fun lt!258276 () Unit!17772)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35599 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17772)

(assert (=> b!567143 (= lt!258276 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!567144 () Bool)

(declare-fun res!357869 () Bool)

(assert (=> b!567144 (=> (not res!357869) (not e!326335))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567144 (= res!357869 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!567145 () Bool)

(declare-fun res!357876 () Bool)

(assert (=> b!567145 (=> (not res!357876) (not e!326336))))

(assert (=> b!567145 (= res!357876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!357874 () Bool)

(assert (=> start!51896 (=> (not res!357874) (not e!326335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51896 (= res!357874 (validMask!0 mask!3119))))

(assert (=> start!51896 e!326335))

(assert (=> start!51896 true))

(declare-fun array_inv!12979 (array!35599) Bool)

(assert (=> start!51896 (array_inv!12979 a!3118)))

(declare-fun b!567146 () Bool)

(declare-datatypes ((SeekEntryResult!5542 0))(
  ( (MissingZero!5542 (index!24395 (_ BitVec 32))) (Found!5542 (index!24396 (_ BitVec 32))) (Intermediate!5542 (undefined!6354 Bool) (index!24397 (_ BitVec 32)) (x!53274 (_ BitVec 32))) (Undefined!5542) (MissingVacant!5542 (index!24398 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35599 (_ BitVec 32)) SeekEntryResult!5542)

(assert (=> b!567146 (= e!326337 (= (seekEntryOrOpen!0 (select (arr!17096 a!3118) j!142) a!3118 mask!3119) (Found!5542 j!142)))))

(declare-fun b!567147 () Bool)

(declare-fun res!357877 () Bool)

(assert (=> b!567147 (=> (not res!357877) (not e!326335))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!567147 (= res!357877 (and (= (size!17461 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17461 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17461 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!567148 () Bool)

(declare-fun res!357873 () Bool)

(assert (=> b!567148 (=> (not res!357873) (not e!326335))))

(assert (=> b!567148 (= res!357873 (validKeyInArray!0 k0!1914))))

(declare-fun b!567149 () Bool)

(declare-fun res!357875 () Bool)

(assert (=> b!567149 (=> (not res!357875) (not e!326336))))

(declare-datatypes ((List!11215 0))(
  ( (Nil!11212) (Cons!11211 (h!12223 (_ BitVec 64)) (t!17434 List!11215)) )
))
(declare-fun arrayNoDuplicates!0 (array!35599 (_ BitVec 32) List!11215) Bool)

(assert (=> b!567149 (= res!357875 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11212))))

(declare-fun b!567150 () Bool)

(declare-fun res!357878 () Bool)

(assert (=> b!567150 (=> (not res!357878) (not e!326336))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35599 (_ BitVec 32)) SeekEntryResult!5542)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567150 (= res!357878 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17096 a!3118) j!142) mask!3119) (select (arr!17096 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17096 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17096 a!3118) i!1132 k0!1914) j!142) (array!35600 (store (arr!17096 a!3118) i!1132 k0!1914) (size!17461 a!3118)) mask!3119)))))

(declare-fun b!567151 () Bool)

(assert (=> b!567151 (= e!326335 e!326336)))

(declare-fun res!357871 () Bool)

(assert (=> b!567151 (=> (not res!357871) (not e!326336))))

(declare-fun lt!258277 () SeekEntryResult!5542)

(assert (=> b!567151 (= res!357871 (or (= lt!258277 (MissingZero!5542 i!1132)) (= lt!258277 (MissingVacant!5542 i!1132))))))

(assert (=> b!567151 (= lt!258277 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!51896 res!357874) b!567147))

(assert (= (and b!567147 res!357877) b!567142))

(assert (= (and b!567142 res!357870) b!567148))

(assert (= (and b!567148 res!357873) b!567144))

(assert (= (and b!567144 res!357869) b!567151))

(assert (= (and b!567151 res!357871) b!567145))

(assert (= (and b!567145 res!357876) b!567149))

(assert (= (and b!567149 res!357875) b!567150))

(assert (= (and b!567150 res!357878) b!567143))

(assert (= (and b!567143 res!357872) b!567146))

(declare-fun m!545225 () Bool)

(assert (=> b!567151 m!545225))

(declare-fun m!545227 () Bool)

(assert (=> start!51896 m!545227))

(declare-fun m!545229 () Bool)

(assert (=> start!51896 m!545229))

(declare-fun m!545231 () Bool)

(assert (=> b!567146 m!545231))

(assert (=> b!567146 m!545231))

(declare-fun m!545233 () Bool)

(assert (=> b!567146 m!545233))

(declare-fun m!545235 () Bool)

(assert (=> b!567149 m!545235))

(declare-fun m!545237 () Bool)

(assert (=> b!567145 m!545237))

(assert (=> b!567150 m!545231))

(declare-fun m!545239 () Bool)

(assert (=> b!567150 m!545239))

(assert (=> b!567150 m!545231))

(declare-fun m!545241 () Bool)

(assert (=> b!567150 m!545241))

(declare-fun m!545243 () Bool)

(assert (=> b!567150 m!545243))

(assert (=> b!567150 m!545241))

(declare-fun m!545245 () Bool)

(assert (=> b!567150 m!545245))

(assert (=> b!567150 m!545239))

(assert (=> b!567150 m!545231))

(declare-fun m!545247 () Bool)

(assert (=> b!567150 m!545247))

(declare-fun m!545249 () Bool)

(assert (=> b!567150 m!545249))

(assert (=> b!567150 m!545241))

(assert (=> b!567150 m!545243))

(declare-fun m!545251 () Bool)

(assert (=> b!567144 m!545251))

(declare-fun m!545253 () Bool)

(assert (=> b!567143 m!545253))

(declare-fun m!545255 () Bool)

(assert (=> b!567143 m!545255))

(assert (=> b!567142 m!545231))

(assert (=> b!567142 m!545231))

(declare-fun m!545257 () Bool)

(assert (=> b!567142 m!545257))

(declare-fun m!545259 () Bool)

(assert (=> b!567148 m!545259))

(check-sat (not b!567149) (not b!567142) (not b!567144) (not b!567148) (not start!51896) (not b!567146) (not b!567150) (not b!567145) (not b!567151) (not b!567143))
(check-sat)
