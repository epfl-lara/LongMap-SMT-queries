; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51902 () Bool)

(assert start!51902)

(declare-fun b!567232 () Bool)

(declare-fun res!357964 () Bool)

(declare-fun e!326370 () Bool)

(assert (=> b!567232 (=> (not res!357964) (not e!326370))))

(declare-datatypes ((array!35605 0))(
  ( (array!35606 (arr!17099 (Array (_ BitVec 32) (_ BitVec 64))) (size!17464 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35605)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567232 (= res!357964 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!357968 () Bool)

(assert (=> start!51902 (=> (not res!357968) (not e!326370))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51902 (= res!357968 (validMask!0 mask!3119))))

(assert (=> start!51902 e!326370))

(assert (=> start!51902 true))

(declare-fun array_inv!12982 (array!35605) Bool)

(assert (=> start!51902 (array_inv!12982 a!3118)))

(declare-fun b!567233 () Bool)

(declare-fun res!357961 () Bool)

(declare-fun e!326371 () Bool)

(assert (=> b!567233 (=> (not res!357961) (not e!326371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35605 (_ BitVec 32)) Bool)

(assert (=> b!567233 (= res!357961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!567234 () Bool)

(declare-fun res!357965 () Bool)

(assert (=> b!567234 (=> (not res!357965) (not e!326371))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5545 0))(
  ( (MissingZero!5545 (index!24407 (_ BitVec 32))) (Found!5545 (index!24408 (_ BitVec 32))) (Intermediate!5545 (undefined!6357 Bool) (index!24409 (_ BitVec 32)) (x!53285 (_ BitVec 32))) (Undefined!5545) (MissingVacant!5545 (index!24410 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35605 (_ BitVec 32)) SeekEntryResult!5545)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567234 (= res!357965 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17099 a!3118) j!142) mask!3119) (select (arr!17099 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17099 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17099 a!3118) i!1132 k0!1914) j!142) (array!35606 (store (arr!17099 a!3118) i!1132 k0!1914) (size!17464 a!3118)) mask!3119)))))

(declare-fun b!567235 () Bool)

(declare-fun res!357960 () Bool)

(assert (=> b!567235 (=> (not res!357960) (not e!326370))))

(assert (=> b!567235 (= res!357960 (and (= (size!17464 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17464 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17464 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!567236 () Bool)

(declare-fun res!357963 () Bool)

(assert (=> b!567236 (=> (not res!357963) (not e!326370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567236 (= res!357963 (validKeyInArray!0 (select (arr!17099 a!3118) j!142)))))

(declare-fun b!567237 () Bool)

(assert (=> b!567237 (= e!326370 e!326371)))

(declare-fun res!357959 () Bool)

(assert (=> b!567237 (=> (not res!357959) (not e!326371))))

(declare-fun lt!258294 () SeekEntryResult!5545)

(assert (=> b!567237 (= res!357959 (or (= lt!258294 (MissingZero!5545 i!1132)) (= lt!258294 (MissingVacant!5545 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35605 (_ BitVec 32)) SeekEntryResult!5545)

(assert (=> b!567237 (= lt!258294 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!567238 () Bool)

(declare-fun e!326372 () Bool)

(assert (=> b!567238 (= e!326372 (= (seekEntryOrOpen!0 (select (arr!17099 a!3118) j!142) a!3118 mask!3119) (Found!5545 j!142)))))

(declare-fun b!567239 () Bool)

(declare-fun res!357967 () Bool)

(assert (=> b!567239 (=> (not res!357967) (not e!326371))))

(declare-datatypes ((List!11218 0))(
  ( (Nil!11215) (Cons!11214 (h!12226 (_ BitVec 64)) (t!17437 List!11218)) )
))
(declare-fun arrayNoDuplicates!0 (array!35605 (_ BitVec 32) List!11218) Bool)

(assert (=> b!567239 (= res!357967 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11215))))

(declare-fun b!567240 () Bool)

(assert (=> b!567240 (= e!326371 (not true))))

(assert (=> b!567240 e!326372))

(declare-fun res!357962 () Bool)

(assert (=> b!567240 (=> (not res!357962) (not e!326372))))

(assert (=> b!567240 (= res!357962 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17778 0))(
  ( (Unit!17779) )
))
(declare-fun lt!258295 () Unit!17778)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35605 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17778)

(assert (=> b!567240 (= lt!258295 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!567241 () Bool)

(declare-fun res!357966 () Bool)

(assert (=> b!567241 (=> (not res!357966) (not e!326370))))

(assert (=> b!567241 (= res!357966 (validKeyInArray!0 k0!1914))))

(assert (= (and start!51902 res!357968) b!567235))

(assert (= (and b!567235 res!357960) b!567236))

(assert (= (and b!567236 res!357963) b!567241))

(assert (= (and b!567241 res!357966) b!567232))

(assert (= (and b!567232 res!357964) b!567237))

(assert (= (and b!567237 res!357959) b!567233))

(assert (= (and b!567233 res!357961) b!567239))

(assert (= (and b!567239 res!357967) b!567234))

(assert (= (and b!567234 res!357965) b!567240))

(assert (= (and b!567240 res!357962) b!567238))

(declare-fun m!545333 () Bool)

(assert (=> b!567233 m!545333))

(declare-fun m!545335 () Bool)

(assert (=> b!567240 m!545335))

(declare-fun m!545337 () Bool)

(assert (=> b!567240 m!545337))

(declare-fun m!545339 () Bool)

(assert (=> b!567234 m!545339))

(declare-fun m!545341 () Bool)

(assert (=> b!567234 m!545341))

(assert (=> b!567234 m!545339))

(declare-fun m!545343 () Bool)

(assert (=> b!567234 m!545343))

(declare-fun m!545345 () Bool)

(assert (=> b!567234 m!545345))

(assert (=> b!567234 m!545343))

(declare-fun m!545347 () Bool)

(assert (=> b!567234 m!545347))

(assert (=> b!567234 m!545341))

(assert (=> b!567234 m!545339))

(declare-fun m!545349 () Bool)

(assert (=> b!567234 m!545349))

(declare-fun m!545351 () Bool)

(assert (=> b!567234 m!545351))

(assert (=> b!567234 m!545343))

(assert (=> b!567234 m!545345))

(declare-fun m!545353 () Bool)

(assert (=> start!51902 m!545353))

(declare-fun m!545355 () Bool)

(assert (=> start!51902 m!545355))

(declare-fun m!545357 () Bool)

(assert (=> b!567239 m!545357))

(declare-fun m!545359 () Bool)

(assert (=> b!567232 m!545359))

(declare-fun m!545361 () Bool)

(assert (=> b!567241 m!545361))

(declare-fun m!545363 () Bool)

(assert (=> b!567237 m!545363))

(assert (=> b!567236 m!545339))

(assert (=> b!567236 m!545339))

(declare-fun m!545365 () Bool)

(assert (=> b!567236 m!545365))

(assert (=> b!567238 m!545339))

(assert (=> b!567238 m!545339))

(declare-fun m!545367 () Bool)

(assert (=> b!567238 m!545367))

(check-sat (not b!567240) (not b!567238) (not b!567233) (not start!51902) (not b!567236) (not b!567234) (not b!567232) (not b!567237) (not b!567241) (not b!567239))
(check-sat)
