; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124748 () Bool)

(assert start!124748)

(declare-fun b!1446546 () Bool)

(declare-fun res!978293 () Bool)

(declare-fun e!814716 () Bool)

(assert (=> b!1446546 (=> (not res!978293) (not e!814716))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1446546 (= res!978293 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446548 () Bool)

(declare-fun res!978298 () Bool)

(declare-fun e!814724 () Bool)

(assert (=> b!1446548 (=> (not res!978298) (not e!814724))))

(declare-datatypes ((array!98196 0))(
  ( (array!98197 (arr!47386 (Array (_ BitVec 32) (_ BitVec 64))) (size!47936 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98196)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98196 (_ BitVec 32)) Bool)

(assert (=> b!1446548 (= res!978298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446549 () Bool)

(declare-fun res!978301 () Bool)

(assert (=> b!1446549 (=> (not res!978301) (not e!814724))))

(declare-datatypes ((List!33887 0))(
  ( (Nil!33884) (Cons!33883 (h!35233 (_ BitVec 64)) (t!48581 List!33887)) )
))
(declare-fun arrayNoDuplicates!0 (array!98196 (_ BitVec 32) List!33887) Bool)

(assert (=> b!1446549 (= res!978301 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33884))))

(declare-fun b!1446550 () Bool)

(declare-fun e!814718 () Bool)

(declare-fun e!814719 () Bool)

(assert (=> b!1446550 (= e!814718 e!814719)))

(declare-fun res!978292 () Bool)

(assert (=> b!1446550 (=> (not res!978292) (not e!814719))))

(declare-datatypes ((SeekEntryResult!11638 0))(
  ( (MissingZero!11638 (index!48944 (_ BitVec 32))) (Found!11638 (index!48945 (_ BitVec 32))) (Intermediate!11638 (undefined!12450 Bool) (index!48946 (_ BitVec 32)) (x!130623 (_ BitVec 32))) (Undefined!11638) (MissingVacant!11638 (index!48947 (_ BitVec 32))) )
))
(declare-fun lt!634837 () SeekEntryResult!11638)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98196 (_ BitVec 32)) SeekEntryResult!11638)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446550 (= res!978292 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47386 a!2862) j!93) mask!2687) (select (arr!47386 a!2862) j!93) a!2862 mask!2687) lt!634837))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1446550 (= lt!634837 (Intermediate!11638 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1446551 () Bool)

(assert (=> b!1446551 (= e!814719 e!814716)))

(declare-fun res!978307 () Bool)

(assert (=> b!1446551 (=> (not res!978307) (not e!814716))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!634835 () SeekEntryResult!11638)

(assert (=> b!1446551 (= res!978307 (= lt!634835 (Intermediate!11638 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634833 () array!98196)

(declare-fun lt!634838 () (_ BitVec 64))

(assert (=> b!1446551 (= lt!634835 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634838 mask!2687) lt!634838 lt!634833 mask!2687))))

(assert (=> b!1446551 (= lt!634838 (select (store (arr!47386 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446552 () Bool)

(declare-fun e!814723 () Bool)

(declare-fun e!814715 () Bool)

(assert (=> b!1446552 (= e!814723 e!814715)))

(declare-fun res!978296 () Bool)

(assert (=> b!1446552 (=> (not res!978296) (not e!814715))))

(declare-fun lt!634839 () SeekEntryResult!11638)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98196 (_ BitVec 32)) SeekEntryResult!11638)

(assert (=> b!1446552 (= res!978296 (= lt!634839 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47386 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1446553 () Bool)

(declare-fun res!978299 () Bool)

(assert (=> b!1446553 (=> (not res!978299) (not e!814724))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446553 (= res!978299 (validKeyInArray!0 (select (arr!47386 a!2862) j!93)))))

(declare-fun b!1446554 () Bool)

(declare-fun res!978291 () Bool)

(assert (=> b!1446554 (=> (not res!978291) (not e!814716))))

(declare-fun e!814721 () Bool)

(assert (=> b!1446554 (= res!978291 e!814721)))

(declare-fun c!133638 () Bool)

(assert (=> b!1446554 (= c!133638 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1446547 () Bool)

(declare-fun e!814717 () Bool)

(assert (=> b!1446547 (= e!814717 e!814723)))

(declare-fun res!978304 () Bool)

(assert (=> b!1446547 (=> res!978304 e!814723)))

(assert (=> b!1446547 (= res!978304 (or (and (= (select (arr!47386 a!2862) index!646) (select (store (arr!47386 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47386 a!2862) index!646) (select (arr!47386 a!2862) j!93))) (not (= (select (arr!47386 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!978295 () Bool)

(assert (=> start!124748 (=> (not res!978295) (not e!814724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124748 (= res!978295 (validMask!0 mask!2687))))

(assert (=> start!124748 e!814724))

(assert (=> start!124748 true))

(declare-fun array_inv!36414 (array!98196) Bool)

(assert (=> start!124748 (array_inv!36414 a!2862)))

(declare-fun b!1446555 () Bool)

(assert (=> b!1446555 (= e!814721 (= lt!634835 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634838 lt!634833 mask!2687)))))

(declare-fun b!1446556 () Bool)

(assert (=> b!1446556 (= e!814715 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1446557 () Bool)

(declare-fun res!978300 () Bool)

(assert (=> b!1446557 (=> (not res!978300) (not e!814724))))

(assert (=> b!1446557 (= res!978300 (and (= (size!47936 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47936 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47936 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1446558 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98196 (_ BitVec 32)) SeekEntryResult!11638)

(assert (=> b!1446558 (= e!814721 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634838 lt!634833 mask!2687) (seekEntryOrOpen!0 lt!634838 lt!634833 mask!2687)))))

(declare-fun b!1446559 () Bool)

(declare-fun e!814722 () Bool)

(assert (=> b!1446559 (= e!814722 true)))

(declare-fun lt!634836 () SeekEntryResult!11638)

(assert (=> b!1446559 (= lt!634836 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47386 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1446560 () Bool)

(declare-fun res!978305 () Bool)

(assert (=> b!1446560 (=> (not res!978305) (not e!814719))))

(assert (=> b!1446560 (= res!978305 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47386 a!2862) j!93) a!2862 mask!2687) lt!634837))))

(declare-fun b!1446561 () Bool)

(assert (=> b!1446561 (= e!814724 e!814718)))

(declare-fun res!978297 () Bool)

(assert (=> b!1446561 (=> (not res!978297) (not e!814718))))

(assert (=> b!1446561 (= res!978297 (= (select (store (arr!47386 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1446561 (= lt!634833 (array!98197 (store (arr!47386 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47936 a!2862)))))

(declare-fun b!1446562 () Bool)

(assert (=> b!1446562 (= e!814716 (not e!814722))))

(declare-fun res!978294 () Bool)

(assert (=> b!1446562 (=> res!978294 e!814722)))

(assert (=> b!1446562 (= res!978294 (or (and (= (select (arr!47386 a!2862) index!646) (select (store (arr!47386 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47386 a!2862) index!646) (select (arr!47386 a!2862) j!93))) (not (= (select (arr!47386 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47386 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1446562 e!814717))

(declare-fun res!978303 () Bool)

(assert (=> b!1446562 (=> (not res!978303) (not e!814717))))

(assert (=> b!1446562 (= res!978303 (and (= lt!634839 (Found!11638 j!93)) (or (= (select (arr!47386 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47386 a!2862) intermediateBeforeIndex!19) (select (arr!47386 a!2862) j!93)))))))

(assert (=> b!1446562 (= lt!634839 (seekEntryOrOpen!0 (select (arr!47386 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1446562 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48772 0))(
  ( (Unit!48773) )
))
(declare-fun lt!634834 () Unit!48772)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98196 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48772)

(assert (=> b!1446562 (= lt!634834 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1446563 () Bool)

(declare-fun res!978306 () Bool)

(assert (=> b!1446563 (=> (not res!978306) (not e!814724))))

(assert (=> b!1446563 (= res!978306 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47936 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47936 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47936 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1446564 () Bool)

(declare-fun res!978302 () Bool)

(assert (=> b!1446564 (=> (not res!978302) (not e!814724))))

(assert (=> b!1446564 (= res!978302 (validKeyInArray!0 (select (arr!47386 a!2862) i!1006)))))

(assert (= (and start!124748 res!978295) b!1446557))

(assert (= (and b!1446557 res!978300) b!1446564))

(assert (= (and b!1446564 res!978302) b!1446553))

(assert (= (and b!1446553 res!978299) b!1446548))

(assert (= (and b!1446548 res!978298) b!1446549))

(assert (= (and b!1446549 res!978301) b!1446563))

(assert (= (and b!1446563 res!978306) b!1446561))

(assert (= (and b!1446561 res!978297) b!1446550))

(assert (= (and b!1446550 res!978292) b!1446560))

(assert (= (and b!1446560 res!978305) b!1446551))

(assert (= (and b!1446551 res!978307) b!1446554))

(assert (= (and b!1446554 c!133638) b!1446555))

(assert (= (and b!1446554 (not c!133638)) b!1446558))

(assert (= (and b!1446554 res!978291) b!1446546))

(assert (= (and b!1446546 res!978293) b!1446562))

(assert (= (and b!1446562 res!978303) b!1446547))

(assert (= (and b!1446547 (not res!978304)) b!1446552))

(assert (= (and b!1446552 res!978296) b!1446556))

(assert (= (and b!1446562 (not res!978294)) b!1446559))

(declare-fun m!1335409 () Bool)

(assert (=> b!1446560 m!1335409))

(assert (=> b!1446560 m!1335409))

(declare-fun m!1335411 () Bool)

(assert (=> b!1446560 m!1335411))

(assert (=> b!1446552 m!1335409))

(assert (=> b!1446552 m!1335409))

(declare-fun m!1335413 () Bool)

(assert (=> b!1446552 m!1335413))

(declare-fun m!1335415 () Bool)

(assert (=> b!1446549 m!1335415))

(assert (=> b!1446550 m!1335409))

(assert (=> b!1446550 m!1335409))

(declare-fun m!1335417 () Bool)

(assert (=> b!1446550 m!1335417))

(assert (=> b!1446550 m!1335417))

(assert (=> b!1446550 m!1335409))

(declare-fun m!1335419 () Bool)

(assert (=> b!1446550 m!1335419))

(declare-fun m!1335421 () Bool)

(assert (=> b!1446562 m!1335421))

(declare-fun m!1335423 () Bool)

(assert (=> b!1446562 m!1335423))

(declare-fun m!1335425 () Bool)

(assert (=> b!1446562 m!1335425))

(declare-fun m!1335427 () Bool)

(assert (=> b!1446562 m!1335427))

(declare-fun m!1335429 () Bool)

(assert (=> b!1446562 m!1335429))

(assert (=> b!1446562 m!1335409))

(declare-fun m!1335431 () Bool)

(assert (=> b!1446562 m!1335431))

(declare-fun m!1335433 () Bool)

(assert (=> b!1446562 m!1335433))

(assert (=> b!1446562 m!1335409))

(declare-fun m!1335435 () Bool)

(assert (=> b!1446558 m!1335435))

(declare-fun m!1335437 () Bool)

(assert (=> b!1446558 m!1335437))

(declare-fun m!1335439 () Bool)

(assert (=> b!1446555 m!1335439))

(assert (=> b!1446559 m!1335409))

(assert (=> b!1446559 m!1335409))

(declare-fun m!1335441 () Bool)

(assert (=> b!1446559 m!1335441))

(assert (=> b!1446553 m!1335409))

(assert (=> b!1446553 m!1335409))

(declare-fun m!1335443 () Bool)

(assert (=> b!1446553 m!1335443))

(declare-fun m!1335445 () Bool)

(assert (=> b!1446548 m!1335445))

(assert (=> b!1446561 m!1335423))

(declare-fun m!1335447 () Bool)

(assert (=> b!1446561 m!1335447))

(declare-fun m!1335449 () Bool)

(assert (=> start!124748 m!1335449))

(declare-fun m!1335451 () Bool)

(assert (=> start!124748 m!1335451))

(assert (=> b!1446547 m!1335429))

(assert (=> b!1446547 m!1335423))

(assert (=> b!1446547 m!1335427))

(assert (=> b!1446547 m!1335409))

(declare-fun m!1335453 () Bool)

(assert (=> b!1446564 m!1335453))

(assert (=> b!1446564 m!1335453))

(declare-fun m!1335455 () Bool)

(assert (=> b!1446564 m!1335455))

(declare-fun m!1335457 () Bool)

(assert (=> b!1446551 m!1335457))

(assert (=> b!1446551 m!1335457))

(declare-fun m!1335459 () Bool)

(assert (=> b!1446551 m!1335459))

(assert (=> b!1446551 m!1335423))

(declare-fun m!1335461 () Bool)

(assert (=> b!1446551 m!1335461))

(push 1)

