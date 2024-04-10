; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124746 () Bool)

(assert start!124746)

(declare-fun b!1446489 () Bool)

(declare-fun e!814694 () Bool)

(declare-fun e!814693 () Bool)

(assert (=> b!1446489 (= e!814694 e!814693)))

(declare-fun res!978243 () Bool)

(assert (=> b!1446489 (=> (not res!978243) (not e!814693))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98194 0))(
  ( (array!98195 (arr!47385 (Array (_ BitVec 32) (_ BitVec 64))) (size!47935 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98194)

(assert (=> b!1446489 (= res!978243 (= (select (store (arr!47385 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!634816 () array!98194)

(assert (=> b!1446489 (= lt!634816 (array!98195 (store (arr!47385 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47935 a!2862)))))

(declare-fun b!1446490 () Bool)

(declare-fun e!814687 () Bool)

(declare-fun e!814690 () Bool)

(assert (=> b!1446490 (= e!814687 e!814690)))

(declare-fun res!978249 () Bool)

(assert (=> b!1446490 (=> res!978249 e!814690)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1446490 (= res!978249 (or (and (= (select (arr!47385 a!2862) index!646) (select (store (arr!47385 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47385 a!2862) index!646) (select (arr!47385 a!2862) j!93))) (not (= (select (arr!47385 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1446491 () Bool)

(declare-fun res!978241 () Bool)

(assert (=> b!1446491 (=> (not res!978241) (not e!814694))))

(declare-datatypes ((List!33886 0))(
  ( (Nil!33883) (Cons!33882 (h!35232 (_ BitVec 64)) (t!48580 List!33886)) )
))
(declare-fun arrayNoDuplicates!0 (array!98194 (_ BitVec 32) List!33886) Bool)

(assert (=> b!1446491 (= res!978241 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33883))))

(declare-fun b!1446492 () Bool)

(declare-fun res!978252 () Bool)

(assert (=> b!1446492 (=> (not res!978252) (not e!814694))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446492 (= res!978252 (validKeyInArray!0 (select (arr!47385 a!2862) i!1006)))))

(declare-fun b!1446493 () Bool)

(declare-fun res!978246 () Bool)

(assert (=> b!1446493 (=> (not res!978246) (not e!814694))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1446493 (= res!978246 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47935 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47935 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47935 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!978244 () Bool)

(assert (=> start!124746 (=> (not res!978244) (not e!814694))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124746 (= res!978244 (validMask!0 mask!2687))))

(assert (=> start!124746 e!814694))

(assert (=> start!124746 true))

(declare-fun array_inv!36413 (array!98194) Bool)

(assert (=> start!124746 (array_inv!36413 a!2862)))

(declare-fun b!1446494 () Bool)

(declare-fun res!978255 () Bool)

(assert (=> b!1446494 (=> (not res!978255) (not e!814694))))

(assert (=> b!1446494 (= res!978255 (and (= (size!47935 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47935 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47935 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1446495 () Bool)

(declare-datatypes ((SeekEntryResult!11637 0))(
  ( (MissingZero!11637 (index!48940 (_ BitVec 32))) (Found!11637 (index!48941 (_ BitVec 32))) (Intermediate!11637 (undefined!12449 Bool) (index!48942 (_ BitVec 32)) (x!130622 (_ BitVec 32))) (Undefined!11637) (MissingVacant!11637 (index!48943 (_ BitVec 32))) )
))
(declare-fun lt!634817 () SeekEntryResult!11637)

(declare-fun e!814689 () Bool)

(declare-fun lt!634815 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98194 (_ BitVec 32)) SeekEntryResult!11637)

(assert (=> b!1446495 (= e!814689 (= lt!634817 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634815 lt!634816 mask!2687)))))

(declare-fun b!1446496 () Bool)

(declare-fun e!814685 () Bool)

(assert (=> b!1446496 (= e!814685 true)))

(declare-fun lt!634814 () SeekEntryResult!11637)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98194 (_ BitVec 32)) SeekEntryResult!11637)

(assert (=> b!1446496 (= lt!634814 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47385 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1446497 () Bool)

(declare-fun e!814688 () Bool)

(assert (=> b!1446497 (= e!814688 (not e!814685))))

(declare-fun res!978254 () Bool)

(assert (=> b!1446497 (=> res!978254 e!814685)))

(assert (=> b!1446497 (= res!978254 (or (and (= (select (arr!47385 a!2862) index!646) (select (store (arr!47385 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47385 a!2862) index!646) (select (arr!47385 a!2862) j!93))) (not (= (select (arr!47385 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47385 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1446497 e!814687))

(declare-fun res!978247 () Bool)

(assert (=> b!1446497 (=> (not res!978247) (not e!814687))))

(declare-fun lt!634813 () SeekEntryResult!11637)

(assert (=> b!1446497 (= res!978247 (and (= lt!634813 (Found!11637 j!93)) (or (= (select (arr!47385 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47385 a!2862) intermediateBeforeIndex!19) (select (arr!47385 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98194 (_ BitVec 32)) SeekEntryResult!11637)

(assert (=> b!1446497 (= lt!634813 (seekEntryOrOpen!0 (select (arr!47385 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98194 (_ BitVec 32)) Bool)

(assert (=> b!1446497 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48770 0))(
  ( (Unit!48771) )
))
(declare-fun lt!634818 () Unit!48770)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98194 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48770)

(assert (=> b!1446497 (= lt!634818 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1446498 () Bool)

(assert (=> b!1446498 (= e!814689 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634815 lt!634816 mask!2687) (seekEntryOrOpen!0 lt!634815 lt!634816 mask!2687)))))

(declare-fun b!1446499 () Bool)

(declare-fun res!978242 () Bool)

(declare-fun e!814691 () Bool)

(assert (=> b!1446499 (=> (not res!978242) (not e!814691))))

(declare-fun lt!634812 () SeekEntryResult!11637)

(assert (=> b!1446499 (= res!978242 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47385 a!2862) j!93) a!2862 mask!2687) lt!634812))))

(declare-fun b!1446500 () Bool)

(assert (=> b!1446500 (= e!814693 e!814691)))

(declare-fun res!978248 () Bool)

(assert (=> b!1446500 (=> (not res!978248) (not e!814691))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446500 (= res!978248 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47385 a!2862) j!93) mask!2687) (select (arr!47385 a!2862) j!93) a!2862 mask!2687) lt!634812))))

(assert (=> b!1446500 (= lt!634812 (Intermediate!11637 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1446501 () Bool)

(declare-fun e!814686 () Bool)

(assert (=> b!1446501 (= e!814690 e!814686)))

(declare-fun res!978250 () Bool)

(assert (=> b!1446501 (=> (not res!978250) (not e!814686))))

(assert (=> b!1446501 (= res!978250 (= lt!634813 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47385 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1446502 () Bool)

(declare-fun res!978245 () Bool)

(assert (=> b!1446502 (=> (not res!978245) (not e!814694))))

(assert (=> b!1446502 (= res!978245 (validKeyInArray!0 (select (arr!47385 a!2862) j!93)))))

(declare-fun b!1446503 () Bool)

(assert (=> b!1446503 (= e!814691 e!814688)))

(declare-fun res!978251 () Bool)

(assert (=> b!1446503 (=> (not res!978251) (not e!814688))))

(assert (=> b!1446503 (= res!978251 (= lt!634817 (Intermediate!11637 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1446503 (= lt!634817 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634815 mask!2687) lt!634815 lt!634816 mask!2687))))

(assert (=> b!1446503 (= lt!634815 (select (store (arr!47385 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446504 () Bool)

(declare-fun res!978256 () Bool)

(assert (=> b!1446504 (=> (not res!978256) (not e!814694))))

(assert (=> b!1446504 (= res!978256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446505 () Bool)

(declare-fun res!978253 () Bool)

(assert (=> b!1446505 (=> (not res!978253) (not e!814688))))

(assert (=> b!1446505 (= res!978253 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446506 () Bool)

(declare-fun res!978240 () Bool)

(assert (=> b!1446506 (=> (not res!978240) (not e!814688))))

(assert (=> b!1446506 (= res!978240 e!814689)))

(declare-fun c!133635 () Bool)

(assert (=> b!1446506 (= c!133635 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1446507 () Bool)

(assert (=> b!1446507 (= e!814686 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(assert (= (and start!124746 res!978244) b!1446494))

(assert (= (and b!1446494 res!978255) b!1446492))

(assert (= (and b!1446492 res!978252) b!1446502))

(assert (= (and b!1446502 res!978245) b!1446504))

(assert (= (and b!1446504 res!978256) b!1446491))

(assert (= (and b!1446491 res!978241) b!1446493))

(assert (= (and b!1446493 res!978246) b!1446489))

(assert (= (and b!1446489 res!978243) b!1446500))

(assert (= (and b!1446500 res!978248) b!1446499))

(assert (= (and b!1446499 res!978242) b!1446503))

(assert (= (and b!1446503 res!978251) b!1446506))

(assert (= (and b!1446506 c!133635) b!1446495))

(assert (= (and b!1446506 (not c!133635)) b!1446498))

(assert (= (and b!1446506 res!978240) b!1446505))

(assert (= (and b!1446505 res!978253) b!1446497))

(assert (= (and b!1446497 res!978247) b!1446490))

(assert (= (and b!1446490 (not res!978249)) b!1446501))

(assert (= (and b!1446501 res!978250) b!1446507))

(assert (= (and b!1446497 (not res!978254)) b!1446496))

(declare-fun m!1335355 () Bool)

(assert (=> b!1446496 m!1335355))

(assert (=> b!1446496 m!1335355))

(declare-fun m!1335357 () Bool)

(assert (=> b!1446496 m!1335357))

(declare-fun m!1335359 () Bool)

(assert (=> b!1446495 m!1335359))

(declare-fun m!1335361 () Bool)

(assert (=> b!1446492 m!1335361))

(assert (=> b!1446492 m!1335361))

(declare-fun m!1335363 () Bool)

(assert (=> b!1446492 m!1335363))

(declare-fun m!1335365 () Bool)

(assert (=> start!124746 m!1335365))

(declare-fun m!1335367 () Bool)

(assert (=> start!124746 m!1335367))

(assert (=> b!1446499 m!1335355))

(assert (=> b!1446499 m!1335355))

(declare-fun m!1335369 () Bool)

(assert (=> b!1446499 m!1335369))

(declare-fun m!1335371 () Bool)

(assert (=> b!1446498 m!1335371))

(declare-fun m!1335373 () Bool)

(assert (=> b!1446498 m!1335373))

(declare-fun m!1335375 () Bool)

(assert (=> b!1446490 m!1335375))

(declare-fun m!1335377 () Bool)

(assert (=> b!1446490 m!1335377))

(declare-fun m!1335379 () Bool)

(assert (=> b!1446490 m!1335379))

(assert (=> b!1446490 m!1335355))

(declare-fun m!1335381 () Bool)

(assert (=> b!1446491 m!1335381))

(assert (=> b!1446489 m!1335377))

(declare-fun m!1335383 () Bool)

(assert (=> b!1446489 m!1335383))

(declare-fun m!1335385 () Bool)

(assert (=> b!1446503 m!1335385))

(assert (=> b!1446503 m!1335385))

(declare-fun m!1335387 () Bool)

(assert (=> b!1446503 m!1335387))

(assert (=> b!1446503 m!1335377))

(declare-fun m!1335389 () Bool)

(assert (=> b!1446503 m!1335389))

(assert (=> b!1446500 m!1335355))

(assert (=> b!1446500 m!1335355))

(declare-fun m!1335391 () Bool)

(assert (=> b!1446500 m!1335391))

(assert (=> b!1446500 m!1335391))

(assert (=> b!1446500 m!1335355))

(declare-fun m!1335393 () Bool)

(assert (=> b!1446500 m!1335393))

(declare-fun m!1335395 () Bool)

(assert (=> b!1446504 m!1335395))

(declare-fun m!1335397 () Bool)

(assert (=> b!1446497 m!1335397))

(assert (=> b!1446497 m!1335377))

(declare-fun m!1335399 () Bool)

(assert (=> b!1446497 m!1335399))

(assert (=> b!1446497 m!1335379))

(assert (=> b!1446497 m!1335375))

(assert (=> b!1446497 m!1335355))

(declare-fun m!1335401 () Bool)

(assert (=> b!1446497 m!1335401))

(declare-fun m!1335403 () Bool)

(assert (=> b!1446497 m!1335403))

(assert (=> b!1446497 m!1335355))

(assert (=> b!1446501 m!1335355))

(assert (=> b!1446501 m!1335355))

(declare-fun m!1335405 () Bool)

(assert (=> b!1446501 m!1335405))

(assert (=> b!1446502 m!1335355))

(assert (=> b!1446502 m!1335355))

(declare-fun m!1335407 () Bool)

(assert (=> b!1446502 m!1335407))

(check-sat (not b!1446501) (not b!1446498) (not b!1446499) (not start!124746) (not b!1446496) (not b!1446500) (not b!1446492) (not b!1446497) (not b!1446504) (not b!1446491) (not b!1446502) (not b!1446495) (not b!1446503))
(check-sat)
