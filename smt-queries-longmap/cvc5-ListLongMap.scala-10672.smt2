; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125170 () Bool)

(assert start!125170)

(declare-fun b!1459254 () Bool)

(declare-fun res!989234 () Bool)

(declare-fun e!820688 () Bool)

(assert (=> b!1459254 (=> (not res!989234) (not e!820688))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98618 0))(
  ( (array!98619 (arr!47597 (Array (_ BitVec 32) (_ BitVec 64))) (size!48147 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98618)

(assert (=> b!1459254 (= res!989234 (and (= (size!48147 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48147 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48147 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1459255 () Bool)

(declare-fun res!989232 () Bool)

(declare-fun e!820685 () Bool)

(assert (=> b!1459255 (=> (not res!989232) (not e!820685))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11849 0))(
  ( (MissingZero!11849 (index!49788 (_ BitVec 32))) (Found!11849 (index!49789 (_ BitVec 32))) (Intermediate!11849 (undefined!12661 Bool) (index!49790 (_ BitVec 32)) (x!131402 (_ BitVec 32))) (Undefined!11849) (MissingVacant!11849 (index!49791 (_ BitVec 32))) )
))
(declare-fun lt!639369 () SeekEntryResult!11849)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98618 (_ BitVec 32)) SeekEntryResult!11849)

(assert (=> b!1459255 (= res!989232 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47597 a!2862) j!93) a!2862 mask!2687) lt!639369))))

(declare-fun b!1459256 () Bool)

(declare-fun res!989242 () Bool)

(declare-fun e!820689 () Bool)

(assert (=> b!1459256 (=> res!989242 e!820689)))

(declare-fun e!820687 () Bool)

(assert (=> b!1459256 (= res!989242 e!820687)))

(declare-fun c!134526 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1459256 (= c!134526 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1459257 () Bool)

(declare-fun res!989236 () Bool)

(assert (=> b!1459257 (=> res!989236 e!820689)))

(declare-fun lt!639367 () (_ BitVec 32))

(assert (=> b!1459257 (= res!989236 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639367 (select (arr!47597 a!2862) j!93) a!2862 mask!2687) lt!639369)))))

(declare-fun b!1459258 () Bool)

(assert (=> b!1459258 (= e!820689 true)))

(declare-fun lt!639372 () SeekEntryResult!11849)

(declare-fun lt!639373 () SeekEntryResult!11849)

(assert (=> b!1459258 (= lt!639372 lt!639373)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((Unit!49194 0))(
  ( (Unit!49195) )
))
(declare-fun lt!639375 () Unit!49194)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98618 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49194)

