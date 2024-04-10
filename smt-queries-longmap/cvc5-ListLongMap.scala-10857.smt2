; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127120 () Bool)

(assert start!127120)

(declare-fun b!1494252 () Bool)

(declare-fun e!836990 () Bool)

(declare-fun e!836988 () Bool)

(assert (=> b!1494252 (= e!836990 (not e!836988))))

(declare-fun res!1016657 () Bool)

(assert (=> b!1494252 (=> res!1016657 e!836988)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99767 0))(
  ( (array!99768 (arr!48152 (Array (_ BitVec 32) (_ BitVec 64))) (size!48702 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99767)

(assert (=> b!1494252 (= res!1016657 (or (and (= (select (arr!48152 a!2862) index!646) (select (store (arr!48152 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48152 a!2862) index!646) (select (arr!48152 a!2862) j!93))) (= (select (arr!48152 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!836994 () Bool)

(assert (=> b!1494252 e!836994))

(declare-fun res!1016656 () Bool)

(assert (=> b!1494252 (=> (not res!1016656) (not e!836994))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99767 (_ BitVec 32)) Bool)

(assert (=> b!1494252 (= res!1016656 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50124 0))(
  ( (Unit!50125) )
))
(declare-fun lt!651299 () Unit!50124)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50124)

(assert (=> b!1494252 (= lt!651299 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1494253 () Bool)

(declare-fun e!836996 () Bool)

(assert (=> b!1494253 (= e!836996 e!836990)))

(declare-fun res!1016654 () Bool)

(assert (=> b!1494253 (=> (not res!1016654) (not e!836990))))

(declare-datatypes ((SeekEntryResult!12392 0))(
  ( (MissingZero!12392 (index!51960 (_ BitVec 32))) (Found!12392 (index!51961 (_ BitVec 32))) (Intermediate!12392 (undefined!13204 Bool) (index!51962 (_ BitVec 32)) (x!133560 (_ BitVec 32))) (Undefined!12392) (MissingVacant!12392 (index!51963 (_ BitVec 32))) )
))
(declare-fun lt!651296 () SeekEntryResult!12392)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1494253 (= res!1016654 (= lt!651296 (Intermediate!12392 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!651297 () array!99767)

(declare-fun lt!651298 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99767 (_ BitVec 32)) SeekEntryResult!12392)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494253 (= lt!651296 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651298 mask!2687) lt!651298 lt!651297 mask!2687))))

(assert (=> b!1494253 (= lt!651298 (select (store (arr!48152 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1494254 () Bool)

(declare-fun res!1016646 () Bool)

(declare-fun e!836995 () Bool)

(assert (=> b!1494254 (=> (not res!1016646) (not e!836995))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1494254 (= res!1016646 (validKeyInArray!0 (select (arr!48152 a!2862) i!1006)))))

(declare-fun b!1494255 () Bool)

(declare-fun e!836993 () Bool)

(assert (=> b!1494255 (= e!836993 e!836996)))

(declare-fun res!1016655 () Bool)

(assert (=> b!1494255 (=> (not res!1016655) (not e!836996))))

(declare-fun lt!651295 () SeekEntryResult!12392)

(assert (=> b!1494255 (= res!1016655 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48152 a!2862) j!93) mask!2687) (select (arr!48152 a!2862) j!93) a!2862 mask!2687) lt!651295))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1494255 (= lt!651295 (Intermediate!12392 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1494256 () Bool)

(declare-fun res!1016649 () Bool)

(assert (=> b!1494256 (=> (not res!1016649) (not e!836995))))

(assert (=> b!1494256 (= res!1016649 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48702 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48702 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48702 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1494257 () Bool)

(declare-fun e!836992 () Bool)

(assert (=> b!1494257 (= e!836992 (= lt!651296 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651298 lt!651297 mask!2687)))))

(declare-fun b!1494258 () Bool)

(declare-fun res!1016652 () Bool)

(assert (=> b!1494258 (=> (not res!1016652) (not e!836990))))

(assert (=> b!1494258 (= res!1016652 e!836992)))

(declare-fun c!138333 () Bool)

(assert (=> b!1494258 (= c!138333 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1494259 () Bool)

(declare-fun res!1016660 () Bool)

(assert (=> b!1494259 (=> (not res!1016660) (not e!836990))))

(assert (=> b!1494259 (= res!1016660 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1494260 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99767 (_ BitVec 32)) SeekEntryResult!12392)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99767 (_ BitVec 32)) SeekEntryResult!12392)

(assert (=> b!1494260 (= e!836992 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651298 lt!651297 mask!2687) (seekEntryOrOpen!0 lt!651298 lt!651297 mask!2687)))))

(declare-fun b!1494261 () Bool)

(declare-fun res!1016651 () Bool)

(assert (=> b!1494261 (=> (not res!1016651) (not e!836994))))

(assert (=> b!1494261 (= res!1016651 (= (seekEntryOrOpen!0 (select (arr!48152 a!2862) j!93) a!2862 mask!2687) (Found!12392 j!93)))))

(declare-fun b!1494262 () Bool)

(assert (=> b!1494262 (= e!836995 e!836993)))

(declare-fun res!1016647 () Bool)

(assert (=> b!1494262 (=> (not res!1016647) (not e!836993))))

(assert (=> b!1494262 (= res!1016647 (= (select (store (arr!48152 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494262 (= lt!651297 (array!99768 (store (arr!48152 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48702 a!2862)))))

(declare-fun b!1494264 () Bool)

(declare-fun res!1016653 () Bool)

(assert (=> b!1494264 (=> (not res!1016653) (not e!836995))))

(declare-datatypes ((List!34653 0))(
  ( (Nil!34650) (Cons!34649 (h!36038 (_ BitVec 64)) (t!49347 List!34653)) )
))
(declare-fun arrayNoDuplicates!0 (array!99767 (_ BitVec 32) List!34653) Bool)

(assert (=> b!1494264 (= res!1016653 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34650))))

(declare-fun b!1494265 () Bool)

(declare-fun res!1016661 () Bool)

(assert (=> b!1494265 (=> (not res!1016661) (not e!836996))))

(assert (=> b!1494265 (= res!1016661 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48152 a!2862) j!93) a!2862 mask!2687) lt!651295))))

(declare-fun b!1494266 () Bool)

(assert (=> b!1494266 (= e!836994 (or (= (select (arr!48152 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48152 a!2862) intermediateBeforeIndex!19) (select (arr!48152 a!2862) j!93))))))

(declare-fun b!1494267 () Bool)

(declare-fun res!1016648 () Bool)

(assert (=> b!1494267 (=> (not res!1016648) (not e!836995))))

(assert (=> b!1494267 (= res!1016648 (validKeyInArray!0 (select (arr!48152 a!2862) j!93)))))

(declare-fun lt!651300 () (_ BitVec 32))

(declare-fun e!836991 () Bool)

(declare-fun b!1494268 () Bool)

(assert (=> b!1494268 (= e!836991 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651300 (select (arr!48152 a!2862) j!93) a!2862 mask!2687) lt!651295))))

(declare-fun b!1494269 () Bool)

(declare-fun res!1016658 () Bool)

(assert (=> b!1494269 (=> (not res!1016658) (not e!836995))))

(assert (=> b!1494269 (= res!1016658 (and (= (size!48702 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48702 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48702 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1494270 () Bool)

(assert (=> b!1494270 (= e!836988 e!836991)))

(declare-fun res!1016662 () Bool)

(assert (=> b!1494270 (=> res!1016662 e!836991)))

(assert (=> b!1494270 (= res!1016662 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!651300 #b00000000000000000000000000000000) (bvsge lt!651300 (size!48702 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494270 (= lt!651300 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun res!1016650 () Bool)

(assert (=> start!127120 (=> (not res!1016650) (not e!836995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127120 (= res!1016650 (validMask!0 mask!2687))))

(assert (=> start!127120 e!836995))

(assert (=> start!127120 true))

(declare-fun array_inv!37180 (array!99767) Bool)

(assert (=> start!127120 (array_inv!37180 a!2862)))

(declare-fun b!1494263 () Bool)

(declare-fun res!1016659 () Bool)

(assert (=> b!1494263 (=> (not res!1016659) (not e!836995))))

(assert (=> b!1494263 (= res!1016659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!127120 res!1016650) b!1494269))

(assert (= (and b!1494269 res!1016658) b!1494254))

(assert (= (and b!1494254 res!1016646) b!1494267))

(assert (= (and b!1494267 res!1016648) b!1494263))

(assert (= (and b!1494263 res!1016659) b!1494264))

(assert (= (and b!1494264 res!1016653) b!1494256))

(assert (= (and b!1494256 res!1016649) b!1494262))

(assert (= (and b!1494262 res!1016647) b!1494255))

(assert (= (and b!1494255 res!1016655) b!1494265))

(assert (= (and b!1494265 res!1016661) b!1494253))

(assert (= (and b!1494253 res!1016654) b!1494258))

(assert (= (and b!1494258 c!138333) b!1494257))

(assert (= (and b!1494258 (not c!138333)) b!1494260))

(assert (= (and b!1494258 res!1016652) b!1494259))

(assert (= (and b!1494259 res!1016660) b!1494252))

(assert (= (and b!1494252 res!1016656) b!1494261))

(assert (= (and b!1494261 res!1016651) b!1494266))

(assert (= (and b!1494252 (not res!1016657)) b!1494270))

(assert (= (and b!1494270 (not res!1016662)) b!1494268))

(declare-fun m!1378003 () Bool)

(assert (=> b!1494268 m!1378003))

(assert (=> b!1494268 m!1378003))

(declare-fun m!1378005 () Bool)

(assert (=> b!1494268 m!1378005))

(declare-fun m!1378007 () Bool)

(assert (=> b!1494253 m!1378007))

(assert (=> b!1494253 m!1378007))

(declare-fun m!1378009 () Bool)

(assert (=> b!1494253 m!1378009))

(declare-fun m!1378011 () Bool)

(assert (=> b!1494253 m!1378011))

(declare-fun m!1378013 () Bool)

(assert (=> b!1494253 m!1378013))

(declare-fun m!1378015 () Bool)

(assert (=> b!1494257 m!1378015))

(assert (=> b!1494255 m!1378003))

(assert (=> b!1494255 m!1378003))

(declare-fun m!1378017 () Bool)

(assert (=> b!1494255 m!1378017))

(assert (=> b!1494255 m!1378017))

(assert (=> b!1494255 m!1378003))

(declare-fun m!1378019 () Bool)

(assert (=> b!1494255 m!1378019))

(assert (=> b!1494267 m!1378003))

(assert (=> b!1494267 m!1378003))

(declare-fun m!1378021 () Bool)

(assert (=> b!1494267 m!1378021))

(assert (=> b!1494265 m!1378003))

(assert (=> b!1494265 m!1378003))

(declare-fun m!1378023 () Bool)

(assert (=> b!1494265 m!1378023))

(declare-fun m!1378025 () Bool)

(assert (=> b!1494264 m!1378025))

(declare-fun m!1378027 () Bool)

(assert (=> b!1494260 m!1378027))

(declare-fun m!1378029 () Bool)

(assert (=> b!1494260 m!1378029))

(assert (=> b!1494262 m!1378011))

(declare-fun m!1378031 () Bool)

(assert (=> b!1494262 m!1378031))

(declare-fun m!1378033 () Bool)

(assert (=> b!1494254 m!1378033))

(assert (=> b!1494254 m!1378033))

(declare-fun m!1378035 () Bool)

(assert (=> b!1494254 m!1378035))

(declare-fun m!1378037 () Bool)

(assert (=> b!1494270 m!1378037))

(declare-fun m!1378039 () Bool)

(assert (=> b!1494252 m!1378039))

(assert (=> b!1494252 m!1378011))

(declare-fun m!1378041 () Bool)

(assert (=> b!1494252 m!1378041))

(declare-fun m!1378043 () Bool)

(assert (=> b!1494252 m!1378043))

(declare-fun m!1378045 () Bool)

(assert (=> b!1494252 m!1378045))

(assert (=> b!1494252 m!1378003))

(declare-fun m!1378047 () Bool)

(assert (=> start!127120 m!1378047))

(declare-fun m!1378049 () Bool)

(assert (=> start!127120 m!1378049))

(declare-fun m!1378051 () Bool)

(assert (=> b!1494266 m!1378051))

(assert (=> b!1494266 m!1378003))

(assert (=> b!1494261 m!1378003))

(assert (=> b!1494261 m!1378003))

(declare-fun m!1378053 () Bool)

(assert (=> b!1494261 m!1378053))

(declare-fun m!1378055 () Bool)

(assert (=> b!1494263 m!1378055))

(push 1)

(assert (not b!1494257))

(assert (not b!1494253))

(assert (not b!1494261))

(assert (not start!127120))

(assert (not b!1494267))

(assert (not b!1494260))

(assert (not b!1494254))

(assert (not b!1494270))

(assert (not b!1494252))

(assert (not b!1494264))

(assert (not b!1494268))

(assert (not b!1494255))

(assert (not b!1494265))

(assert (not b!1494263))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun e!837105 () SeekEntryResult!12392)

(declare-fun b!1494475 () Bool)

(assert (=> b!1494475 (= e!837105 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!651298 lt!651297 mask!2687))))

(declare-fun b!1494476 () Bool)

(declare-fun e!837104 () SeekEntryResult!12392)

(assert (=> b!1494476 (= e!837104 (Found!12392 index!646))))

(declare-fun b!1494477 () Bool)

(declare-fun e!837106 () SeekEntryResult!12392)

(assert (=> b!1494477 (= e!837106 Undefined!12392)))

(declare-fun b!1494478 () Bool)

(assert (=> b!1494478 (= e!837105 (MissingVacant!12392 intermediateAfterIndex!19))))

(declare-fun d!157073 () Bool)

(declare-fun lt!651383 () SeekEntryResult!12392)

(assert (=> d!157073 (and (or (is-Undefined!12392 lt!651383) (not (is-Found!12392 lt!651383)) (and (bvsge (index!51961 lt!651383) #b00000000000000000000000000000000) (bvslt (index!51961 lt!651383) (size!48702 lt!651297)))) (or (is-Undefined!12392 lt!651383) (is-Found!12392 lt!651383) (not (is-MissingVacant!12392 lt!651383)) (not (= (index!51963 lt!651383) intermediateAfterIndex!19)) (and (bvsge (index!51963 lt!651383) #b00000000000000000000000000000000) (bvslt (index!51963 lt!651383) (size!48702 lt!651297)))) (or (is-Undefined!12392 lt!651383) (ite (is-Found!12392 lt!651383) (= (select (arr!48152 lt!651297) (index!51961 lt!651383)) lt!651298) (and (is-MissingVacant!12392 lt!651383) (= (index!51963 lt!651383) intermediateAfterIndex!19) (= (select (arr!48152 lt!651297) (index!51963 lt!651383)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157073 (= lt!651383 e!837106)))

(declare-fun c!138375 () Bool)

(assert (=> d!157073 (= c!138375 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!651382 () (_ BitVec 64))

(assert (=> d!157073 (= lt!651382 (select (arr!48152 lt!651297) index!646))))

(assert (=> d!157073 (validMask!0 mask!2687)))

(assert (=> d!157073 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651298 lt!651297 mask!2687) lt!651383)))

(declare-fun b!1494479 () Bool)

(assert (=> b!1494479 (= e!837106 e!837104)))

(declare-fun c!138373 () Bool)

(assert (=> b!1494479 (= c!138373 (= lt!651382 lt!651298))))

(declare-fun b!1494480 () Bool)

(declare-fun c!138374 () Bool)

(assert (=> b!1494480 (= c!138374 (= lt!651382 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494480 (= e!837104 e!837105)))

(assert (= (and d!157073 c!138375) b!1494477))

(assert (= (and d!157073 (not c!138375)) b!1494479))

(assert (= (and b!1494479 c!138373) b!1494476))

(assert (= (and b!1494479 (not c!138373)) b!1494480))

(assert (= (and b!1494480 c!138374) b!1494478))

(assert (= (and b!1494480 (not c!138374)) b!1494475))

(assert (=> b!1494475 m!1378037))

(assert (=> b!1494475 m!1378037))

(declare-fun m!1378215 () Bool)

(assert (=> b!1494475 m!1378215))

(declare-fun m!1378217 () Bool)

(assert (=> d!157073 m!1378217))

(declare-fun m!1378219 () Bool)

(assert (=> d!157073 m!1378219))

(declare-fun m!1378221 () Bool)

(assert (=> d!157073 m!1378221))

(assert (=> d!157073 m!1378047))

(assert (=> b!1494260 d!157073))

(declare-fun b!1494547 () Bool)

(declare-fun e!837143 () SeekEntryResult!12392)

(assert (=> b!1494547 (= e!837143 Undefined!12392)))

(declare-fun e!837144 () SeekEntryResult!12392)

(declare-fun b!1494548 () Bool)

(declare-fun lt!651409 () SeekEntryResult!12392)

(assert (=> b!1494548 (= e!837144 (seekKeyOrZeroReturnVacant!0 (x!133560 lt!651409) (index!51962 lt!651409) (index!51962 lt!651409) lt!651298 lt!651297 mask!2687))))

(declare-fun b!1494549 () Bool)

(declare-fun e!837142 () SeekEntryResult!12392)

(assert (=> b!1494549 (= e!837143 e!837142)))

(declare-fun lt!651407 () (_ BitVec 64))

(assert (=> b!1494549 (= lt!651407 (select (arr!48152 lt!651297) (index!51962 lt!651409)))))

(declare-fun c!138405 () Bool)

(assert (=> b!1494549 (= c!138405 (= lt!651407 lt!651298))))

(declare-fun b!1494550 () Bool)

(assert (=> b!1494550 (= e!837144 (MissingZero!12392 (index!51962 lt!651409)))))

(declare-fun d!157081 () Bool)

(declare-fun lt!651408 () SeekEntryResult!12392)

(assert (=> d!157081 (and (or (is-Undefined!12392 lt!651408) (not (is-Found!12392 lt!651408)) (and (bvsge (index!51961 lt!651408) #b00000000000000000000000000000000) (bvslt (index!51961 lt!651408) (size!48702 lt!651297)))) (or (is-Undefined!12392 lt!651408) (is-Found!12392 lt!651408) (not (is-MissingZero!12392 lt!651408)) (and (bvsge (index!51960 lt!651408) #b00000000000000000000000000000000) (bvslt (index!51960 lt!651408) (size!48702 lt!651297)))) (or (is-Undefined!12392 lt!651408) (is-Found!12392 lt!651408) (is-MissingZero!12392 lt!651408) (not (is-MissingVacant!12392 lt!651408)) (and (bvsge (index!51963 lt!651408) #b00000000000000000000000000000000) (bvslt (index!51963 lt!651408) (size!48702 lt!651297)))) (or (is-Undefined!12392 lt!651408) (ite (is-Found!12392 lt!651408) (= (select (arr!48152 lt!651297) (index!51961 lt!651408)) lt!651298) (ite (is-MissingZero!12392 lt!651408) (= (select (arr!48152 lt!651297) (index!51960 lt!651408)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12392 lt!651408) (= (select (arr!48152 lt!651297) (index!51963 lt!651408)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157081 (= lt!651408 e!837143)))

(declare-fun c!138403 () Bool)

(assert (=> d!157081 (= c!138403 (and (is-Intermediate!12392 lt!651409) (undefined!13204 lt!651409)))))

(assert (=> d!157081 (= lt!651409 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651298 mask!2687) lt!651298 lt!651297 mask!2687))))

(assert (=> d!157081 (validMask!0 mask!2687)))

(assert (=> d!157081 (= (seekEntryOrOpen!0 lt!651298 lt!651297 mask!2687) lt!651408)))

(declare-fun b!1494551 () Bool)

(declare-fun c!138404 () Bool)

(assert (=> b!1494551 (= c!138404 (= lt!651407 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494551 (= e!837142 e!837144)))

(declare-fun b!1494552 () Bool)

(assert (=> b!1494552 (= e!837142 (Found!12392 (index!51962 lt!651409)))))

(assert (= (and d!157081 c!138403) b!1494547))

(assert (= (and d!157081 (not c!138403)) b!1494549))

(assert (= (and b!1494549 c!138405) b!1494552))

(assert (= (and b!1494549 (not c!138405)) b!1494551))

(assert (= (and b!1494551 c!138404) b!1494550))

(assert (= (and b!1494551 (not c!138404)) b!1494548))

(declare-fun m!1378241 () Bool)

(assert (=> b!1494548 m!1378241))

(declare-fun m!1378243 () Bool)

(assert (=> b!1494549 m!1378243))

(assert (=> d!157081 m!1378007))

(assert (=> d!157081 m!1378009))

(declare-fun m!1378245 () Bool)

(assert (=> d!157081 m!1378245))

(declare-fun m!1378247 () Bool)

(assert (=> d!157081 m!1378247))

(declare-fun m!1378249 () Bool)

(assert (=> d!157081 m!1378249))

(assert (=> d!157081 m!1378007))

(assert (=> d!157081 m!1378047))

(assert (=> b!1494260 d!157081))

(declare-fun b!1494562 () Bool)

(declare-fun e!837151 () SeekEntryResult!12392)

(assert (=> b!1494562 (= e!837151 Undefined!12392)))

(declare-fun lt!651414 () SeekEntryResult!12392)

(declare-fun e!837152 () SeekEntryResult!12392)

(declare-fun b!1494563 () Bool)

(assert (=> b!1494563 (= e!837152 (seekKeyOrZeroReturnVacant!0 (x!133560 lt!651414) (index!51962 lt!651414) (index!51962 lt!651414) (select (arr!48152 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1494564 () Bool)

(declare-fun e!837150 () SeekEntryResult!12392)

(assert (=> b!1494564 (= e!837151 e!837150)))

(declare-fun lt!651412 () (_ BitVec 64))

(assert (=> b!1494564 (= lt!651412 (select (arr!48152 a!2862) (index!51962 lt!651414)))))

(declare-fun c!138411 () Bool)

(assert (=> b!1494564 (= c!138411 (= lt!651412 (select (arr!48152 a!2862) j!93)))))

(declare-fun b!1494565 () Bool)

(assert (=> b!1494565 (= e!837152 (MissingZero!12392 (index!51962 lt!651414)))))

(declare-fun d!157089 () Bool)

(declare-fun lt!651413 () SeekEntryResult!12392)

(assert (=> d!157089 (and (or (is-Undefined!12392 lt!651413) (not (is-Found!12392 lt!651413)) (and (bvsge (index!51961 lt!651413) #b00000000000000000000000000000000) (bvslt (index!51961 lt!651413) (size!48702 a!2862)))) (or (is-Undefined!12392 lt!651413) (is-Found!12392 lt!651413) (not (is-MissingZero!12392 lt!651413)) (and (bvsge (index!51960 lt!651413) #b00000000000000000000000000000000) (bvslt (index!51960 lt!651413) (size!48702 a!2862)))) (or (is-Undefined!12392 lt!651413) (is-Found!12392 lt!651413) (is-MissingZero!12392 lt!651413) (not (is-MissingVacant!12392 lt!651413)) (and (bvsge (index!51963 lt!651413) #b00000000000000000000000000000000) (bvslt (index!51963 lt!651413) (size!48702 a!2862)))) (or (is-Undefined!12392 lt!651413) (ite (is-Found!12392 lt!651413) (= (select (arr!48152 a!2862) (index!51961 lt!651413)) (select (arr!48152 a!2862) j!93)) (ite (is-MissingZero!12392 lt!651413) (= (select (arr!48152 a!2862) (index!51960 lt!651413)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12392 lt!651413) (= (select (arr!48152 a!2862) (index!51963 lt!651413)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157089 (= lt!651413 e!837151)))

(declare-fun c!138409 () Bool)

(assert (=> d!157089 (= c!138409 (and (is-Intermediate!12392 lt!651414) (undefined!13204 lt!651414)))))

(assert (=> d!157089 (= lt!651414 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48152 a!2862) j!93) mask!2687) (select (arr!48152 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!157089 (validMask!0 mask!2687)))

(assert (=> d!157089 (= (seekEntryOrOpen!0 (select (arr!48152 a!2862) j!93) a!2862 mask!2687) lt!651413)))

(declare-fun b!1494566 () Bool)

(declare-fun c!138410 () Bool)

(assert (=> b!1494566 (= c!138410 (= lt!651412 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494566 (= e!837150 e!837152)))

(declare-fun b!1494567 () Bool)

(assert (=> b!1494567 (= e!837150 (Found!12392 (index!51962 lt!651414)))))

(assert (= (and d!157089 c!138409) b!1494562))

(assert (= (and d!157089 (not c!138409)) b!1494564))

(assert (= (and b!1494564 c!138411) b!1494567))

(assert (= (and b!1494564 (not c!138411)) b!1494566))

(assert (= (and b!1494566 c!138410) b!1494565))

(assert (= (and b!1494566 (not c!138410)) b!1494563))

(assert (=> b!1494563 m!1378003))

(declare-fun m!1378259 () Bool)

(assert (=> b!1494563 m!1378259))

(declare-fun m!1378261 () Bool)

(assert (=> b!1494564 m!1378261))

(assert (=> d!157089 m!1378017))

(assert (=> d!157089 m!1378003))

(assert (=> d!157089 m!1378019))

(declare-fun m!1378263 () Bool)

(assert (=> d!157089 m!1378263))

(declare-fun m!1378265 () Bool)

(assert (=> d!157089 m!1378265))

(declare-fun m!1378267 () Bool)

(assert (=> d!157089 m!1378267))

(assert (=> d!157089 m!1378003))

(assert (=> d!157089 m!1378017))

(assert (=> d!157089 m!1378047))

(assert (=> b!1494261 d!157089))

(declare-fun d!157093 () Bool)

(declare-fun e!837191 () Bool)

(assert (=> d!157093 e!837191))

(declare-fun c!138431 () Bool)

(declare-fun lt!651442 () SeekEntryResult!12392)

(assert (=> d!157093 (= c!138431 (and (is-Intermediate!12392 lt!651442) (undefined!13204 lt!651442)))))

(declare-fun e!837190 () SeekEntryResult!12392)

(assert (=> d!157093 (= lt!651442 e!837190)))

(declare-fun c!138432 () Bool)

(assert (=> d!157093 (= c!138432 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(declare-fun lt!651443 () (_ BitVec 64))

(assert (=> d!157093 (= lt!651443 (select (arr!48152 a!2862) lt!651300))))

(assert (=> d!157093 (validMask!0 mask!2687)))

(assert (=> d!157093 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651300 (select (arr!48152 a!2862) j!93) a!2862 mask!2687) lt!651442)))

(declare-fun b!1494624 () Bool)

(assert (=> b!1494624 (and (bvsge (index!51962 lt!651442) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651442) (size!48702 a!2862)))))

(declare-fun res!1016826 () Bool)

(assert (=> b!1494624 (= res!1016826 (= (select (arr!48152 a!2862) (index!51962 lt!651442)) (select (arr!48152 a!2862) j!93)))))

(declare-fun e!837188 () Bool)

(assert (=> b!1494624 (=> res!1016826 e!837188)))

(declare-fun e!837192 () Bool)

(assert (=> b!1494624 (= e!837192 e!837188)))

(declare-fun b!1494625 () Bool)

(declare-fun e!837186 () SeekEntryResult!12392)

(assert (=> b!1494625 (= e!837190 e!837186)))

(declare-fun c!138429 () Bool)

(assert (=> b!1494625 (= c!138429 (or (= lt!651443 (select (arr!48152 a!2862) j!93)) (= (bvadd lt!651443 lt!651443) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1494626 () Bool)

(assert (=> b!1494626 (= e!837186 (Intermediate!12392 false lt!651300 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1494627 () Bool)

(assert (=> b!1494627 (and (bvsge (index!51962 lt!651442) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651442) (size!48702 a!2862)))))

(declare-fun res!1016827 () Bool)

(assert (=> b!1494627 (= res!1016827 (= (select (arr!48152 a!2862) (index!51962 lt!651442)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494627 (=> res!1016827 e!837188)))

(declare-fun b!1494628 () Bool)

(assert (=> b!1494628 (= e!837191 e!837192)))

(declare-fun res!1016828 () Bool)

(assert (=> b!1494628 (= res!1016828 (and (is-Intermediate!12392 lt!651442) (not (undefined!13204 lt!651442)) (bvslt (x!133560 lt!651442) #b01111111111111111111111111111110) (bvsge (x!133560 lt!651442) #b00000000000000000000000000000000) (bvsge (x!133560 lt!651442) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1494628 (=> (not res!1016828) (not e!837192))))

(declare-fun b!1494629 () Bool)

(assert (=> b!1494629 (= e!837186 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!651300 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) (select (arr!48152 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1494630 () Bool)

(assert (=> b!1494630 (= e!837190 (Intermediate!12392 true lt!651300 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1494631 () Bool)

(assert (=> b!1494631 (= e!837191 (bvsge (x!133560 lt!651442) #b01111111111111111111111111111110))))

(declare-fun b!1494632 () Bool)

(assert (=> b!1494632 (and (bvsge (index!51962 lt!651442) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651442) (size!48702 a!2862)))))

(assert (=> b!1494632 (= e!837188 (= (select (arr!48152 a!2862) (index!51962 lt!651442)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!157093 c!138432) b!1494630))

(assert (= (and d!157093 (not c!138432)) b!1494625))

(assert (= (and b!1494625 c!138429) b!1494626))

(assert (= (and b!1494625 (not c!138429)) b!1494629))

(assert (= (and d!157093 c!138431) b!1494631))

(assert (= (and d!157093 (not c!138431)) b!1494628))

(assert (= (and b!1494628 res!1016828) b!1494624))

(assert (= (and b!1494624 (not res!1016826)) b!1494627))

(assert (= (and b!1494627 (not res!1016827)) b!1494632))

(declare-fun m!1378299 () Bool)

(assert (=> b!1494627 m!1378299))

(assert (=> b!1494632 m!1378299))

(assert (=> b!1494624 m!1378299))

(declare-fun m!1378301 () Bool)

(assert (=> b!1494629 m!1378301))

(assert (=> b!1494629 m!1378301))

(assert (=> b!1494629 m!1378003))

(declare-fun m!1378303 () Bool)

(assert (=> b!1494629 m!1378303))

(declare-fun m!1378305 () Bool)

(assert (=> d!157093 m!1378305))

(assert (=> d!157093 m!1378047))

(assert (=> b!1494268 d!157093))

(declare-fun d!157111 () Bool)

(declare-fun e!837200 () Bool)

(assert (=> d!157111 e!837200))

(declare-fun c!138438 () Bool)

(declare-fun lt!651446 () SeekEntryResult!12392)

(assert (=> d!157111 (= c!138438 (and (is-Intermediate!12392 lt!651446) (undefined!13204 lt!651446)))))

(declare-fun e!837199 () SeekEntryResult!12392)

(assert (=> d!157111 (= lt!651446 e!837199)))

(declare-fun c!138439 () Bool)

(assert (=> d!157111 (= c!138439 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!651447 () (_ BitVec 64))

(assert (=> d!157111 (= lt!651447 (select (arr!48152 lt!651297) index!646))))

(assert (=> d!157111 (validMask!0 mask!2687)))

(assert (=> d!157111 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651298 lt!651297 mask!2687) lt!651446)))

(declare-fun b!1494641 () Bool)

(assert (=> b!1494641 (and (bvsge (index!51962 lt!651446) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651446) (size!48702 lt!651297)))))

(declare-fun res!1016829 () Bool)

(assert (=> b!1494641 (= res!1016829 (= (select (arr!48152 lt!651297) (index!51962 lt!651446)) lt!651298))))

(declare-fun e!837198 () Bool)

(assert (=> b!1494641 (=> res!1016829 e!837198)))

(declare-fun e!837201 () Bool)

(assert (=> b!1494641 (= e!837201 e!837198)))

(declare-fun b!1494642 () Bool)

(declare-fun e!837197 () SeekEntryResult!12392)

(assert (=> b!1494642 (= e!837199 e!837197)))

(declare-fun c!138437 () Bool)

(assert (=> b!1494642 (= c!138437 (or (= lt!651447 lt!651298) (= (bvadd lt!651447 lt!651447) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1494643 () Bool)

(assert (=> b!1494643 (= e!837197 (Intermediate!12392 false index!646 x!665))))

(declare-fun b!1494644 () Bool)

(assert (=> b!1494644 (and (bvsge (index!51962 lt!651446) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651446) (size!48702 lt!651297)))))

(declare-fun res!1016830 () Bool)

(assert (=> b!1494644 (= res!1016830 (= (select (arr!48152 lt!651297) (index!51962 lt!651446)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494644 (=> res!1016830 e!837198)))

(declare-fun b!1494645 () Bool)

(assert (=> b!1494645 (= e!837200 e!837201)))

(declare-fun res!1016831 () Bool)

(assert (=> b!1494645 (= res!1016831 (and (is-Intermediate!12392 lt!651446) (not (undefined!13204 lt!651446)) (bvslt (x!133560 lt!651446) #b01111111111111111111111111111110) (bvsge (x!133560 lt!651446) #b00000000000000000000000000000000) (bvsge (x!133560 lt!651446) x!665)))))

(assert (=> b!1494645 (=> (not res!1016831) (not e!837201))))

(declare-fun b!1494646 () Bool)

(assert (=> b!1494646 (= e!837197 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!651298 lt!651297 mask!2687))))

(declare-fun b!1494647 () Bool)

(assert (=> b!1494647 (= e!837199 (Intermediate!12392 true index!646 x!665))))

(declare-fun b!1494648 () Bool)

(assert (=> b!1494648 (= e!837200 (bvsge (x!133560 lt!651446) #b01111111111111111111111111111110))))

(declare-fun b!1494649 () Bool)

(assert (=> b!1494649 (and (bvsge (index!51962 lt!651446) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651446) (size!48702 lt!651297)))))

(assert (=> b!1494649 (= e!837198 (= (select (arr!48152 lt!651297) (index!51962 lt!651446)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!157111 c!138439) b!1494647))

(assert (= (and d!157111 (not c!138439)) b!1494642))

(assert (= (and b!1494642 c!138437) b!1494643))

(assert (= (and b!1494642 (not c!138437)) b!1494646))

(assert (= (and d!157111 c!138438) b!1494648))

(assert (= (and d!157111 (not c!138438)) b!1494645))

(assert (= (and b!1494645 res!1016831) b!1494641))

(assert (= (and b!1494641 (not res!1016829)) b!1494644))

(assert (= (and b!1494644 (not res!1016830)) b!1494649))

(declare-fun m!1378307 () Bool)

(assert (=> b!1494644 m!1378307))

(assert (=> b!1494649 m!1378307))

(assert (=> b!1494641 m!1378307))

(assert (=> b!1494646 m!1378037))

(assert (=> b!1494646 m!1378037))

(declare-fun m!1378309 () Bool)

(assert (=> b!1494646 m!1378309))

(assert (=> d!157111 m!1378221))

(assert (=> d!157111 m!1378047))

(assert (=> b!1494257 d!157111))

(declare-fun d!157113 () Bool)

(declare-fun lt!651452 () (_ BitVec 32))

(assert (=> d!157113 (and (bvsge lt!651452 #b00000000000000000000000000000000) (bvslt lt!651452 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157113 (= lt!651452 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!157113 (validMask!0 mask!2687)))

(assert (=> d!157113 (= (nextIndex!0 index!646 x!665 mask!2687) lt!651452)))

(declare-fun bs!42901 () Bool)

(assert (= bs!42901 d!157113))

(declare-fun m!1378315 () Bool)

(assert (=> bs!42901 m!1378315))

(assert (=> bs!42901 m!1378047))

(assert (=> b!1494270 d!157113))

(declare-fun d!157119 () Bool)

(declare-fun e!837213 () Bool)

(assert (=> d!157119 e!837213))

(declare-fun c!138447 () Bool)

(declare-fun lt!651456 () SeekEntryResult!12392)

(assert (=> d!157119 (= c!138447 (and (is-Intermediate!12392 lt!651456) (undefined!13204 lt!651456)))))

(declare-fun e!837212 () SeekEntryResult!12392)

(assert (=> d!157119 (= lt!651456 e!837212)))

(declare-fun c!138448 () Bool)

(assert (=> d!157119 (= c!138448 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!651457 () (_ BitVec 64))

(assert (=> d!157119 (= lt!651457 (select (arr!48152 a!2862) index!646))))

(assert (=> d!157119 (validMask!0 mask!2687)))

(assert (=> d!157119 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48152 a!2862) j!93) a!2862 mask!2687) lt!651456)))

(declare-fun b!1494665 () Bool)

(assert (=> b!1494665 (and (bvsge (index!51962 lt!651456) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651456) (size!48702 a!2862)))))

(declare-fun res!1016835 () Bool)

(assert (=> b!1494665 (= res!1016835 (= (select (arr!48152 a!2862) (index!51962 lt!651456)) (select (arr!48152 a!2862) j!93)))))

(declare-fun e!837211 () Bool)

(assert (=> b!1494665 (=> res!1016835 e!837211)))

(declare-fun e!837214 () Bool)

(assert (=> b!1494665 (= e!837214 e!837211)))

(declare-fun b!1494666 () Bool)

(declare-fun e!837210 () SeekEntryResult!12392)

(assert (=> b!1494666 (= e!837212 e!837210)))

(declare-fun c!138446 () Bool)

(assert (=> b!1494666 (= c!138446 (or (= lt!651457 (select (arr!48152 a!2862) j!93)) (= (bvadd lt!651457 lt!651457) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1494667 () Bool)

(assert (=> b!1494667 (= e!837210 (Intermediate!12392 false index!646 x!665))))

(declare-fun b!1494668 () Bool)

(assert (=> b!1494668 (and (bvsge (index!51962 lt!651456) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651456) (size!48702 a!2862)))))

(declare-fun res!1016836 () Bool)

(assert (=> b!1494668 (= res!1016836 (= (select (arr!48152 a!2862) (index!51962 lt!651456)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494668 (=> res!1016836 e!837211)))

(declare-fun b!1494669 () Bool)

(assert (=> b!1494669 (= e!837213 e!837214)))

(declare-fun res!1016837 () Bool)

(assert (=> b!1494669 (= res!1016837 (and (is-Intermediate!12392 lt!651456) (not (undefined!13204 lt!651456)) (bvslt (x!133560 lt!651456) #b01111111111111111111111111111110) (bvsge (x!133560 lt!651456) #b00000000000000000000000000000000) (bvsge (x!133560 lt!651456) x!665)))))

(assert (=> b!1494669 (=> (not res!1016837) (not e!837214))))

(declare-fun b!1494670 () Bool)

(assert (=> b!1494670 (= e!837210 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48152 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1494671 () Bool)

(assert (=> b!1494671 (= e!837212 (Intermediate!12392 true index!646 x!665))))

(declare-fun b!1494672 () Bool)

(assert (=> b!1494672 (= e!837213 (bvsge (x!133560 lt!651456) #b01111111111111111111111111111110))))

(declare-fun b!1494673 () Bool)

(assert (=> b!1494673 (and (bvsge (index!51962 lt!651456) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651456) (size!48702 a!2862)))))

(assert (=> b!1494673 (= e!837211 (= (select (arr!48152 a!2862) (index!51962 lt!651456)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!157119 c!138448) b!1494671))

(assert (= (and d!157119 (not c!138448)) b!1494666))

(assert (= (and b!1494666 c!138446) b!1494667))

(assert (= (and b!1494666 (not c!138446)) b!1494670))

(assert (= (and d!157119 c!138447) b!1494672))

(assert (= (and d!157119 (not c!138447)) b!1494669))

(assert (= (and b!1494669 res!1016837) b!1494665))

(assert (= (and b!1494665 (not res!1016835)) b!1494668))

(assert (= (and b!1494668 (not res!1016836)) b!1494673))

(declare-fun m!1378327 () Bool)

(assert (=> b!1494668 m!1378327))

(assert (=> b!1494673 m!1378327))

(assert (=> b!1494665 m!1378327))

(assert (=> b!1494670 m!1378037))

(assert (=> b!1494670 m!1378037))

(assert (=> b!1494670 m!1378003))

(declare-fun m!1378329 () Bool)

(assert (=> b!1494670 m!1378329))

(assert (=> d!157119 m!1378043))

(assert (=> d!157119 m!1378047))

(assert (=> b!1494265 d!157119))

(declare-fun d!157123 () Bool)

(declare-fun e!837218 () Bool)

(assert (=> d!157123 e!837218))

(declare-fun c!138450 () Bool)

(declare-fun lt!651458 () SeekEntryResult!12392)

(assert (=> d!157123 (= c!138450 (and (is-Intermediate!12392 lt!651458) (undefined!13204 lt!651458)))))

(declare-fun e!837217 () SeekEntryResult!12392)

(assert (=> d!157123 (= lt!651458 e!837217)))

(declare-fun c!138451 () Bool)

(assert (=> d!157123 (= c!138451 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!651459 () (_ BitVec 64))

(assert (=> d!157123 (= lt!651459 (select (arr!48152 a!2862) (toIndex!0 (select (arr!48152 a!2862) j!93) mask!2687)))))

(assert (=> d!157123 (validMask!0 mask!2687)))

(assert (=> d!157123 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48152 a!2862) j!93) mask!2687) (select (arr!48152 a!2862) j!93) a!2862 mask!2687) lt!651458)))

(declare-fun b!1494674 () Bool)

(assert (=> b!1494674 (and (bvsge (index!51962 lt!651458) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651458) (size!48702 a!2862)))))

(declare-fun res!1016838 () Bool)

(assert (=> b!1494674 (= res!1016838 (= (select (arr!48152 a!2862) (index!51962 lt!651458)) (select (arr!48152 a!2862) j!93)))))

(declare-fun e!837216 () Bool)

(assert (=> b!1494674 (=> res!1016838 e!837216)))

(declare-fun e!837219 () Bool)

(assert (=> b!1494674 (= e!837219 e!837216)))

(declare-fun b!1494675 () Bool)

(declare-fun e!837215 () SeekEntryResult!12392)

(assert (=> b!1494675 (= e!837217 e!837215)))

(declare-fun c!138449 () Bool)

(assert (=> b!1494675 (= c!138449 (or (= lt!651459 (select (arr!48152 a!2862) j!93)) (= (bvadd lt!651459 lt!651459) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1494676 () Bool)

(assert (=> b!1494676 (= e!837215 (Intermediate!12392 false (toIndex!0 (select (arr!48152 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1494677 () Bool)

(assert (=> b!1494677 (and (bvsge (index!51962 lt!651458) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651458) (size!48702 a!2862)))))

(declare-fun res!1016839 () Bool)

(assert (=> b!1494677 (= res!1016839 (= (select (arr!48152 a!2862) (index!51962 lt!651458)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494677 (=> res!1016839 e!837216)))

(declare-fun b!1494678 () Bool)

(assert (=> b!1494678 (= e!837218 e!837219)))

(declare-fun res!1016840 () Bool)

(assert (=> b!1494678 (= res!1016840 (and (is-Intermediate!12392 lt!651458) (not (undefined!13204 lt!651458)) (bvslt (x!133560 lt!651458) #b01111111111111111111111111111110) (bvsge (x!133560 lt!651458) #b00000000000000000000000000000000) (bvsge (x!133560 lt!651458) #b00000000000000000000000000000000)))))

(assert (=> b!1494678 (=> (not res!1016840) (not e!837219))))

(declare-fun b!1494679 () Bool)

(assert (=> b!1494679 (= e!837215 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48152 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48152 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1494680 () Bool)

(assert (=> b!1494680 (= e!837217 (Intermediate!12392 true (toIndex!0 (select (arr!48152 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1494681 () Bool)

(assert (=> b!1494681 (= e!837218 (bvsge (x!133560 lt!651458) #b01111111111111111111111111111110))))

(declare-fun b!1494682 () Bool)

(assert (=> b!1494682 (and (bvsge (index!51962 lt!651458) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651458) (size!48702 a!2862)))))

(assert (=> b!1494682 (= e!837216 (= (select (arr!48152 a!2862) (index!51962 lt!651458)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!157123 c!138451) b!1494680))

(assert (= (and d!157123 (not c!138451)) b!1494675))

(assert (= (and b!1494675 c!138449) b!1494676))

(assert (= (and b!1494675 (not c!138449)) b!1494679))

(assert (= (and d!157123 c!138450) b!1494681))

(assert (= (and d!157123 (not c!138450)) b!1494678))

(assert (= (and b!1494678 res!1016840) b!1494674))

(assert (= (and b!1494674 (not res!1016838)) b!1494677))

(assert (= (and b!1494677 (not res!1016839)) b!1494682))

(declare-fun m!1378331 () Bool)

(assert (=> b!1494677 m!1378331))

(assert (=> b!1494682 m!1378331))

(assert (=> b!1494674 m!1378331))

(assert (=> b!1494679 m!1378017))

(declare-fun m!1378333 () Bool)

(assert (=> b!1494679 m!1378333))

(assert (=> b!1494679 m!1378333))

(assert (=> b!1494679 m!1378003))

(declare-fun m!1378335 () Bool)

(assert (=> b!1494679 m!1378335))

(assert (=> d!157123 m!1378017))

(declare-fun m!1378337 () Bool)

(assert (=> d!157123 m!1378337))

(assert (=> d!157123 m!1378047))

(assert (=> b!1494255 d!157123))

(declare-fun d!157127 () Bool)

(declare-fun lt!651470 () (_ BitVec 32))

(declare-fun lt!651469 () (_ BitVec 32))

(assert (=> d!157127 (= lt!651470 (bvmul (bvxor lt!651469 (bvlshr lt!651469 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157127 (= lt!651469 ((_ extract 31 0) (bvand (bvxor (select (arr!48152 a!2862) j!93) (bvlshr (select (arr!48152 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157127 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1016844 (let ((h!36043 ((_ extract 31 0) (bvand (bvxor (select (arr!48152 a!2862) j!93) (bvlshr (select (arr!48152 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133572 (bvmul (bvxor h!36043 (bvlshr h!36043 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133572 (bvlshr x!133572 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1016844 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1016844 #b00000000000000000000000000000000))))))

(assert (=> d!157127 (= (toIndex!0 (select (arr!48152 a!2862) j!93) mask!2687) (bvand (bvxor lt!651470 (bvlshr lt!651470 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1494255 d!157127))

(declare-fun d!157133 () Bool)

(assert (=> d!157133 (= (validKeyInArray!0 (select (arr!48152 a!2862) j!93)) (and (not (= (select (arr!48152 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48152 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1494267 d!157133))

(declare-fun b!1494713 () Bool)

(declare-fun e!837241 () Bool)

(declare-fun call!67992 () Bool)

(assert (=> b!1494713 (= e!837241 call!67992)))

(declare-fun b!1494714 () Bool)

(declare-fun e!837240 () Bool)

(assert (=> b!1494714 (= e!837240 e!837241)))

(declare-fun c!138461 () Bool)

(assert (=> b!1494714 (= c!138461 (validKeyInArray!0 (select (arr!48152 a!2862) j!93)))))

(declare-fun b!1494715 () Bool)

(declare-fun e!837239 () Bool)

(assert (=> b!1494715 (= e!837239 call!67992)))

(declare-fun b!1494716 () Bool)

(assert (=> b!1494716 (= e!837241 e!837239)))

(declare-fun lt!651485 () (_ BitVec 64))

(assert (=> b!1494716 (= lt!651485 (select (arr!48152 a!2862) j!93))))

(declare-fun lt!651486 () Unit!50124)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99767 (_ BitVec 64) (_ BitVec 32)) Unit!50124)

(assert (=> b!1494716 (= lt!651486 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!651485 j!93))))

(declare-fun arrayContainsKey!0 (array!99767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1494716 (arrayContainsKey!0 a!2862 lt!651485 #b00000000000000000000000000000000)))

(declare-fun lt!651484 () Unit!50124)

(assert (=> b!1494716 (= lt!651484 lt!651486)))

(declare-fun res!1016855 () Bool)

(assert (=> b!1494716 (= res!1016855 (= (seekEntryOrOpen!0 (select (arr!48152 a!2862) j!93) a!2862 mask!2687) (Found!12392 j!93)))))

(assert (=> b!1494716 (=> (not res!1016855) (not e!837239))))

(declare-fun bm!67989 () Bool)

(assert (=> bm!67989 (= call!67992 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!157137 () Bool)

(declare-fun res!1016854 () Bool)

(assert (=> d!157137 (=> res!1016854 e!837240)))

(assert (=> d!157137 (= res!1016854 (bvsge j!93 (size!48702 a!2862)))))

(assert (=> d!157137 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!837240)))

(assert (= (and d!157137 (not res!1016854)) b!1494714))

(assert (= (and b!1494714 c!138461) b!1494716))

(assert (= (and b!1494714 (not c!138461)) b!1494713))

(assert (= (and b!1494716 res!1016855) b!1494715))

(assert (= (or b!1494715 b!1494713) bm!67989))

(assert (=> b!1494714 m!1378003))

(assert (=> b!1494714 m!1378003))

(assert (=> b!1494714 m!1378021))

(assert (=> b!1494716 m!1378003))

(declare-fun m!1378361 () Bool)

(assert (=> b!1494716 m!1378361))

(declare-fun m!1378363 () Bool)

(assert (=> b!1494716 m!1378363))

(assert (=> b!1494716 m!1378003))

(assert (=> b!1494716 m!1378053))

(declare-fun m!1378365 () Bool)

(assert (=> bm!67989 m!1378365))

(assert (=> b!1494252 d!157137))

(declare-fun d!157143 () Bool)

(assert (=> d!157143 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!651493 () Unit!50124)

(declare-fun choose!38 (array!99767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50124)

(assert (=> d!157143 (= lt!651493 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!157143 (validMask!0 mask!2687)))

(assert (=> d!157143 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!651493)))

(declare-fun bs!42903 () Bool)

(assert (= bs!42903 d!157143))

(assert (=> bs!42903 m!1378045))

(declare-fun m!1378367 () Bool)

(assert (=> bs!42903 m!1378367))

(assert (=> bs!42903 m!1378047))

(assert (=> b!1494252 d!157143))

(declare-fun d!157145 () Bool)

(assert (=> d!157145 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!127120 d!157145))

(declare-fun d!157153 () Bool)

(assert (=> d!157153 (= (array_inv!37180 a!2862) (bvsge (size!48702 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!127120 d!157153))

(declare-fun b!1494741 () Bool)

(declare-fun e!837256 () Bool)

(declare-fun call!67993 () Bool)

(assert (=> b!1494741 (= e!837256 call!67993)))

(declare-fun b!1494742 () Bool)

(declare-fun e!837255 () Bool)

(assert (=> b!1494742 (= e!837255 e!837256)))

(declare-fun c!138474 () Bool)

(assert (=> b!1494742 (= c!138474 (validKeyInArray!0 (select (arr!48152 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1494743 () Bool)

(declare-fun e!837254 () Bool)

(assert (=> b!1494743 (= e!837254 call!67993)))

(declare-fun b!1494744 () Bool)

(assert (=> b!1494744 (= e!837256 e!837254)))

(declare-fun lt!651500 () (_ BitVec 64))

(assert (=> b!1494744 (= lt!651500 (select (arr!48152 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!651501 () Unit!50124)

(assert (=> b!1494744 (= lt!651501 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!651500 #b00000000000000000000000000000000))))

(assert (=> b!1494744 (arrayContainsKey!0 a!2862 lt!651500 #b00000000000000000000000000000000)))

(declare-fun lt!651499 () Unit!50124)

(assert (=> b!1494744 (= lt!651499 lt!651501)))

(declare-fun res!1016857 () Bool)

(assert (=> b!1494744 (= res!1016857 (= (seekEntryOrOpen!0 (select (arr!48152 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12392 #b00000000000000000000000000000000)))))

(assert (=> b!1494744 (=> (not res!1016857) (not e!837254))))

(declare-fun bm!67990 () Bool)

(assert (=> bm!67990 (= call!67993 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!157155 () Bool)

(declare-fun res!1016856 () Bool)

(assert (=> d!157155 (=> res!1016856 e!837255)))

(assert (=> d!157155 (= res!1016856 (bvsge #b00000000000000000000000000000000 (size!48702 a!2862)))))

(assert (=> d!157155 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!837255)))

(assert (= (and d!157155 (not res!1016856)) b!1494742))

(assert (= (and b!1494742 c!138474) b!1494744))

(assert (= (and b!1494742 (not c!138474)) b!1494741))

(assert (= (and b!1494744 res!1016857) b!1494743))

(assert (= (or b!1494743 b!1494741) bm!67990))

(declare-fun m!1378385 () Bool)

(assert (=> b!1494742 m!1378385))

(assert (=> b!1494742 m!1378385))

(declare-fun m!1378387 () Bool)

(assert (=> b!1494742 m!1378387))

(assert (=> b!1494744 m!1378385))

(declare-fun m!1378389 () Bool)

(assert (=> b!1494744 m!1378389))

(declare-fun m!1378391 () Bool)

(assert (=> b!1494744 m!1378391))

(assert (=> b!1494744 m!1378385))

(declare-fun m!1378393 () Bool)

(assert (=> b!1494744 m!1378393))

(declare-fun m!1378395 () Bool)

(assert (=> bm!67990 m!1378395))

(assert (=> b!1494263 d!157155))

(declare-fun b!1494755 () Bool)

(declare-fun e!837267 () Bool)

(declare-fun call!67996 () Bool)

(assert (=> b!1494755 (= e!837267 call!67996)))

(declare-fun b!1494756 () Bool)

(assert (=> b!1494756 (= e!837267 call!67996)))

(declare-fun d!157157 () Bool)

(declare-fun res!1016865 () Bool)

(declare-fun e!837268 () Bool)

(assert (=> d!157157 (=> res!1016865 e!837268)))

(assert (=> d!157157 (= res!1016865 (bvsge #b00000000000000000000000000000000 (size!48702 a!2862)))))

(assert (=> d!157157 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34650) e!837268)))

(declare-fun b!1494757 () Bool)

(declare-fun e!837265 () Bool)

(declare-fun contains!9931 (List!34653 (_ BitVec 64)) Bool)

(assert (=> b!1494757 (= e!837265 (contains!9931 Nil!34650 (select (arr!48152 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1494758 () Bool)

(declare-fun e!837266 () Bool)

(assert (=> b!1494758 (= e!837266 e!837267)))

(declare-fun c!138477 () Bool)

(assert (=> b!1494758 (= c!138477 (validKeyInArray!0 (select (arr!48152 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67993 () Bool)

(assert (=> bm!67993 (= call!67996 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!138477 (Cons!34649 (select (arr!48152 a!2862) #b00000000000000000000000000000000) Nil!34650) Nil!34650)))))

(declare-fun b!1494759 () Bool)

(assert (=> b!1494759 (= e!837268 e!837266)))

(declare-fun res!1016864 () Bool)

(assert (=> b!1494759 (=> (not res!1016864) (not e!837266))))

(assert (=> b!1494759 (= res!1016864 (not e!837265))))

(declare-fun res!1016866 () Bool)

(assert (=> b!1494759 (=> (not res!1016866) (not e!837265))))

(assert (=> b!1494759 (= res!1016866 (validKeyInArray!0 (select (arr!48152 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!157157 (not res!1016865)) b!1494759))

(assert (= (and b!1494759 res!1016866) b!1494757))

(assert (= (and b!1494759 res!1016864) b!1494758))

(assert (= (and b!1494758 c!138477) b!1494755))

(assert (= (and b!1494758 (not c!138477)) b!1494756))

(assert (= (or b!1494755 b!1494756) bm!67993))

(assert (=> b!1494757 m!1378385))

(assert (=> b!1494757 m!1378385))

(declare-fun m!1378397 () Bool)

(assert (=> b!1494757 m!1378397))

(assert (=> b!1494758 m!1378385))

(assert (=> b!1494758 m!1378385))

(assert (=> b!1494758 m!1378387))

(assert (=> bm!67993 m!1378385))

(declare-fun m!1378399 () Bool)

(assert (=> bm!67993 m!1378399))

(assert (=> b!1494759 m!1378385))

(assert (=> b!1494759 m!1378385))

(assert (=> b!1494759 m!1378387))

(assert (=> b!1494264 d!157157))

(declare-fun d!157159 () Bool)

(declare-fun e!837272 () Bool)

(assert (=> d!157159 e!837272))

(declare-fun c!138479 () Bool)

(declare-fun lt!651502 () SeekEntryResult!12392)

(assert (=> d!157159 (= c!138479 (and (is-Intermediate!12392 lt!651502) (undefined!13204 lt!651502)))))

(declare-fun e!837271 () SeekEntryResult!12392)

(assert (=> d!157159 (= lt!651502 e!837271)))

(declare-fun c!138480 () Bool)

(assert (=> d!157159 (= c!138480 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!651503 () (_ BitVec 64))

(assert (=> d!157159 (= lt!651503 (select (arr!48152 lt!651297) (toIndex!0 lt!651298 mask!2687)))))

(assert (=> d!157159 (validMask!0 mask!2687)))

(assert (=> d!157159 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651298 mask!2687) lt!651298 lt!651297 mask!2687) lt!651502)))

(declare-fun b!1494760 () Bool)

(assert (=> b!1494760 (and (bvsge (index!51962 lt!651502) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651502) (size!48702 lt!651297)))))

(declare-fun res!1016867 () Bool)

(assert (=> b!1494760 (= res!1016867 (= (select (arr!48152 lt!651297) (index!51962 lt!651502)) lt!651298))))

(declare-fun e!837270 () Bool)

(assert (=> b!1494760 (=> res!1016867 e!837270)))

(declare-fun e!837273 () Bool)

(assert (=> b!1494760 (= e!837273 e!837270)))

(declare-fun b!1494761 () Bool)

(declare-fun e!837269 () SeekEntryResult!12392)

(assert (=> b!1494761 (= e!837271 e!837269)))

(declare-fun c!138478 () Bool)

(assert (=> b!1494761 (= c!138478 (or (= lt!651503 lt!651298) (= (bvadd lt!651503 lt!651503) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1494762 () Bool)

(assert (=> b!1494762 (= e!837269 (Intermediate!12392 false (toIndex!0 lt!651298 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1494763 () Bool)

(assert (=> b!1494763 (and (bvsge (index!51962 lt!651502) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651502) (size!48702 lt!651297)))))

(declare-fun res!1016868 () Bool)

(assert (=> b!1494763 (= res!1016868 (= (select (arr!48152 lt!651297) (index!51962 lt!651502)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494763 (=> res!1016868 e!837270)))

(declare-fun b!1494764 () Bool)

(assert (=> b!1494764 (= e!837272 e!837273)))

(declare-fun res!1016869 () Bool)

(assert (=> b!1494764 (= res!1016869 (and (is-Intermediate!12392 lt!651502) (not (undefined!13204 lt!651502)) (bvslt (x!133560 lt!651502) #b01111111111111111111111111111110) (bvsge (x!133560 lt!651502) #b00000000000000000000000000000000) (bvsge (x!133560 lt!651502) #b00000000000000000000000000000000)))))

(assert (=> b!1494764 (=> (not res!1016869) (not e!837273))))

(declare-fun b!1494765 () Bool)

(assert (=> b!1494765 (= e!837269 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!651298 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!651298 lt!651297 mask!2687))))

(declare-fun b!1494766 () Bool)

(assert (=> b!1494766 (= e!837271 (Intermediate!12392 true (toIndex!0 lt!651298 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1494767 () Bool)

(assert (=> b!1494767 (= e!837272 (bvsge (x!133560 lt!651502) #b01111111111111111111111111111110))))

(declare-fun b!1494768 () Bool)

(assert (=> b!1494768 (and (bvsge (index!51962 lt!651502) #b00000000000000000000000000000000) (bvslt (index!51962 lt!651502) (size!48702 lt!651297)))))

(assert (=> b!1494768 (= e!837270 (= (select (arr!48152 lt!651297) (index!51962 lt!651502)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!157159 c!138480) b!1494766))

(assert (= (and d!157159 (not c!138480)) b!1494761))

(assert (= (and b!1494761 c!138478) b!1494762))

(assert (= (and b!1494761 (not c!138478)) b!1494765))

(assert (= (and d!157159 c!138479) b!1494767))

(assert (= (and d!157159 (not c!138479)) b!1494764))

(assert (= (and b!1494764 res!1016869) b!1494760))

(assert (= (and b!1494760 (not res!1016867)) b!1494763))

(assert (= (and b!1494763 (not res!1016868)) b!1494768))

(declare-fun m!1378401 () Bool)

(assert (=> b!1494763 m!1378401))

(assert (=> b!1494768 m!1378401))

(assert (=> b!1494760 m!1378401))

(assert (=> b!1494765 m!1378007))

(declare-fun m!1378403 () Bool)

(assert (=> b!1494765 m!1378403))

(assert (=> b!1494765 m!1378403))

(declare-fun m!1378405 () Bool)

(assert (=> b!1494765 m!1378405))

(assert (=> d!157159 m!1378007))

(declare-fun m!1378407 () Bool)

(assert (=> d!157159 m!1378407))

(assert (=> d!157159 m!1378047))

(assert (=> b!1494253 d!157159))

(declare-fun d!157161 () Bool)

(declare-fun lt!651505 () (_ BitVec 32))

(declare-fun lt!651504 () (_ BitVec 32))

(assert (=> d!157161 (= lt!651505 (bvmul (bvxor lt!651504 (bvlshr lt!651504 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157161 (= lt!651504 ((_ extract 31 0) (bvand (bvxor lt!651298 (bvlshr lt!651298 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157161 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1016844 (let ((h!36043 ((_ extract 31 0) (bvand (bvxor lt!651298 (bvlshr lt!651298 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133572 (bvmul (bvxor h!36043 (bvlshr h!36043 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133572 (bvlshr x!133572 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1016844 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1016844 #b00000000000000000000000000000000))))))

(assert (=> d!157161 (= (toIndex!0 lt!651298 mask!2687) (bvand (bvxor lt!651505 (bvlshr lt!651505 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1494253 d!157161))

(declare-fun d!157163 () Bool)

(assert (=> d!157163 (= (validKeyInArray!0 (select (arr!48152 a!2862) i!1006)) (and (not (= (select (arr!48152 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48152 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1494254 d!157163))

(push 1)

