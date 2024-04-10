; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124780 () Bool)

(assert start!124780)

(declare-fun b!1447458 () Bool)

(declare-fun res!979108 () Bool)

(declare-fun e!815196 () Bool)

(assert (=> b!1447458 (=> (not res!979108) (not e!815196))))

(declare-datatypes ((array!98228 0))(
  ( (array!98229 (arr!47402 (Array (_ BitVec 32) (_ BitVec 64))) (size!47952 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98228)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98228 (_ BitVec 32)) Bool)

(assert (=> b!1447458 (= res!979108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447459 () Bool)

(declare-fun res!979117 () Bool)

(assert (=> b!1447459 (=> (not res!979117) (not e!815196))))

(declare-datatypes ((List!33903 0))(
  ( (Nil!33900) (Cons!33899 (h!35249 (_ BitVec 64)) (t!48597 List!33903)) )
))
(declare-fun arrayNoDuplicates!0 (array!98228 (_ BitVec 32) List!33903) Bool)

(assert (=> b!1447459 (= res!979117 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33900))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!815201 () Bool)

(declare-fun b!1447460 () Bool)

(declare-fun lt!635169 () (_ BitVec 64))

(declare-fun lt!635171 () array!98228)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11654 0))(
  ( (MissingZero!11654 (index!49008 (_ BitVec 32))) (Found!11654 (index!49009 (_ BitVec 32))) (Intermediate!11654 (undefined!12466 Bool) (index!49010 (_ BitVec 32)) (x!130687 (_ BitVec 32))) (Undefined!11654) (MissingVacant!11654 (index!49011 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98228 (_ BitVec 32)) SeekEntryResult!11654)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98228 (_ BitVec 32)) SeekEntryResult!11654)

(assert (=> b!1447460 (= e!815201 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635169 lt!635171 mask!2687) (seekEntryOrOpen!0 lt!635169 lt!635171 mask!2687)))))

(declare-fun b!1447462 () Bool)

(declare-fun e!815202 () Bool)

(declare-fun e!815197 () Bool)

(assert (=> b!1447462 (= e!815202 e!815197)))

(declare-fun res!979115 () Bool)

(assert (=> b!1447462 (=> (not res!979115) (not e!815197))))

