; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125172 () Bool)

(assert start!125172)

(declare-fun b!1459320 () Bool)

(declare-fun res!989292 () Bool)

(declare-fun e!820716 () Bool)

(assert (=> b!1459320 (=> (not res!989292) (not e!820716))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98620 0))(
  ( (array!98621 (arr!47598 (Array (_ BitVec 32) (_ BitVec 64))) (size!48148 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98620)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1459320 (= res!989292 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48148 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48148 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48148 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!989281 () Bool)

(assert (=> start!125172 (=> (not res!989281) (not e!820716))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125172 (= res!989281 (validMask!0 mask!2687))))

(assert (=> start!125172 e!820716))

(assert (=> start!125172 true))

(declare-fun array_inv!36626 (array!98620) Bool)

(assert (=> start!125172 (array_inv!36626 a!2862)))

(declare-fun b!1459321 () Bool)

(declare-fun res!989290 () Bool)

(declare-fun e!820718 () Bool)

(assert (=> b!1459321 (=> res!989290 e!820718)))

(declare-fun e!820713 () Bool)

(assert (=> b!1459321 (= res!989290 e!820713)))

(declare-fun c!134532 () Bool)

(assert (=> b!1459321 (= c!134532 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1459322 () Bool)

(declare-fun e!820717 () Bool)

(assert (=> b!1459322 (= e!820717 e!820718)))

(declare-fun res!989286 () Bool)

(assert (=> b!1459322 (=> res!989286 e!820718)))

(declare-fun lt!639396 () (_ BitVec 32))

(assert (=> b!1459322 (= res!989286 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639396 #b00000000000000000000000000000000) (bvsge lt!639396 (size!48148 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459322 (= lt!639396 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!639394 () array!98620)

(declare-datatypes ((SeekEntryResult!11850 0))(
  ( (MissingZero!11850 (index!49792 (_ BitVec 32))) (Found!11850 (index!49793 (_ BitVec 32))) (Intermediate!11850 (undefined!12662 Bool) (index!49794 (_ BitVec 32)) (x!131403 (_ BitVec 32))) (Undefined!11850) (MissingVacant!11850 (index!49795 (_ BitVec 32))) )
))
(declare-fun lt!639397 () SeekEntryResult!11850)

(declare-fun lt!639398 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98620 (_ BitVec 32)) SeekEntryResult!11850)

(assert (=> b!1459322 (= lt!639397 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639398 lt!639394 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98620 (_ BitVec 32)) SeekEntryResult!11850)

(assert (=> b!1459322 (= lt!639397 (seekEntryOrOpen!0 lt!639398 lt!639394 mask!2687))))

(declare-fun b!1459323 () Bool)

(declare-fun res!989279 () Bool)

(assert (=> b!1459323 (=> (not res!989279) (not e!820716))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1459323 (= res!989279 (and (= (size!48148 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48148 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48148 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1459324 () Bool)

(declare-fun e!820712 () Bool)

(declare-fun e!820714 () Bool)

(assert (=> b!1459324 (= e!820712 e!820714)))

(declare-fun res!989294 () Bool)

(assert (=> b!1459324 (=> (not res!989294) (not e!820714))))

(declare-fun lt!639395 () SeekEntryResult!11850)

(assert (=> b!1459324 (= res!989294 (= lt!639395 (Intermediate!11850 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98620 (_ BitVec 32)) SeekEntryResult!11850)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459324 (= lt!639395 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639398 mask!2687) lt!639398 lt!639394 mask!2687))))

(assert (=> b!1459324 (= lt!639398 (select (store (arr!47598 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1459325 () Bool)

(declare-fun res!989280 () Bool)

(assert (=> b!1459325 (=> (not res!989280) (not e!820714))))

(declare-fun e!820710 () Bool)

(assert (=> b!1459325 (= res!989280 e!820710)))

(declare-fun c!134531 () Bool)

(assert (=> b!1459325 (= c!134531 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1459326 () Bool)

(declare-fun res!989282 () Bool)

(assert (=> b!1459326 (=> (not res!989282) (not e!820714))))

(assert (=> b!1459326 (= res!989282 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1459327 () Bool)

(assert (=> b!1459327 (= e!820710 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639398 lt!639394 mask!2687) (seekEntryOrOpen!0 lt!639398 lt!639394 mask!2687)))))

(declare-fun b!1459328 () Bool)

(declare-fun res!989296 () Bool)

(assert (=> b!1459328 (=> (not res!989296) (not e!820716))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1459328 (= res!989296 (validKeyInArray!0 (select (arr!47598 a!2862) j!93)))))

(declare-fun b!1459329 () Bool)

(declare-fun res!989283 () Bool)

(assert (=> b!1459329 (=> (not res!989283) (not e!820712))))

(declare-fun lt!639402 () SeekEntryResult!11850)

(assert (=> b!1459329 (= res!989283 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47598 a!2862) j!93) a!2862 mask!2687) lt!639402))))

(declare-fun b!1459330 () Bool)

(declare-fun e!820711 () Bool)

(assert (=> b!1459330 (= e!820711 e!820712)))

(declare-fun res!989295 () Bool)

(assert (=> b!1459330 (=> (not res!989295) (not e!820712))))

(assert (=> b!1459330 (= res!989295 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47598 a!2862) j!93) mask!2687) (select (arr!47598 a!2862) j!93) a!2862 mask!2687) lt!639402))))

(assert (=> b!1459330 (= lt!639402 (Intermediate!11850 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1459331 () Bool)

(declare-fun res!989288 () Bool)

(assert (=> b!1459331 (=> (not res!989288) (not e!820716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98620 (_ BitVec 32)) Bool)

(assert (=> b!1459331 (= res!989288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1459332 () Bool)

(assert (=> b!1459332 (= e!820713 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639396 intermediateAfterIndex!19 lt!639398 lt!639394 mask!2687) lt!639397)))))

(declare-fun b!1459333 () Bool)

(assert (=> b!1459333 (= e!820713 (not (= lt!639395 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639396 lt!639398 lt!639394 mask!2687))))))

(declare-fun b!1459334 () Bool)

(assert (=> b!1459334 (= e!820710 (= lt!639395 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639398 lt!639394 mask!2687)))))

(declare-fun b!1459335 () Bool)

(declare-fun res!989289 () Bool)

(assert (=> b!1459335 (=> (not res!989289) (not e!820716))))

(assert (=> b!1459335 (= res!989289 (validKeyInArray!0 (select (arr!47598 a!2862) i!1006)))))

(declare-fun b!1459336 () Bool)

(assert (=> b!1459336 (= e!820716 e!820711)))

(declare-fun res!989285 () Bool)

(assert (=> b!1459336 (=> (not res!989285) (not e!820711))))

(assert (=> b!1459336 (= res!989285 (= (select (store (arr!47598 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1459336 (= lt!639394 (array!98621 (store (arr!47598 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48148 a!2862)))))

(declare-fun b!1459337 () Bool)

(declare-fun res!989291 () Bool)

(assert (=> b!1459337 (=> res!989291 e!820718)))

(assert (=> b!1459337 (= res!989291 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1459338 () Bool)

(assert (=> b!1459338 (= e!820714 (not e!820717))))

(declare-fun res!989293 () Bool)

(assert (=> b!1459338 (=> res!989293 e!820717)))

(assert (=> b!1459338 (= res!989293 (or (and (= (select (arr!47598 a!2862) index!646) (select (store (arr!47598 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47598 a!2862) index!646) (select (arr!47598 a!2862) j!93))) (= (select (arr!47598 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun lt!639400 () SeekEntryResult!11850)

(assert (=> b!1459338 (and (= lt!639400 (Found!11850 j!93)) (or (= (select (arr!47598 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47598 a!2862) intermediateBeforeIndex!19) (select (arr!47598 a!2862) j!93))) (let ((bdg!53499 (select (store (arr!47598 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47598 a!2862) index!646) bdg!53499) (= (select (arr!47598 a!2862) index!646) (select (arr!47598 a!2862) j!93))) (= (select (arr!47598 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53499 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1459338 (= lt!639400 (seekEntryOrOpen!0 (select (arr!47598 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1459338 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49196 0))(
  ( (Unit!49197) )
))
(declare-fun lt!639401 () Unit!49196)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98620 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49196)

(assert (=> b!1459338 (= lt!639401 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1459339 () Bool)

(assert (=> b!1459339 (= e!820718 true)))

(assert (=> b!1459339 (= lt!639400 lt!639397)))

(declare-fun lt!639399 () Unit!49196)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98620 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49196)

(assert (=> b!1459339 (= lt!639399 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639396 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1459340 () Bool)

(declare-fun res!989287 () Bool)

(assert (=> b!1459340 (=> (not res!989287) (not e!820716))))

(declare-datatypes ((List!34099 0))(
  ( (Nil!34096) (Cons!34095 (h!35445 (_ BitVec 64)) (t!48793 List!34099)) )
))
(declare-fun arrayNoDuplicates!0 (array!98620 (_ BitVec 32) List!34099) Bool)

(assert (=> b!1459340 (= res!989287 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34096))))

(declare-fun b!1459341 () Bool)

(declare-fun res!989284 () Bool)

(assert (=> b!1459341 (=> res!989284 e!820718)))

(assert (=> b!1459341 (= res!989284 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639396 (select (arr!47598 a!2862) j!93) a!2862 mask!2687) lt!639402)))))

(assert (= (and start!125172 res!989281) b!1459323))

(assert (= (and b!1459323 res!989279) b!1459335))

(assert (= (and b!1459335 res!989289) b!1459328))

(assert (= (and b!1459328 res!989296) b!1459331))

(assert (= (and b!1459331 res!989288) b!1459340))

(assert (= (and b!1459340 res!989287) b!1459320))

(assert (= (and b!1459320 res!989292) b!1459336))

(assert (= (and b!1459336 res!989285) b!1459330))

(assert (= (and b!1459330 res!989295) b!1459329))

(assert (= (and b!1459329 res!989283) b!1459324))

(assert (= (and b!1459324 res!989294) b!1459325))

(assert (= (and b!1459325 c!134531) b!1459334))

(assert (= (and b!1459325 (not c!134531)) b!1459327))

(assert (= (and b!1459325 res!989280) b!1459326))

(assert (= (and b!1459326 res!989282) b!1459338))

(assert (= (and b!1459338 (not res!989293)) b!1459322))

(assert (= (and b!1459322 (not res!989286)) b!1459341))

(assert (= (and b!1459341 (not res!989284)) b!1459321))

(assert (= (and b!1459321 c!134532) b!1459333))

(assert (= (and b!1459321 (not c!134532)) b!1459332))

(assert (= (and b!1459321 (not res!989290)) b!1459337))

(assert (= (and b!1459337 (not res!989291)) b!1459339))

(declare-fun m!1347091 () Bool)

(assert (=> b!1459329 m!1347091))

(assert (=> b!1459329 m!1347091))

(declare-fun m!1347093 () Bool)

(assert (=> b!1459329 m!1347093))

(declare-fun m!1347095 () Bool)

(assert (=> start!125172 m!1347095))

(declare-fun m!1347097 () Bool)

(assert (=> start!125172 m!1347097))

(declare-fun m!1347099 () Bool)

(assert (=> b!1459327 m!1347099))

(declare-fun m!1347101 () Bool)

(assert (=> b!1459327 m!1347101))

(declare-fun m!1347103 () Bool)

(assert (=> b!1459340 m!1347103))

(declare-fun m!1347105 () Bool)

(assert (=> b!1459339 m!1347105))

(declare-fun m!1347107 () Bool)

(assert (=> b!1459333 m!1347107))

(declare-fun m!1347109 () Bool)

(assert (=> b!1459334 m!1347109))

(assert (=> b!1459341 m!1347091))

(assert (=> b!1459341 m!1347091))

(declare-fun m!1347111 () Bool)

(assert (=> b!1459341 m!1347111))

(declare-fun m!1347113 () Bool)

(assert (=> b!1459336 m!1347113))

(declare-fun m!1347115 () Bool)

(assert (=> b!1459336 m!1347115))

(assert (=> b!1459330 m!1347091))

(assert (=> b!1459330 m!1347091))

(declare-fun m!1347117 () Bool)

(assert (=> b!1459330 m!1347117))

(assert (=> b!1459330 m!1347117))

(assert (=> b!1459330 m!1347091))

(declare-fun m!1347119 () Bool)

(assert (=> b!1459330 m!1347119))

(declare-fun m!1347121 () Bool)

(assert (=> b!1459332 m!1347121))

(declare-fun m!1347123 () Bool)

(assert (=> b!1459322 m!1347123))

(assert (=> b!1459322 m!1347099))

(assert (=> b!1459322 m!1347101))

(declare-fun m!1347125 () Bool)

(assert (=> b!1459335 m!1347125))

(assert (=> b!1459335 m!1347125))

(declare-fun m!1347127 () Bool)

(assert (=> b!1459335 m!1347127))

(assert (=> b!1459328 m!1347091))

(assert (=> b!1459328 m!1347091))

(declare-fun m!1347129 () Bool)

(assert (=> b!1459328 m!1347129))

(declare-fun m!1347131 () Bool)

(assert (=> b!1459338 m!1347131))

(assert (=> b!1459338 m!1347113))

(declare-fun m!1347133 () Bool)

(assert (=> b!1459338 m!1347133))

(declare-fun m!1347135 () Bool)

(assert (=> b!1459338 m!1347135))

(declare-fun m!1347137 () Bool)

(assert (=> b!1459338 m!1347137))

(assert (=> b!1459338 m!1347091))

(declare-fun m!1347139 () Bool)

(assert (=> b!1459338 m!1347139))

(declare-fun m!1347141 () Bool)

(assert (=> b!1459338 m!1347141))

(assert (=> b!1459338 m!1347091))

(declare-fun m!1347143 () Bool)

(assert (=> b!1459331 m!1347143))

(declare-fun m!1347145 () Bool)

(assert (=> b!1459324 m!1347145))

(assert (=> b!1459324 m!1347145))

(declare-fun m!1347147 () Bool)

(assert (=> b!1459324 m!1347147))

(assert (=> b!1459324 m!1347113))

(declare-fun m!1347149 () Bool)

(assert (=> b!1459324 m!1347149))

(check-sat (not b!1459340) (not b!1459322) (not b!1459329) (not b!1459335) (not b!1459328) (not b!1459327) (not b!1459334) (not b!1459324) (not b!1459333) (not b!1459341) (not b!1459330) (not b!1459338) (not b!1459339) (not b!1459332) (not b!1459331) (not start!125172))
(check-sat)
