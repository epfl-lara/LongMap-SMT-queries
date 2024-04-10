; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118586 () Bool)

(assert start!118586)

(declare-fun b!1386337 () Bool)

(declare-fun res!927562 () Bool)

(declare-fun e!785351 () Bool)

(assert (=> b!1386337 (=> (not res!927562) (not e!785351))))

(declare-datatypes ((array!94862 0))(
  ( (array!94863 (arr!45807 (Array (_ BitVec 32) (_ BitVec 64))) (size!46357 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94862)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94862 (_ BitVec 32)) Bool)

(assert (=> b!1386337 (= res!927562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386338 () Bool)

(declare-fun res!927564 () Bool)

(assert (=> b!1386338 (=> (not res!927564) (not e!785351))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386338 (= res!927564 (validKeyInArray!0 (select (arr!45807 a!2938) i!1065)))))

(declare-fun b!1386339 () Bool)

(declare-datatypes ((Unit!46292 0))(
  ( (Unit!46293) )
))
(declare-fun e!785354 () Unit!46292)

(declare-fun Unit!46294 () Unit!46292)

(assert (=> b!1386339 (= e!785354 Unit!46294)))

(declare-fun b!1386340 () Bool)

(declare-fun res!927560 () Bool)

(assert (=> b!1386340 (=> (not res!927560) (not e!785351))))

(assert (=> b!1386340 (= res!927560 (and (not (= (select (arr!45807 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45807 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386341 () Bool)

(assert (=> b!1386341 (= e!785351 false)))

(declare-fun lt!609432 () Unit!46292)

(assert (=> b!1386341 (= lt!609432 e!785354)))

(declare-fun c!128829 () Bool)

(declare-fun e!785353 () Bool)

(assert (=> b!1386341 (= c!128829 e!785353)))

(declare-fun res!927565 () Bool)

(assert (=> b!1386341 (=> (not res!927565) (not e!785353))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1386341 (= res!927565 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386342 () Bool)

(declare-fun res!927561 () Bool)

(assert (=> b!1386342 (=> (not res!927561) (not e!785351))))

(assert (=> b!1386342 (= res!927561 (and (= (size!46357 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46357 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46357 a!2938))))))

(declare-fun b!1386343 () Bool)

(declare-fun res!927563 () Bool)

(assert (=> b!1386343 (=> (not res!927563) (not e!785351))))

(declare-datatypes ((List!32335 0))(
  ( (Nil!32332) (Cons!32331 (h!33540 (_ BitVec 64)) (t!47029 List!32335)) )
))
(declare-fun arrayNoDuplicates!0 (array!94862 (_ BitVec 32) List!32335) Bool)

(assert (=> b!1386343 (= res!927563 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32332))))

(declare-fun b!1386344 () Bool)

(assert (=> b!1386344 (= e!785353 (validKeyInArray!0 (select (arr!45807 a!2938) startIndex!16)))))

(declare-fun b!1386345 () Bool)

(declare-fun lt!609431 () Unit!46292)

(assert (=> b!1386345 (= e!785354 lt!609431)))

(declare-fun lt!609430 () Unit!46292)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94862 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46292)

(assert (=> b!1386345 (= lt!609430 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10150 0))(
  ( (MissingZero!10150 (index!42971 (_ BitVec 32))) (Found!10150 (index!42972 (_ BitVec 32))) (Intermediate!10150 (undefined!10962 Bool) (index!42973 (_ BitVec 32)) (x!124591 (_ BitVec 32))) (Undefined!10150) (MissingVacant!10150 (index!42974 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94862 (_ BitVec 32)) SeekEntryResult!10150)

(assert (=> b!1386345 (= (seekEntryOrOpen!0 (select (arr!45807 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45807 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94863 (store (arr!45807 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46357 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94862 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46292)

(assert (=> b!1386345 (= lt!609431 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1386345 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!927559 () Bool)

(assert (=> start!118586 (=> (not res!927559) (not e!785351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118586 (= res!927559 (validMask!0 mask!2987))))

(assert (=> start!118586 e!785351))

(assert (=> start!118586 true))

(declare-fun array_inv!34835 (array!94862) Bool)

(assert (=> start!118586 (array_inv!34835 a!2938)))

(assert (= (and start!118586 res!927559) b!1386342))

(assert (= (and b!1386342 res!927561) b!1386338))

(assert (= (and b!1386338 res!927564) b!1386343))

(assert (= (and b!1386343 res!927563) b!1386337))

(assert (= (and b!1386337 res!927562) b!1386340))

(assert (= (and b!1386340 res!927560) b!1386341))

(assert (= (and b!1386341 res!927565) b!1386344))

(assert (= (and b!1386341 c!128829) b!1386345))

(assert (= (and b!1386341 (not c!128829)) b!1386339))

(declare-fun m!1271691 () Bool)

(assert (=> start!118586 m!1271691))

(declare-fun m!1271693 () Bool)

(assert (=> start!118586 m!1271693))

(declare-fun m!1271695 () Bool)

(assert (=> b!1386343 m!1271695))

(declare-fun m!1271697 () Bool)

(assert (=> b!1386344 m!1271697))

(assert (=> b!1386344 m!1271697))

(declare-fun m!1271699 () Bool)

(assert (=> b!1386344 m!1271699))

(declare-fun m!1271701 () Bool)

(assert (=> b!1386338 m!1271701))

(assert (=> b!1386338 m!1271701))

(declare-fun m!1271703 () Bool)

(assert (=> b!1386338 m!1271703))

(declare-fun m!1271705 () Bool)

(assert (=> b!1386345 m!1271705))

(declare-fun m!1271707 () Bool)

(assert (=> b!1386345 m!1271707))

(assert (=> b!1386345 m!1271707))

(declare-fun m!1271709 () Bool)

(assert (=> b!1386345 m!1271709))

(declare-fun m!1271711 () Bool)

(assert (=> b!1386345 m!1271711))

(declare-fun m!1271713 () Bool)

(assert (=> b!1386345 m!1271713))

(assert (=> b!1386345 m!1271697))

(declare-fun m!1271715 () Bool)

(assert (=> b!1386345 m!1271715))

(assert (=> b!1386345 m!1271697))

(declare-fun m!1271717 () Bool)

(assert (=> b!1386345 m!1271717))

(declare-fun m!1271719 () Bool)

(assert (=> b!1386337 m!1271719))

(assert (=> b!1386340 m!1271701))

(check-sat (not b!1386338) (not b!1386337) (not b!1386344) (not b!1386345) (not b!1386343) (not start!118586))
