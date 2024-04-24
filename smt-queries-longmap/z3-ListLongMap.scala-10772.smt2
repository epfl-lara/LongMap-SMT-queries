; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126408 () Bool)

(assert start!126408)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1478198 () Bool)

(declare-fun lt!645668 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!829436 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!99352 0))(
  ( (array!99353 (arr!47950 (Array (_ BitVec 32) (_ BitVec 64))) (size!48501 (_ BitVec 32))) )
))
(declare-fun lt!645671 () array!99352)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12087 0))(
  ( (MissingZero!12087 (index!50740 (_ BitVec 32))) (Found!12087 (index!50741 (_ BitVec 32))) (Intermediate!12087 (undefined!12899 Bool) (index!50742 (_ BitVec 32)) (x!132527 (_ BitVec 32))) (Undefined!12087) (MissingVacant!12087 (index!50743 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99352 (_ BitVec 32)) SeekEntryResult!12087)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99352 (_ BitVec 32)) SeekEntryResult!12087)

(assert (=> b!1478198 (= e!829436 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645668 lt!645671 mask!2687) (seekEntryOrOpen!0 lt!645668 lt!645671 mask!2687)))))

(declare-fun b!1478199 () Bool)

(declare-fun res!1003335 () Bool)

(declare-fun e!829439 () Bool)

(assert (=> b!1478199 (=> (not res!1003335) (not e!829439))))

(declare-fun a!2862 () array!99352)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478199 (= res!1003335 (validKeyInArray!0 (select (arr!47950 a!2862) j!93)))))

(declare-fun b!1478200 () Bool)

(declare-fun res!1003339 () Bool)

(declare-fun e!829433 () Bool)

(assert (=> b!1478200 (=> (not res!1003339) (not e!829433))))

(declare-fun lt!645669 () SeekEntryResult!12087)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99352 (_ BitVec 32)) SeekEntryResult!12087)

(assert (=> b!1478200 (= res!1003339 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47950 a!2862) j!93) a!2862 mask!2687) lt!645669))))

(declare-fun b!1478201 () Bool)

(declare-fun res!1003334 () Bool)

(assert (=> b!1478201 (=> (not res!1003334) (not e!829439))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1478201 (= res!1003334 (validKeyInArray!0 (select (arr!47950 a!2862) i!1006)))))

(declare-fun b!1478202 () Bool)

(declare-fun res!1003338 () Bool)

(assert (=> b!1478202 (=> (not res!1003338) (not e!829439))))

(declare-datatypes ((List!34438 0))(
  ( (Nil!34435) (Cons!34434 (h!35816 (_ BitVec 64)) (t!49124 List!34438)) )
))
(declare-fun arrayNoDuplicates!0 (array!99352 (_ BitVec 32) List!34438) Bool)

(assert (=> b!1478202 (= res!1003338 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34435))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!829434 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1478203 () Bool)

