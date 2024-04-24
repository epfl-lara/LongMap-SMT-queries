; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124980 () Bool)

(assert start!124980)

(declare-fun b!1448272 () Bool)

(declare-fun res!979165 () Bool)

(declare-fun e!815768 () Bool)

(assert (=> b!1448272 (=> (not res!979165) (not e!815768))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1448272 (= res!979165 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448273 () Bool)

(declare-fun e!815772 () Bool)

(declare-fun e!815766 () Bool)

(assert (=> b!1448273 (= e!815772 e!815766)))

(declare-fun res!979160 () Bool)

(assert (=> b!1448273 (=> res!979160 e!815766)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!98323 0))(
  ( (array!98324 (arr!47446 (Array (_ BitVec 32) (_ BitVec 64))) (size!47997 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98323)

(assert (=> b!1448273 (= res!979160 (or (and (= (select (arr!47446 a!2862) index!646) (select (store (arr!47446 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47446 a!2862) index!646) (select (arr!47446 a!2862) j!93))) (not (= (select (arr!47446 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!635462 () array!98323)

(declare-fun e!815767 () Bool)

(declare-fun lt!635464 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11595 0))(
  ( (MissingZero!11595 (index!48772 (_ BitVec 32))) (Found!11595 (index!48773 (_ BitVec 32))) (Intermediate!11595 (undefined!12407 Bool) (index!48774 (_ BitVec 32)) (x!130628 (_ BitVec 32))) (Undefined!11595) (MissingVacant!11595 (index!48775 (_ BitVec 32))) )
))
(declare-fun lt!635461 () SeekEntryResult!11595)

(declare-fun b!1448274 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98323 (_ BitVec 32)) SeekEntryResult!11595)

(assert (=> b!1448274 (= e!815767 (= lt!635461 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635464 lt!635462 mask!2687)))))

(declare-fun b!1448275 () Bool)

(declare-fun e!815770 () Bool)

(assert (=> b!1448275 (= e!815770 e!815768)))

(declare-fun res!979157 () Bool)

(assert (=> b!1448275 (=> (not res!979157) (not e!815768))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1448275 (= res!979157 (= lt!635461 (Intermediate!11595 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448275 (= lt!635461 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635464 mask!2687) lt!635464 lt!635462 mask!2687))))

(assert (=> b!1448275 (= lt!635464 (select (store (arr!47446 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448276 () Bool)

(declare-fun e!815769 () Bool)

(assert (=> b!1448276 (= e!815769 true)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!635463 () SeekEntryResult!11595)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98323 (_ BitVec 32)) SeekEntryResult!11595)

(assert (=> b!1448276 (= lt!635463 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47446 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1448277 () Bool)

(declare-fun res!979152 () Bool)

(assert (=> b!1448277 (=> (not res!979152) (not e!815770))))

(declare-fun lt!635458 () SeekEntryResult!11595)

(assert (=> b!1448277 (= res!979152 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47446 a!2862) j!93) a!2862 mask!2687) lt!635458))))

(declare-fun b!1448278 () Bool)

(declare-fun res!979166 () Bool)

(declare-fun e!815764 () Bool)

(assert (=> b!1448278 (=> (not res!979166) (not e!815764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448278 (= res!979166 (validKeyInArray!0 (select (arr!47446 a!2862) j!93)))))

(declare-fun b!1448279 () Bool)

(declare-fun e!815763 () Bool)

(assert (=> b!1448279 (= e!815766 e!815763)))

(declare-fun res!979155 () Bool)

(assert (=> b!1448279 (=> (not res!979155) (not e!815763))))

(declare-fun lt!635459 () SeekEntryResult!11595)

(assert (=> b!1448279 (= res!979155 (= lt!635459 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47446 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448281 () Bool)

(declare-fun res!979159 () Bool)

(assert (=> b!1448281 (=> (not res!979159) (not e!815764))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98323 (_ BitVec 32)) Bool)

(assert (=> b!1448281 (= res!979159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1448282 () Bool)

(assert (=> b!1448282 (= e!815768 (not e!815769))))

(declare-fun res!979158 () Bool)

(assert (=> b!1448282 (=> res!979158 e!815769)))

(assert (=> b!1448282 (= res!979158 (or (and (= (select (arr!47446 a!2862) index!646) (select (store (arr!47446 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47446 a!2862) index!646) (select (arr!47446 a!2862) j!93))) (not (= (select (arr!47446 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47446 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1448282 e!815772))

(declare-fun res!979153 () Bool)

(assert (=> b!1448282 (=> (not res!979153) (not e!815772))))

(assert (=> b!1448282 (= res!979153 (and (= lt!635459 (Found!11595 j!93)) (or (= (select (arr!47446 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47446 a!2862) intermediateBeforeIndex!19) (select (arr!47446 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98323 (_ BitVec 32)) SeekEntryResult!11595)

(assert (=> b!1448282 (= lt!635459 (seekEntryOrOpen!0 (select (arr!47446 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1448282 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48719 0))(
  ( (Unit!48720) )
))
(declare-fun lt!635460 () Unit!48719)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98323 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48719)

(assert (=> b!1448282 (= lt!635460 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1448283 () Bool)

(assert (=> b!1448283 (= e!815767 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635464 lt!635462 mask!2687) (seekEntryOrOpen!0 lt!635464 lt!635462 mask!2687)))))

(declare-fun b!1448284 () Bool)

(declare-fun res!979156 () Bool)

(assert (=> b!1448284 (=> (not res!979156) (not e!815764))))

(assert (=> b!1448284 (= res!979156 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47997 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47997 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47997 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1448285 () Bool)

(assert (=> b!1448285 (= e!815763 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1448286 () Bool)

(declare-fun res!979150 () Bool)

(assert (=> b!1448286 (=> (not res!979150) (not e!815764))))

(declare-datatypes ((List!33934 0))(
  ( (Nil!33931) (Cons!33930 (h!35291 (_ BitVec 64)) (t!48620 List!33934)) )
))
(declare-fun arrayNoDuplicates!0 (array!98323 (_ BitVec 32) List!33934) Bool)

(assert (=> b!1448286 (= res!979150 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33931))))

(declare-fun b!1448287 () Bool)

(declare-fun res!979161 () Bool)

(assert (=> b!1448287 (=> (not res!979161) (not e!815768))))

(assert (=> b!1448287 (= res!979161 e!815767)))

(declare-fun c!134080 () Bool)

(assert (=> b!1448287 (= c!134080 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1448288 () Bool)

(declare-fun e!815771 () Bool)

(assert (=> b!1448288 (= e!815764 e!815771)))

(declare-fun res!979162 () Bool)

(assert (=> b!1448288 (=> (not res!979162) (not e!815771))))

(assert (=> b!1448288 (= res!979162 (= (select (store (arr!47446 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1448288 (= lt!635462 (array!98324 (store (arr!47446 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47997 a!2862)))))

(declare-fun res!979163 () Bool)

(assert (=> start!124980 (=> (not res!979163) (not e!815764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124980 (= res!979163 (validMask!0 mask!2687))))

(assert (=> start!124980 e!815764))

(assert (=> start!124980 true))

(declare-fun array_inv!36727 (array!98323) Bool)

(assert (=> start!124980 (array_inv!36727 a!2862)))

(declare-fun b!1448280 () Bool)

(assert (=> b!1448280 (= e!815771 e!815770)))

(declare-fun res!979154 () Bool)

(assert (=> b!1448280 (=> (not res!979154) (not e!815770))))

(assert (=> b!1448280 (= res!979154 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47446 a!2862) j!93) mask!2687) (select (arr!47446 a!2862) j!93) a!2862 mask!2687) lt!635458))))

(assert (=> b!1448280 (= lt!635458 (Intermediate!11595 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1448289 () Bool)

(declare-fun res!979151 () Bool)

(assert (=> b!1448289 (=> (not res!979151) (not e!815764))))

(assert (=> b!1448289 (= res!979151 (validKeyInArray!0 (select (arr!47446 a!2862) i!1006)))))

(declare-fun b!1448290 () Bool)

(declare-fun res!979164 () Bool)

(assert (=> b!1448290 (=> (not res!979164) (not e!815764))))

(assert (=> b!1448290 (= res!979164 (and (= (size!47997 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47997 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47997 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124980 res!979163) b!1448290))

(assert (= (and b!1448290 res!979164) b!1448289))

(assert (= (and b!1448289 res!979151) b!1448278))

(assert (= (and b!1448278 res!979166) b!1448281))

(assert (= (and b!1448281 res!979159) b!1448286))

(assert (= (and b!1448286 res!979150) b!1448284))

(assert (= (and b!1448284 res!979156) b!1448288))

(assert (= (and b!1448288 res!979162) b!1448280))

(assert (= (and b!1448280 res!979154) b!1448277))

(assert (= (and b!1448277 res!979152) b!1448275))

(assert (= (and b!1448275 res!979157) b!1448287))

(assert (= (and b!1448287 c!134080) b!1448274))

(assert (= (and b!1448287 (not c!134080)) b!1448283))

(assert (= (and b!1448287 res!979161) b!1448272))

(assert (= (and b!1448272 res!979165) b!1448282))

(assert (= (and b!1448282 res!979153) b!1448273))

(assert (= (and b!1448273 (not res!979160)) b!1448279))

(assert (= (and b!1448279 res!979155) b!1448285))

(assert (= (and b!1448282 (not res!979158)) b!1448276))

(declare-fun m!1337227 () Bool)

(assert (=> b!1448279 m!1337227))

(assert (=> b!1448279 m!1337227))

(declare-fun m!1337229 () Bool)

(assert (=> b!1448279 m!1337229))

(declare-fun m!1337231 () Bool)

(assert (=> b!1448282 m!1337231))

(declare-fun m!1337233 () Bool)

(assert (=> b!1448282 m!1337233))

(declare-fun m!1337235 () Bool)

(assert (=> b!1448282 m!1337235))

(declare-fun m!1337237 () Bool)

(assert (=> b!1448282 m!1337237))

(declare-fun m!1337239 () Bool)

(assert (=> b!1448282 m!1337239))

(assert (=> b!1448282 m!1337227))

(declare-fun m!1337241 () Bool)

(assert (=> b!1448282 m!1337241))

(declare-fun m!1337243 () Bool)

(assert (=> b!1448282 m!1337243))

(assert (=> b!1448282 m!1337227))

(declare-fun m!1337245 () Bool)

(assert (=> b!1448283 m!1337245))

(declare-fun m!1337247 () Bool)

(assert (=> b!1448283 m!1337247))

(assert (=> b!1448276 m!1337227))

(assert (=> b!1448276 m!1337227))

(declare-fun m!1337249 () Bool)

(assert (=> b!1448276 m!1337249))

(assert (=> b!1448288 m!1337233))

(declare-fun m!1337251 () Bool)

(assert (=> b!1448288 m!1337251))

(declare-fun m!1337253 () Bool)

(assert (=> b!1448289 m!1337253))

(assert (=> b!1448289 m!1337253))

(declare-fun m!1337255 () Bool)

(assert (=> b!1448289 m!1337255))

(declare-fun m!1337257 () Bool)

(assert (=> start!124980 m!1337257))

(declare-fun m!1337259 () Bool)

(assert (=> start!124980 m!1337259))

(declare-fun m!1337261 () Bool)

(assert (=> b!1448286 m!1337261))

(assert (=> b!1448280 m!1337227))

(assert (=> b!1448280 m!1337227))

(declare-fun m!1337263 () Bool)

(assert (=> b!1448280 m!1337263))

(assert (=> b!1448280 m!1337263))

(assert (=> b!1448280 m!1337227))

(declare-fun m!1337265 () Bool)

(assert (=> b!1448280 m!1337265))

(assert (=> b!1448277 m!1337227))

(assert (=> b!1448277 m!1337227))

(declare-fun m!1337267 () Bool)

(assert (=> b!1448277 m!1337267))

(assert (=> b!1448273 m!1337239))

(assert (=> b!1448273 m!1337233))

(assert (=> b!1448273 m!1337237))

(assert (=> b!1448273 m!1337227))

(declare-fun m!1337269 () Bool)

(assert (=> b!1448274 m!1337269))

(assert (=> b!1448278 m!1337227))

(assert (=> b!1448278 m!1337227))

(declare-fun m!1337271 () Bool)

(assert (=> b!1448278 m!1337271))

(declare-fun m!1337273 () Bool)

(assert (=> b!1448281 m!1337273))

(declare-fun m!1337275 () Bool)

(assert (=> b!1448275 m!1337275))

(assert (=> b!1448275 m!1337275))

(declare-fun m!1337277 () Bool)

(assert (=> b!1448275 m!1337277))

(assert (=> b!1448275 m!1337233))

(declare-fun m!1337279 () Bool)

(assert (=> b!1448275 m!1337279))

(check-sat (not b!1448275) (not b!1448274) (not start!124980) (not b!1448281) (not b!1448277) (not b!1448286) (not b!1448289) (not b!1448280) (not b!1448278) (not b!1448276) (not b!1448279) (not b!1448282) (not b!1448283))
(check-sat)
