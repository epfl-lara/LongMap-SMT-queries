; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127122 () Bool)

(assert start!127122)

(declare-fun b!1491172 () Bool)

(declare-fun e!835841 () Bool)

(declare-fun e!835844 () Bool)

(assert (=> b!1491172 (= e!835841 (not e!835844))))

(declare-fun res!1013520 () Bool)

(assert (=> b!1491172 (=> res!1013520 e!835844)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99733 0))(
  ( (array!99734 (arr!48133 (Array (_ BitVec 32) (_ BitVec 64))) (size!48684 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99733)

(assert (=> b!1491172 (= res!1013520 (or (and (= (select (arr!48133 a!2862) index!646) (select (store (arr!48133 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48133 a!2862) index!646) (select (arr!48133 a!2862) j!93))) (= (select (arr!48133 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12270 0))(
  ( (MissingZero!12270 (index!51472 (_ BitVec 32))) (Found!12270 (index!51473 (_ BitVec 32))) (Intermediate!12270 (undefined!13082 Bool) (index!51474 (_ BitVec 32)) (x!133255 (_ BitVec 32))) (Undefined!12270) (MissingVacant!12270 (index!51475 (_ BitVec 32))) )
))
(declare-fun lt!650204 () SeekEntryResult!12270)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1491172 (and (= lt!650204 (Found!12270 j!93)) (or (= (select (arr!48133 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48133 a!2862) intermediateBeforeIndex!19) (select (arr!48133 a!2862) j!93))) (let ((bdg!54723 (select (store (arr!48133 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48133 a!2862) index!646) bdg!54723) (= (select (arr!48133 a!2862) index!646) (select (arr!48133 a!2862) j!93))) (= (select (arr!48133 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54723 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99733 (_ BitVec 32)) SeekEntryResult!12270)

(assert (=> b!1491172 (= lt!650204 (seekEntryOrOpen!0 (select (arr!48133 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99733 (_ BitVec 32)) Bool)

(assert (=> b!1491172 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49913 0))(
  ( (Unit!49914) )
))
(declare-fun lt!650199 () Unit!49913)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49913)

(assert (=> b!1491172 (= lt!650199 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1013523 () Bool)

(declare-fun e!835845 () Bool)

(assert (=> start!127122 (=> (not res!1013523) (not e!835845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127122 (= res!1013523 (validMask!0 mask!2687))))

(assert (=> start!127122 e!835845))

(assert (=> start!127122 true))

(declare-fun array_inv!37414 (array!99733) Bool)

(assert (=> start!127122 (array_inv!37414 a!2862)))

(declare-fun b!1491173 () Bool)

(declare-fun res!1013514 () Bool)

(assert (=> b!1491173 (=> (not res!1013514) (not e!835845))))

(assert (=> b!1491173 (= res!1013514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1491174 () Bool)

(declare-fun res!1013530 () Bool)

(assert (=> b!1491174 (=> (not res!1013530) (not e!835845))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491174 (= res!1013530 (validKeyInArray!0 (select (arr!48133 a!2862) j!93)))))

(declare-fun b!1491175 () Bool)

(declare-fun e!835838 () Bool)

(assert (=> b!1491175 (= e!835845 e!835838)))

(declare-fun res!1013521 () Bool)

(assert (=> b!1491175 (=> (not res!1013521) (not e!835838))))

(assert (=> b!1491175 (= res!1013521 (= (select (store (arr!48133 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!650202 () array!99733)

(assert (=> b!1491175 (= lt!650202 (array!99734 (store (arr!48133 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48684 a!2862)))))

(declare-fun b!1491176 () Bool)

(declare-fun res!1013517 () Bool)

(declare-fun e!835839 () Bool)

(assert (=> b!1491176 (=> res!1013517 e!835839)))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1491176 (= res!1013517 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1491177 () Bool)

(declare-fun res!1013531 () Bool)

(assert (=> b!1491177 (=> res!1013531 e!835839)))

(declare-fun e!835842 () Bool)

(assert (=> b!1491177 (= res!1013531 e!835842)))

(declare-fun c!138366 () Bool)

(assert (=> b!1491177 (= c!138366 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1491178 () Bool)

(declare-fun res!1013524 () Bool)

(assert (=> b!1491178 (=> (not res!1013524) (not e!835845))))

(declare-datatypes ((List!34621 0))(
  ( (Nil!34618) (Cons!34617 (h!36014 (_ BitVec 64)) (t!49307 List!34621)) )
))
(declare-fun arrayNoDuplicates!0 (array!99733 (_ BitVec 32) List!34621) Bool)

(assert (=> b!1491178 (= res!1013524 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34618))))

(declare-fun b!1491179 () Bool)

(assert (=> b!1491179 (= e!835839 true)))

(declare-fun lt!650200 () SeekEntryResult!12270)

(assert (=> b!1491179 (= lt!650204 lt!650200)))

(declare-fun lt!650201 () (_ BitVec 32))

(declare-fun lt!650198 () Unit!49913)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49913)

(assert (=> b!1491179 (= lt!650198 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!650201 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1491180 () Bool)

(declare-fun e!835840 () Bool)

(assert (=> b!1491180 (= e!835840 e!835841)))

(declare-fun res!1013516 () Bool)

(assert (=> b!1491180 (=> (not res!1013516) (not e!835841))))

(declare-fun lt!650205 () SeekEntryResult!12270)

(assert (=> b!1491180 (= res!1013516 (= lt!650205 (Intermediate!12270 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!650206 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99733 (_ BitVec 32)) SeekEntryResult!12270)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491180 (= lt!650205 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650206 mask!2687) lt!650206 lt!650202 mask!2687))))

(assert (=> b!1491180 (= lt!650206 (select (store (arr!48133 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491181 () Bool)

(declare-fun res!1013525 () Bool)

(assert (=> b!1491181 (=> (not res!1013525) (not e!835845))))

(assert (=> b!1491181 (= res!1013525 (validKeyInArray!0 (select (arr!48133 a!2862) i!1006)))))

(declare-fun b!1491182 () Bool)

(declare-fun res!1013529 () Bool)

(assert (=> b!1491182 (=> (not res!1013529) (not e!835845))))

(assert (=> b!1491182 (= res!1013529 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48684 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48684 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48684 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1491183 () Bool)

(declare-fun res!1013519 () Bool)

(assert (=> b!1491183 (=> (not res!1013519) (not e!835841))))

(declare-fun e!835843 () Bool)

(assert (=> b!1491183 (= res!1013519 e!835843)))

(declare-fun c!138367 () Bool)

(assert (=> b!1491183 (= c!138367 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1491184 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99733 (_ BitVec 32)) SeekEntryResult!12270)

(assert (=> b!1491184 (= e!835843 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650206 lt!650202 mask!2687) (seekEntryOrOpen!0 lt!650206 lt!650202 mask!2687)))))

(declare-fun b!1491185 () Bool)

(assert (=> b!1491185 (= e!835844 e!835839)))

(declare-fun res!1013527 () Bool)

(assert (=> b!1491185 (=> res!1013527 e!835839)))

(assert (=> b!1491185 (= res!1013527 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!650201 #b00000000000000000000000000000000) (bvsge lt!650201 (size!48684 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491185 (= lt!650201 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1491185 (= lt!650200 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650206 lt!650202 mask!2687))))

(assert (=> b!1491185 (= lt!650200 (seekEntryOrOpen!0 lt!650206 lt!650202 mask!2687))))

(declare-fun b!1491186 () Bool)

(assert (=> b!1491186 (= e!835843 (= lt!650205 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650206 lt!650202 mask!2687)))))

(declare-fun b!1491187 () Bool)

(declare-fun res!1013526 () Bool)

(assert (=> b!1491187 (=> (not res!1013526) (not e!835840))))

(declare-fun lt!650203 () SeekEntryResult!12270)

(assert (=> b!1491187 (= res!1013526 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48133 a!2862) j!93) a!2862 mask!2687) lt!650203))))

(declare-fun b!1491188 () Bool)

(declare-fun res!1013518 () Bool)

(assert (=> b!1491188 (=> (not res!1013518) (not e!835845))))

(assert (=> b!1491188 (= res!1013518 (and (= (size!48684 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48684 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48684 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1491189 () Bool)

(assert (=> b!1491189 (= e!835838 e!835840)))

(declare-fun res!1013522 () Bool)

(assert (=> b!1491189 (=> (not res!1013522) (not e!835840))))

(assert (=> b!1491189 (= res!1013522 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48133 a!2862) j!93) mask!2687) (select (arr!48133 a!2862) j!93) a!2862 mask!2687) lt!650203))))

(assert (=> b!1491189 (= lt!650203 (Intermediate!12270 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491190 () Bool)

(assert (=> b!1491190 (= e!835842 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!650201 intermediateAfterIndex!19 lt!650206 lt!650202 mask!2687) lt!650200)))))

(declare-fun b!1491191 () Bool)

(declare-fun res!1013515 () Bool)

(assert (=> b!1491191 (=> res!1013515 e!835839)))

(assert (=> b!1491191 (= res!1013515 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!650201 (select (arr!48133 a!2862) j!93) a!2862 mask!2687) lt!650203)))))

(declare-fun b!1491192 () Bool)

(declare-fun res!1013528 () Bool)

(assert (=> b!1491192 (=> (not res!1013528) (not e!835841))))

(assert (=> b!1491192 (= res!1013528 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1491193 () Bool)

(assert (=> b!1491193 (= e!835842 (not (= lt!650205 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!650201 lt!650206 lt!650202 mask!2687))))))

(assert (= (and start!127122 res!1013523) b!1491188))

(assert (= (and b!1491188 res!1013518) b!1491181))

(assert (= (and b!1491181 res!1013525) b!1491174))

(assert (= (and b!1491174 res!1013530) b!1491173))

(assert (= (and b!1491173 res!1013514) b!1491178))

(assert (= (and b!1491178 res!1013524) b!1491182))

(assert (= (and b!1491182 res!1013529) b!1491175))

(assert (= (and b!1491175 res!1013521) b!1491189))

(assert (= (and b!1491189 res!1013522) b!1491187))

(assert (= (and b!1491187 res!1013526) b!1491180))

(assert (= (and b!1491180 res!1013516) b!1491183))

(assert (= (and b!1491183 c!138367) b!1491186))

(assert (= (and b!1491183 (not c!138367)) b!1491184))

(assert (= (and b!1491183 res!1013519) b!1491192))

(assert (= (and b!1491192 res!1013528) b!1491172))

(assert (= (and b!1491172 (not res!1013520)) b!1491185))

(assert (= (and b!1491185 (not res!1013527)) b!1491191))

(assert (= (and b!1491191 (not res!1013515)) b!1491177))

(assert (= (and b!1491177 c!138366) b!1491193))

(assert (= (and b!1491177 (not c!138366)) b!1491190))

(assert (= (and b!1491177 (not res!1013531)) b!1491176))

(assert (= (and b!1491176 (not res!1013517)) b!1491179))

(declare-fun m!1375399 () Bool)

(assert (=> b!1491181 m!1375399))

(assert (=> b!1491181 m!1375399))

(declare-fun m!1375401 () Bool)

(assert (=> b!1491181 m!1375401))

(declare-fun m!1375403 () Bool)

(assert (=> start!127122 m!1375403))

(declare-fun m!1375405 () Bool)

(assert (=> start!127122 m!1375405))

(declare-fun m!1375407 () Bool)

(assert (=> b!1491185 m!1375407))

(declare-fun m!1375409 () Bool)

(assert (=> b!1491185 m!1375409))

(declare-fun m!1375411 () Bool)

(assert (=> b!1491185 m!1375411))

(declare-fun m!1375413 () Bool)

(assert (=> b!1491187 m!1375413))

(assert (=> b!1491187 m!1375413))

(declare-fun m!1375415 () Bool)

(assert (=> b!1491187 m!1375415))

(assert (=> b!1491174 m!1375413))

(assert (=> b!1491174 m!1375413))

(declare-fun m!1375417 () Bool)

(assert (=> b!1491174 m!1375417))

(declare-fun m!1375419 () Bool)

(assert (=> b!1491190 m!1375419))

(assert (=> b!1491184 m!1375409))

(assert (=> b!1491184 m!1375411))

(assert (=> b!1491189 m!1375413))

(assert (=> b!1491189 m!1375413))

(declare-fun m!1375421 () Bool)

(assert (=> b!1491189 m!1375421))

(assert (=> b!1491189 m!1375421))

(assert (=> b!1491189 m!1375413))

(declare-fun m!1375423 () Bool)

(assert (=> b!1491189 m!1375423))

(declare-fun m!1375425 () Bool)

(assert (=> b!1491186 m!1375425))

(declare-fun m!1375427 () Bool)

(assert (=> b!1491172 m!1375427))

(declare-fun m!1375429 () Bool)

(assert (=> b!1491172 m!1375429))

(declare-fun m!1375431 () Bool)

(assert (=> b!1491172 m!1375431))

(declare-fun m!1375433 () Bool)

(assert (=> b!1491172 m!1375433))

(declare-fun m!1375435 () Bool)

(assert (=> b!1491172 m!1375435))

(assert (=> b!1491172 m!1375413))

(declare-fun m!1375437 () Bool)

(assert (=> b!1491172 m!1375437))

(declare-fun m!1375439 () Bool)

(assert (=> b!1491172 m!1375439))

(assert (=> b!1491172 m!1375413))

(declare-fun m!1375441 () Bool)

(assert (=> b!1491180 m!1375441))

(assert (=> b!1491180 m!1375441))

(declare-fun m!1375443 () Bool)

(assert (=> b!1491180 m!1375443))

(assert (=> b!1491180 m!1375429))

(declare-fun m!1375445 () Bool)

(assert (=> b!1491180 m!1375445))

(assert (=> b!1491191 m!1375413))

(assert (=> b!1491191 m!1375413))

(declare-fun m!1375447 () Bool)

(assert (=> b!1491191 m!1375447))

(declare-fun m!1375449 () Bool)

(assert (=> b!1491178 m!1375449))

(assert (=> b!1491175 m!1375429))

(declare-fun m!1375451 () Bool)

(assert (=> b!1491175 m!1375451))

(declare-fun m!1375453 () Bool)

(assert (=> b!1491193 m!1375453))

(declare-fun m!1375455 () Bool)

(assert (=> b!1491179 m!1375455))

(declare-fun m!1375457 () Bool)

(assert (=> b!1491173 m!1375457))

(check-sat (not b!1491174) (not b!1491179) (not b!1491172) (not b!1491184) (not b!1491173) (not b!1491178) (not b!1491193) (not start!127122) (not b!1491180) (not b!1491186) (not b!1491181) (not b!1491189) (not b!1491190) (not b!1491187) (not b!1491185) (not b!1491191))
(check-sat)
