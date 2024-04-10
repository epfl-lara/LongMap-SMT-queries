; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125388 () Bool)

(assert start!125388)

(declare-fun b!1466277 () Bool)

(declare-fun res!995022 () Bool)

(declare-fun e!823795 () Bool)

(assert (=> b!1466277 (=> (not res!995022) (not e!823795))))

(declare-fun e!823792 () Bool)

(assert (=> b!1466277 (= res!995022 e!823792)))

(declare-fun c!135143 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1466277 (= c!135143 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1466278 () Bool)

(declare-fun res!995017 () Bool)

(declare-fun e!823794 () Bool)

(assert (=> b!1466278 (=> (not res!995017) (not e!823794))))

(declare-datatypes ((array!98836 0))(
  ( (array!98837 (arr!47706 (Array (_ BitVec 32) (_ BitVec 64))) (size!48256 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98836)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98836 (_ BitVec 32)) Bool)

(assert (=> b!1466278 (= res!995017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1466279 () Bool)

(declare-fun e!823789 () Bool)

(declare-fun e!823791 () Bool)

(assert (=> b!1466279 (= e!823789 e!823791)))

(declare-fun res!995024 () Bool)

(assert (=> b!1466279 (=> (not res!995024) (not e!823791))))

(declare-datatypes ((SeekEntryResult!11958 0))(
  ( (MissingZero!11958 (index!50224 (_ BitVec 32))) (Found!11958 (index!50225 (_ BitVec 32))) (Intermediate!11958 (undefined!12770 Bool) (index!50226 (_ BitVec 32)) (x!131799 (_ BitVec 32))) (Undefined!11958) (MissingVacant!11958 (index!50227 (_ BitVec 32))) )
))
(declare-fun lt!641696 () SeekEntryResult!11958)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98836 (_ BitVec 32)) SeekEntryResult!11958)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466279 (= res!995024 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47706 a!2862) j!93) mask!2687) (select (arr!47706 a!2862) j!93) a!2862 mask!2687) lt!641696))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1466279 (= lt!641696 (Intermediate!11958 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1466280 () Bool)

(assert (=> b!1466280 (= e!823794 e!823789)))

(declare-fun res!995025 () Bool)

(assert (=> b!1466280 (=> (not res!995025) (not e!823789))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1466280 (= res!995025 (= (select (store (arr!47706 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!641698 () array!98836)

(assert (=> b!1466280 (= lt!641698 (array!98837 (store (arr!47706 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48256 a!2862)))))

(declare-fun b!1466281 () Bool)

(declare-fun e!823790 () Bool)

(assert (=> b!1466281 (= e!823790 true)))

(declare-fun lt!641697 () (_ BitVec 64))

(declare-fun lt!641700 () SeekEntryResult!11958)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98836 (_ BitVec 32)) SeekEntryResult!11958)

(assert (=> b!1466281 (= lt!641700 (seekEntryOrOpen!0 lt!641697 lt!641698 mask!2687))))

(declare-datatypes ((Unit!49412 0))(
  ( (Unit!49413) )
))
(declare-fun lt!641694 () Unit!49412)

(declare-fun lt!641693 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98836 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49412)

(assert (=> b!1466281 (= lt!641694 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641693 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1466282 () Bool)

(assert (=> b!1466282 (= e!823791 e!823795)))

(declare-fun res!995023 () Bool)

(assert (=> b!1466282 (=> (not res!995023) (not e!823795))))

(declare-fun lt!641699 () SeekEntryResult!11958)

(assert (=> b!1466282 (= res!995023 (= lt!641699 (Intermediate!11958 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1466282 (= lt!641699 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641697 mask!2687) lt!641697 lt!641698 mask!2687))))

(assert (=> b!1466282 (= lt!641697 (select (store (arr!47706 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1466283 () Bool)

(assert (=> b!1466283 (= e!823792 (= lt!641699 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641697 lt!641698 mask!2687)))))

(declare-fun e!823788 () Bool)

(declare-fun b!1466284 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98836 (_ BitVec 32)) SeekEntryResult!11958)

(assert (=> b!1466284 (= e!823788 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641693 intermediateAfterIndex!19 lt!641697 lt!641698 mask!2687) (seekEntryOrOpen!0 lt!641697 lt!641698 mask!2687))))))

(declare-fun res!995016 () Bool)

(assert (=> start!125388 (=> (not res!995016) (not e!823794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125388 (= res!995016 (validMask!0 mask!2687))))

(assert (=> start!125388 e!823794))

(assert (=> start!125388 true))

(declare-fun array_inv!36734 (array!98836) Bool)

(assert (=> start!125388 (array_inv!36734 a!2862)))

(declare-fun b!1466285 () Bool)

(declare-fun e!823793 () Bool)

(assert (=> b!1466285 (= e!823793 e!823790)))

(declare-fun res!995014 () Bool)

(assert (=> b!1466285 (=> res!995014 e!823790)))

(assert (=> b!1466285 (= res!995014 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641693 #b00000000000000000000000000000000) (bvsge lt!641693 (size!48256 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466285 (= lt!641693 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1466286 () Bool)

(declare-fun res!995018 () Bool)

(assert (=> b!1466286 (=> (not res!995018) (not e!823795))))

(assert (=> b!1466286 (= res!995018 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1466287 () Bool)

(declare-fun res!995027 () Bool)

(assert (=> b!1466287 (=> (not res!995027) (not e!823794))))

(assert (=> b!1466287 (= res!995027 (and (= (size!48256 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48256 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48256 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1466288 () Bool)

(assert (=> b!1466288 (= e!823795 (not e!823793))))

(declare-fun res!995015 () Bool)

(assert (=> b!1466288 (=> res!995015 e!823793)))

(assert (=> b!1466288 (= res!995015 (or (and (= (select (arr!47706 a!2862) index!646) (select (store (arr!47706 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47706 a!2862) index!646) (select (arr!47706 a!2862) j!93))) (= (select (arr!47706 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1466288 (and (= lt!641700 (Found!11958 j!93)) (or (= (select (arr!47706 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47706 a!2862) intermediateBeforeIndex!19) (select (arr!47706 a!2862) j!93))))))

(assert (=> b!1466288 (= lt!641700 (seekEntryOrOpen!0 (select (arr!47706 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1466288 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!641695 () Unit!49412)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98836 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49412)

(assert (=> b!1466288 (= lt!641695 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1466289 () Bool)

(declare-fun res!995021 () Bool)

(assert (=> b!1466289 (=> (not res!995021) (not e!823794))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1466289 (= res!995021 (validKeyInArray!0 (select (arr!47706 a!2862) i!1006)))))

(declare-fun b!1466290 () Bool)

(declare-fun res!995013 () Bool)

(assert (=> b!1466290 (=> res!995013 e!823790)))

(assert (=> b!1466290 (= res!995013 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1466291 () Bool)

(declare-fun res!995026 () Bool)

(assert (=> b!1466291 (=> res!995026 e!823790)))

(assert (=> b!1466291 (= res!995026 e!823788)))

(declare-fun c!135144 () Bool)

(assert (=> b!1466291 (= c!135144 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1466292 () Bool)

(declare-fun res!995020 () Bool)

(assert (=> b!1466292 (=> (not res!995020) (not e!823794))))

(assert (=> b!1466292 (= res!995020 (validKeyInArray!0 (select (arr!47706 a!2862) j!93)))))

(declare-fun b!1466293 () Bool)

(assert (=> b!1466293 (= e!823788 (not (= lt!641699 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641693 lt!641697 lt!641698 mask!2687))))))

(declare-fun b!1466294 () Bool)

(declare-fun res!995028 () Bool)

(assert (=> b!1466294 (=> (not res!995028) (not e!823794))))

(declare-datatypes ((List!34207 0))(
  ( (Nil!34204) (Cons!34203 (h!35553 (_ BitVec 64)) (t!48901 List!34207)) )
))
(declare-fun arrayNoDuplicates!0 (array!98836 (_ BitVec 32) List!34207) Bool)

(assert (=> b!1466294 (= res!995028 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34204))))

(declare-fun b!1466295 () Bool)

(declare-fun res!995012 () Bool)

(assert (=> b!1466295 (=> res!995012 e!823790)))

(assert (=> b!1466295 (= res!995012 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641693 (select (arr!47706 a!2862) j!93) a!2862 mask!2687) lt!641696)))))

(declare-fun b!1466296 () Bool)

(declare-fun res!995029 () Bool)

(assert (=> b!1466296 (=> (not res!995029) (not e!823791))))

(assert (=> b!1466296 (= res!995029 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47706 a!2862) j!93) a!2862 mask!2687) lt!641696))))

(declare-fun b!1466297 () Bool)

(assert (=> b!1466297 (= e!823792 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641697 lt!641698 mask!2687) (seekEntryOrOpen!0 lt!641697 lt!641698 mask!2687)))))

(declare-fun b!1466298 () Bool)

(declare-fun res!995019 () Bool)

(assert (=> b!1466298 (=> (not res!995019) (not e!823794))))

(assert (=> b!1466298 (= res!995019 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48256 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48256 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48256 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!125388 res!995016) b!1466287))

(assert (= (and b!1466287 res!995027) b!1466289))

(assert (= (and b!1466289 res!995021) b!1466292))

(assert (= (and b!1466292 res!995020) b!1466278))

(assert (= (and b!1466278 res!995017) b!1466294))

(assert (= (and b!1466294 res!995028) b!1466298))

(assert (= (and b!1466298 res!995019) b!1466280))

(assert (= (and b!1466280 res!995025) b!1466279))

(assert (= (and b!1466279 res!995024) b!1466296))

(assert (= (and b!1466296 res!995029) b!1466282))

(assert (= (and b!1466282 res!995023) b!1466277))

(assert (= (and b!1466277 c!135143) b!1466283))

(assert (= (and b!1466277 (not c!135143)) b!1466297))

(assert (= (and b!1466277 res!995022) b!1466286))

(assert (= (and b!1466286 res!995018) b!1466288))

(assert (= (and b!1466288 (not res!995015)) b!1466285))

(assert (= (and b!1466285 (not res!995014)) b!1466295))

(assert (= (and b!1466295 (not res!995012)) b!1466291))

(assert (= (and b!1466291 c!135144) b!1466293))

(assert (= (and b!1466291 (not c!135144)) b!1466284))

(assert (= (and b!1466291 (not res!995026)) b!1466290))

(assert (= (and b!1466290 (not res!995013)) b!1466281))

(declare-fun m!1353283 () Bool)

(assert (=> b!1466282 m!1353283))

(assert (=> b!1466282 m!1353283))

(declare-fun m!1353285 () Bool)

(assert (=> b!1466282 m!1353285))

(declare-fun m!1353287 () Bool)

(assert (=> b!1466282 m!1353287))

(declare-fun m!1353289 () Bool)

(assert (=> b!1466282 m!1353289))

(declare-fun m!1353291 () Bool)

(assert (=> b!1466281 m!1353291))

(declare-fun m!1353293 () Bool)

(assert (=> b!1466281 m!1353293))

(declare-fun m!1353295 () Bool)

(assert (=> b!1466283 m!1353295))

(declare-fun m!1353297 () Bool)

(assert (=> b!1466293 m!1353297))

(declare-fun m!1353299 () Bool)

(assert (=> b!1466295 m!1353299))

(assert (=> b!1466295 m!1353299))

(declare-fun m!1353301 () Bool)

(assert (=> b!1466295 m!1353301))

(declare-fun m!1353303 () Bool)

(assert (=> start!125388 m!1353303))

(declare-fun m!1353305 () Bool)

(assert (=> start!125388 m!1353305))

(declare-fun m!1353307 () Bool)

(assert (=> b!1466285 m!1353307))

(declare-fun m!1353309 () Bool)

(assert (=> b!1466284 m!1353309))

(assert (=> b!1466284 m!1353291))

(assert (=> b!1466280 m!1353287))

(declare-fun m!1353311 () Bool)

(assert (=> b!1466280 m!1353311))

(declare-fun m!1353313 () Bool)

(assert (=> b!1466289 m!1353313))

(assert (=> b!1466289 m!1353313))

(declare-fun m!1353315 () Bool)

(assert (=> b!1466289 m!1353315))

(assert (=> b!1466292 m!1353299))

(assert (=> b!1466292 m!1353299))

(declare-fun m!1353317 () Bool)

(assert (=> b!1466292 m!1353317))

(assert (=> b!1466296 m!1353299))

(assert (=> b!1466296 m!1353299))

(declare-fun m!1353319 () Bool)

(assert (=> b!1466296 m!1353319))

(declare-fun m!1353321 () Bool)

(assert (=> b!1466278 m!1353321))

(declare-fun m!1353323 () Bool)

(assert (=> b!1466297 m!1353323))

(assert (=> b!1466297 m!1353291))

(declare-fun m!1353325 () Bool)

(assert (=> b!1466294 m!1353325))

(declare-fun m!1353327 () Bool)

(assert (=> b!1466288 m!1353327))

(assert (=> b!1466288 m!1353287))

(declare-fun m!1353329 () Bool)

(assert (=> b!1466288 m!1353329))

(declare-fun m!1353331 () Bool)

(assert (=> b!1466288 m!1353331))

(declare-fun m!1353333 () Bool)

(assert (=> b!1466288 m!1353333))

(assert (=> b!1466288 m!1353299))

(declare-fun m!1353335 () Bool)

(assert (=> b!1466288 m!1353335))

(declare-fun m!1353337 () Bool)

(assert (=> b!1466288 m!1353337))

(assert (=> b!1466288 m!1353299))

(assert (=> b!1466279 m!1353299))

(assert (=> b!1466279 m!1353299))

(declare-fun m!1353339 () Bool)

(assert (=> b!1466279 m!1353339))

(assert (=> b!1466279 m!1353339))

(assert (=> b!1466279 m!1353299))

(declare-fun m!1353341 () Bool)

(assert (=> b!1466279 m!1353341))

(check-sat (not b!1466282) (not b!1466285) (not b!1466283) (not b!1466296) (not b!1466293) (not b!1466288) (not b!1466278) (not b!1466292) (not start!125388) (not b!1466294) (not b!1466289) (not b!1466297) (not b!1466279) (not b!1466281) (not b!1466284) (not b!1466295))
(check-sat)
