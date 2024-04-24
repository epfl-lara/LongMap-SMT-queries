; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118844 () Bool)

(assert start!118844)

(declare-fun b!1388266 () Bool)

(declare-fun e!786477 () Bool)

(declare-datatypes ((array!95018 0))(
  ( (array!95019 (arr!45883 (Array (_ BitVec 32) (_ BitVec 64))) (size!46434 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!95018)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388266 (= e!786477 (validKeyInArray!0 (select (arr!45883 a!2938) startIndex!16)))))

(declare-fun res!928563 () Bool)

(declare-fun e!786475 () Bool)

(assert (=> start!118844 (=> (not res!928563) (not e!786475))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118844 (= res!928563 (validMask!0 mask!2987))))

(assert (=> start!118844 e!786475))

(assert (=> start!118844 true))

(declare-fun array_inv!35164 (array!95018) Bool)

(assert (=> start!118844 (array_inv!35164 a!2938)))

(declare-fun b!1388267 () Bool)

(assert (=> b!1388267 (= e!786475 (and (bvslt startIndex!16 (bvsub (size!46434 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000) (bvsge (bvsub (size!46434 a!2938) (bvadd #b00000000000000000000000000000001 startIndex!16)) (bvsub (size!46434 a!2938) startIndex!16))))))

(declare-datatypes ((Unit!46302 0))(
  ( (Unit!46303) )
))
(declare-fun lt!610118 () Unit!46302)

(declare-fun e!786478 () Unit!46302)

(assert (=> b!1388267 (= lt!610118 e!786478)))

(declare-fun c!129300 () Bool)

(assert (=> b!1388267 (= c!129300 e!786477)))

(declare-fun res!928565 () Bool)

(assert (=> b!1388267 (=> (not res!928565) (not e!786477))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1388267 (= res!928565 (not (= startIndex!16 i!1065)))))

(declare-fun b!1388268 () Bool)

(declare-fun res!928564 () Bool)

(assert (=> b!1388268 (=> (not res!928564) (not e!786475))))

(assert (=> b!1388268 (= res!928564 (validKeyInArray!0 (select (arr!45883 a!2938) i!1065)))))

(declare-fun b!1388269 () Bool)

(declare-fun res!928562 () Bool)

(assert (=> b!1388269 (=> (not res!928562) (not e!786475))))

(declare-datatypes ((List!32398 0))(
  ( (Nil!32395) (Cons!32394 (h!33612 (_ BitVec 64)) (t!47084 List!32398)) )
))
(declare-fun arrayNoDuplicates!0 (array!95018 (_ BitVec 32) List!32398) Bool)

(assert (=> b!1388269 (= res!928562 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32395))))

(declare-fun b!1388270 () Bool)

(declare-fun lt!610119 () Unit!46302)

(assert (=> b!1388270 (= e!786478 lt!610119)))

(declare-fun lt!610117 () Unit!46302)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!95018 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46302)

(assert (=> b!1388270 (= lt!610117 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10130 0))(
  ( (MissingZero!10130 (index!42891 (_ BitVec 32))) (Found!10130 (index!42892 (_ BitVec 32))) (Intermediate!10130 (undefined!10942 Bool) (index!42893 (_ BitVec 32)) (x!124657 (_ BitVec 32))) (Undefined!10130) (MissingVacant!10130 (index!42894 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95018 (_ BitVec 32)) SeekEntryResult!10130)

(assert (=> b!1388270 (= (seekEntryOrOpen!0 (select (arr!45883 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45883 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!95019 (store (arr!45883 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46434 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95018 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46302)

(assert (=> b!1388270 (= lt!610119 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95018 (_ BitVec 32)) Bool)

(assert (=> b!1388270 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1388271 () Bool)

(declare-fun res!928561 () Bool)

(assert (=> b!1388271 (=> (not res!928561) (not e!786475))))

(assert (=> b!1388271 (= res!928561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1388272 () Bool)

(declare-fun res!928566 () Bool)

(assert (=> b!1388272 (=> (not res!928566) (not e!786475))))

(assert (=> b!1388272 (= res!928566 (and (= (size!46434 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46434 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46434 a!2938))))))

(declare-fun b!1388273 () Bool)

(declare-fun res!928567 () Bool)

(assert (=> b!1388273 (=> (not res!928567) (not e!786475))))

(assert (=> b!1388273 (= res!928567 (and (not (= (select (arr!45883 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45883 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1388274 () Bool)

(declare-fun Unit!46304 () Unit!46302)

(assert (=> b!1388274 (= e!786478 Unit!46304)))

(assert (= (and start!118844 res!928563) b!1388272))

(assert (= (and b!1388272 res!928566) b!1388268))

(assert (= (and b!1388268 res!928564) b!1388269))

(assert (= (and b!1388269 res!928562) b!1388271))

(assert (= (and b!1388271 res!928561) b!1388273))

(assert (= (and b!1388273 res!928567) b!1388267))

(assert (= (and b!1388267 res!928565) b!1388266))

(assert (= (and b!1388267 c!129300) b!1388270))

(assert (= (and b!1388267 (not c!129300)) b!1388274))

(declare-fun m!1274013 () Bool)

(assert (=> b!1388273 m!1274013))

(declare-fun m!1274015 () Bool)

(assert (=> b!1388266 m!1274015))

(assert (=> b!1388266 m!1274015))

(declare-fun m!1274017 () Bool)

(assert (=> b!1388266 m!1274017))

(declare-fun m!1274019 () Bool)

(assert (=> b!1388271 m!1274019))

(declare-fun m!1274021 () Bool)

(assert (=> b!1388270 m!1274021))

(declare-fun m!1274023 () Bool)

(assert (=> b!1388270 m!1274023))

(assert (=> b!1388270 m!1274023))

(declare-fun m!1274025 () Bool)

(assert (=> b!1388270 m!1274025))

(declare-fun m!1274027 () Bool)

(assert (=> b!1388270 m!1274027))

(declare-fun m!1274029 () Bool)

(assert (=> b!1388270 m!1274029))

(assert (=> b!1388270 m!1274015))

(declare-fun m!1274031 () Bool)

(assert (=> b!1388270 m!1274031))

(assert (=> b!1388270 m!1274015))

(declare-fun m!1274033 () Bool)

(assert (=> b!1388270 m!1274033))

(declare-fun m!1274035 () Bool)

(assert (=> start!118844 m!1274035))

(declare-fun m!1274037 () Bool)

(assert (=> start!118844 m!1274037))

(declare-fun m!1274039 () Bool)

(assert (=> b!1388269 m!1274039))

(assert (=> b!1388268 m!1274013))

(assert (=> b!1388268 m!1274013))

(declare-fun m!1274041 () Bool)

(assert (=> b!1388268 m!1274041))

(check-sat (not b!1388268) (not b!1388266) (not b!1388270) (not b!1388271) (not b!1388269) (not start!118844))
(check-sat)
