; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124788 () Bool)

(assert start!124788)

(declare-fun res!979319 () Bool)

(declare-fun e!815319 () Bool)

(assert (=> start!124788 (=> (not res!979319) (not e!815319))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124788 (= res!979319 (validMask!0 mask!2687))))

(assert (=> start!124788 e!815319))

(assert (=> start!124788 true))

(declare-datatypes ((array!98236 0))(
  ( (array!98237 (arr!47406 (Array (_ BitVec 32) (_ BitVec 64))) (size!47956 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98236)

(declare-fun array_inv!36434 (array!98236) Bool)

(assert (=> start!124788 (array_inv!36434 a!2862)))

(declare-fun b!1447686 () Bool)

(declare-fun e!815317 () Bool)

(declare-fun e!815315 () Bool)

(assert (=> b!1447686 (= e!815317 e!815315)))

(declare-fun res!979313 () Bool)

(assert (=> b!1447686 (=> (not res!979313) (not e!815315))))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11658 0))(
  ( (MissingZero!11658 (index!49024 (_ BitVec 32))) (Found!11658 (index!49025 (_ BitVec 32))) (Intermediate!11658 (undefined!12470 Bool) (index!49026 (_ BitVec 32)) (x!130699 (_ BitVec 32))) (Undefined!11658) (MissingVacant!11658 (index!49027 (_ BitVec 32))) )
))
(declare-fun lt!635259 () SeekEntryResult!11658)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98236 (_ BitVec 32)) SeekEntryResult!11658)

(assert (=> b!1447686 (= res!979313 (= lt!635259 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47406 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1447687 () Bool)

(declare-fun res!979324 () Bool)

(declare-fun e!815318 () Bool)

(assert (=> b!1447687 (=> (not res!979324) (not e!815318))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1447687 (= res!979324 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1447688 () Bool)

(assert (=> b!1447688 (= e!815315 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun lt!635256 () (_ BitVec 64))

(declare-fun lt!635258 () SeekEntryResult!11658)

(declare-fun b!1447689 () Bool)

(declare-fun e!815322 () Bool)

(declare-fun lt!635255 () array!98236)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98236 (_ BitVec 32)) SeekEntryResult!11658)

(assert (=> b!1447689 (= e!815322 (= lt!635258 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635256 lt!635255 mask!2687)))))

(declare-fun b!1447690 () Bool)

(declare-fun res!979326 () Bool)

(declare-fun e!815316 () Bool)

(assert (=> b!1447690 (=> (not res!979326) (not e!815316))))

(declare-fun lt!635257 () SeekEntryResult!11658)

(assert (=> b!1447690 (= res!979326 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47406 a!2862) j!93) a!2862 mask!2687) lt!635257))))

(declare-fun b!1447691 () Bool)

(declare-fun res!979314 () Bool)

(assert (=> b!1447691 (=> (not res!979314) (not e!815319))))

(declare-datatypes ((List!33907 0))(
  ( (Nil!33904) (Cons!33903 (h!35253 (_ BitVec 64)) (t!48601 List!33907)) )
))
(declare-fun arrayNoDuplicates!0 (array!98236 (_ BitVec 32) List!33907) Bool)

(assert (=> b!1447691 (= res!979314 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33904))))

(declare-fun b!1447692 () Bool)

(declare-fun res!979317 () Bool)

