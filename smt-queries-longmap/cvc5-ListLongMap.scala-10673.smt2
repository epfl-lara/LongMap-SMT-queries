; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125176 () Bool)

(assert start!125176)

(declare-fun b!1459452 () Bool)

(declare-fun res!989389 () Bool)

(declare-fun e!820767 () Bool)

(assert (=> b!1459452 (=> res!989389 e!820767)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!639455 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11852 0))(
  ( (MissingZero!11852 (index!49800 (_ BitVec 32))) (Found!11852 (index!49801 (_ BitVec 32))) (Intermediate!11852 (undefined!12664 Bool) (index!49802 (_ BitVec 32)) (x!131413 (_ BitVec 32))) (Undefined!11852) (MissingVacant!11852 (index!49803 (_ BitVec 32))) )
))
(declare-fun lt!639456 () SeekEntryResult!11852)

(declare-datatypes ((array!98624 0))(
  ( (array!98625 (arr!47600 (Array (_ BitVec 32) (_ BitVec 64))) (size!48150 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98624)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98624 (_ BitVec 32)) SeekEntryResult!11852)

(assert (=> b!1459452 (= res!989389 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639455 (select (arr!47600 a!2862) j!93) a!2862 mask!2687) lt!639456)))))

(declare-fun b!1459453 () Bool)

(declare-fun e!820771 () Bool)

(declare-fun lt!639454 () SeekEntryResult!11852)

(declare-fun lt!639450 () (_ BitVec 64))

(declare-fun lt!639453 () array!98624)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1459453 (= e!820771 (= lt!639454 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639450 lt!639453 mask!2687)))))

(declare-fun b!1459454 () Bool)

(declare-fun res!989398 () Bool)

(assert (=> b!1459454 (=> res!989398 e!820767)))

(declare-fun e!820766 () Bool)

(assert (=> b!1459454 (= res!989398 e!820766)))

(declare-fun c!134543 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1459454 (= c!134543 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1459455 () Bool)

(declare-fun res!989396 () Bool)

(declare-fun e!820769 () Bool)

(assert (=> b!1459455 (=> (not res!989396) (not e!820769))))

(assert (=> b!1459455 (= res!989396 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47600 a!2862) j!93) a!2862 mask!2687) lt!639456))))

(declare-fun b!1459456 () Bool)

(declare-fun res!989402 () Bool)

(declare-fun e!820765 () Bool)

(assert (=> b!1459456 (=> (not res!989402) (not e!820765))))

(assert (=> b!1459456 (= res!989402 e!820771)))

(declare-fun c!134544 () Bool)