(declare-fun lt!635170 () SeekEntryResult!11654)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98228 (_ BitVec 32)) SeekEntryResult!11654)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447462 (= res!979115 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47402 a!2862) j!93) mask!2687) (select (arr!47402 a!2862) j!93) a!2862 mask!2687) lt!635170))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1447462 (= lt!635170 (Intermediate!11654 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1447463 () Bool)

(declare-fun e!815195 () Bool)

(declare-fun e!815199 () Bool)

(assert (=> b!1447463 (= e!815195 e!815199)))

(declare-fun res!979112 () Bool)

(assert (=> b!1447463 (=> res!979112 e!815199)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1447463 (= res!979112 (or (and (= (select (arr!47402 a!2862) index!646) (select (store (arr!47402 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47402 a!2862) index!646) (select (arr!47402 a!2862) j!93))) (not (= (select (arr!47402 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1447464 () Bool)

(declare-fun e!815203 () Bool)

(assert (=> b!1447464 (= e!815203 true)))

(declare-fun lt!635172 () SeekEntryResult!11654)

(assert (=> b!1447464 (= lt!635172 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47402 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1447465 () Bool)

(declare-fun e!815204 () Bool)

(assert (=> b!1447465 (= e!815204 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1447466 () Bool)

(assert (=> b!1447466 (= e!815199 e!815204)))

(declare-fun res!979119 () Bool)

(assert (=> b!1447466 (=> (not res!979119) (not e!815204))))

(declare-fun lt!635175 () SeekEntryResult!11654)

(assert (=> b!1447466 (= res!979119 (= lt!635175 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47402 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1447467 () Bool)

(declare-fun res!979123 () Bool)

(assert (=> b!1447467 (=> (not res!979123) (not e!815196))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447467 (= res!979123 (validKeyInArray!0 (select (arr!47402 a!2862) i!1006)))))

(declare-fun b!1447468 () Bool)

(assert (=> b!1447468 (= e!815196 e!815202)))

(declare-fun res!979118 () Bool)

(assert (=> b!1447468 (=> (not res!979118) (not e!815202))))

(assert (=> b!1447468 (= res!979118 (= (select (store (arr!47402 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1447468 (= lt!635171 (array!98229 (store (arr!47402 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47952 a!2862)))))

(declare-fun b!1447469 () Bool)

(declare-fun res!979109 () Bool)

(declare-fun e!815200 () Bool)

(assert (=> b!1447469 (=> (not res!979109) (not e!815200))))

(assert (=> b!1447469 (= res!979109 e!815201)))

(declare-fun c!133686 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1447469 (= c!133686 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447470 () Bool)

(assert (=> b!1447470 (= e!815200 (not e!815203))))

(declare-fun res!979122 () Bool)

(assert (=> b!1447470 (=> res!979122 e!815203)))

(assert (=> b!1447470 (= res!979122 (or (and (= (select (arr!47402 a!2862) index!646) (select (store (arr!47402 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47402 a!2862) index!646) (select (arr!47402 a!2862) j!93))) (not (= (select (arr!47402 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47402 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1447470 e!815195))

(declare-fun res!979111 () Bool)

(assert (=> b!1447470 (=> (not res!979111) (not e!815195))))

(assert (=> b!1447470 (= res!979111 (and (= lt!635175 (Found!11654 j!93)) (or (= (select (arr!47402 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47402 a!2862) intermediateBeforeIndex!19) (select (arr!47402 a!2862) j!93)))))))

(assert (=> b!1447470 (= lt!635175 (seekEntryOrOpen!0 (select (arr!47402 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1447470 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48804 0))(
  ( (Unit!48805) )
))
(declare-fun lt!635173 () Unit!48804)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98228 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48804)

(assert (=> b!1447470 (= lt!635173 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447471 () Bool)

(declare-fun res!979116 () Bool)

(assert (=> b!1447471 (=> (not res!979116) (not e!815197))))

(assert (=> b!1447471 (= res!979116 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47402 a!2862) j!93) a!2862 mask!2687) lt!635170))))

(declare-fun b!1447472 () Bool)

(assert (=> b!1447472 (= e!815197 e!815200)))

(declare-fun res!979120 () Bool)

(assert (=> b!1447472 (=> (not res!979120) (not e!815200))))

(declare-fun lt!635174 () SeekEntryResult!11654)

(assert (=> b!1447472 (= res!979120 (= lt!635174 (Intermediate!11654 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1447472 (= lt!635174 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635169 mask!2687) lt!635169 lt!635171 mask!2687))))

(assert (=> b!1447472 (= lt!635169 (select (store (arr!47402 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!979113 () Bool)

(assert (=> start!124780 (=> (not res!979113) (not e!815196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124780 (= res!979113 (validMask!0 mask!2687))))

(assert (=> start!124780 e!815196))

(assert (=> start!124780 true))

(declare-fun array_inv!36430 (array!98228) Bool)

(assert (=> start!124780 (array_inv!36430 a!2862)))

(declare-fun b!1447461 () Bool)

(declare-fun res!979121 () Bool)

(assert (=> b!1447461 (=> (not res!979121) (not e!815196))))

(assert (=> b!1447461 (= res!979121 (and (= (size!47952 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47952 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47952 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1447473 () Bool)

(declare-fun res!979114 () Bool)

(assert (=> b!1447473 (=> (not res!979114) (not e!815200))))

(assert (=> b!1447473 (= res!979114 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447474 () Bool)

(assert (=> b!1447474 (= e!815201 (= lt!635174 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635169 lt!635171 mask!2687)))))

(declare-fun b!1447475 () Bool)

(declare-fun res!979107 () Bool)

(assert (=> b!1447475 (=> (not res!979107) (not e!815196))))

(assert (=> b!1447475 (= res!979107 (validKeyInArray!0 (select (arr!47402 a!2862) j!93)))))

(declare-fun b!1447476 () Bool)

(declare-fun res!979110 () Bool)

(assert (=> b!1447476 (=> (not res!979110) (not e!815196))))

(assert (=> b!1447476 (= res!979110 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47952 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47952 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47952 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!124780 res!979113) b!1447461))

(assert (= (and b!1447461 res!979121) b!1447467))

(assert (= (and b!1447467 res!979123) b!1447475))

(assert (= (and b!1447475 res!979107) b!1447458))

(assert (= (and b!1447458 res!979108) b!1447459))

(assert (= (and b!1447459 res!979117) b!1447476))

(assert (= (and b!1447476 res!979110) b!1447468))

(assert (= (and b!1447468 res!979118) b!1447462))

(assert (= (and b!1447462 res!979115) b!1447471))

(assert (= (and b!1447471 res!979116) b!1447472))

(assert (= (and b!1447472 res!979120) b!1447469))

(assert (= (and b!1447469 c!133686) b!1447474))

(assert (= (and b!1447469 (not c!133686)) b!1447460))

(assert (= (and b!1447469 res!979109) b!1447473))

(assert (= (and b!1447473 res!979114) b!1447470))

(assert (= (and b!1447470 res!979111) b!1447463))

(assert (= (and b!1447463 (not res!979112)) b!1447466))

(assert (= (and b!1447466 res!979119) b!1447465))

(assert (= (and b!1447470 (not res!979122)) b!1447464))

(declare-fun m!1336273 () Bool)

(assert (=> b!1447470 m!1336273))

(declare-fun m!1336275 () Bool)

(assert (=> b!1447470 m!1336275))

(declare-fun m!1336277 () Bool)

(assert (=> b!1447470 m!1336277))

(declare-fun m!1336279 () Bool)

(assert (=> b!1447470 m!1336279))

(declare-fun m!1336281 () Bool)

(assert (=> b!1447470 m!1336281))

(declare-fun m!1336283 () Bool)

(assert (=> b!1447470 m!1336283))

(declare-fun m!1336285 () Bool)

(assert (=> b!1447470 m!1336285))

(declare-fun m!1336287 () Bool)

(assert (=> b!1447470 m!1336287))

(assert (=> b!1447470 m!1336283))

(declare-fun m!1336289 () Bool)

(assert (=> start!124780 m!1336289))

(declare-fun m!1336291 () Bool)

(assert (=> start!124780 m!1336291))

(assert (=> b!1447468 m!1336275))

(declare-fun m!1336293 () Bool)

(assert (=> b!1447468 m!1336293))

(declare-fun m!1336295 () Bool)

(assert (=> b!1447460 m!1336295))

(declare-fun m!1336297 () Bool)

(assert (=> b!1447460 m!1336297))

(assert (=> b!1447475 m!1336283))

(assert (=> b!1447475 m!1336283))

(declare-fun m!1336299 () Bool)

(assert (=> b!1447475 m!1336299))

(assert (=> b!1447471 m!1336283))

(assert (=> b!1447471 m!1336283))

(declare-fun m!1336301 () Bool)

(assert (=> b!1447471 m!1336301))

(assert (=> b!1447463 m!1336281))

(assert (=> b!1447463 m!1336275))

(assert (=> b!1447463 m!1336279))

(assert (=> b!1447463 m!1336283))

(assert (=> b!1447466 m!1336283))

(assert (=> b!1447466 m!1336283))

(declare-fun m!1336303 () Bool)

(assert (=> b!1447466 m!1336303))

(declare-fun m!1336305 () Bool)

(assert (=> b!1447459 m!1336305))

(assert (=> b!1447462 m!1336283))

(assert (=> b!1447462 m!1336283))

(declare-fun m!1336307 () Bool)

(assert (=> b!1447462 m!1336307))

(assert (=> b!1447462 m!1336307))

(assert (=> b!1447462 m!1336283))

(declare-fun m!1336309 () Bool)

(assert (=> b!1447462 m!1336309))

(declare-fun m!1336311 () Bool)

(assert (=> b!1447467 m!1336311))

(assert (=> b!1447467 m!1336311))

(declare-fun m!1336313 () Bool)

(assert (=> b!1447467 m!1336313))

(assert (=> b!1447464 m!1336283))

(assert (=> b!1447464 m!1336283))

(declare-fun m!1336315 () Bool)

(assert (=> b!1447464 m!1336315))

(declare-fun m!1336317 () Bool)

(assert (=> b!1447474 m!1336317))

(declare-fun m!1336319 () Bool)

(assert (=> b!1447458 m!1336319))

(declare-fun m!1336321 () Bool)

(assert (=> b!1447472 m!1336321))

(assert (=> b!1447472 m!1336321))

(declare-fun m!1336323 () Bool)

(assert (=> b!1447472 m!1336323))

(assert (=> b!1447472 m!1336275))

(declare-fun m!1336325 () Bool)

(assert (=> b!1447472 m!1336325))

(push 1)

