; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121582 () Bool)

(assert start!121582)

(declare-fun b!1412346 () Bool)

(declare-fun e!799249 () Bool)

(declare-fun e!799246 () Bool)

(assert (=> b!1412346 (= e!799249 e!799246)))

(declare-fun res!949338 () Bool)

(assert (=> b!1412346 (=> res!949338 e!799246)))

(declare-datatypes ((SeekEntryResult!10908 0))(
  ( (MissingZero!10908 (index!46012 (_ BitVec 32))) (Found!10908 (index!46013 (_ BitVec 32))) (Intermediate!10908 (undefined!11720 Bool) (index!46014 (_ BitVec 32)) (x!127603 (_ BitVec 32))) (Undefined!10908) (MissingVacant!10908 (index!46015 (_ BitVec 32))) )
))
(declare-fun lt!622274 () SeekEntryResult!10908)

(declare-fun lt!622271 () SeekEntryResult!10908)

(assert (=> b!1412346 (= res!949338 (or (= lt!622274 lt!622271) (not (is-Intermediate!10908 lt!622271))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96520 0))(
  ( (array!96521 (arr!46597 (Array (_ BitVec 32) (_ BitVec 64))) (size!47147 (_ BitVec 32))) )
))
(declare-fun lt!622269 () array!96520)

(declare-fun lt!622272 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96520 (_ BitVec 32)) SeekEntryResult!10908)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412346 (= lt!622271 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622272 mask!2840) lt!622272 lt!622269 mask!2840))))