(assert (=> b!1447692 (=> (not res!979317) (not e!815319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447692 (= res!979317 (validKeyInArray!0 (select (arr!47406 a!2862) j!93)))))

(declare-fun b!1447693 () Bool)

(declare-fun e!815321 () Bool)

(assert (=> b!1447693 (= e!815319 e!815321)))

(declare-fun res!979321 () Bool)

(assert (=> b!1447693 (=> (not res!979321) (not e!815321))))

(assert (=> b!1447693 (= res!979321 (= (select (store (arr!47406 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1447693 (= lt!635255 (array!98237 (store (arr!47406 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47956 a!2862)))))

(declare-fun b!1447694 () Bool)

(declare-fun e!815320 () Bool)

(assert (=> b!1447694 (= e!815318 (not e!815320))))

(declare-fun res!979311 () Bool)

(assert (=> b!1447694 (=> res!979311 e!815320)))

(assert (=> b!1447694 (= res!979311 (or (and (= (select (arr!47406 a!2862) index!646) (select (store (arr!47406 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47406 a!2862) index!646) (select (arr!47406 a!2862) j!93))) (not (= (select (arr!47406 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47406 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!815323 () Bool)

(assert (=> b!1447694 e!815323))

(declare-fun res!979315 () Bool)

(assert (=> b!1447694 (=> (not res!979315) (not e!815323))))

(assert (=> b!1447694 (= res!979315 (and (= lt!635259 (Found!11658 j!93)) (or (= (select (arr!47406 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47406 a!2862) intermediateBeforeIndex!19) (select (arr!47406 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98236 (_ BitVec 32)) SeekEntryResult!11658)

(assert (=> b!1447694 (= lt!635259 (seekEntryOrOpen!0 (select (arr!47406 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98236 (_ BitVec 32)) Bool)

(assert (=> b!1447694 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48812 0))(
  ( (Unit!48813) )
))
(declare-fun lt!635253 () Unit!48812)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98236 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48812)

(assert (=> b!1447694 (= lt!635253 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447695 () Bool)

(assert (=> b!1447695 (= e!815321 e!815316)))

(declare-fun res!979318 () Bool)

(assert (=> b!1447695 (=> (not res!979318) (not e!815316))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447695 (= res!979318 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47406 a!2862) j!93) mask!2687) (select (arr!47406 a!2862) j!93) a!2862 mask!2687) lt!635257))))

(assert (=> b!1447695 (= lt!635257 (Intermediate!11658 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1447696 () Bool)

(assert (=> b!1447696 (= e!815323 e!815317)))

(declare-fun res!979320 () Bool)

(assert (=> b!1447696 (=> res!979320 e!815317)))

(assert (=> b!1447696 (= res!979320 (or (and (= (select (arr!47406 a!2862) index!646) (select (store (arr!47406 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47406 a!2862) index!646) (select (arr!47406 a!2862) j!93))) (not (= (select (arr!47406 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1447697 () Bool)

(declare-fun res!979312 () Bool)

(assert (=> b!1447697 (=> (not res!979312) (not e!815318))))

(assert (=> b!1447697 (= res!979312 e!815322)))

(declare-fun c!133698 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1447697 (= c!133698 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447698 () Bool)

(assert (=> b!1447698 (= e!815322 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635256 lt!635255 mask!2687) (seekEntryOrOpen!0 lt!635256 lt!635255 mask!2687)))))

(declare-fun b!1447699 () Bool)

(declare-fun res!979323 () Bool)

(assert (=> b!1447699 (=> (not res!979323) (not e!815319))))

(assert (=> b!1447699 (= res!979323 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47956 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47956 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47956 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1447700 () Bool)

(assert (=> b!1447700 (= e!815316 e!815318)))

(declare-fun res!979316 () Bool)

(assert (=> b!1447700 (=> (not res!979316) (not e!815318))))

(assert (=> b!1447700 (= res!979316 (= lt!635258 (Intermediate!11658 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1447700 (= lt!635258 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635256 mask!2687) lt!635256 lt!635255 mask!2687))))

(assert (=> b!1447700 (= lt!635256 (select (store (arr!47406 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1447701 () Bool)

(declare-fun res!979325 () Bool)

(assert (=> b!1447701 (=> (not res!979325) (not e!815319))))

(assert (=> b!1447701 (= res!979325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447702 () Bool)

(declare-fun res!979322 () Bool)

(assert (=> b!1447702 (=> (not res!979322) (not e!815319))))

(assert (=> b!1447702 (= res!979322 (validKeyInArray!0 (select (arr!47406 a!2862) i!1006)))))

(declare-fun b!1447703 () Bool)

(declare-fun res!979327 () Bool)

(assert (=> b!1447703 (=> (not res!979327) (not e!815319))))

(assert (=> b!1447703 (= res!979327 (and (= (size!47956 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47956 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47956 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1447704 () Bool)

(assert (=> b!1447704 (= e!815320 true)))

(declare-fun lt!635254 () SeekEntryResult!11658)

(assert (=> b!1447704 (= lt!635254 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47406 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and start!124788 res!979319) b!1447703))

(assert (= (and b!1447703 res!979327) b!1447702))

(assert (= (and b!1447702 res!979322) b!1447692))

(assert (= (and b!1447692 res!979317) b!1447701))

(assert (= (and b!1447701 res!979325) b!1447691))

(assert (= (and b!1447691 res!979314) b!1447699))

(assert (= (and b!1447699 res!979323) b!1447693))

(assert (= (and b!1447693 res!979321) b!1447695))

(assert (= (and b!1447695 res!979318) b!1447690))

(assert (= (and b!1447690 res!979326) b!1447700))

(assert (= (and b!1447700 res!979316) b!1447697))

(assert (= (and b!1447697 c!133698) b!1447689))

(assert (= (and b!1447697 (not c!133698)) b!1447698))

(assert (= (and b!1447697 res!979312) b!1447687))

(assert (= (and b!1447687 res!979324) b!1447694))

(assert (= (and b!1447694 res!979315) b!1447696))

(assert (= (and b!1447696 (not res!979320)) b!1447686))

(assert (= (and b!1447686 res!979313) b!1447688))

(assert (= (and b!1447694 (not res!979311)) b!1447704))

(declare-fun m!1336489 () Bool)

(assert (=> b!1447704 m!1336489))

(assert (=> b!1447704 m!1336489))

(declare-fun m!1336491 () Bool)

(assert (=> b!1447704 m!1336491))

(declare-fun m!1336493 () Bool)

(assert (=> b!1447701 m!1336493))

(assert (=> b!1447695 m!1336489))

(assert (=> b!1447695 m!1336489))

(declare-fun m!1336495 () Bool)

(assert (=> b!1447695 m!1336495))

(assert (=> b!1447695 m!1336495))

(assert (=> b!1447695 m!1336489))

(declare-fun m!1336497 () Bool)

(assert (=> b!1447695 m!1336497))

(assert (=> b!1447690 m!1336489))

(assert (=> b!1447690 m!1336489))

(declare-fun m!1336499 () Bool)

(assert (=> b!1447690 m!1336499))

(declare-fun m!1336501 () Bool)

(assert (=> b!1447702 m!1336501))

(assert (=> b!1447702 m!1336501))

(declare-fun m!1336503 () Bool)

(assert (=> b!1447702 m!1336503))

(declare-fun m!1336505 () Bool)

(assert (=> b!1447693 m!1336505))

(declare-fun m!1336507 () Bool)

(assert (=> b!1447693 m!1336507))

(declare-fun m!1336509 () Bool)

(assert (=> b!1447696 m!1336509))

(assert (=> b!1447696 m!1336505))

(declare-fun m!1336511 () Bool)

(assert (=> b!1447696 m!1336511))

(assert (=> b!1447696 m!1336489))

(declare-fun m!1336513 () Bool)

(assert (=> b!1447691 m!1336513))

(assert (=> b!1447686 m!1336489))

(assert (=> b!1447686 m!1336489))

(declare-fun m!1336515 () Bool)

(assert (=> b!1447686 m!1336515))

(assert (=> b!1447692 m!1336489))

(assert (=> b!1447692 m!1336489))

(declare-fun m!1336517 () Bool)

(assert (=> b!1447692 m!1336517))

(declare-fun m!1336519 () Bool)

(assert (=> b!1447689 m!1336519))

(declare-fun m!1336521 () Bool)

(assert (=> b!1447694 m!1336521))

(assert (=> b!1447694 m!1336505))

(declare-fun m!1336523 () Bool)

(assert (=> b!1447694 m!1336523))

(assert (=> b!1447694 m!1336511))

(assert (=> b!1447694 m!1336509))

(assert (=> b!1447694 m!1336489))

(declare-fun m!1336525 () Bool)

(assert (=> b!1447694 m!1336525))

(declare-fun m!1336527 () Bool)

(assert (=> b!1447694 m!1336527))

(assert (=> b!1447694 m!1336489))

(declare-fun m!1336529 () Bool)

(assert (=> b!1447700 m!1336529))

(assert (=> b!1447700 m!1336529))

(declare-fun m!1336531 () Bool)

(assert (=> b!1447700 m!1336531))

(assert (=> b!1447700 m!1336505))

(declare-fun m!1336533 () Bool)

(assert (=> b!1447700 m!1336533))

(declare-fun m!1336535 () Bool)

(assert (=> b!1447698 m!1336535))

(declare-fun m!1336537 () Bool)

(assert (=> b!1447698 m!1336537))

(declare-fun m!1336539 () Bool)

(assert (=> start!124788 m!1336539))

(declare-fun m!1336541 () Bool)

(assert (=> start!124788 m!1336541))

(check-sat (not b!1447694) (not b!1447695) (not b!1447700) (not b!1447692) (not b!1447690) (not b!1447701) (not b!1447686) (not b!1447689) (not b!1447704) (not b!1447698) (not start!124788) (not b!1447691) (not b!1447702))
(check-sat)
