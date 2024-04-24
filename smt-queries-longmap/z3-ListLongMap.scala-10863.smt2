; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127626 () Bool)

(assert start!127626)

(declare-fun b!1498393 () Bool)

(declare-fun res!1018591 () Bool)

(declare-fun e!839321 () Bool)

(assert (=> b!1498393 (=> (not res!1018591) (not e!839321))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99927 0))(
  ( (array!99928 (arr!48223 (Array (_ BitVec 32) (_ BitVec 64))) (size!48774 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99927)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1498393 (= res!1018591 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48774 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48774 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48774 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1498394 () Bool)

(declare-fun e!839323 () Bool)

(declare-fun e!839322 () Bool)

(assert (=> b!1498394 (= e!839323 (not e!839322))))

(declare-fun res!1018590 () Bool)

(assert (=> b!1498394 (=> res!1018590 e!839322)))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1498394 (= res!1018590 (or (and (= (select (arr!48223 a!2862) index!646) (select (store (arr!48223 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48223 a!2862) index!646) (select (arr!48223 a!2862) j!93))) (= (select (arr!48223 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-datatypes ((SeekEntryResult!12360 0))(
  ( (MissingZero!12360 (index!51832 (_ BitVec 32))) (Found!12360 (index!51833 (_ BitVec 32))) (Intermediate!12360 (undefined!13172 Bool) (index!51834 (_ BitVec 32)) (x!133644 (_ BitVec 32))) (Undefined!12360) (MissingVacant!12360 (index!51835 (_ BitVec 32))) )
))
(declare-fun lt!652812 () SeekEntryResult!12360)

(assert (=> b!1498394 (and (= lt!652812 (Found!12360 j!93)) (or (= (select (arr!48223 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48223 a!2862) intermediateBeforeIndex!19) (select (arr!48223 a!2862) j!93))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99927 (_ BitVec 32)) SeekEntryResult!12360)

(assert (=> b!1498394 (= lt!652812 (seekEntryOrOpen!0 (select (arr!48223 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99927 (_ BitVec 32)) Bool)

(assert (=> b!1498394 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!50093 0))(
  ( (Unit!50094) )
))
(declare-fun lt!652810 () Unit!50093)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99927 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50093)

(assert (=> b!1498394 (= lt!652810 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1498395 () Bool)

(declare-fun res!1018594 () Bool)

(assert (=> b!1498395 (=> (not res!1018594) (not e!839323))))

(declare-fun e!839320 () Bool)

(assert (=> b!1498395 (= res!1018594 e!839320)))

(declare-fun c!139446 () Bool)

(assert (=> b!1498395 (= c!139446 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1498396 () Bool)

(declare-fun res!1018599 () Bool)

(assert (=> b!1498396 (=> (not res!1018599) (not e!839321))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498396 (= res!1018599 (validKeyInArray!0 (select (arr!48223 a!2862) i!1006)))))

(declare-fun b!1498397 () Bool)

(declare-fun res!1018607 () Bool)

(assert (=> b!1498397 (=> (not res!1018607) (not e!839323))))

(assert (=> b!1498397 (= res!1018607 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1498398 () Bool)

(declare-fun e!839326 () Bool)

(declare-fun e!839327 () Bool)

(assert (=> b!1498398 (= e!839326 e!839327)))

(declare-fun res!1018595 () Bool)

(assert (=> b!1498398 (=> (not res!1018595) (not e!839327))))

(declare-fun lt!652813 () SeekEntryResult!12360)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99927 (_ BitVec 32)) SeekEntryResult!12360)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1498398 (= res!1018595 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48223 a!2862) j!93) mask!2687) (select (arr!48223 a!2862) j!93) a!2862 mask!2687) lt!652813))))

(assert (=> b!1498398 (= lt!652813 (Intermediate!12360 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1498399 () Bool)

(declare-fun res!1018592 () Bool)

(assert (=> b!1498399 (=> (not res!1018592) (not e!839321))))

(assert (=> b!1498399 (= res!1018592 (and (= (size!48774 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48774 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48774 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1018606 () Bool)

(assert (=> start!127626 (=> (not res!1018606) (not e!839321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127626 (= res!1018606 (validMask!0 mask!2687))))

(assert (=> start!127626 e!839321))

(assert (=> start!127626 true))

(declare-fun array_inv!37504 (array!99927) Bool)

(assert (=> start!127626 (array_inv!37504 a!2862)))

(declare-fun lt!652814 () (_ BitVec 64))

(declare-fun e!839328 () Bool)

(declare-fun lt!652811 () array!99927)

(declare-fun lt!652809 () (_ BitVec 32))

(declare-fun b!1498400 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99927 (_ BitVec 32)) SeekEntryResult!12360)

(assert (=> b!1498400 (= e!839328 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652809 intermediateAfterIndex!19 lt!652814 lt!652811 mask!2687) (seekEntryOrOpen!0 lt!652814 lt!652811 mask!2687))))))

(declare-fun b!1498401 () Bool)

(declare-fun res!1018605 () Bool)

(assert (=> b!1498401 (=> (not res!1018605) (not e!839321))))

(declare-datatypes ((List!34711 0))(
  ( (Nil!34708) (Cons!34707 (h!36119 (_ BitVec 64)) (t!49397 List!34711)) )
))
(declare-fun arrayNoDuplicates!0 (array!99927 (_ BitVec 32) List!34711) Bool)

(assert (=> b!1498401 (= res!1018605 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34708))))

(declare-fun b!1498402 () Bool)

(declare-fun res!1018597 () Bool)

(assert (=> b!1498402 (=> (not res!1018597) (not e!839327))))

(assert (=> b!1498402 (= res!1018597 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48223 a!2862) j!93) a!2862 mask!2687) lt!652813))))

(declare-fun b!1498403 () Bool)

(declare-fun e!839324 () Bool)

(assert (=> b!1498403 (= e!839322 e!839324)))

(declare-fun res!1018593 () Bool)

(assert (=> b!1498403 (=> res!1018593 e!839324)))

(assert (=> b!1498403 (= res!1018593 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652809 #b00000000000000000000000000000000) (bvsge lt!652809 (size!48774 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1498403 (= lt!652809 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1498404 () Bool)

(assert (=> b!1498404 (= e!839327 e!839323)))

(declare-fun res!1018596 () Bool)

(assert (=> b!1498404 (=> (not res!1018596) (not e!839323))))

(declare-fun lt!652815 () SeekEntryResult!12360)

(assert (=> b!1498404 (= res!1018596 (= lt!652815 (Intermediate!12360 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1498404 (= lt!652815 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652814 mask!2687) lt!652814 lt!652811 mask!2687))))

(assert (=> b!1498404 (= lt!652814 (select (store (arr!48223 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1498405 () Bool)

(declare-fun res!1018601 () Bool)

(assert (=> b!1498405 (=> res!1018601 e!839324)))

(assert (=> b!1498405 (= res!1018601 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1498406 () Bool)

(assert (=> b!1498406 (= e!839321 e!839326)))

(declare-fun res!1018603 () Bool)

(assert (=> b!1498406 (=> (not res!1018603) (not e!839326))))

(assert (=> b!1498406 (= res!1018603 (= (select (store (arr!48223 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1498406 (= lt!652811 (array!99928 (store (arr!48223 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48774 a!2862)))))

(declare-fun b!1498407 () Bool)

(assert (=> b!1498407 (= e!839324 true)))

(assert (=> b!1498407 (= lt!652812 (seekEntryOrOpen!0 lt!652814 lt!652811 mask!2687))))

(declare-fun lt!652808 () Unit!50093)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99927 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50093)

(assert (=> b!1498407 (= lt!652808 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!652809 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1498408 () Bool)

(assert (=> b!1498408 (= e!839328 (not (= lt!652815 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652809 lt!652814 lt!652811 mask!2687))))))

(declare-fun b!1498409 () Bool)

(assert (=> b!1498409 (= e!839320 (= lt!652815 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652814 lt!652811 mask!2687)))))

(declare-fun b!1498410 () Bool)

(declare-fun res!1018600 () Bool)

(assert (=> b!1498410 (=> (not res!1018600) (not e!839321))))

(assert (=> b!1498410 (= res!1018600 (validKeyInArray!0 (select (arr!48223 a!2862) j!93)))))

(declare-fun b!1498411 () Bool)

(declare-fun res!1018602 () Bool)

(assert (=> b!1498411 (=> res!1018602 e!839324)))

(assert (=> b!1498411 (= res!1018602 e!839328)))

(declare-fun c!139447 () Bool)

(assert (=> b!1498411 (= c!139447 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1498412 () Bool)

(assert (=> b!1498412 (= e!839320 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652814 lt!652811 mask!2687) (seekEntryOrOpen!0 lt!652814 lt!652811 mask!2687)))))

(declare-fun b!1498413 () Bool)

(declare-fun res!1018604 () Bool)

(assert (=> b!1498413 (=> res!1018604 e!839324)))

(assert (=> b!1498413 (= res!1018604 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652809 (select (arr!48223 a!2862) j!93) a!2862 mask!2687) lt!652813)))))

(declare-fun b!1498414 () Bool)

(declare-fun res!1018598 () Bool)

(assert (=> b!1498414 (=> (not res!1018598) (not e!839321))))

(assert (=> b!1498414 (= res!1018598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!127626 res!1018606) b!1498399))

(assert (= (and b!1498399 res!1018592) b!1498396))

(assert (= (and b!1498396 res!1018599) b!1498410))

(assert (= (and b!1498410 res!1018600) b!1498414))

(assert (= (and b!1498414 res!1018598) b!1498401))

(assert (= (and b!1498401 res!1018605) b!1498393))

(assert (= (and b!1498393 res!1018591) b!1498406))

(assert (= (and b!1498406 res!1018603) b!1498398))

(assert (= (and b!1498398 res!1018595) b!1498402))

(assert (= (and b!1498402 res!1018597) b!1498404))

(assert (= (and b!1498404 res!1018596) b!1498395))

(assert (= (and b!1498395 c!139446) b!1498409))

(assert (= (and b!1498395 (not c!139446)) b!1498412))

(assert (= (and b!1498395 res!1018594) b!1498397))

(assert (= (and b!1498397 res!1018607) b!1498394))

(assert (= (and b!1498394 (not res!1018590)) b!1498403))

(assert (= (and b!1498403 (not res!1018593)) b!1498413))

(assert (= (and b!1498413 (not res!1018604)) b!1498411))

(assert (= (and b!1498411 c!139447) b!1498408))

(assert (= (and b!1498411 (not c!139447)) b!1498400))

(assert (= (and b!1498411 (not res!1018602)) b!1498405))

(assert (= (and b!1498405 (not res!1018601)) b!1498407))

(declare-fun m!1381557 () Bool)

(assert (=> b!1498401 m!1381557))

(declare-fun m!1381559 () Bool)

(assert (=> b!1498410 m!1381559))

(assert (=> b!1498410 m!1381559))

(declare-fun m!1381561 () Bool)

(assert (=> b!1498410 m!1381561))

(declare-fun m!1381563 () Bool)

(assert (=> b!1498412 m!1381563))

(declare-fun m!1381565 () Bool)

(assert (=> b!1498412 m!1381565))

(assert (=> b!1498402 m!1381559))

(assert (=> b!1498402 m!1381559))

(declare-fun m!1381567 () Bool)

(assert (=> b!1498402 m!1381567))

(assert (=> b!1498413 m!1381559))

(assert (=> b!1498413 m!1381559))

(declare-fun m!1381569 () Bool)

(assert (=> b!1498413 m!1381569))

(declare-fun m!1381571 () Bool)

(assert (=> b!1498408 m!1381571))

(declare-fun m!1381573 () Bool)

(assert (=> b!1498414 m!1381573))

(declare-fun m!1381575 () Bool)

(assert (=> b!1498404 m!1381575))

(assert (=> b!1498404 m!1381575))

(declare-fun m!1381577 () Bool)

(assert (=> b!1498404 m!1381577))

(declare-fun m!1381579 () Bool)

(assert (=> b!1498404 m!1381579))

(declare-fun m!1381581 () Bool)

(assert (=> b!1498404 m!1381581))

(declare-fun m!1381583 () Bool)

(assert (=> start!127626 m!1381583))

(declare-fun m!1381585 () Bool)

(assert (=> start!127626 m!1381585))

(assert (=> b!1498406 m!1381579))

(declare-fun m!1381587 () Bool)

(assert (=> b!1498406 m!1381587))

(declare-fun m!1381589 () Bool)

(assert (=> b!1498400 m!1381589))

(assert (=> b!1498400 m!1381565))

(assert (=> b!1498407 m!1381565))

(declare-fun m!1381591 () Bool)

(assert (=> b!1498407 m!1381591))

(assert (=> b!1498398 m!1381559))

(assert (=> b!1498398 m!1381559))

(declare-fun m!1381593 () Bool)

(assert (=> b!1498398 m!1381593))

(assert (=> b!1498398 m!1381593))

(assert (=> b!1498398 m!1381559))

(declare-fun m!1381595 () Bool)

(assert (=> b!1498398 m!1381595))

(declare-fun m!1381597 () Bool)

(assert (=> b!1498409 m!1381597))

(declare-fun m!1381599 () Bool)

(assert (=> b!1498403 m!1381599))

(declare-fun m!1381601 () Bool)

(assert (=> b!1498396 m!1381601))

(assert (=> b!1498396 m!1381601))

(declare-fun m!1381603 () Bool)

(assert (=> b!1498396 m!1381603))

(declare-fun m!1381605 () Bool)

(assert (=> b!1498394 m!1381605))

(assert (=> b!1498394 m!1381579))

(declare-fun m!1381607 () Bool)

(assert (=> b!1498394 m!1381607))

(declare-fun m!1381609 () Bool)

(assert (=> b!1498394 m!1381609))

(declare-fun m!1381611 () Bool)

(assert (=> b!1498394 m!1381611))

(assert (=> b!1498394 m!1381559))

(declare-fun m!1381613 () Bool)

(assert (=> b!1498394 m!1381613))

(declare-fun m!1381615 () Bool)

(assert (=> b!1498394 m!1381615))

(assert (=> b!1498394 m!1381559))

(check-sat (not b!1498402) (not b!1498408) (not b!1498413) (not b!1498404) (not b!1498394) (not b!1498414) (not b!1498412) (not b!1498410) (not b!1498401) (not start!127626) (not b!1498398) (not b!1498409) (not b!1498400) (not b!1498396) (not b!1498407) (not b!1498403))
(check-sat)