(assert (=> b!1459258 (= lt!639375 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639367 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1459259 () Bool)

(declare-fun e!820691 () Bool)

(assert (=> b!1459259 (= e!820685 e!820691)))

(declare-fun res!989231 () Bool)

(assert (=> b!1459259 (=> (not res!989231) (not e!820691))))

(declare-fun lt!639374 () SeekEntryResult!11849)

(assert (=> b!1459259 (= res!989231 (= lt!639374 (Intermediate!11849 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!639368 () array!98618)

(declare-fun lt!639371 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459259 (= lt!639374 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639371 mask!2687) lt!639371 lt!639368 mask!2687))))

(assert (=> b!1459259 (= lt!639371 (select (store (arr!47597 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1459260 () Bool)

(declare-fun e!820690 () Bool)

(assert (=> b!1459260 (= e!820691 (not e!820690))))

(declare-fun res!989237 () Bool)

(assert (=> b!1459260 (=> res!989237 e!820690)))

(assert (=> b!1459260 (= res!989237 (or (and (= (select (arr!47597 a!2862) index!646) (select (store (arr!47597 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47597 a!2862) index!646) (select (arr!47597 a!2862) j!93))) (= (select (arr!47597 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1459260 (and (= lt!639372 (Found!11849 j!93)) (or (= (select (arr!47597 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47597 a!2862) intermediateBeforeIndex!19) (select (arr!47597 a!2862) j!93))) (let ((bdg!53497 (select (store (arr!47597 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47597 a!2862) index!646) bdg!53497) (= (select (arr!47597 a!2862) index!646) (select (arr!47597 a!2862) j!93))) (= (select (arr!47597 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53497 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98618 (_ BitVec 32)) SeekEntryResult!11849)

(assert (=> b!1459260 (= lt!639372 (seekEntryOrOpen!0 (select (arr!47597 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98618 (_ BitVec 32)) Bool)

(assert (=> b!1459260 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!639370 () Unit!49194)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98618 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49194)

(assert (=> b!1459260 (= lt!639370 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1459262 () Bool)

(declare-fun e!820683 () Bool)

(assert (=> b!1459262 (= e!820683 e!820685)))

(declare-fun res!989226 () Bool)

(assert (=> b!1459262 (=> (not res!989226) (not e!820685))))

(assert (=> b!1459262 (= res!989226 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47597 a!2862) j!93) mask!2687) (select (arr!47597 a!2862) j!93) a!2862 mask!2687) lt!639369))))

(assert (=> b!1459262 (= lt!639369 (Intermediate!11849 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1459263 () Bool)

(declare-fun res!989228 () Bool)

(assert (=> b!1459263 (=> (not res!989228) (not e!820688))))

(declare-datatypes ((List!34098 0))(
  ( (Nil!34095) (Cons!34094 (h!35444 (_ BitVec 64)) (t!48792 List!34098)) )
))
(declare-fun arrayNoDuplicates!0 (array!98618 (_ BitVec 32) List!34098) Bool)

(assert (=> b!1459263 (= res!989228 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34095))))

(declare-fun b!1459264 () Bool)

(declare-fun res!989240 () Bool)

(assert (=> b!1459264 (=> (not res!989240) (not e!820688))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1459264 (= res!989240 (validKeyInArray!0 (select (arr!47597 a!2862) i!1006)))))

(declare-fun b!1459265 () Bool)

(declare-fun res!989229 () Bool)

(assert (=> b!1459265 (=> res!989229 e!820689)))

(assert (=> b!1459265 (= res!989229 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun e!820684 () Bool)

(declare-fun b!1459266 () Bool)

(assert (=> b!1459266 (= e!820684 (= lt!639374 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639371 lt!639368 mask!2687)))))

(declare-fun b!1459267 () Bool)

(declare-fun res!989233 () Bool)

(assert (=> b!1459267 (=> (not res!989233) (not e!820691))))

(assert (=> b!1459267 (= res!989233 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1459268 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98618 (_ BitVec 32)) SeekEntryResult!11849)

(assert (=> b!1459268 (= e!820684 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639371 lt!639368 mask!2687) (seekEntryOrOpen!0 lt!639371 lt!639368 mask!2687)))))

(declare-fun b!1459269 () Bool)

(declare-fun res!989225 () Bool)

(assert (=> b!1459269 (=> (not res!989225) (not e!820688))))

(assert (=> b!1459269 (= res!989225 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48147 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48147 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48147 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1459270 () Bool)

(declare-fun res!989230 () Bool)

(assert (=> b!1459270 (=> (not res!989230) (not e!820688))))

(assert (=> b!1459270 (= res!989230 (validKeyInArray!0 (select (arr!47597 a!2862) j!93)))))

(declare-fun b!1459271 () Bool)

(declare-fun res!989238 () Bool)

(assert (=> b!1459271 (=> (not res!989238) (not e!820691))))

(assert (=> b!1459271 (= res!989238 e!820684)))

(declare-fun c!134525 () Bool)

(assert (=> b!1459271 (= c!134525 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1459261 () Bool)

(assert (=> b!1459261 (= e!820688 e!820683)))

(declare-fun res!989227 () Bool)

(assert (=> b!1459261 (=> (not res!989227) (not e!820683))))

(assert (=> b!1459261 (= res!989227 (= (select (store (arr!47597 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1459261 (= lt!639368 (array!98619 (store (arr!47597 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48147 a!2862)))))

(declare-fun res!989241 () Bool)

(assert (=> start!125170 (=> (not res!989241) (not e!820688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125170 (= res!989241 (validMask!0 mask!2687))))

(assert (=> start!125170 e!820688))

(assert (=> start!125170 true))

(declare-fun array_inv!36625 (array!98618) Bool)

(assert (=> start!125170 (array_inv!36625 a!2862)))

(declare-fun b!1459272 () Bool)

(assert (=> b!1459272 (= e!820690 e!820689)))

(declare-fun res!989235 () Bool)

(assert (=> b!1459272 (=> res!989235 e!820689)))

(assert (=> b!1459272 (= res!989235 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639367 #b00000000000000000000000000000000) (bvsge lt!639367 (size!48147 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459272 (= lt!639367 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1459272 (= lt!639373 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639371 lt!639368 mask!2687))))

(assert (=> b!1459272 (= lt!639373 (seekEntryOrOpen!0 lt!639371 lt!639368 mask!2687))))

(declare-fun b!1459273 () Bool)

(assert (=> b!1459273 (= e!820687 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639367 intermediateAfterIndex!19 lt!639371 lt!639368 mask!2687) lt!639373)))))

(declare-fun b!1459274 () Bool)

(declare-fun res!989239 () Bool)

(assert (=> b!1459274 (=> (not res!989239) (not e!820688))))

(assert (=> b!1459274 (= res!989239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1459275 () Bool)

(assert (=> b!1459275 (= e!820687 (not (= lt!639374 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639367 lt!639371 lt!639368 mask!2687))))))

(assert (= (and start!125170 res!989241) b!1459254))

(assert (= (and b!1459254 res!989234) b!1459264))

(assert (= (and b!1459264 res!989240) b!1459270))

(assert (= (and b!1459270 res!989230) b!1459274))

(assert (= (and b!1459274 res!989239) b!1459263))

(assert (= (and b!1459263 res!989228) b!1459269))

(assert (= (and b!1459269 res!989225) b!1459261))

(assert (= (and b!1459261 res!989227) b!1459262))

(assert (= (and b!1459262 res!989226) b!1459255))

(assert (= (and b!1459255 res!989232) b!1459259))

(assert (= (and b!1459259 res!989231) b!1459271))

(assert (= (and b!1459271 c!134525) b!1459266))

(assert (= (and b!1459271 (not c!134525)) b!1459268))

(assert (= (and b!1459271 res!989238) b!1459267))

(assert (= (and b!1459267 res!989233) b!1459260))

(assert (= (and b!1459260 (not res!989237)) b!1459272))

(assert (= (and b!1459272 (not res!989235)) b!1459257))

(assert (= (and b!1459257 (not res!989236)) b!1459256))

(assert (= (and b!1459256 c!134526) b!1459275))

(assert (= (and b!1459256 (not c!134526)) b!1459273))

(assert (= (and b!1459256 (not res!989242)) b!1459265))

(assert (= (and b!1459265 (not res!989229)) b!1459258))

(declare-fun m!1347031 () Bool)

(assert (=> start!125170 m!1347031))

(declare-fun m!1347033 () Bool)

(assert (=> start!125170 m!1347033))

(declare-fun m!1347035 () Bool)

(assert (=> b!1459257 m!1347035))

(assert (=> b!1459257 m!1347035))

(declare-fun m!1347037 () Bool)

(assert (=> b!1459257 m!1347037))

(declare-fun m!1347039 () Bool)

(assert (=> b!1459266 m!1347039))

(declare-fun m!1347041 () Bool)

(assert (=> b!1459273 m!1347041))

(declare-fun m!1347043 () Bool)

(assert (=> b!1459272 m!1347043))

(declare-fun m!1347045 () Bool)

(assert (=> b!1459272 m!1347045))

(declare-fun m!1347047 () Bool)

(assert (=> b!1459272 m!1347047))

(declare-fun m!1347049 () Bool)

(assert (=> b!1459275 m!1347049))

(assert (=> b!1459255 m!1347035))

(assert (=> b!1459255 m!1347035))

(declare-fun m!1347051 () Bool)

(assert (=> b!1459255 m!1347051))

(declare-fun m!1347053 () Bool)

(assert (=> b!1459261 m!1347053))

(declare-fun m!1347055 () Bool)

(assert (=> b!1459261 m!1347055))

(assert (=> b!1459262 m!1347035))

(assert (=> b!1459262 m!1347035))

(declare-fun m!1347057 () Bool)

(assert (=> b!1459262 m!1347057))

(assert (=> b!1459262 m!1347057))

(assert (=> b!1459262 m!1347035))

(declare-fun m!1347059 () Bool)

(assert (=> b!1459262 m!1347059))

(declare-fun m!1347061 () Bool)

(assert (=> b!1459264 m!1347061))

(assert (=> b!1459264 m!1347061))

(declare-fun m!1347063 () Bool)

(assert (=> b!1459264 m!1347063))

(declare-fun m!1347065 () Bool)

(assert (=> b!1459260 m!1347065))

(assert (=> b!1459260 m!1347053))

(declare-fun m!1347067 () Bool)

(assert (=> b!1459260 m!1347067))

(declare-fun m!1347069 () Bool)

(assert (=> b!1459260 m!1347069))

(declare-fun m!1347071 () Bool)

(assert (=> b!1459260 m!1347071))

(assert (=> b!1459260 m!1347035))

(declare-fun m!1347073 () Bool)

(assert (=> b!1459260 m!1347073))

(declare-fun m!1347075 () Bool)

(assert (=> b!1459260 m!1347075))

(assert (=> b!1459260 m!1347035))

(declare-fun m!1347077 () Bool)

(assert (=> b!1459259 m!1347077))

(assert (=> b!1459259 m!1347077))

(declare-fun m!1347079 () Bool)

(assert (=> b!1459259 m!1347079))

(assert (=> b!1459259 m!1347053))

(declare-fun m!1347081 () Bool)

(assert (=> b!1459259 m!1347081))

(declare-fun m!1347083 () Bool)

(assert (=> b!1459258 m!1347083))

(declare-fun m!1347085 () Bool)

(assert (=> b!1459263 m!1347085))

(assert (=> b!1459270 m!1347035))

(assert (=> b!1459270 m!1347035))

(declare-fun m!1347087 () Bool)

(assert (=> b!1459270 m!1347087))

(declare-fun m!1347089 () Bool)

(assert (=> b!1459274 m!1347089))

(assert (=> b!1459268 m!1347045))

(assert (=> b!1459268 m!1347047))

(push 1)