(declare-fun a!2901 () array!96520)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1412346 (= lt!622272 (select (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412346 (= lt!622269 (array!96521 (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47147 a!2901)))))

(declare-fun b!1412347 () Bool)

(declare-fun res!949336 () Bool)

(declare-fun e!799250 () Bool)

(assert (=> b!1412347 (=> (not res!949336) (not e!799250))))

(assert (=> b!1412347 (= res!949336 (and (= (size!47147 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47147 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47147 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412348 () Bool)

(assert (=> b!1412348 (= e!799246 true)))

(declare-fun e!799245 () Bool)

(assert (=> b!1412348 e!799245))

(declare-fun res!949342 () Bool)

(assert (=> b!1412348 (=> (not res!949342) (not e!799245))))

(assert (=> b!1412348 (= res!949342 (and (not (undefined!11720 lt!622271)) (= (index!46014 lt!622271) i!1037) (bvslt (x!127603 lt!622271) (x!127603 lt!622274)) (= (select (store (arr!46597 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46014 lt!622271)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47790 0))(
  ( (Unit!47791) )
))
(declare-fun lt!622275 () Unit!47790)

(declare-fun lt!622273 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96520 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47790)

(assert (=> b!1412348 (= lt!622275 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622273 (x!127603 lt!622274) (index!46014 lt!622274) (x!127603 lt!622271) (index!46014 lt!622271) (undefined!11720 lt!622271) mask!2840))))

(declare-fun b!1412349 () Bool)

(declare-fun res!949340 () Bool)

(assert (=> b!1412349 (=> (not res!949340) (not e!799250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412349 (= res!949340 (validKeyInArray!0 (select (arr!46597 a!2901) j!112)))))

(declare-fun b!1412350 () Bool)

(declare-fun res!949343 () Bool)

(assert (=> b!1412350 (=> (not res!949343) (not e!799250))))

(assert (=> b!1412350 (= res!949343 (validKeyInArray!0 (select (arr!46597 a!2901) i!1037)))))

(declare-fun b!1412351 () Bool)

(assert (=> b!1412351 (= e!799250 (not e!799249))))

(declare-fun res!949339 () Bool)

(assert (=> b!1412351 (=> res!949339 e!799249)))

(assert (=> b!1412351 (= res!949339 (or (not (is-Intermediate!10908 lt!622274)) (undefined!11720 lt!622274)))))

(declare-fun e!799248 () Bool)

(assert (=> b!1412351 e!799248))

(declare-fun res!949344 () Bool)

(assert (=> b!1412351 (=> (not res!949344) (not e!799248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96520 (_ BitVec 32)) Bool)

(assert (=> b!1412351 (= res!949344 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622270 () Unit!47790)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96520 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47790)

(assert (=> b!1412351 (= lt!622270 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1412351 (= lt!622274 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622273 (select (arr!46597 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1412351 (= lt!622273 (toIndex!0 (select (arr!46597 a!2901) j!112) mask!2840))))

(declare-fun res!949337 () Bool)

(assert (=> start!121582 (=> (not res!949337) (not e!799250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121582 (= res!949337 (validMask!0 mask!2840))))

(assert (=> start!121582 e!799250))

(assert (=> start!121582 true))

(declare-fun array_inv!35625 (array!96520) Bool)

(assert (=> start!121582 (array_inv!35625 a!2901)))

(declare-fun b!1412352 () Bool)

(declare-fun res!949341 () Bool)

(assert (=> b!1412352 (=> (not res!949341) (not e!799250))))

(assert (=> b!1412352 (= res!949341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412353 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96520 (_ BitVec 32)) SeekEntryResult!10908)

(assert (=> b!1412353 (= e!799248 (= (seekEntryOrOpen!0 (select (arr!46597 a!2901) j!112) a!2901 mask!2840) (Found!10908 j!112)))))

(declare-fun b!1412354 () Bool)

(declare-fun res!949345 () Bool)

(assert (=> b!1412354 (=> (not res!949345) (not e!799250))))

(declare-datatypes ((List!33116 0))(
  ( (Nil!33113) (Cons!33112 (h!34387 (_ BitVec 64)) (t!47810 List!33116)) )
))
(declare-fun arrayNoDuplicates!0 (array!96520 (_ BitVec 32) List!33116) Bool)

(assert (=> b!1412354 (= res!949345 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33113))))

(declare-fun b!1412355 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96520 (_ BitVec 32)) SeekEntryResult!10908)

(assert (=> b!1412355 (= e!799245 (= (seekEntryOrOpen!0 lt!622272 lt!622269 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127603 lt!622271) (index!46014 lt!622271) (index!46014 lt!622271) (select (arr!46597 a!2901) j!112) lt!622269 mask!2840)))))

(assert (= (and start!121582 res!949337) b!1412347))

(assert (= (and b!1412347 res!949336) b!1412350))

(assert (= (and b!1412350 res!949343) b!1412349))

(assert (= (and b!1412349 res!949340) b!1412352))

(assert (= (and b!1412352 res!949341) b!1412354))

(assert (= (and b!1412354 res!949345) b!1412351))

(assert (= (and b!1412351 res!949344) b!1412353))

(assert (= (and b!1412351 (not res!949339)) b!1412346))

(assert (= (and b!1412346 (not res!949338)) b!1412348))

(assert (= (and b!1412348 res!949342) b!1412355))

(declare-fun m!1302333 () Bool)

(assert (=> b!1412346 m!1302333))

(assert (=> b!1412346 m!1302333))

(declare-fun m!1302335 () Bool)

(assert (=> b!1412346 m!1302335))

(declare-fun m!1302337 () Bool)

(assert (=> b!1412346 m!1302337))

(declare-fun m!1302339 () Bool)

(assert (=> b!1412346 m!1302339))

(declare-fun m!1302341 () Bool)

(assert (=> b!1412353 m!1302341))

(assert (=> b!1412353 m!1302341))

(declare-fun m!1302343 () Bool)

(assert (=> b!1412353 m!1302343))

(assert (=> b!1412349 m!1302341))

(assert (=> b!1412349 m!1302341))

(declare-fun m!1302345 () Bool)

(assert (=> b!1412349 m!1302345))

(declare-fun m!1302347 () Bool)

(assert (=> start!121582 m!1302347))

(declare-fun m!1302349 () Bool)

(assert (=> start!121582 m!1302349))

(declare-fun m!1302351 () Bool)

(assert (=> b!1412350 m!1302351))

(assert (=> b!1412350 m!1302351))

(declare-fun m!1302353 () Bool)

(assert (=> b!1412350 m!1302353))

(declare-fun m!1302355 () Bool)

(assert (=> b!1412352 m!1302355))

(assert (=> b!1412348 m!1302337))

(declare-fun m!1302357 () Bool)

(assert (=> b!1412348 m!1302357))

(declare-fun m!1302359 () Bool)

(assert (=> b!1412348 m!1302359))

(declare-fun m!1302361 () Bool)

(assert (=> b!1412355 m!1302361))

(assert (=> b!1412355 m!1302341))

(assert (=> b!1412355 m!1302341))

(declare-fun m!1302363 () Bool)

(assert (=> b!1412355 m!1302363))

(assert (=> b!1412351 m!1302341))

(declare-fun m!1302365 () Bool)

(assert (=> b!1412351 m!1302365))

(assert (=> b!1412351 m!1302341))

(declare-fun m!1302367 () Bool)

(assert (=> b!1412351 m!1302367))

(assert (=> b!1412351 m!1302341))

(declare-fun m!1302369 () Bool)

(assert (=> b!1412351 m!1302369))

(declare-fun m!1302371 () Bool)

(assert (=> b!1412351 m!1302371))

(declare-fun m!1302373 () Bool)

(assert (=> b!1412354 m!1302373))

(push 1)

