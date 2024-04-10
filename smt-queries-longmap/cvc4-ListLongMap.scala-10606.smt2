; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124778 () Bool)

(assert start!124778)

(declare-fun b!1447401 () Bool)

(declare-fun e!815169 () Bool)

(declare-fun e!815171 () Bool)

(assert (=> b!1447401 (= e!815169 e!815171)))

(declare-fun res!979059 () Bool)

(assert (=> b!1447401 (=> res!979059 e!815171)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98226 0))(
  ( (array!98227 (arr!47401 (Array (_ BitVec 32) (_ BitVec 64))) (size!47951 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98226)

(assert (=> b!1447401 (= res!979059 (or (and (= (select (arr!47401 a!2862) index!646) (select (store (arr!47401 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47401 a!2862) index!646) (select (arr!47401 a!2862) j!93))) (not (= (select (arr!47401 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1447402 () Bool)

(declare-fun e!815174 () Bool)

(declare-fun e!815165 () Bool)

(assert (=> b!1447402 (= e!815174 e!815165)))

(declare-fun res!979068 () Bool)

(assert (=> b!1447402 (=> (not res!979068) (not e!815165))))

(declare-datatypes ((SeekEntryResult!11653 0))(
  ( (MissingZero!11653 (index!49004 (_ BitVec 32))) (Found!11653 (index!49005 (_ BitVec 32))) (Intermediate!11653 (undefined!12465 Bool) (index!49006 (_ BitVec 32)) (x!130678 (_ BitVec 32))) (Undefined!11653) (MissingVacant!11653 (index!49007 (_ BitVec 32))) )
))
(declare-fun lt!635152 () SeekEntryResult!11653)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1447402 (= res!979068 (= lt!635152 (Intermediate!11653 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!635150 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!635153 () array!98226)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98226 (_ BitVec 32)) SeekEntryResult!11653)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447402 (= lt!635152 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635150 mask!2687) lt!635150 lt!635153 mask!2687))))

(assert (=> b!1447402 (= lt!635150 (select (store (arr!47401 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1447403 () Bool)

(declare-fun res!979056 () Bool)

(assert (=> b!1447403 (=> (not res!979056) (not e!815174))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!635151 () SeekEntryResult!11653)

(assert (=> b!1447403 (= res!979056 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47401 a!2862) j!93) a!2862 mask!2687) lt!635151))))

(declare-fun b!1447404 () Bool)

(declare-fun res!979057 () Bool)

(declare-fun e!815166 () Bool)

(assert (=> b!1447404 (=> (not res!979057) (not e!815166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98226 (_ BitVec 32)) Bool)

(assert (=> b!1447404 (= res!979057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447405 () Bool)

(declare-fun e!815172 () Bool)

(assert (=> b!1447405 (= e!815172 (= lt!635152 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635150 lt!635153 mask!2687)))))

(declare-fun b!1447406 () Bool)

(declare-fun e!815167 () Bool)

(assert (=> b!1447406 (= e!815166 e!815167)))

(declare-fun res!979072 () Bool)

(assert (=> b!1447406 (=> (not res!979072) (not e!815167))))

(assert (=> b!1447406 (= res!979072 (= (select (store (arr!47401 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1447406 (= lt!635153 (array!98227 (store (arr!47401 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47951 a!2862)))))

(declare-fun b!1447407 () Bool)

(declare-fun res!979063 () Bool)

(assert (=> b!1447407 (=> (not res!979063) (not e!815166))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447407 (= res!979063 (validKeyInArray!0 (select (arr!47401 a!2862) j!93)))))

(declare-fun b!1447408 () Bool)

(declare-fun e!815170 () Bool)

(assert (=> b!1447408 (= e!815170 true)))

(declare-fun lt!635148 () SeekEntryResult!11653)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98226 (_ BitVec 32)) SeekEntryResult!11653)

(assert (=> b!1447408 (= lt!635148 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47401 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1447410 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun e!815173 () Bool)

(assert (=> b!1447410 (= e!815173 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1447411 () Bool)

(declare-fun res!979066 () Bool)

(assert (=> b!1447411 (=> (not res!979066) (not e!815166))))

(assert (=> b!1447411 (= res!979066 (validKeyInArray!0 (select (arr!47401 a!2862) i!1006)))))

(declare-fun b!1447412 () Bool)

(assert (=> b!1447412 (= e!815167 e!815174)))

(declare-fun res!979065 () Bool)

(assert (=> b!1447412 (=> (not res!979065) (not e!815174))))

(assert (=> b!1447412 (= res!979065 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47401 a!2862) j!93) mask!2687) (select (arr!47401 a!2862) j!93) a!2862 mask!2687) lt!635151))))

(assert (=> b!1447412 (= lt!635151 (Intermediate!11653 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1447413 () Bool)

(declare-fun res!979061 () Bool)

(assert (=> b!1447413 (=> (not res!979061) (not e!815166))))

(assert (=> b!1447413 (= res!979061 (and (= (size!47951 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47951 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47951 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1447414 () Bool)

(declare-fun res!979064 () Bool)

(assert (=> b!1447414 (=> (not res!979064) (not e!815165))))

(assert (=> b!1447414 (= res!979064 e!815172)))

(declare-fun c!133683 () Bool)

(assert (=> b!1447414 (= c!133683 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447415 () Bool)

(assert (=> b!1447415 (= e!815165 (not e!815170))))

(declare-fun res!979069 () Bool)

(assert (=> b!1447415 (=> res!979069 e!815170)))

(assert (=> b!1447415 (= res!979069 (or (and (= (select (arr!47401 a!2862) index!646) (select (store (arr!47401 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47401 a!2862) index!646) (select (arr!47401 a!2862) j!93))) (not (= (select (arr!47401 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47401 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1447415 e!815169))

(declare-fun res!979070 () Bool)

(assert (=> b!1447415 (=> (not res!979070) (not e!815169))))

(declare-fun lt!635149 () SeekEntryResult!11653)

(assert (=> b!1447415 (= res!979070 (and (= lt!635149 (Found!11653 j!93)) (or (= (select (arr!47401 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47401 a!2862) intermediateBeforeIndex!19) (select (arr!47401 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98226 (_ BitVec 32)) SeekEntryResult!11653)

(assert (=> b!1447415 (= lt!635149 (seekEntryOrOpen!0 (select (arr!47401 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1447415 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48802 0))(
  ( (Unit!48803) )
))
(declare-fun lt!635154 () Unit!48802)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98226 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48802)

(assert (=> b!1447415 (= lt!635154 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447416 () Bool)

(assert (=> b!1447416 (= e!815171 e!815173)))

(declare-fun res!979058 () Bool)

(assert (=> b!1447416 (=> (not res!979058) (not e!815173))))

(assert (=> b!1447416 (= res!979058 (= lt!635149 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47401 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1447417 () Bool)

(assert (=> b!1447417 (= e!815172 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635150 lt!635153 mask!2687) (seekEntryOrOpen!0 lt!635150 lt!635153 mask!2687)))))

(declare-fun b!1447418 () Bool)

(declare-fun res!979071 () Bool)

(assert (=> b!1447418 (=> (not res!979071) (not e!815165))))

(assert (=> b!1447418 (= res!979071 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447419 () Bool)

(declare-fun res!979062 () Bool)

(assert (=> b!1447419 (=> (not res!979062) (not e!815166))))

(assert (=> b!1447419 (= res!979062 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47951 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47951 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47951 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1447409 () Bool)

(declare-fun res!979067 () Bool)

(assert (=> b!1447409 (=> (not res!979067) (not e!815166))))

(declare-datatypes ((List!33902 0))(
  ( (Nil!33899) (Cons!33898 (h!35248 (_ BitVec 64)) (t!48596 List!33902)) )
))
(declare-fun arrayNoDuplicates!0 (array!98226 (_ BitVec 32) List!33902) Bool)

(assert (=> b!1447409 (= res!979067 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33899))))

(declare-fun res!979060 () Bool)

(assert (=> start!124778 (=> (not res!979060) (not e!815166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124778 (= res!979060 (validMask!0 mask!2687))))

(assert (=> start!124778 e!815166))

(assert (=> start!124778 true))

(declare-fun array_inv!36429 (array!98226) Bool)

(assert (=> start!124778 (array_inv!36429 a!2862)))

(assert (= (and start!124778 res!979060) b!1447413))

(assert (= (and b!1447413 res!979061) b!1447411))

(assert (= (and b!1447411 res!979066) b!1447407))

(assert (= (and b!1447407 res!979063) b!1447404))

(assert (= (and b!1447404 res!979057) b!1447409))

(assert (= (and b!1447409 res!979067) b!1447419))

(assert (= (and b!1447419 res!979062) b!1447406))

(assert (= (and b!1447406 res!979072) b!1447412))

(assert (= (and b!1447412 res!979065) b!1447403))

(assert (= (and b!1447403 res!979056) b!1447402))

(assert (= (and b!1447402 res!979068) b!1447414))

(assert (= (and b!1447414 c!133683) b!1447405))

(assert (= (and b!1447414 (not c!133683)) b!1447417))

(assert (= (and b!1447414 res!979064) b!1447418))

(assert (= (and b!1447418 res!979071) b!1447415))

(assert (= (and b!1447415 res!979070) b!1447401))

(assert (= (and b!1447401 (not res!979059)) b!1447416))

(assert (= (and b!1447416 res!979058) b!1447410))

(assert (= (and b!1447415 (not res!979069)) b!1447408))

(declare-fun m!1336219 () Bool)

(assert (=> start!124778 m!1336219))

(declare-fun m!1336221 () Bool)

(assert (=> start!124778 m!1336221))

(declare-fun m!1336223 () Bool)

(assert (=> b!1447408 m!1336223))

(assert (=> b!1447408 m!1336223))

(declare-fun m!1336225 () Bool)

(assert (=> b!1447408 m!1336225))

(declare-fun m!1336227 () Bool)

(assert (=> b!1447401 m!1336227))

(declare-fun m!1336229 () Bool)

(assert (=> b!1447401 m!1336229))

(declare-fun m!1336231 () Bool)

(assert (=> b!1447401 m!1336231))

(assert (=> b!1447401 m!1336223))

(declare-fun m!1336233 () Bool)

(assert (=> b!1447402 m!1336233))

(assert (=> b!1447402 m!1336233))

(declare-fun m!1336235 () Bool)

(assert (=> b!1447402 m!1336235))

(assert (=> b!1447402 m!1336229))

(declare-fun m!1336237 () Bool)

(assert (=> b!1447402 m!1336237))

(declare-fun m!1336239 () Bool)

(assert (=> b!1447417 m!1336239))

(declare-fun m!1336241 () Bool)

(assert (=> b!1447417 m!1336241))

(assert (=> b!1447407 m!1336223))

(assert (=> b!1447407 m!1336223))

(declare-fun m!1336243 () Bool)

(assert (=> b!1447407 m!1336243))

(declare-fun m!1336245 () Bool)

(assert (=> b!1447409 m!1336245))

(assert (=> b!1447416 m!1336223))

(assert (=> b!1447416 m!1336223))

(declare-fun m!1336247 () Bool)

(assert (=> b!1447416 m!1336247))

(declare-fun m!1336249 () Bool)

(assert (=> b!1447415 m!1336249))

(assert (=> b!1447415 m!1336229))

(declare-fun m!1336251 () Bool)

(assert (=> b!1447415 m!1336251))

(assert (=> b!1447415 m!1336231))

(assert (=> b!1447415 m!1336227))

(assert (=> b!1447415 m!1336223))

(declare-fun m!1336253 () Bool)

(assert (=> b!1447415 m!1336253))

(declare-fun m!1336255 () Bool)

(assert (=> b!1447415 m!1336255))

(assert (=> b!1447415 m!1336223))

(declare-fun m!1336257 () Bool)

(assert (=> b!1447404 m!1336257))

(declare-fun m!1336259 () Bool)

(assert (=> b!1447411 m!1336259))

(assert (=> b!1447411 m!1336259))

(declare-fun m!1336261 () Bool)

(assert (=> b!1447411 m!1336261))

(assert (=> b!1447406 m!1336229))

(declare-fun m!1336263 () Bool)

(assert (=> b!1447406 m!1336263))

(assert (=> b!1447403 m!1336223))

(assert (=> b!1447403 m!1336223))

(declare-fun m!1336265 () Bool)

(assert (=> b!1447403 m!1336265))

(assert (=> b!1447412 m!1336223))

(assert (=> b!1447412 m!1336223))

(declare-fun m!1336267 () Bool)

(assert (=> b!1447412 m!1336267))

(assert (=> b!1447412 m!1336267))

(assert (=> b!1447412 m!1336223))

(declare-fun m!1336269 () Bool)

(assert (=> b!1447412 m!1336269))

(declare-fun m!1336271 () Bool)

(assert (=> b!1447405 m!1336271))

(push 1)

