; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127124 () Bool)

(assert start!127124)

(declare-fun b!1494366 () Bool)

(declare-fun res!1016764 () Bool)

(declare-fun e!837050 () Bool)

(assert (=> b!1494366 (=> (not res!1016764) (not e!837050))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99771 0))(
  ( (array!99772 (arr!48154 (Array (_ BitVec 32) (_ BitVec 64))) (size!48704 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99771)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1494366 (= res!1016764 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48704 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48704 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48704 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1494367 () Bool)

(declare-fun res!1016748 () Bool)

(assert (=> b!1494367 (=> (not res!1016748) (not e!837050))))

(declare-datatypes ((List!34655 0))(
  ( (Nil!34652) (Cons!34651 (h!36040 (_ BitVec 64)) (t!49349 List!34655)) )
))
(declare-fun arrayNoDuplicates!0 (array!99771 (_ BitVec 32) List!34655) Bool)

(assert (=> b!1494367 (= res!1016748 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34652))))

(declare-fun e!837047 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun b!1494368 () Bool)

(assert (=> b!1494368 (= e!837047 (or (= (select (arr!48154 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48154 a!2862) intermediateBeforeIndex!19) (select (arr!48154 a!2862) j!93))))))

(declare-fun b!1494369 () Bool)

(declare-fun e!837042 () Bool)

(declare-fun e!837046 () Bool)

(assert (=> b!1494369 (= e!837042 e!837046)))

(declare-fun res!1016759 () Bool)

(assert (=> b!1494369 (=> (not res!1016759) (not e!837046))))

(declare-datatypes ((SeekEntryResult!12394 0))(
  ( (MissingZero!12394 (index!51968 (_ BitVec 32))) (Found!12394 (index!51969 (_ BitVec 32))) (Intermediate!12394 (undefined!13206 Bool) (index!51970 (_ BitVec 32)) (x!133562 (_ BitVec 32))) (Undefined!12394) (MissingVacant!12394 (index!51971 (_ BitVec 32))) )
))
(declare-fun lt!651331 () SeekEntryResult!12394)

(assert (=> b!1494369 (= res!1016759 (= lt!651331 (Intermediate!12394 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!651335 () (_ BitVec 64))

(declare-fun lt!651332 () array!99771)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99771 (_ BitVec 32)) SeekEntryResult!12394)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494369 (= lt!651331 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651335 mask!2687) lt!651335 lt!651332 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1494369 (= lt!651335 (select (store (arr!48154 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1494370 () Bool)

(declare-fun res!1016760 () Bool)

(assert (=> b!1494370 (=> (not res!1016760) (not e!837050))))

(assert (=> b!1494370 (= res!1016760 (and (= (size!48704 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48704 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48704 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1494371 () Bool)

(declare-fun res!1016755 () Bool)

(assert (=> b!1494371 (=> (not res!1016755) (not e!837050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99771 (_ BitVec 32)) Bool)

(assert (=> b!1494371 (= res!1016755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1494372 () Bool)

(declare-fun e!837048 () Bool)

(assert (=> b!1494372 (= e!837048 e!837042)))

(declare-fun res!1016752 () Bool)

(assert (=> b!1494372 (=> (not res!1016752) (not e!837042))))

(declare-fun lt!651334 () SeekEntryResult!12394)

(assert (=> b!1494372 (= res!1016752 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48154 a!2862) j!93) mask!2687) (select (arr!48154 a!2862) j!93) a!2862 mask!2687) lt!651334))))

(assert (=> b!1494372 (= lt!651334 (Intermediate!12394 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1494374 () Bool)

(declare-fun res!1016763 () Bool)

(assert (=> b!1494374 (=> (not res!1016763) (not e!837046))))

(assert (=> b!1494374 (= res!1016763 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun lt!651336 () (_ BitVec 32))

(declare-fun e!837044 () Bool)

(declare-fun b!1494375 () Bool)

(assert (=> b!1494375 (= e!837044 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651336 (select (arr!48154 a!2862) j!93) a!2862 mask!2687) lt!651334))))

(declare-fun b!1494376 () Bool)

(declare-fun e!837043 () Bool)

(assert (=> b!1494376 (= e!837043 e!837044)))

(declare-fun res!1016762 () Bool)

(assert (=> b!1494376 (=> res!1016762 e!837044)))

(assert (=> b!1494376 (= res!1016762 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!651336 #b00000000000000000000000000000000) (bvsge lt!651336 (size!48704 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494376 (= lt!651336 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1494377 () Bool)

(declare-fun res!1016758 () Bool)

(assert (=> b!1494377 (=> (not res!1016758) (not e!837050))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1494377 (= res!1016758 (validKeyInArray!0 (select (arr!48154 a!2862) i!1006)))))

(declare-fun b!1494378 () Bool)

(declare-fun res!1016750 () Bool)

(assert (=> b!1494378 (=> (not res!1016750) (not e!837046))))

(declare-fun e!837049 () Bool)

(assert (=> b!1494378 (= res!1016750 e!837049)))

(declare-fun c!138339 () Bool)

(assert (=> b!1494378 (= c!138339 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1494379 () Bool)

(assert (=> b!1494379 (= e!837046 (not e!837043))))

(declare-fun res!1016757 () Bool)

(assert (=> b!1494379 (=> res!1016757 e!837043)))

(assert (=> b!1494379 (= res!1016757 (or (and (= (select (arr!48154 a!2862) index!646) (select (store (arr!48154 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48154 a!2862) index!646) (select (arr!48154 a!2862) j!93))) (= (select (arr!48154 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1494379 e!837047))

(declare-fun res!1016751 () Bool)

(assert (=> b!1494379 (=> (not res!1016751) (not e!837047))))

(assert (=> b!1494379 (= res!1016751 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50128 0))(
  ( (Unit!50129) )
))
(declare-fun lt!651333 () Unit!50128)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99771 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50128)

(assert (=> b!1494379 (= lt!651333 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1494380 () Bool)

(assert (=> b!1494380 (= e!837050 e!837048)))

(declare-fun res!1016761 () Bool)

(assert (=> b!1494380 (=> (not res!1016761) (not e!837048))))

(assert (=> b!1494380 (= res!1016761 (= (select (store (arr!48154 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494380 (= lt!651332 (array!99772 (store (arr!48154 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48704 a!2862)))))

(declare-fun b!1494381 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99771 (_ BitVec 32)) SeekEntryResult!12394)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99771 (_ BitVec 32)) SeekEntryResult!12394)

(assert (=> b!1494381 (= e!837049 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651335 lt!651332 mask!2687) (seekEntryOrOpen!0 lt!651335 lt!651332 mask!2687)))))

(declare-fun b!1494382 () Bool)

(declare-fun res!1016754 () Bool)

(assert (=> b!1494382 (=> (not res!1016754) (not e!837042))))

(assert (=> b!1494382 (= res!1016754 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48154 a!2862) j!93) a!2862 mask!2687) lt!651334))))

(declare-fun b!1494383 () Bool)

(declare-fun res!1016756 () Bool)

(assert (=> b!1494383 (=> (not res!1016756) (not e!837047))))

(assert (=> b!1494383 (= res!1016756 (= (seekEntryOrOpen!0 (select (arr!48154 a!2862) j!93) a!2862 mask!2687) (Found!12394 j!93)))))

(declare-fun b!1494384 () Bool)

(assert (=> b!1494384 (= e!837049 (= lt!651331 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651335 lt!651332 mask!2687)))))

(declare-fun res!1016749 () Bool)

(assert (=> start!127124 (=> (not res!1016749) (not e!837050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127124 (= res!1016749 (validMask!0 mask!2687))))

(assert (=> start!127124 e!837050))

(assert (=> start!127124 true))

(declare-fun array_inv!37182 (array!99771) Bool)

(assert (=> start!127124 (array_inv!37182 a!2862)))

(declare-fun b!1494373 () Bool)

(declare-fun res!1016753 () Bool)

(assert (=> b!1494373 (=> (not res!1016753) (not e!837050))))

(assert (=> b!1494373 (= res!1016753 (validKeyInArray!0 (select (arr!48154 a!2862) j!93)))))

(assert (= (and start!127124 res!1016749) b!1494370))

(assert (= (and b!1494370 res!1016760) b!1494377))

(assert (= (and b!1494377 res!1016758) b!1494373))

(assert (= (and b!1494373 res!1016753) b!1494371))

(assert (= (and b!1494371 res!1016755) b!1494367))

(assert (= (and b!1494367 res!1016748) b!1494366))

(assert (= (and b!1494366 res!1016764) b!1494380))

(assert (= (and b!1494380 res!1016761) b!1494372))

(assert (= (and b!1494372 res!1016752) b!1494382))

(assert (= (and b!1494382 res!1016754) b!1494369))

(assert (= (and b!1494369 res!1016759) b!1494378))

(assert (= (and b!1494378 c!138339) b!1494384))

(assert (= (and b!1494378 (not c!138339)) b!1494381))

(assert (= (and b!1494378 res!1016750) b!1494374))

(assert (= (and b!1494374 res!1016763) b!1494379))

(assert (= (and b!1494379 res!1016751) b!1494383))

(assert (= (and b!1494383 res!1016756) b!1494368))

(assert (= (and b!1494379 (not res!1016757)) b!1494376))

(assert (= (and b!1494376 (not res!1016762)) b!1494375))

(declare-fun m!1378111 () Bool)

(assert (=> b!1494375 m!1378111))

(assert (=> b!1494375 m!1378111))

(declare-fun m!1378113 () Bool)

(assert (=> b!1494375 m!1378113))

(declare-fun m!1378115 () Bool)

(assert (=> b!1494379 m!1378115))

(declare-fun m!1378117 () Bool)

(assert (=> b!1494379 m!1378117))

(declare-fun m!1378119 () Bool)

(assert (=> b!1494379 m!1378119))

(declare-fun m!1378121 () Bool)

(assert (=> b!1494379 m!1378121))

(declare-fun m!1378123 () Bool)

(assert (=> b!1494379 m!1378123))

(assert (=> b!1494379 m!1378111))

(declare-fun m!1378125 () Bool)

(assert (=> b!1494367 m!1378125))

(declare-fun m!1378127 () Bool)

(assert (=> start!127124 m!1378127))

(declare-fun m!1378129 () Bool)

(assert (=> start!127124 m!1378129))

(assert (=> b!1494372 m!1378111))

(assert (=> b!1494372 m!1378111))

(declare-fun m!1378131 () Bool)

(assert (=> b!1494372 m!1378131))

(assert (=> b!1494372 m!1378131))

(assert (=> b!1494372 m!1378111))

(declare-fun m!1378133 () Bool)

(assert (=> b!1494372 m!1378133))

(declare-fun m!1378135 () Bool)

(assert (=> b!1494371 m!1378135))

(declare-fun m!1378137 () Bool)

(assert (=> b!1494368 m!1378137))

(assert (=> b!1494368 m!1378111))

(declare-fun m!1378139 () Bool)

(assert (=> b!1494369 m!1378139))

(assert (=> b!1494369 m!1378139))

(declare-fun m!1378141 () Bool)

(assert (=> b!1494369 m!1378141))

(assert (=> b!1494369 m!1378117))

(declare-fun m!1378143 () Bool)

(assert (=> b!1494369 m!1378143))

(declare-fun m!1378145 () Bool)

(assert (=> b!1494384 m!1378145))

(assert (=> b!1494383 m!1378111))

(assert (=> b!1494383 m!1378111))

(declare-fun m!1378147 () Bool)

(assert (=> b!1494383 m!1378147))

(assert (=> b!1494380 m!1378117))

(declare-fun m!1378149 () Bool)

(assert (=> b!1494380 m!1378149))

(declare-fun m!1378151 () Bool)

(assert (=> b!1494377 m!1378151))

(assert (=> b!1494377 m!1378151))

(declare-fun m!1378153 () Bool)

(assert (=> b!1494377 m!1378153))

(declare-fun m!1378155 () Bool)

(assert (=> b!1494376 m!1378155))

(assert (=> b!1494373 m!1378111))

(assert (=> b!1494373 m!1378111))

(declare-fun m!1378157 () Bool)

(assert (=> b!1494373 m!1378157))

(assert (=> b!1494382 m!1378111))

(assert (=> b!1494382 m!1378111))

(declare-fun m!1378159 () Bool)

(assert (=> b!1494382 m!1378159))

(declare-fun m!1378161 () Bool)

(assert (=> b!1494381 m!1378161))

(declare-fun m!1378163 () Bool)

(assert (=> b!1494381 m!1378163))

(push 1)

(assert (not b!1494375))

(assert (not start!127124))

(assert (not b!1494383))

(assert (not b!1494369))

(assert (not b!1494372))

(assert (not b!1494377))

(assert (not b!1494379))

(assert (not b!1494381))

(assert (not b!1494373))

(assert (not b!1494384))

(assert (not b!1494382))

(assert (not b!1494376))

(assert (not b!1494367))

(assert (not b!1494371))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1494471 () Bool)

(declare-fun e!837103 () Bool)

(declare-fun e!837101 () Bool)

(assert (=> b!1494471 (= e!837103 e!837101)))

(declare-fun lt!651379 () (_ BitVec 64))

(assert (=> b!1494471 (= lt!651379 (select (arr!48154 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!651381 () Unit!50128)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99771 (_ BitVec 64) (_ BitVec 32)) Unit!50128)

(assert (=> b!1494471 (= lt!651381 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!651379 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1494471 (arrayContainsKey!0 a!2862 lt!651379 #b00000000000000000000000000000000)))

(declare-fun lt!651380 () Unit!50128)

(assert (=> b!1494471 (= lt!651380 lt!651381)))

(declare-fun res!1016789 () Bool)

(assert (=> b!1494471 (= res!1016789 (= (seekEntryOrOpen!0 (select (arr!48154 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12394 #b00000000000000000000000000000000)))))

(assert (=> b!1494471 (=> (not res!1016789) (not e!837101))))

(declare-fun d!157075 () Bool)

(declare-fun res!1016788 () Bool)

(declare-fun e!837102 () Bool)

(assert (=> d!157075 (=> res!1016788 e!837102)))

(assert (=> d!157075 (= res!1016788 (bvsge #b00000000000000000000000000000000 (size!48704 a!2862)))))

(assert (=> d!157075 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!837102)))

(declare-fun bm!67981 () Bool)

(declare-fun call!67984 () Bool)

(assert (=> bm!67981 (= call!67984 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1494472 () Bool)

(assert (=> b!1494472 (= e!837101 call!67984)))

(declare-fun b!1494473 () Bool)

(assert (=> b!1494473 (= e!837103 call!67984)))

(declare-fun b!1494474 () Bool)

(assert (=> b!1494474 (= e!837102 e!837103)))

(declare-fun c!138372 () Bool)

(assert (=> b!1494474 (= c!138372 (validKeyInArray!0 (select (arr!48154 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!157075 (not res!1016788)) b!1494474))

(assert (= (and b!1494474 c!138372) b!1494471))

(assert (= (and b!1494474 (not c!138372)) b!1494473))

(assert (= (and b!1494471 res!1016789) b!1494472))

(assert (= (or b!1494472 b!1494473) bm!67981))

(declare-fun m!1378203 () Bool)

(assert (=> b!1494471 m!1378203))

(declare-fun m!1378205 () Bool)

(assert (=> b!1494471 m!1378205))

(declare-fun m!1378207 () Bool)

(assert (=> b!1494471 m!1378207))

(assert (=> b!1494471 m!1378203))

(declare-fun m!1378209 () Bool)

(assert (=> b!1494471 m!1378209))

(declare-fun m!1378211 () Bool)

(assert (=> bm!67981 m!1378211))

(assert (=> b!1494474 m!1378203))

(assert (=> b!1494474 m!1378203))

(declare-fun m!1378213 () Bool)

(assert (=> b!1494474 m!1378213))

(assert (=> b!1494371 d!157075))

(declare-fun b!1494539 () Bool)

(declare-fun lt!651406 () SeekEntryResult!12394)

(assert (=> b!1494539 (and (bvsge (index!51970 lt!651406) #b00000000000000000000000000000000) (bvslt (index!51970 lt!651406) (size!48704 a!2862)))))

(declare-fun res!1016801 () Bool)

(assert (=> b!1494539 (= res!1016801 (= (select (arr!48154 a!2862) (index!51970 lt!651406)) (select (arr!48154 a!2862) j!93)))))

(declare-fun e!837140 () Bool)

(assert (=> b!1494539 (=> res!1016801 e!837140)))

(declare-fun e!837138 () Bool)

(assert (=> b!1494539 (= e!837138 e!837140)))

(declare-fun b!1494540 () Bool)

(declare-fun e!837141 () Bool)

(assert (=> b!1494540 (= e!837141 (bvsge (x!133562 lt!651406) #b01111111111111111111111111111110))))

(declare-fun e!837137 () SeekEntryResult!12394)

(declare-fun b!1494541 () Bool)

(assert (=> b!1494541 (= e!837137 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48154 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1494542 () Bool)

(assert (=> b!1494542 (= e!837141 e!837138)))

(declare-fun res!1016800 () Bool)

(assert (=> b!1494542 (= res!1016800 (and (is-Intermediate!12394 lt!651406) (not (undefined!13206 lt!651406)) (bvslt (x!133562 lt!651406) #b01111111111111111111111111111110) (bvsge (x!133562 lt!651406) #b00000000000000000000000000000000) (bvsge (x!133562 lt!651406) x!665)))))

(assert (=> b!1494542 (=> (not res!1016800) (not e!837138))))

(declare-fun b!1494538 () Bool)

(declare-fun e!837139 () SeekEntryResult!12394)

(assert (=> b!1494538 (= e!837139 (Intermediate!12394 true index!646 x!665))))

(declare-fun d!157079 () Bool)

(assert (=> d!157079 e!837141))

(declare-fun c!138401 () Bool)

(assert (=> d!157079 (= c!138401 (and (is-Intermediate!12394 lt!651406) (undefined!13206 lt!651406)))))

(assert (=> d!157079 (= lt!651406 e!837139)))

(declare-fun c!138400 () Bool)

(assert (=> d!157079 (= c!138400 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!651405 () (_ BitVec 64))

(assert (=> d!157079 (= lt!651405 (select (arr!48154 a!2862) index!646))))

(assert (=> d!157079 (validMask!0 mask!2687)))

(assert (=> d!157079 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48154 a!2862) j!93) a!2862 mask!2687) lt!651406)))

(declare-fun b!1494543 () Bool)

(assert (=> b!1494543 (and (bvsge (index!51970 lt!651406) #b00000000000000000000000000000000) (bvslt (index!51970 lt!651406) (size!48704 a!2862)))))

(declare-fun res!1016799 () Bool)

(assert (=> b!1494543 (= res!1016799 (= (select (arr!48154 a!2862) (index!51970 lt!651406)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494543 (=> res!1016799 e!837140)))

(declare-fun b!1494544 () Bool)

(assert (=> b!1494544 (= e!837137 (Intermediate!12394 false index!646 x!665))))

(declare-fun b!1494545 () Bool)

(assert (=> b!1494545 (and (bvsge (index!51970 lt!651406) #b00000000000000000000000000000000) (bvslt (index!51970 lt!651406) (size!48704 a!2862)))))

(assert (=> b!1494545 (= e!837140 (= (select (arr!48154 a!2862) (index!51970 lt!651406)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1494546 () Bool)

(assert (=> b!1494546 (= e!837139 e!837137)))

(declare-fun c!138402 () Bool)

(assert (=> b!1494546 (= c!138402 (or (= lt!651405 (select (arr!48154 a!2862) j!93)) (= (bvadd lt!651405 lt!651405) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!157079 c!138400) b!1494538))

(assert (= (and d!157079 (not c!138400)) b!1494546))

(assert (= (and b!1494546 c!138402) b!1494544))

(assert (= (and b!1494546 (not c!138402)) b!1494541))

(assert (= (and d!157079 c!138401) b!1494540))

(assert (= (and d!157079 (not c!138401)) b!1494542))

(assert (= (and b!1494542 res!1016800) b!1494539))

(assert (= (and b!1494539 (not res!1016801)) b!1494543))

(assert (= (and b!1494543 (not res!1016799)) b!1494545))

(declare-fun m!1378237 () Bool)

(assert (=> b!1494543 m!1378237))

(assert (=> b!1494541 m!1378155))

(assert (=> b!1494541 m!1378155))

(assert (=> b!1494541 m!1378111))

(declare-fun m!1378239 () Bool)

(assert (=> b!1494541 m!1378239))

(assert (=> b!1494539 m!1378237))

(assert (=> d!157079 m!1378121))

(assert (=> d!157079 m!1378127))

(assert (=> b!1494545 m!1378237))

(assert (=> b!1494382 d!157079))

(declare-fun b!1494554 () Bool)

(declare-fun lt!651411 () SeekEntryResult!12394)

(assert (=> b!1494554 (and (bvsge (index!51970 lt!651411) #b00000000000000000000000000000000) (bvslt (index!51970 lt!651411) (size!48704 a!2862)))))

(declare-fun res!1016804 () Bool)

(assert (=> b!1494554 (= res!1016804 (= (select (arr!48154 a!2862) (index!51970 lt!651411)) (select (arr!48154 a!2862) j!93)))))

(declare-fun e!837148 () Bool)

(assert (=> b!1494554 (=> res!1016804 e!837148)))

(declare-fun e!837146 () Bool)

(assert (=> b!1494554 (= e!837146 e!837148)))

(declare-fun b!1494555 () Bool)

(declare-fun e!837149 () Bool)

(assert (=> b!1494555 (= e!837149 (bvsge (x!133562 lt!651411) #b01111111111111111111111111111110))))

(declare-fun b!1494556 () Bool)

(declare-fun e!837145 () SeekEntryResult!12394)

(assert (=> b!1494556 (= e!837145 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48154 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48154 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1494557 () Bool)

(assert (=> b!1494557 (= e!837149 e!837146)))

(declare-fun res!1016803 () Bool)

(assert (=> b!1494557 (= res!1016803 (and (is-Intermediate!12394 lt!651411) (not (undefined!13206 lt!651411)) (bvslt (x!133562 lt!651411) #b01111111111111111111111111111110) (bvsge (x!133562 lt!651411) #b00000000000000000000000000000000) (bvsge (x!133562 lt!651411) #b00000000000000000000000000000000)))))

(assert (=> b!1494557 (=> (not res!1016803) (not e!837146))))

(declare-fun b!1494553 () Bool)

(declare-fun e!837147 () SeekEntryResult!12394)

(assert (=> b!1494553 (= e!837147 (Intermediate!12394 true (toIndex!0 (select (arr!48154 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!157087 () Bool)

(assert (=> d!157087 e!837149))

(declare-fun c!138407 () Bool)

(assert (=> d!157087 (= c!138407 (and (is-Intermediate!12394 lt!651411) (undefined!13206 lt!651411)))))

(assert (=> d!157087 (= lt!651411 e!837147)))

(declare-fun c!138406 () Bool)

(assert (=> d!157087 (= c!138406 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!651410 () (_ BitVec 64))

(assert (=> d!157087 (= lt!651410 (select (arr!48154 a!2862) (toIndex!0 (select (arr!48154 a!2862) j!93) mask!2687)))))

(assert (=> d!157087 (validMask!0 mask!2687)))

(assert (=> d!157087 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48154 a!2862) j!93) mask!2687) (select (arr!48154 a!2862) j!93) a!2862 mask!2687) lt!651411)))

(declare-fun b!1494558 () Bool)

(assert (=> b!1494558 (and (bvsge (index!51970 lt!651411) #b00000000000000000000000000000000) (bvslt (index!51970 lt!651411) (size!48704 a!2862)))))

(declare-fun res!1016802 () Bool)

(assert (=> b!1494558 (= res!1016802 (= (select (arr!48154 a!2862) (index!51970 lt!651411)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494558 (=> res!1016802 e!837148)))

(declare-fun b!1494559 () Bool)

(assert (=> b!1494559 (= e!837145 (Intermediate!12394 false (toIndex!0 (select (arr!48154 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1494560 () Bool)

(assert (=> b!1494560 (and (bvsge (index!51970 lt!651411) #b00000000000000000000000000000000) (bvslt (index!51970 lt!651411) (size!48704 a!2862)))))

(assert (=> b!1494560 (= e!837148 (= (select (arr!48154 a!2862) (index!51970 lt!651411)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1494561 () Bool)

(assert (=> b!1494561 (= e!837147 e!837145)))

(declare-fun c!138408 () Bool)

(assert (=> b!1494561 (= c!138408 (or (= lt!651410 (select (arr!48154 a!2862) j!93)) (= (bvadd lt!651410 lt!651410) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!157087 c!138406) b!1494553))

(assert (= (and d!157087 (not c!138406)) b!1494561))

(assert (= (and b!1494561 c!138408) b!1494559))

(assert (= (and b!1494561 (not c!138408)) b!1494556))

(assert (= (and d!157087 c!138407) b!1494555))

(assert (= (and d!157087 (not c!138407)) b!1494557))

(assert (= (and b!1494557 res!1016803) b!1494554))

(assert (= (and b!1494554 (not res!1016804)) b!1494558))

(assert (= (and b!1494558 (not res!1016802)) b!1494560))

(declare-fun m!1378251 () Bool)

(assert (=> b!1494558 m!1378251))

(assert (=> b!1494556 m!1378131))

(declare-fun m!1378253 () Bool)

(assert (=> b!1494556 m!1378253))

(assert (=> b!1494556 m!1378253))

(assert (=> b!1494556 m!1378111))

(declare-fun m!1378255 () Bool)

(assert (=> b!1494556 m!1378255))

(assert (=> b!1494554 m!1378251))

(assert (=> d!157087 m!1378131))

(declare-fun m!1378257 () Bool)

(assert (=> d!157087 m!1378257))

(assert (=> d!157087 m!1378127))

(assert (=> b!1494560 m!1378251))

(assert (=> b!1494372 d!157087))

(declare-fun d!157091 () Bool)

(declare-fun lt!651422 () (_ BitVec 32))

(declare-fun lt!651421 () (_ BitVec 32))

(assert (=> d!157091 (= lt!651422 (bvmul (bvxor lt!651421 (bvlshr lt!651421 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157091 (= lt!651421 ((_ extract 31 0) (bvand (bvxor (select (arr!48154 a!2862) j!93) (bvlshr (select (arr!48154 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157091 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1016807 (let ((h!36042 ((_ extract 31 0) (bvand (bvxor (select (arr!48154 a!2862) j!93) (bvlshr (select (arr!48154 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133569 (bvmul (bvxor h!36042 (bvlshr h!36042 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133569 (bvlshr x!133569 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1016807 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1016807 #b00000000000000000000000000000000))))))

(assert (=> d!157091 (= (toIndex!0 (select (arr!48154 a!2862) j!93) mask!2687) (bvand (bvxor lt!651422 (bvlshr lt!651422 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1494372 d!157091))

(declare-fun d!157097 () Bool)

(declare-fun lt!651453 () SeekEntryResult!12394)

(assert (=> d!157097 (and (or (is-Undefined!12394 lt!651453) (not (is-Found!12394 lt!651453)) (and (bvsge (index!51969 lt!651453) #b00000000000000000000000000000000) (bvslt (index!51969 lt!651453) (size!48704 a!2862)))) (or (is-Undefined!12394 lt!651453) (is-Found!12394 lt!651453) (not (is-MissingZero!12394 lt!651453)) (and (bvsge (index!51968 lt!651453) #b00000000000000000000000000000000) (bvslt (index!51968 lt!651453) (size!48704 a!2862)))) (or (is-Undefined!12394 lt!651453) (is-Found!12394 lt!651453) (is-MissingZero!12394 lt!651453) (not (is-MissingVacant!12394 lt!651453)) (and (bvsge (index!51971 lt!651453) #b00000000000000000000000000000000) (bvslt (index!51971 lt!651453) (size!48704 a!2862)))) (or (is-Undefined!12394 lt!651453) (ite (is-Found!12394 lt!651453) (= (select (arr!48154 a!2862) (index!51969 lt!651453)) (select (arr!48154 a!2862) j!93)) (ite (is-MissingZero!12394 lt!651453) (= (select (arr!48154 a!2862) (index!51968 lt!651453)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12394 lt!651453) (= (select (arr!48154 a!2862) (index!51971 lt!651453)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!837207 () SeekEntryResult!12394)

(assert (=> d!157097 (= lt!651453 e!837207)))

(declare-fun c!138445 () Bool)

(declare-fun lt!651454 () SeekEntryResult!12394)

(assert (=> d!157097 (= c!138445 (and (is-Intermediate!12394 lt!651454) (undefined!13206 lt!651454)))))

(assert (=> d!157097 (= lt!651454 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48154 a!2862) j!93) mask!2687) (select (arr!48154 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!157097 (validMask!0 mask!2687)))

(assert (=> d!157097 (= (seekEntryOrOpen!0 (select (arr!48154 a!2862) j!93) a!2862 mask!2687) lt!651453)))

(declare-fun b!1494659 () Bool)

(declare-fun e!837208 () SeekEntryResult!12394)

(assert (=> b!1494659 (= e!837207 e!837208)))

(declare-fun lt!651455 () (_ BitVec 64))

(assert (=> b!1494659 (= lt!651455 (select (arr!48154 a!2862) (index!51970 lt!651454)))))

(declare-fun c!138444 () Bool)

(assert (=> b!1494659 (= c!138444 (= lt!651455 (select (arr!48154 a!2862) j!93)))))

(declare-fun b!1494660 () Bool)

(declare-fun c!138443 () Bool)

(assert (=> b!1494660 (= c!138443 (= lt!651455 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!837209 () SeekEntryResult!12394)

(assert (=> b!1494660 (= e!837208 e!837209)))

(declare-fun b!1494661 () Bool)

(assert (=> b!1494661 (= e!837209 (seekKeyOrZeroReturnVacant!0 (x!133562 lt!651454) (index!51970 lt!651454) (index!51970 lt!651454) (select (arr!48154 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1494662 () Bool)

(assert (=> b!1494662 (= e!837209 (MissingZero!12394 (index!51970 lt!651454)))))

(declare-fun b!1494663 () Bool)

(assert (=> b!1494663 (= e!837207 Undefined!12394)))

(declare-fun b!1494664 () Bool)

(assert (=> b!1494664 (= e!837208 (Found!12394 (index!51970 lt!651454)))))

(assert (= (and d!157097 c!138445) b!1494663))

(assert (= (and d!157097 (not c!138445)) b!1494659))

(assert (= (and b!1494659 c!138444) b!1494664))

(assert (= (and b!1494659 (not c!138444)) b!1494660))

(assert (= (and b!1494660 c!138443) b!1494662))

(assert (= (and b!1494660 (not c!138443)) b!1494661))

(declare-fun m!1378317 () Bool)

(assert (=> d!157097 m!1378317))

(assert (=> d!157097 m!1378111))

(assert (=> d!157097 m!1378131))

(declare-fun m!1378319 () Bool)

(assert (=> d!157097 m!1378319))

(assert (=> d!157097 m!1378127))

(declare-fun m!1378321 () Bool)

(assert (=> d!157097 m!1378321))

(assert (=> d!157097 m!1378131))

(assert (=> d!157097 m!1378111))

(assert (=> d!157097 m!1378133))

(declare-fun m!1378323 () Bool)

(assert (=> b!1494659 m!1378323))

(assert (=> b!1494661 m!1378111))

(declare-fun m!1378325 () Bool)

(assert (=> b!1494661 m!1378325))

(assert (=> b!1494383 d!157097))

(declare-fun d!157121 () Bool)

(assert (=> d!157121 (= (validKeyInArray!0 (select (arr!48154 a!2862) j!93)) (and (not (= (select (arr!48154 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48154 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1494373 d!157121))

(declare-fun b!1494684 () Bool)

(declare-fun lt!651461 () SeekEntryResult!12394)

(assert (=> b!1494684 (and (bvsge (index!51970 lt!651461) #b00000000000000000000000000000000) (bvslt (index!51970 lt!651461) (size!48704 lt!651332)))))

(declare-fun res!1016843 () Bool)

(assert (=> b!1494684 (= res!1016843 (= (select (arr!48154 lt!651332) (index!51970 lt!651461)) lt!651335))))

(declare-fun e!837223 () Bool)

(assert (=> b!1494684 (=> res!1016843 e!837223)))

(declare-fun e!837221 () Bool)

(assert (=> b!1494684 (= e!837221 e!837223)))

(declare-fun b!1494685 () Bool)

(declare-fun e!837224 () Bool)

(assert (=> b!1494685 (= e!837224 (bvsge (x!133562 lt!651461) #b01111111111111111111111111111110))))

(declare-fun b!1494686 () Bool)

(declare-fun e!837220 () SeekEntryResult!12394)

(assert (=> b!1494686 (= e!837220 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!651335 lt!651332 mask!2687))))

(declare-fun b!1494687 () Bool)

(assert (=> b!1494687 (= e!837224 e!837221)))

(declare-fun res!1016842 () Bool)

(assert (=> b!1494687 (= res!1016842 (and (is-Intermediate!12394 lt!651461) (not (undefined!13206 lt!651461)) (bvslt (x!133562 lt!651461) #b01111111111111111111111111111110) (bvsge (x!133562 lt!651461) #b00000000000000000000000000000000) (bvsge (x!133562 lt!651461) x!665)))))

(assert (=> b!1494687 (=> (not res!1016842) (not e!837221))))

(declare-fun b!1494683 () Bool)

(declare-fun e!837222 () SeekEntryResult!12394)

(assert (=> b!1494683 (= e!837222 (Intermediate!12394 true index!646 x!665))))

(declare-fun d!157125 () Bool)

(assert (=> d!157125 e!837224))

(declare-fun c!138453 () Bool)

(assert (=> d!157125 (= c!138453 (and (is-Intermediate!12394 lt!651461) (undefined!13206 lt!651461)))))

(assert (=> d!157125 (= lt!651461 e!837222)))

(declare-fun c!138452 () Bool)

(assert (=> d!157125 (= c!138452 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!651460 () (_ BitVec 64))

(assert (=> d!157125 (= lt!651460 (select (arr!48154 lt!651332) index!646))))

(assert (=> d!157125 (validMask!0 mask!2687)))

(assert (=> d!157125 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651335 lt!651332 mask!2687) lt!651461)))

(declare-fun b!1494688 () Bool)

(assert (=> b!1494688 (and (bvsge (index!51970 lt!651461) #b00000000000000000000000000000000) (bvslt (index!51970 lt!651461) (size!48704 lt!651332)))))

(declare-fun res!1016841 () Bool)

(assert (=> b!1494688 (= res!1016841 (= (select (arr!48154 lt!651332) (index!51970 lt!651461)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494688 (=> res!1016841 e!837223)))

(declare-fun b!1494689 () Bool)

(assert (=> b!1494689 (= e!837220 (Intermediate!12394 false index!646 x!665))))

(declare-fun b!1494690 () Bool)

(assert (=> b!1494690 (and (bvsge (index!51970 lt!651461) #b00000000000000000000000000000000) (bvslt (index!51970 lt!651461) (size!48704 lt!651332)))))

(assert (=> b!1494690 (= e!837223 (= (select (arr!48154 lt!651332) (index!51970 lt!651461)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1494691 () Bool)

(assert (=> b!1494691 (= e!837222 e!837220)))

(declare-fun c!138454 () Bool)

(assert (=> b!1494691 (= c!138454 (or (= lt!651460 lt!651335) (= (bvadd lt!651460 lt!651460) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!157125 c!138452) b!1494683))

(assert (= (and d!157125 (not c!138452)) b!1494691))

(assert (= (and b!1494691 c!138454) b!1494689))

(assert (= (and b!1494691 (not c!138454)) b!1494686))

(assert (= (and d!157125 c!138453) b!1494685))

(assert (= (and d!157125 (not c!138453)) b!1494687))

(assert (= (and b!1494687 res!1016842) b!1494684))

(assert (= (and b!1494684 (not res!1016843)) b!1494688))

(assert (= (and b!1494688 (not res!1016841)) b!1494690))

(declare-fun m!1378339 () Bool)

(assert (=> b!1494688 m!1378339))

(assert (=> b!1494686 m!1378155))

(assert (=> b!1494686 m!1378155))

(declare-fun m!1378341 () Bool)

(assert (=> b!1494686 m!1378341))

(assert (=> b!1494684 m!1378339))

(declare-fun m!1378343 () Bool)

(assert (=> d!157125 m!1378343))

(assert (=> d!157125 m!1378127))

(assert (=> b!1494690 m!1378339))

(assert (=> b!1494384 d!157125))

(declare-fun b!1494692 () Bool)

(declare-fun e!837227 () Bool)

(declare-fun e!837225 () Bool)

(assert (=> b!1494692 (= e!837227 e!837225)))

(declare-fun lt!651462 () (_ BitVec 64))

(assert (=> b!1494692 (= lt!651462 (select (arr!48154 a!2862) j!93))))

(declare-fun lt!651464 () Unit!50128)

(assert (=> b!1494692 (= lt!651464 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!651462 j!93))))

(assert (=> b!1494692 (arrayContainsKey!0 a!2862 lt!651462 #b00000000000000000000000000000000)))

(declare-fun lt!651463 () Unit!50128)

(assert (=> b!1494692 (= lt!651463 lt!651464)))

(declare-fun res!1016846 () Bool)

(assert (=> b!1494692 (= res!1016846 (= (seekEntryOrOpen!0 (select (arr!48154 a!2862) j!93) a!2862 mask!2687) (Found!12394 j!93)))))

(assert (=> b!1494692 (=> (not res!1016846) (not e!837225))))

(declare-fun d!157129 () Bool)

(declare-fun res!1016845 () Bool)

(declare-fun e!837226 () Bool)

(assert (=> d!157129 (=> res!1016845 e!837226)))

(assert (=> d!157129 (= res!1016845 (bvsge j!93 (size!48704 a!2862)))))

(assert (=> d!157129 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!837226)))

(declare-fun call!67989 () Bool)

(declare-fun bm!67986 () Bool)

(assert (=> bm!67986 (= call!67989 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1494693 () Bool)

(assert (=> b!1494693 (= e!837225 call!67989)))

(declare-fun b!1494694 () Bool)

(assert (=> b!1494694 (= e!837227 call!67989)))

(declare-fun b!1494695 () Bool)

(assert (=> b!1494695 (= e!837226 e!837227)))

(declare-fun c!138455 () Bool)

(assert (=> b!1494695 (= c!138455 (validKeyInArray!0 (select (arr!48154 a!2862) j!93)))))

(assert (= (and d!157129 (not res!1016845)) b!1494695))

(assert (= (and b!1494695 c!138455) b!1494692))

(assert (= (and b!1494695 (not c!138455)) b!1494694))

(assert (= (and b!1494692 res!1016846) b!1494693))

(assert (= (or b!1494693 b!1494694) bm!67986))

(assert (=> b!1494692 m!1378111))

(declare-fun m!1378345 () Bool)

(assert (=> b!1494692 m!1378345))

(declare-fun m!1378347 () Bool)

(assert (=> b!1494692 m!1378347))

(assert (=> b!1494692 m!1378111))

(assert (=> b!1494692 m!1378147))

(declare-fun m!1378349 () Bool)

(assert (=> bm!67986 m!1378349))

(assert (=> b!1494695 m!1378111))

(assert (=> b!1494695 m!1378111))

(assert (=> b!1494695 m!1378157))

(assert (=> b!1494379 d!157129))

(declare-fun d!157131 () Bool)

(assert (=> d!157131 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!651473 () Unit!50128)

(declare-fun choose!38 (array!99771 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50128)

(assert (=> d!157131 (= lt!651473 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!157131 (validMask!0 mask!2687)))

(assert (=> d!157131 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!651473)))

(declare-fun bs!42902 () Bool)

(assert (= bs!42902 d!157131))

(assert (=> bs!42902 m!1378123))

(declare-fun m!1378351 () Bool)

(assert (=> bs!42902 m!1378351))

(assert (=> bs!42902 m!1378127))

(assert (=> b!1494379 d!157131))

(declare-fun b!1494697 () Bool)

(declare-fun lt!651475 () SeekEntryResult!12394)

(assert (=> b!1494697 (and (bvsge (index!51970 lt!651475) #b00000000000000000000000000000000) (bvslt (index!51970 lt!651475) (size!48704 lt!651332)))))

(declare-fun res!1016849 () Bool)

(assert (=> b!1494697 (= res!1016849 (= (select (arr!48154 lt!651332) (index!51970 lt!651475)) lt!651335))))

(declare-fun e!837231 () Bool)

(assert (=> b!1494697 (=> res!1016849 e!837231)))

(declare-fun e!837229 () Bool)

(assert (=> b!1494697 (= e!837229 e!837231)))

(declare-fun b!1494698 () Bool)

(declare-fun e!837232 () Bool)

(assert (=> b!1494698 (= e!837232 (bvsge (x!133562 lt!651475) #b01111111111111111111111111111110))))

(declare-fun e!837228 () SeekEntryResult!12394)

(declare-fun b!1494699 () Bool)

(assert (=> b!1494699 (= e!837228 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!651335 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!651335 lt!651332 mask!2687))))

(declare-fun b!1494700 () Bool)

(assert (=> b!1494700 (= e!837232 e!837229)))

(declare-fun res!1016848 () Bool)

(assert (=> b!1494700 (= res!1016848 (and (is-Intermediate!12394 lt!651475) (not (undefined!13206 lt!651475)) (bvslt (x!133562 lt!651475) #b01111111111111111111111111111110) (bvsge (x!133562 lt!651475) #b00000000000000000000000000000000) (bvsge (x!133562 lt!651475) #b00000000000000000000000000000000)))))

(assert (=> b!1494700 (=> (not res!1016848) (not e!837229))))

(declare-fun b!1494696 () Bool)

(declare-fun e!837230 () SeekEntryResult!12394)

(assert (=> b!1494696 (= e!837230 (Intermediate!12394 true (toIndex!0 lt!651335 mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!157135 () Bool)

(assert (=> d!157135 e!837232))

(declare-fun c!138457 () Bool)

(assert (=> d!157135 (= c!138457 (and (is-Intermediate!12394 lt!651475) (undefined!13206 lt!651475)))))

(assert (=> d!157135 (= lt!651475 e!837230)))

(declare-fun c!138456 () Bool)

(assert (=> d!157135 (= c!138456 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!651474 () (_ BitVec 64))

(assert (=> d!157135 (= lt!651474 (select (arr!48154 lt!651332) (toIndex!0 lt!651335 mask!2687)))))

(assert (=> d!157135 (validMask!0 mask!2687)))

(assert (=> d!157135 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651335 mask!2687) lt!651335 lt!651332 mask!2687) lt!651475)))

(declare-fun b!1494701 () Bool)

(assert (=> b!1494701 (and (bvsge (index!51970 lt!651475) #b00000000000000000000000000000000) (bvslt (index!51970 lt!651475) (size!48704 lt!651332)))))

(declare-fun res!1016847 () Bool)

(assert (=> b!1494701 (= res!1016847 (= (select (arr!48154 lt!651332) (index!51970 lt!651475)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494701 (=> res!1016847 e!837231)))

(declare-fun b!1494702 () Bool)

(assert (=> b!1494702 (= e!837228 (Intermediate!12394 false (toIndex!0 lt!651335 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1494703 () Bool)

(assert (=> b!1494703 (and (bvsge (index!51970 lt!651475) #b00000000000000000000000000000000) (bvslt (index!51970 lt!651475) (size!48704 lt!651332)))))

(assert (=> b!1494703 (= e!837231 (= (select (arr!48154 lt!651332) (index!51970 lt!651475)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1494704 () Bool)

(assert (=> b!1494704 (= e!837230 e!837228)))

(declare-fun c!138458 () Bool)

(assert (=> b!1494704 (= c!138458 (or (= lt!651474 lt!651335) (= (bvadd lt!651474 lt!651474) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!157135 c!138456) b!1494696))

(assert (= (and d!157135 (not c!138456)) b!1494704))

(assert (= (and b!1494704 c!138458) b!1494702))

(assert (= (and b!1494704 (not c!138458)) b!1494699))

(assert (= (and d!157135 c!138457) b!1494698))

(assert (= (and d!157135 (not c!138457)) b!1494700))

(assert (= (and b!1494700 res!1016848) b!1494697))

(assert (= (and b!1494697 (not res!1016849)) b!1494701))

(assert (= (and b!1494701 (not res!1016847)) b!1494703))

(declare-fun m!1378353 () Bool)

(assert (=> b!1494701 m!1378353))

(assert (=> b!1494699 m!1378139))

