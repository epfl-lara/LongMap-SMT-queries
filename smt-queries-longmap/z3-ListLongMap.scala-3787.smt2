; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51898 () Bool)

(assert start!51898)

(declare-fun b!567263 () Bool)

(declare-fun res!357856 () Bool)

(declare-fun e!326451 () Bool)

(assert (=> b!567263 (=> (not res!357856) (not e!326451))))

(declare-datatypes ((array!35592 0))(
  ( (array!35593 (arr!17092 (Array (_ BitVec 32) (_ BitVec 64))) (size!17456 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35592)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35592 (_ BitVec 32)) Bool)

(assert (=> b!567263 (= res!357856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!567264 () Bool)

(declare-fun e!326449 () Bool)

(declare-datatypes ((SeekEntryResult!5541 0))(
  ( (MissingZero!5541 (index!24391 (_ BitVec 32))) (Found!5541 (index!24392 (_ BitVec 32))) (Intermediate!5541 (undefined!6353 Bool) (index!24393 (_ BitVec 32)) (x!53262 (_ BitVec 32))) (Undefined!5541) (MissingVacant!5541 (index!24394 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35592 (_ BitVec 32)) SeekEntryResult!5541)

(assert (=> b!567264 (= e!326449 (= (seekEntryOrOpen!0 (select (arr!17092 a!3118) j!142) a!3118 mask!3119) (Found!5541 j!142)))))

(declare-fun b!567265 () Bool)

(declare-fun res!357852 () Bool)

(declare-fun e!326450 () Bool)

(assert (=> b!567265 (=> (not res!357852) (not e!326450))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!567265 (= res!357852 (and (= (size!17456 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17456 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17456 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!567266 () Bool)

(declare-fun res!357849 () Bool)

(assert (=> b!567266 (=> (not res!357849) (not e!326451))))

(declare-datatypes ((List!11172 0))(
  ( (Nil!11169) (Cons!11168 (h!12180 (_ BitVec 64)) (t!17400 List!11172)) )
))
(declare-fun arrayNoDuplicates!0 (array!35592 (_ BitVec 32) List!11172) Bool)

(assert (=> b!567266 (= res!357849 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11169))))

(declare-fun b!567267 () Bool)

(assert (=> b!567267 (= e!326450 e!326451)))

(declare-fun res!357855 () Bool)

(assert (=> b!567267 (=> (not res!357855) (not e!326451))))

(declare-fun lt!258481 () SeekEntryResult!5541)

(assert (=> b!567267 (= res!357855 (or (= lt!258481 (MissingZero!5541 i!1132)) (= lt!258481 (MissingVacant!5541 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!567267 (= lt!258481 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!567268 () Bool)

(declare-fun res!357850 () Bool)

(assert (=> b!567268 (=> (not res!357850) (not e!326450))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567268 (= res!357850 (validKeyInArray!0 (select (arr!17092 a!3118) j!142)))))

(declare-fun b!567269 () Bool)

(assert (=> b!567269 (= e!326451 (not true))))

(assert (=> b!567269 e!326449))

(declare-fun res!357854 () Bool)

(assert (=> b!567269 (=> (not res!357854) (not e!326449))))

(assert (=> b!567269 (= res!357854 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17784 0))(
  ( (Unit!17785) )
))
(declare-fun lt!258480 () Unit!17784)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35592 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17784)

(assert (=> b!567269 (= lt!258480 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!357857 () Bool)

(assert (=> start!51898 (=> (not res!357857) (not e!326450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51898 (= res!357857 (validMask!0 mask!3119))))

(assert (=> start!51898 e!326450))

(assert (=> start!51898 true))

(declare-fun array_inv!12888 (array!35592) Bool)

(assert (=> start!51898 (array_inv!12888 a!3118)))

(declare-fun b!567270 () Bool)

(declare-fun res!357851 () Bool)

(assert (=> b!567270 (=> (not res!357851) (not e!326450))))

(assert (=> b!567270 (= res!357851 (validKeyInArray!0 k0!1914))))

(declare-fun b!567271 () Bool)

(declare-fun res!357853 () Bool)

(assert (=> b!567271 (=> (not res!357853) (not e!326450))))

(declare-fun arrayContainsKey!0 (array!35592 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567271 (= res!357853 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!567272 () Bool)

(declare-fun res!357848 () Bool)

(assert (=> b!567272 (=> (not res!357848) (not e!326451))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35592 (_ BitVec 32)) SeekEntryResult!5541)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567272 (= res!357848 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17092 a!3118) j!142) mask!3119) (select (arr!17092 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17092 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17092 a!3118) i!1132 k0!1914) j!142) (array!35593 (store (arr!17092 a!3118) i!1132 k0!1914) (size!17456 a!3118)) mask!3119)))))

(assert (= (and start!51898 res!357857) b!567265))

(assert (= (and b!567265 res!357852) b!567268))

(assert (= (and b!567268 res!357850) b!567270))

(assert (= (and b!567270 res!357851) b!567271))

(assert (= (and b!567271 res!357853) b!567267))

(assert (= (and b!567267 res!357855) b!567263))

(assert (= (and b!567263 res!357856) b!567266))

(assert (= (and b!567266 res!357849) b!567272))

(assert (= (and b!567272 res!357848) b!567269))

(assert (= (and b!567269 res!357854) b!567264))

(declare-fun m!545817 () Bool)

(assert (=> b!567263 m!545817))

(declare-fun m!545819 () Bool)

(assert (=> b!567271 m!545819))

(declare-fun m!545821 () Bool)

(assert (=> b!567264 m!545821))

(assert (=> b!567264 m!545821))

(declare-fun m!545823 () Bool)

(assert (=> b!567264 m!545823))

(declare-fun m!545825 () Bool)

(assert (=> start!51898 m!545825))

(declare-fun m!545827 () Bool)

(assert (=> start!51898 m!545827))

(assert (=> b!567268 m!545821))

(assert (=> b!567268 m!545821))

(declare-fun m!545829 () Bool)

(assert (=> b!567268 m!545829))

(declare-fun m!545831 () Bool)

(assert (=> b!567266 m!545831))

(declare-fun m!545833 () Bool)

(assert (=> b!567267 m!545833))

(declare-fun m!545835 () Bool)

(assert (=> b!567270 m!545835))

(declare-fun m!545837 () Bool)

(assert (=> b!567269 m!545837))

(declare-fun m!545839 () Bool)

(assert (=> b!567269 m!545839))

(assert (=> b!567272 m!545821))

(declare-fun m!545841 () Bool)

(assert (=> b!567272 m!545841))

(assert (=> b!567272 m!545821))

(declare-fun m!545843 () Bool)

(assert (=> b!567272 m!545843))

(declare-fun m!545845 () Bool)

(assert (=> b!567272 m!545845))

(assert (=> b!567272 m!545843))

(declare-fun m!545847 () Bool)

(assert (=> b!567272 m!545847))

(assert (=> b!567272 m!545841))

(assert (=> b!567272 m!545821))

(declare-fun m!545849 () Bool)

(assert (=> b!567272 m!545849))

(declare-fun m!545851 () Bool)

(assert (=> b!567272 m!545851))

(assert (=> b!567272 m!545843))

(assert (=> b!567272 m!545845))

(check-sat (not b!567269) (not start!51898) (not b!567268) (not b!567264) (not b!567266) (not b!567263) (not b!567267) (not b!567270) (not b!567271) (not b!567272))
(check-sat)