(assert (=> b!1459456 (= c!134544 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1459457 () Bool)

(declare-fun e!820772 () Bool)

(assert (=> b!1459457 (= e!820772 e!820769)))

(declare-fun res!989395 () Bool)

(assert (=> b!1459457 (=> (not res!989395) (not e!820769))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459457 (= res!989395 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47600 a!2862) j!93) mask!2687) (select (arr!47600 a!2862) j!93) a!2862 mask!2687) lt!639456))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1459457 (= lt!639456 (Intermediate!11852 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1459458 () Bool)

(declare-fun res!989393 () Bool)

(declare-fun e!820764 () Bool)

(assert (=> b!1459458 (=> (not res!989393) (not e!820764))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1459458 (= res!989393 (and (= (size!48150 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48150 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48150 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1459459 () Bool)

(assert (=> b!1459459 (= e!820764 e!820772)))

(declare-fun res!989403 () Bool)

(assert (=> b!1459459 (=> (not res!989403) (not e!820772))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1459459 (= res!989403 (= (select (store (arr!47600 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1459459 (= lt!639453 (array!98625 (store (arr!47600 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48150 a!2862)))))

(declare-fun b!1459460 () Bool)

(declare-fun e!820770 () Bool)

(assert (=> b!1459460 (= e!820770 e!820767)))

(declare-fun res!989397 () Bool)

(assert (=> b!1459460 (=> res!989397 e!820767)))

(assert (=> b!1459460 (= res!989397 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639455 #b00000000000000000000000000000000) (bvsge lt!639455 (size!48150 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459460 (= lt!639455 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!639449 () SeekEntryResult!11852)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98624 (_ BitVec 32)) SeekEntryResult!11852)

(assert (=> b!1459460 (= lt!639449 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639450 lt!639453 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98624 (_ BitVec 32)) SeekEntryResult!11852)

(assert (=> b!1459460 (= lt!639449 (seekEntryOrOpen!0 lt!639450 lt!639453 mask!2687))))

(declare-fun b!1459461 () Bool)

(declare-fun res!989394 () Bool)

(assert (=> b!1459461 (=> (not res!989394) (not e!820764))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98624 (_ BitVec 32)) Bool)

(assert (=> b!1459461 (= res!989394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1459462 () Bool)

(assert (=> b!1459462 (= e!820771 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639450 lt!639453 mask!2687) (seekEntryOrOpen!0 lt!639450 lt!639453 mask!2687)))))

(declare-fun b!1459463 () Bool)

(declare-fun res!989399 () Bool)

(assert (=> b!1459463 (=> res!989399 e!820767)))

(assert (=> b!1459463 (= res!989399 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1459464 () Bool)

(assert (=> b!1459464 (= e!820769 e!820765)))

(declare-fun res!989400 () Bool)

(assert (=> b!1459464 (=> (not res!989400) (not e!820765))))

(assert (=> b!1459464 (= res!989400 (= lt!639454 (Intermediate!11852 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1459464 (= lt!639454 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639450 mask!2687) lt!639450 lt!639453 mask!2687))))

(assert (=> b!1459464 (= lt!639450 (select (store (arr!47600 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1459465 () Bool)

(declare-fun res!989404 () Bool)

(assert (=> b!1459465 (=> (not res!989404) (not e!820764))))

(declare-datatypes ((List!34101 0))(
  ( (Nil!34098) (Cons!34097 (h!35447 (_ BitVec 64)) (t!48795 List!34101)) )
))
(declare-fun arrayNoDuplicates!0 (array!98624 (_ BitVec 32) List!34101) Bool)

(assert (=> b!1459465 (= res!989404 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34098))))

(declare-fun b!1459466 () Bool)

(declare-fun res!989387 () Bool)

(assert (=> b!1459466 (=> (not res!989387) (not e!820764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1459466 (= res!989387 (validKeyInArray!0 (select (arr!47600 a!2862) j!93)))))

(declare-fun b!1459467 () Bool)

(declare-fun res!989390 () Bool)

(assert (=> b!1459467 (=> (not res!989390) (not e!820764))))

(assert (=> b!1459467 (= res!989390 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48150 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48150 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48150 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!989392 () Bool)

(assert (=> start!125176 (=> (not res!989392) (not e!820764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125176 (= res!989392 (validMask!0 mask!2687))))

(assert (=> start!125176 e!820764))

(assert (=> start!125176 true))

(declare-fun array_inv!36628 (array!98624) Bool)

(assert (=> start!125176 (array_inv!36628 a!2862)))

(declare-fun b!1459468 () Bool)

(assert (=> b!1459468 (= e!820767 true)))

(declare-fun lt!639452 () SeekEntryResult!11852)

(assert (=> b!1459468 (= lt!639452 lt!639449)))

(declare-datatypes ((Unit!49200 0))(
  ( (Unit!49201) )
))
(declare-fun lt!639448 () Unit!49200)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98624 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49200)

(assert (=> b!1459468 (= lt!639448 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639455 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1459469 () Bool)

(assert (=> b!1459469 (= e!820766 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639455 intermediateAfterIndex!19 lt!639450 lt!639453 mask!2687) lt!639449)))))

(declare-fun b!1459470 () Bool)

(declare-fun res!989388 () Bool)

(assert (=> b!1459470 (=> (not res!989388) (not e!820765))))

(assert (=> b!1459470 (= res!989388 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1459471 () Bool)

(assert (=> b!1459471 (= e!820766 (not (= lt!639454 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639455 lt!639450 lt!639453 mask!2687))))))

(declare-fun b!1459472 () Bool)

(declare-fun res!989401 () Bool)

(assert (=> b!1459472 (=> (not res!989401) (not e!820764))))

(assert (=> b!1459472 (= res!989401 (validKeyInArray!0 (select (arr!47600 a!2862) i!1006)))))

(declare-fun b!1459473 () Bool)

(assert (=> b!1459473 (= e!820765 (not e!820770))))

(declare-fun res!989391 () Bool)

(assert (=> b!1459473 (=> res!989391 e!820770)))

(assert (=> b!1459473 (= res!989391 (or (and (= (select (arr!47600 a!2862) index!646) (select (store (arr!47600 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47600 a!2862) index!646) (select (arr!47600 a!2862) j!93))) (= (select (arr!47600 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1459473 (and (= lt!639452 (Found!11852 j!93)) (or (= (select (arr!47600 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47600 a!2862) intermediateBeforeIndex!19) (select (arr!47600 a!2862) j!93))) (let ((bdg!53513 (select (store (arr!47600 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47600 a!2862) index!646) bdg!53513) (= (select (arr!47600 a!2862) index!646) (select (arr!47600 a!2862) j!93))) (= (select (arr!47600 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53513 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1459473 (= lt!639452 (seekEntryOrOpen!0 (select (arr!47600 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1459473 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!639451 () Unit!49200)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98624 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49200)

(assert (=> b!1459473 (= lt!639451 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125176 res!989392) b!1459458))

(assert (= (and b!1459458 res!989393) b!1459472))

(assert (= (and b!1459472 res!989401) b!1459466))

(assert (= (and b!1459466 res!989387) b!1459461))

(assert (= (and b!1459461 res!989394) b!1459465))

(assert (= (and b!1459465 res!989404) b!1459467))

(assert (= (and b!1459467 res!989390) b!1459459))

(assert (= (and b!1459459 res!989403) b!1459457))

(assert (= (and b!1459457 res!989395) b!1459455))

(assert (= (and b!1459455 res!989396) b!1459464))

(assert (= (and b!1459464 res!989400) b!1459456))

(assert (= (and b!1459456 c!134544) b!1459453))

(assert (= (and b!1459456 (not c!134544)) b!1459462))

(assert (= (and b!1459456 res!989402) b!1459470))

(assert (= (and b!1459470 res!989388) b!1459473))

(assert (= (and b!1459473 (not res!989391)) b!1459460))

(assert (= (and b!1459460 (not res!989397)) b!1459452))

(assert (= (and b!1459452 (not res!989389)) b!1459454))

(assert (= (and b!1459454 c!134543) b!1459471))

(assert (= (and b!1459454 (not c!134543)) b!1459469))

(assert (= (and b!1459454 (not res!989398)) b!1459463))

(assert (= (and b!1459463 (not res!989399)) b!1459468))

(declare-fun m!1347211 () Bool)

(assert (=> b!1459469 m!1347211))

(declare-fun m!1347213 () Bool)

(assert (=> b!1459460 m!1347213))

(declare-fun m!1347215 () Bool)

(assert (=> b!1459460 m!1347215))

(declare-fun m!1347217 () Bool)

(assert (=> b!1459460 m!1347217))

(declare-fun m!1347219 () Bool)

(assert (=> b!1459471 m!1347219))

(assert (=> b!1459462 m!1347215))

(assert (=> b!1459462 m!1347217))

(declare-fun m!1347221 () Bool)

(assert (=> b!1459452 m!1347221))

(assert (=> b!1459452 m!1347221))

(declare-fun m!1347223 () Bool)

(assert (=> b!1459452 m!1347223))

(declare-fun m!1347225 () Bool)

(assert (=> b!1459468 m!1347225))

(declare-fun m!1347227 () Bool)

(assert (=> start!125176 m!1347227))

(declare-fun m!1347229 () Bool)

(assert (=> start!125176 m!1347229))

(declare-fun m!1347231 () Bool)

(assert (=> b!1459461 m!1347231))

(declare-fun m!1347233 () Bool)

(assert (=> b!1459472 m!1347233))

(assert (=> b!1459472 m!1347233))

(declare-fun m!1347235 () Bool)

(assert (=> b!1459472 m!1347235))

(declare-fun m!1347237 () Bool)

(assert (=> b!1459453 m!1347237))

(declare-fun m!1347239 () Bool)

(assert (=> b!1459473 m!1347239))

(declare-fun m!1347241 () Bool)

(assert (=> b!1459473 m!1347241))

(declare-fun m!1347243 () Bool)

(assert (=> b!1459473 m!1347243))

(declare-fun m!1347245 () Bool)

(assert (=> b!1459473 m!1347245))

(declare-fun m!1347247 () Bool)

(assert (=> b!1459473 m!1347247))

(assert (=> b!1459473 m!1347221))

(declare-fun m!1347249 () Bool)

(assert (=> b!1459473 m!1347249))

(declare-fun m!1347251 () Bool)

(assert (=> b!1459473 m!1347251))

(assert (=> b!1459473 m!1347221))

(assert (=> b!1459459 m!1347241))

(declare-fun m!1347253 () Bool)

(assert (=> b!1459459 m!1347253))

(assert (=> b!1459455 m!1347221))

(assert (=> b!1459455 m!1347221))

(declare-fun m!1347255 () Bool)

(assert (=> b!1459455 m!1347255))

(declare-fun m!1347257 () Bool)

(assert (=> b!1459464 m!1347257))

(assert (=> b!1459464 m!1347257))

(declare-fun m!1347259 () Bool)

(assert (=> b!1459464 m!1347259))

(assert (=> b!1459464 m!1347241))

(declare-fun m!1347261 () Bool)

(assert (=> b!1459464 m!1347261))

(assert (=> b!1459466 m!1347221))

(assert (=> b!1459466 m!1347221))

(declare-fun m!1347263 () Bool)

(assert (=> b!1459466 m!1347263))

(assert (=> b!1459457 m!1347221))

(assert (=> b!1459457 m!1347221))

(declare-fun m!1347265 () Bool)

(assert (=> b!1459457 m!1347265))

(assert (=> b!1459457 m!1347265))

(assert (=> b!1459457 m!1347221))

(declare-fun m!1347267 () Bool)

(assert (=> b!1459457 m!1347267))

(declare-fun m!1347269 () Bool)

(assert (=> b!1459465 m!1347269))

(push 1)

