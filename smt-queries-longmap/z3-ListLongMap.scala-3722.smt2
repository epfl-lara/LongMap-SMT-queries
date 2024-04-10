; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51328 () Bool)

(assert start!51328)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!322690 () Bool)

(declare-datatypes ((array!35193 0))(
  ( (array!35194 (arr!16897 (Array (_ BitVec 32) (_ BitVec 64))) (size!17261 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35193)

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5346 0))(
  ( (MissingZero!5346 (index!23611 (_ BitVec 32))) (Found!5346 (index!23612 (_ BitVec 32))) (Intermediate!5346 (undefined!6158 Bool) (index!23613 (_ BitVec 32)) (x!52529 (_ BitVec 32))) (Undefined!5346) (MissingVacant!5346 (index!23614 (_ BitVec 32))) )
))
(declare-fun lt!254579 () SeekEntryResult!5346)

(declare-fun b!560083 () Bool)

(declare-fun lt!254580 () SeekEntryResult!5346)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35193 (_ BitVec 32)) SeekEntryResult!5346)

(assert (=> b!560083 (= e!322690 (= lt!254580 (seekKeyOrZeroReturnVacant!0 (x!52529 lt!254579) (index!23613 lt!254579) (index!23613 lt!254579) (select (arr!16897 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560084 () Bool)

(declare-fun e!322689 () Bool)

(declare-fun e!322685 () Bool)

(assert (=> b!560084 (= e!322689 e!322685)))

(declare-fun res!351239 () Bool)

(assert (=> b!560084 (=> (not res!351239) (not e!322685))))

(declare-fun lt!254574 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!254576 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35193 (_ BitVec 32)) SeekEntryResult!5346)

(assert (=> b!560084 (= res!351239 (= lt!254579 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254576 lt!254574 (array!35194 (store (arr!16897 a!3118) i!1132 k0!1914) (size!17261 a!3118)) mask!3119)))))

(declare-fun lt!254577 () (_ BitVec 32))

(assert (=> b!560084 (= lt!254579 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254577 (select (arr!16897 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560084 (= lt!254576 (toIndex!0 lt!254574 mask!3119))))

(assert (=> b!560084 (= lt!254574 (select (store (arr!16897 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!560084 (= lt!254577 (toIndex!0 (select (arr!16897 a!3118) j!142) mask!3119))))

(declare-fun b!560085 () Bool)

(declare-fun e!322688 () Bool)

(assert (=> b!560085 (= e!322688 e!322690)))

(declare-fun res!351237 () Bool)

(assert (=> b!560085 (=> res!351237 e!322690)))

(declare-fun lt!254581 () (_ BitVec 64))

(assert (=> b!560085 (= res!351237 (or (= lt!254581 (select (arr!16897 a!3118) j!142)) (= lt!254581 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560085 (= lt!254581 (select (arr!16897 a!3118) (index!23613 lt!254579)))))

(declare-fun b!560086 () Bool)

(declare-fun e!322684 () Bool)

(declare-fun e!322692 () Bool)

(assert (=> b!560086 (= e!322684 e!322692)))

(declare-fun res!351236 () Bool)

(assert (=> b!560086 (=> res!351236 e!322692)))

(declare-fun lt!254578 () (_ BitVec 64))

(assert (=> b!560086 (= res!351236 (or (= lt!254578 (select (arr!16897 a!3118) j!142)) (= lt!254578 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt (index!23613 lt!254579) #b00000000000000000000000000000000) (bvsge (index!23613 lt!254579) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52529 lt!254579) #b01111111111111111111111111111110) (bvslt (x!52529 lt!254579) #b00000000000000000000000000000000) (not (= (select (store (arr!16897 a!3118) i!1132 k0!1914) (index!23613 lt!254579)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!560086 (= lt!254578 (select (arr!16897 a!3118) (index!23613 lt!254579)))))

(declare-fun b!560087 () Bool)

(declare-fun e!322686 () Bool)

(assert (=> b!560087 (= e!322686 e!322689)))

(declare-fun res!351240 () Bool)

(assert (=> b!560087 (=> (not res!351240) (not e!322689))))

(declare-fun lt!254575 () SeekEntryResult!5346)

(assert (=> b!560087 (= res!351240 (or (= lt!254575 (MissingZero!5346 i!1132)) (= lt!254575 (MissingVacant!5346 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35193 (_ BitVec 32)) SeekEntryResult!5346)

(assert (=> b!560087 (= lt!254575 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!560088 () Bool)

(declare-fun res!351248 () Bool)

(assert (=> b!560088 (=> (not res!351248) (not e!322686))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560088 (= res!351248 (validKeyInArray!0 (select (arr!16897 a!3118) j!142)))))

(declare-fun b!560089 () Bool)

(assert (=> b!560089 (= e!322685 (not e!322684))))

(declare-fun res!351241 () Bool)

(assert (=> b!560089 (=> res!351241 e!322684)))

(get-info :version)

(assert (=> b!560089 (= res!351241 (or (undefined!6158 lt!254579) (not ((_ is Intermediate!5346) lt!254579))))))

(declare-fun e!322691 () Bool)

(assert (=> b!560089 e!322691))

(declare-fun res!351243 () Bool)

(assert (=> b!560089 (=> (not res!351243) (not e!322691))))

(assert (=> b!560089 (= res!351243 (= lt!254580 (Found!5346 j!142)))))

(assert (=> b!560089 (= lt!254580 (seekEntryOrOpen!0 (select (arr!16897 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35193 (_ BitVec 32)) Bool)

(assert (=> b!560089 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17466 0))(
  ( (Unit!17467) )
))
(declare-fun lt!254573 () Unit!17466)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35193 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17466)

(assert (=> b!560089 (= lt!254573 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560090 () Bool)

(assert (=> b!560090 (= e!322692 (validKeyInArray!0 lt!254574))))

(declare-fun res!351244 () Bool)

(assert (=> start!51328 (=> (not res!351244) (not e!322686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51328 (= res!351244 (validMask!0 mask!3119))))

(assert (=> start!51328 e!322686))

(assert (=> start!51328 true))

(declare-fun array_inv!12693 (array!35193) Bool)

(assert (=> start!51328 (array_inv!12693 a!3118)))

(declare-fun b!560091 () Bool)

(declare-fun res!351247 () Bool)

(assert (=> b!560091 (=> (not res!351247) (not e!322686))))

(declare-fun arrayContainsKey!0 (array!35193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560091 (= res!351247 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560092 () Bool)

(declare-fun res!351245 () Bool)

(assert (=> b!560092 (=> (not res!351245) (not e!322686))))

(assert (=> b!560092 (= res!351245 (validKeyInArray!0 k0!1914))))

(declare-fun b!560093 () Bool)

(declare-fun res!351246 () Bool)

(assert (=> b!560093 (=> (not res!351246) (not e!322689))))

(declare-datatypes ((List!10977 0))(
  ( (Nil!10974) (Cons!10973 (h!11976 (_ BitVec 64)) (t!17205 List!10977)) )
))
(declare-fun arrayNoDuplicates!0 (array!35193 (_ BitVec 32) List!10977) Bool)

(assert (=> b!560093 (= res!351246 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10974))))

(declare-fun b!560094 () Bool)

(assert (=> b!560094 (= e!322691 e!322688)))

(declare-fun res!351235 () Bool)

(assert (=> b!560094 (=> res!351235 e!322688)))

(assert (=> b!560094 (= res!351235 (or (undefined!6158 lt!254579) (not ((_ is Intermediate!5346) lt!254579))))))

(declare-fun b!560095 () Bool)

(declare-fun res!351238 () Bool)

(assert (=> b!560095 (=> (not res!351238) (not e!322686))))

(assert (=> b!560095 (= res!351238 (and (= (size!17261 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17261 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17261 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560096 () Bool)

(declare-fun res!351242 () Bool)

(assert (=> b!560096 (=> (not res!351242) (not e!322689))))

(assert (=> b!560096 (= res!351242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51328 res!351244) b!560095))

(assert (= (and b!560095 res!351238) b!560088))

(assert (= (and b!560088 res!351248) b!560092))

(assert (= (and b!560092 res!351245) b!560091))

(assert (= (and b!560091 res!351247) b!560087))

(assert (= (and b!560087 res!351240) b!560096))

(assert (= (and b!560096 res!351242) b!560093))

(assert (= (and b!560093 res!351246) b!560084))

(assert (= (and b!560084 res!351239) b!560089))

(assert (= (and b!560089 res!351243) b!560094))

(assert (= (and b!560094 (not res!351235)) b!560085))

(assert (= (and b!560085 (not res!351237)) b!560083))

(assert (= (and b!560089 (not res!351241)) b!560086))

(assert (= (and b!560086 (not res!351236)) b!560090))

(declare-fun m!537809 () Bool)

(assert (=> b!560092 m!537809))

(declare-fun m!537811 () Bool)

(assert (=> start!51328 m!537811))

(declare-fun m!537813 () Bool)

(assert (=> start!51328 m!537813))

(declare-fun m!537815 () Bool)

(assert (=> b!560083 m!537815))

(assert (=> b!560083 m!537815))

(declare-fun m!537817 () Bool)

(assert (=> b!560083 m!537817))

(declare-fun m!537819 () Bool)

(assert (=> b!560096 m!537819))

(assert (=> b!560088 m!537815))

(assert (=> b!560088 m!537815))

(declare-fun m!537821 () Bool)

(assert (=> b!560088 m!537821))

(assert (=> b!560089 m!537815))

(assert (=> b!560089 m!537815))

(declare-fun m!537823 () Bool)

(assert (=> b!560089 m!537823))

(declare-fun m!537825 () Bool)

(assert (=> b!560089 m!537825))

(declare-fun m!537827 () Bool)

(assert (=> b!560089 m!537827))

(assert (=> b!560086 m!537815))

(declare-fun m!537829 () Bool)

(assert (=> b!560086 m!537829))

(declare-fun m!537831 () Bool)

(assert (=> b!560086 m!537831))

(declare-fun m!537833 () Bool)

(assert (=> b!560086 m!537833))

(declare-fun m!537835 () Bool)

(assert (=> b!560087 m!537835))

(declare-fun m!537837 () Bool)

(assert (=> b!560091 m!537837))

(declare-fun m!537839 () Bool)

(assert (=> b!560093 m!537839))

(assert (=> b!560084 m!537815))

(declare-fun m!537841 () Bool)

(assert (=> b!560084 m!537841))

(assert (=> b!560084 m!537815))

(declare-fun m!537843 () Bool)

(assert (=> b!560084 m!537843))

(declare-fun m!537845 () Bool)

(assert (=> b!560084 m!537845))

(assert (=> b!560084 m!537829))

(declare-fun m!537847 () Bool)

(assert (=> b!560084 m!537847))

(assert (=> b!560084 m!537815))

(declare-fun m!537849 () Bool)

(assert (=> b!560084 m!537849))

(declare-fun m!537851 () Bool)

(assert (=> b!560090 m!537851))

(assert (=> b!560085 m!537815))

(assert (=> b!560085 m!537833))

(check-sat (not b!560096) (not b!560090) (not b!560092) (not start!51328) (not b!560093) (not b!560091) (not b!560088) (not b!560089) (not b!560084) (not b!560083) (not b!560087))
(check-sat)
