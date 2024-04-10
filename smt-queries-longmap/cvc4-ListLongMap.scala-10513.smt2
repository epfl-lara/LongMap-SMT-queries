; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123898 () Bool)

(assert start!123898)

(declare-fun b!1435844 () Bool)

(declare-fun res!968850 () Bool)

(declare-fun e!810298 () Bool)

(assert (=> b!1435844 (=> (not res!968850) (not e!810298))))

(declare-datatypes ((array!97642 0))(
  ( (array!97643 (arr!47122 (Array (_ BitVec 32) (_ BitVec 64))) (size!47672 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97642)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97642 (_ BitVec 32)) Bool)

(assert (=> b!1435844 (= res!968850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1435845 () Bool)

(declare-fun res!968852 () Bool)

(assert (=> b!1435845 (=> (not res!968852) (not e!810298))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1435845 (= res!968852 (and (= (size!47672 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47672 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47672 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1435846 () Bool)

(declare-fun res!968853 () Bool)

(assert (=> b!1435846 (=> (not res!968853) (not e!810298))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435846 (= res!968853 (validKeyInArray!0 (select (arr!47122 a!2862) i!1006)))))

(declare-fun res!968851 () Bool)

(assert (=> start!123898 (=> (not res!968851) (not e!810298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123898 (= res!968851 (validMask!0 mask!2687))))

(assert (=> start!123898 e!810298))

(assert (=> start!123898 true))

(declare-fun array_inv!36150 (array!97642) Bool)

(assert (=> start!123898 (array_inv!36150 a!2862)))

(declare-fun b!1435847 () Bool)

(assert (=> b!1435847 (= e!810298 (and (bvsle #b00000000000000000000000000000000 (size!47672 a!2862)) (bvsge (size!47672 a!2862) #b01111111111111111111111111111111)))))

(declare-fun b!1435848 () Bool)

(declare-fun res!968854 () Bool)

(assert (=> b!1435848 (=> (not res!968854) (not e!810298))))

(assert (=> b!1435848 (= res!968854 (validKeyInArray!0 (select (arr!47122 a!2862) j!93)))))

(assert (= (and start!123898 res!968851) b!1435845))

(assert (= (and b!1435845 res!968852) b!1435846))

(assert (= (and b!1435846 res!968853) b!1435848))

(assert (= (and b!1435848 res!968854) b!1435844))

(assert (= (and b!1435844 res!968850) b!1435847))

(declare-fun m!1325209 () Bool)

(assert (=> b!1435844 m!1325209))

(declare-fun m!1325211 () Bool)

(assert (=> b!1435846 m!1325211))

(assert (=> b!1435846 m!1325211))

(declare-fun m!1325213 () Bool)

(assert (=> b!1435846 m!1325213))

(declare-fun m!1325215 () Bool)

(assert (=> start!123898 m!1325215))

(declare-fun m!1325217 () Bool)

(assert (=> start!123898 m!1325217))

(declare-fun m!1325219 () Bool)

(assert (=> b!1435848 m!1325219))

(assert (=> b!1435848 m!1325219))

(declare-fun m!1325221 () Bool)

(assert (=> b!1435848 m!1325221))

(push 1)

(assert (not b!1435844))

(assert (not start!123898))

(assert (not b!1435846))

(assert (not b!1435848))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1435877 () Bool)

(declare-fun e!810323 () Bool)

(declare-fun call!67569 () Bool)

(assert (=> b!1435877 (= e!810323 call!67569)))

(declare-fun bm!67566 () Bool)

(assert (=> bm!67566 (= call!67569 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!154417 () Bool)

(declare-fun res!968869 () Bool)

(declare-fun e!810321 () Bool)

(assert (=> d!154417 (=> res!968869 e!810321)))

(assert (=> d!154417 (= res!968869 (bvsge #b00000000000000000000000000000000 (size!47672 a!2862)))))

(assert (=> d!154417 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!810321)))

(declare-fun b!1435878 () Bool)

(declare-fun e!810322 () Bool)

(assert (=> b!1435878 (= e!810322 e!810323)))

(declare-fun lt!632014 () (_ BitVec 64))

(assert (=> b!1435878 (= lt!632014 (select (arr!47122 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48536 0))(
  ( (Unit!48537) )
))
(declare-fun lt!632016 () Unit!48536)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97642 (_ BitVec 64) (_ BitVec 32)) Unit!48536)

(assert (=> b!1435878 (= lt!632016 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632014 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97642 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1435878 (arrayContainsKey!0 a!2862 lt!632014 #b00000000000000000000000000000000)))

(declare-fun lt!632015 () Unit!48536)

(assert (=> b!1435878 (= lt!632015 lt!632016)))

(declare-fun res!968870 () Bool)

