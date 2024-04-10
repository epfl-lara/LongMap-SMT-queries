; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124776 () Bool)

(assert start!124776)

(declare-fun b!1447344 () Bool)

(declare-fun e!815143 () Bool)

(declare-fun e!815138 () Bool)

(assert (=> b!1447344 (= e!815143 e!815138)))

(declare-fun res!979015 () Bool)

(assert (=> b!1447344 (=> (not res!979015) (not e!815138))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11652 0))(
  ( (MissingZero!11652 (index!49000 (_ BitVec 32))) (Found!11652 (index!49001 (_ BitVec 32))) (Intermediate!11652 (undefined!12464 Bool) (index!49002 (_ BitVec 32)) (x!130677 (_ BitVec 32))) (Undefined!11652) (MissingVacant!11652 (index!49003 (_ BitVec 32))) )
))
(declare-fun lt!635133 () SeekEntryResult!11652)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98224 0))(
  ( (array!98225 (arr!47400 (Array (_ BitVec 32) (_ BitVec 64))) (size!47950 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98224)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98224 (_ BitVec 32)) SeekEntryResult!11652)

(assert (=> b!1447344 (= res!979015 (= lt!635133 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47400 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1447345 () Bool)

(declare-fun e!815144 () Bool)

(declare-fun e!815142 () Bool)

(assert (=> b!1447345 (= e!815144 (not e!815142))))

(declare-fun res!979008 () Bool)

(assert (=> b!1447345 (=> res!979008 e!815142)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1447345 (= res!979008 (or (and (= (select (arr!47400 a!2862) index!646) (select (store (arr!47400 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47400 a!2862) index!646) (select (arr!47400 a!2862) j!93))) (not (= (select (arr!47400 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47400 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!815137 () Bool)

(assert (=> b!1447345 e!815137))

(declare-fun res!979018 () Bool)

(assert (=> b!1447345 (=> (not res!979018) (not e!815137))))

(assert (=> b!1447345 (= res!979018 (and (= lt!635133 (Found!11652 j!93)) (or (= (select (arr!47400 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47400 a!2862) intermediateBeforeIndex!19) (select (arr!47400 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98224 (_ BitVec 32)) SeekEntryResult!11652)

(assert (=> b!1447345 (= lt!635133 (seekEntryOrOpen!0 (select (arr!47400 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98224 (_ BitVec 32)) Bool)

(assert (=> b!1447345 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48800 0))(
  ( (Unit!48801) )
))
(declare-fun lt!635129 () Unit!48800)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98224 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48800)

(assert (=> b!1447345 (= lt!635129 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447346 () Bool)

(declare-fun res!979014 () Bool)

(declare-fun e!815135 () Bool)

(assert (=> b!1447346 (=> (not res!979014) (not e!815135))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1447346 (= res!979014 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47950 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47950 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47950 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1447347 () Bool)

(declare-fun res!979017 () Bool)

(assert (=> b!1447347 (=> (not res!979017) (not e!815135))))

(declare-datatypes ((List!33901 0))(
  ( (Nil!33898) (Cons!33897 (h!35247 (_ BitVec 64)) (t!48595 List!33901)) )
))
(declare-fun arrayNoDuplicates!0 (array!98224 (_ BitVec 32) List!33901) Bool)

(assert (=> b!1447347 (= res!979017 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33898))))

(declare-fun b!1447348 () Bool)

(assert (=> b!1447348 (= e!815142 true)))

(declare-fun lt!635127 () SeekEntryResult!11652)

(assert (=> b!1447348 (= lt!635127 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47400 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1447349 () Bool)

(declare-fun lt!635132 () (_ BitVec 64))

(declare-fun lt!635131 () array!98224)

(declare-fun e!815140 () Bool)

(assert (=> b!1447349 (= e!815140 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635132 lt!635131 mask!2687) (seekEntryOrOpen!0 lt!635132 lt!635131 mask!2687)))))

(declare-fun b!1447350 () Bool)

(declare-fun res!979016 () Bool)

(assert (=> b!1447350 (=> (not res!979016) (not e!815144))))

(assert (=> b!1447350 (= res!979016 e!815140)))

(declare-fun c!133680 () Bool)

(assert (=> b!1447350 (= c!133680 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447351 () Bool)

(declare-fun res!979013 () Bool)

(assert (=> b!1447351 (=> (not res!979013) (not e!815135))))

(assert (=> b!1447351 (= res!979013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447352 () Bool)

(declare-fun res!979005 () Bool)

(assert (=> b!1447352 (=> (not res!979005) (not e!815135))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447352 (= res!979005 (validKeyInArray!0 (select (arr!47400 a!2862) i!1006)))))

(declare-fun b!1447353 () Bool)

(declare-fun e!815141 () Bool)

(assert (=> b!1447353 (= e!815135 e!815141)))

(declare-fun res!979010 () Bool)

(assert (=> b!1447353 (=> (not res!979010) (not e!815141))))

(assert (=> b!1447353 (= res!979010 (= (select (store (arr!47400 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1447353 (= lt!635131 (array!98225 (store (arr!47400 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47950 a!2862)))))

(declare-fun b!1447354 () Bool)

(declare-fun res!979020 () Bool)

(assert (=> b!1447354 (=> (not res!979020) (not e!815135))))

(assert (=> b!1447354 (= res!979020 (and (= (size!47950 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47950 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47950 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1447355 () Bool)

(declare-fun res!979012 () Bool)

(assert (=> b!1447355 (=> (not res!979012) (not e!815135))))

(assert (=> b!1447355 (= res!979012 (validKeyInArray!0 (select (arr!47400 a!2862) j!93)))))

(declare-fun b!1447356 () Bool)

(declare-fun e!815136 () Bool)

(assert (=> b!1447356 (= e!815136 e!815144)))

(declare-fun res!979009 () Bool)

(assert (=> b!1447356 (=> (not res!979009) (not e!815144))))

(declare-fun lt!635130 () SeekEntryResult!11652)

(assert (=> b!1447356 (= res!979009 (= lt!635130 (Intermediate!11652 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98224 (_ BitVec 32)) SeekEntryResult!11652)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447356 (= lt!635130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635132 mask!2687) lt!635132 lt!635131 mask!2687))))

(assert (=> b!1447356 (= lt!635132 (select (store (arr!47400 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1447357 () Bool)

(assert (=> b!1447357 (= e!815140 (= lt!635130 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635132 lt!635131 mask!2687)))))

(declare-fun b!1447358 () Bool)

(declare-fun res!979011 () Bool)

(assert (=> b!1447358 (=> (not res!979011) (not e!815144))))

(assert (=> b!1447358 (= res!979011 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447359 () Bool)

(assert (=> b!1447359 (= e!815137 e!815143)))

(declare-fun res!979006 () Bool)

(assert (=> b!1447359 (=> res!979006 e!815143)))

(assert (=> b!1447359 (= res!979006 (or (and (= (select (arr!47400 a!2862) index!646) (select (store (arr!47400 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47400 a!2862) index!646) (select (arr!47400 a!2862) j!93))) (not (= (select (arr!47400 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1447360 () Bool)

(assert (=> b!1447360 (= e!815141 e!815136)))

(declare-fun res!979019 () Bool)

(assert (=> b!1447360 (=> (not res!979019) (not e!815136))))

(declare-fun lt!635128 () SeekEntryResult!11652)

(assert (=> b!1447360 (= res!979019 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47400 a!2862) j!93) mask!2687) (select (arr!47400 a!2862) j!93) a!2862 mask!2687) lt!635128))))

(assert (=> b!1447360 (= lt!635128 (Intermediate!11652 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1447361 () Bool)

(declare-fun res!979021 () Bool)

(assert (=> b!1447361 (=> (not res!979021) (not e!815136))))

(assert (=> b!1447361 (= res!979021 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47400 a!2862) j!93) a!2862 mask!2687) lt!635128))))

(declare-fun res!979007 () Bool)

(assert (=> start!124776 (=> (not res!979007) (not e!815135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124776 (= res!979007 (validMask!0 mask!2687))))

(assert (=> start!124776 e!815135))

(assert (=> start!124776 true))

(declare-fun array_inv!36428 (array!98224) Bool)

(assert (=> start!124776 (array_inv!36428 a!2862)))

(declare-fun b!1447362 () Bool)

(assert (=> b!1447362 (= e!815138 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(assert (= (and start!124776 res!979007) b!1447354))

(assert (= (and b!1447354 res!979020) b!1447352))

(assert (= (and b!1447352 res!979005) b!1447355))

(assert (= (and b!1447355 res!979012) b!1447351))

(assert (= (and b!1447351 res!979013) b!1447347))

(assert (= (and b!1447347 res!979017) b!1447346))

(assert (= (and b!1447346 res!979014) b!1447353))

(assert (= (and b!1447353 res!979010) b!1447360))

(assert (= (and b!1447360 res!979019) b!1447361))

(assert (= (and b!1447361 res!979021) b!1447356))

(assert (= (and b!1447356 res!979009) b!1447350))

(assert (= (and b!1447350 c!133680) b!1447357))

(assert (= (and b!1447350 (not c!133680)) b!1447349))

(assert (= (and b!1447350 res!979016) b!1447358))

(assert (= (and b!1447358 res!979011) b!1447345))

(assert (= (and b!1447345 res!979018) b!1447359))

(assert (= (and b!1447359 (not res!979006)) b!1447344))

(assert (= (and b!1447344 res!979015) b!1447362))

(assert (= (and b!1447345 (not res!979008)) b!1447348))

(declare-fun m!1336165 () Bool)

(assert (=> b!1447345 m!1336165))

(declare-fun m!1336167 () Bool)

(assert (=> b!1447345 m!1336167))

(declare-fun m!1336169 () Bool)

(assert (=> b!1447345 m!1336169))

(declare-fun m!1336171 () Bool)

(assert (=> b!1447345 m!1336171))

(declare-fun m!1336173 () Bool)

(assert (=> b!1447345 m!1336173))

(declare-fun m!1336175 () Bool)

(assert (=> b!1447345 m!1336175))

(declare-fun m!1336177 () Bool)

(assert (=> b!1447345 m!1336177))

(declare-fun m!1336179 () Bool)

(assert (=> b!1447345 m!1336179))

(assert (=> b!1447345 m!1336175))

(assert (=> b!1447344 m!1336175))

(assert (=> b!1447344 m!1336175))

(declare-fun m!1336181 () Bool)

(assert (=> b!1447344 m!1336181))

(declare-fun m!1336183 () Bool)

(assert (=> b!1447356 m!1336183))

(assert (=> b!1447356 m!1336183))

(declare-fun m!1336185 () Bool)

(assert (=> b!1447356 m!1336185))

(assert (=> b!1447356 m!1336167))

(declare-fun m!1336187 () Bool)

(assert (=> b!1447356 m!1336187))

(assert (=> b!1447348 m!1336175))

(assert (=> b!1447348 m!1336175))

(declare-fun m!1336189 () Bool)

(assert (=> b!1447348 m!1336189))

(declare-fun m!1336191 () Bool)

(assert (=> b!1447351 m!1336191))

(assert (=> b!1447360 m!1336175))

(assert (=> b!1447360 m!1336175))

(declare-fun m!1336193 () Bool)

(assert (=> b!1447360 m!1336193))

(assert (=> b!1447360 m!1336193))

(assert (=> b!1447360 m!1336175))

(declare-fun m!1336195 () Bool)

(assert (=> b!1447360 m!1336195))

(declare-fun m!1336197 () Bool)

(assert (=> b!1447347 m!1336197))

(declare-fun m!1336199 () Bool)

(assert (=> b!1447357 m!1336199))

(assert (=> b!1447359 m!1336173))

(assert (=> b!1447359 m!1336167))

(assert (=> b!1447359 m!1336171))

(assert (=> b!1447359 m!1336175))

(assert (=> b!1447353 m!1336167))

(declare-fun m!1336201 () Bool)

(assert (=> b!1447353 m!1336201))

(declare-fun m!1336203 () Bool)

(assert (=> b!1447349 m!1336203))

(declare-fun m!1336205 () Bool)

(assert (=> b!1447349 m!1336205))

(declare-fun m!1336207 () Bool)

(assert (=> b!1447352 m!1336207))

(assert (=> b!1447352 m!1336207))

(declare-fun m!1336209 () Bool)

(assert (=> b!1447352 m!1336209))

(assert (=> b!1447361 m!1336175))

(assert (=> b!1447361 m!1336175))

(declare-fun m!1336211 () Bool)

(assert (=> b!1447361 m!1336211))

(assert (=> b!1447355 m!1336175))

(assert (=> b!1447355 m!1336175))

(declare-fun m!1336213 () Bool)

(assert (=> b!1447355 m!1336213))

(declare-fun m!1336215 () Bool)

(assert (=> start!124776 m!1336215))

(declare-fun m!1336217 () Bool)

(assert (=> start!124776 m!1336217))

(check-sat (not b!1447349) (not b!1447361) (not start!124776) (not b!1447344) (not b!1447345) (not b!1447351) (not b!1447347) (not b!1447352) (not b!1447360) (not b!1447357) (not b!1447356) (not b!1447348) (not b!1447355))
(check-sat)