(assert (=> b!1478203 (= e!829434 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1478204 () Bool)

(declare-fun res!1003342 () Bool)

(assert (=> b!1478204 (=> (not res!1003342) (not e!829439))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99352 (_ BitVec 32)) Bool)

(assert (=> b!1478204 (= res!1003342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478205 () Bool)

(declare-fun e!829435 () Bool)

(assert (=> b!1478205 (= e!829435 (not true))))

(declare-fun e!829440 () Bool)

(assert (=> b!1478205 e!829440))

(declare-fun res!1003340 () Bool)

(assert (=> b!1478205 (=> (not res!1003340) (not e!829440))))

(declare-fun lt!645670 () SeekEntryResult!12087)

(assert (=> b!1478205 (= res!1003340 (and (= lt!645670 (Found!12087 j!93)) (or (= (select (arr!47950 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47950 a!2862) intermediateBeforeIndex!19) (select (arr!47950 a!2862) j!93)))))))

(assert (=> b!1478205 (= lt!645670 (seekEntryOrOpen!0 (select (arr!47950 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1478205 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49547 0))(
  ( (Unit!49548) )
))
(declare-fun lt!645672 () Unit!49547)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99352 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49547)

(assert (=> b!1478205 (= lt!645672 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1478206 () Bool)

(declare-fun res!1003345 () Bool)

(assert (=> b!1478206 (=> (not res!1003345) (not e!829439))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1478206 (= res!1003345 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48501 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48501 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48501 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478207 () Bool)

(declare-fun res!1003346 () Bool)

(assert (=> b!1478207 (=> (not res!1003346) (not e!829435))))

(assert (=> b!1478207 (= res!1003346 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun lt!645673 () SeekEntryResult!12087)

(declare-fun b!1478208 () Bool)

(assert (=> b!1478208 (= e!829436 (= lt!645673 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645668 lt!645671 mask!2687)))))

(declare-fun b!1478209 () Bool)

(declare-fun res!1003343 () Bool)

(assert (=> b!1478209 (=> (not res!1003343) (not e!829435))))

(assert (=> b!1478209 (= res!1003343 e!829436)))

(declare-fun c!136963 () Bool)

(assert (=> b!1478209 (= c!136963 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1003337 () Bool)

(assert (=> start!126408 (=> (not res!1003337) (not e!829439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126408 (= res!1003337 (validMask!0 mask!2687))))

(assert (=> start!126408 e!829439))

(assert (=> start!126408 true))

(declare-fun array_inv!37231 (array!99352) Bool)

(assert (=> start!126408 (array_inv!37231 a!2862)))

(declare-fun b!1478210 () Bool)

(declare-fun e!829432 () Bool)

(assert (=> b!1478210 (= e!829432 e!829434)))

(declare-fun res!1003333 () Bool)

(assert (=> b!1478210 (=> (not res!1003333) (not e!829434))))

(assert (=> b!1478210 (= res!1003333 (= lt!645670 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47950 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478211 () Bool)

(declare-fun res!1003332 () Bool)

(assert (=> b!1478211 (=> (not res!1003332) (not e!829439))))

(assert (=> b!1478211 (= res!1003332 (and (= (size!48501 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48501 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48501 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1478212 () Bool)

(assert (=> b!1478212 (= e!829440 e!829432)))

(declare-fun res!1003341 () Bool)

(assert (=> b!1478212 (=> res!1003341 e!829432)))

(assert (=> b!1478212 (= res!1003341 (or (and (= (select (arr!47950 a!2862) index!646) (select (store (arr!47950 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47950 a!2862) index!646) (select (arr!47950 a!2862) j!93))) (not (= (select (arr!47950 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1478213 () Bool)

(declare-fun e!829437 () Bool)

(assert (=> b!1478213 (= e!829437 e!829433)))

(declare-fun res!1003336 () Bool)

(assert (=> b!1478213 (=> (not res!1003336) (not e!829433))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478213 (= res!1003336 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47950 a!2862) j!93) mask!2687) (select (arr!47950 a!2862) j!93) a!2862 mask!2687) lt!645669))))

(assert (=> b!1478213 (= lt!645669 (Intermediate!12087 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478214 () Bool)

(assert (=> b!1478214 (= e!829433 e!829435)))

(declare-fun res!1003344 () Bool)

(assert (=> b!1478214 (=> (not res!1003344) (not e!829435))))

(assert (=> b!1478214 (= res!1003344 (= lt!645673 (Intermediate!12087 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1478214 (= lt!645673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645668 mask!2687) lt!645668 lt!645671 mask!2687))))

(assert (=> b!1478214 (= lt!645668 (select (store (arr!47950 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1478215 () Bool)

(assert (=> b!1478215 (= e!829439 e!829437)))

(declare-fun res!1003331 () Bool)

(assert (=> b!1478215 (=> (not res!1003331) (not e!829437))))

(assert (=> b!1478215 (= res!1003331 (= (select (store (arr!47950 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1478215 (= lt!645671 (array!99353 (store (arr!47950 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48501 a!2862)))))

(assert (= (and start!126408 res!1003337) b!1478211))

(assert (= (and b!1478211 res!1003332) b!1478201))

(assert (= (and b!1478201 res!1003334) b!1478199))

(assert (= (and b!1478199 res!1003335) b!1478204))

(assert (= (and b!1478204 res!1003342) b!1478202))

(assert (= (and b!1478202 res!1003338) b!1478206))

(assert (= (and b!1478206 res!1003345) b!1478215))

(assert (= (and b!1478215 res!1003331) b!1478213))

(assert (= (and b!1478213 res!1003336) b!1478200))

(assert (= (and b!1478200 res!1003339) b!1478214))

(assert (= (and b!1478214 res!1003344) b!1478209))

(assert (= (and b!1478209 c!136963) b!1478208))

(assert (= (and b!1478209 (not c!136963)) b!1478198))

(assert (= (and b!1478209 res!1003343) b!1478207))

(assert (= (and b!1478207 res!1003346) b!1478205))

(assert (= (and b!1478205 res!1003340) b!1478212))

(assert (= (and b!1478212 (not res!1003341)) b!1478210))

(assert (= (and b!1478210 res!1003333) b!1478203))

(declare-fun m!1364161 () Bool)

(assert (=> b!1478213 m!1364161))

(assert (=> b!1478213 m!1364161))

(declare-fun m!1364163 () Bool)

(assert (=> b!1478213 m!1364163))

(assert (=> b!1478213 m!1364163))

(assert (=> b!1478213 m!1364161))

(declare-fun m!1364165 () Bool)

(assert (=> b!1478213 m!1364165))

(declare-fun m!1364167 () Bool)

(assert (=> start!126408 m!1364167))

(declare-fun m!1364169 () Bool)

(assert (=> start!126408 m!1364169))

(declare-fun m!1364171 () Bool)

(assert (=> b!1478214 m!1364171))

(assert (=> b!1478214 m!1364171))

(declare-fun m!1364173 () Bool)

(assert (=> b!1478214 m!1364173))

(declare-fun m!1364175 () Bool)

(assert (=> b!1478214 m!1364175))

(declare-fun m!1364177 () Bool)

(assert (=> b!1478214 m!1364177))

(declare-fun m!1364179 () Bool)

(assert (=> b!1478205 m!1364179))

(declare-fun m!1364181 () Bool)

(assert (=> b!1478205 m!1364181))

(assert (=> b!1478205 m!1364161))

(declare-fun m!1364183 () Bool)

(assert (=> b!1478205 m!1364183))

(declare-fun m!1364185 () Bool)

(assert (=> b!1478205 m!1364185))

(assert (=> b!1478205 m!1364161))

(declare-fun m!1364187 () Bool)

(assert (=> b!1478212 m!1364187))

(assert (=> b!1478212 m!1364175))

(declare-fun m!1364189 () Bool)

(assert (=> b!1478212 m!1364189))

(assert (=> b!1478212 m!1364161))

(declare-fun m!1364191 () Bool)

(assert (=> b!1478201 m!1364191))

(assert (=> b!1478201 m!1364191))

(declare-fun m!1364193 () Bool)

(assert (=> b!1478201 m!1364193))

(assert (=> b!1478210 m!1364161))

(assert (=> b!1478210 m!1364161))

(declare-fun m!1364195 () Bool)

(assert (=> b!1478210 m!1364195))

(assert (=> b!1478215 m!1364175))

(declare-fun m!1364197 () Bool)

(assert (=> b!1478215 m!1364197))

(declare-fun m!1364199 () Bool)

(assert (=> b!1478198 m!1364199))

(declare-fun m!1364201 () Bool)

(assert (=> b!1478198 m!1364201))

(declare-fun m!1364203 () Bool)

(assert (=> b!1478204 m!1364203))

(assert (=> b!1478200 m!1364161))

(assert (=> b!1478200 m!1364161))

(declare-fun m!1364205 () Bool)

(assert (=> b!1478200 m!1364205))

(assert (=> b!1478199 m!1364161))

(assert (=> b!1478199 m!1364161))

(declare-fun m!1364207 () Bool)

(assert (=> b!1478199 m!1364207))

(declare-fun m!1364209 () Bool)

(assert (=> b!1478208 m!1364209))

(declare-fun m!1364211 () Bool)

(assert (=> b!1478202 m!1364211))

(check-sat (not b!1478199) (not b!1478201) (not b!1478198) (not b!1478200) (not b!1478202) (not b!1478205) (not b!1478214) (not b!1478204) (not start!126408) (not b!1478213) (not b!1478208) (not b!1478210))
(check-sat)
