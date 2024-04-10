; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126380 () Bool)

(assert start!126380)

(declare-fun res!1006844 () Bool)

(declare-fun e!830907 () Bool)

(assert (=> start!126380 (=> (not res!1006844) (not e!830907))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126380 (= res!1006844 (validMask!0 mask!2687))))

(assert (=> start!126380 e!830907))

(assert (=> start!126380 true))

(declare-datatypes ((array!99399 0))(
  ( (array!99400 (arr!47977 (Array (_ BitVec 32) (_ BitVec 64))) (size!48527 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99399)

(declare-fun array_inv!37005 (array!99399) Bool)

(assert (=> start!126380 (array_inv!37005 a!2862)))

(declare-fun b!1481516 () Bool)

(declare-fun res!1006842 () Bool)

(assert (=> b!1481516 (=> (not res!1006842) (not e!830907))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1481516 (= res!1006842 (and (= (size!48527 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48527 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48527 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1481517 () Bool)

(declare-fun e!830911 () Bool)

(declare-fun e!830909 () Bool)

(assert (=> b!1481517 (= e!830911 e!830909)))

(declare-fun res!1006836 () Bool)

(assert (=> b!1481517 (=> (not res!1006836) (not e!830909))))

(declare-datatypes ((SeekEntryResult!12217 0))(
  ( (MissingZero!12217 (index!51260 (_ BitVec 32))) (Found!12217 (index!51261 (_ BitVec 32))) (Intermediate!12217 (undefined!13029 Bool) (index!51262 (_ BitVec 32)) (x!132844 (_ BitVec 32))) (Undefined!12217) (MissingVacant!12217 (index!51263 (_ BitVec 32))) )
))
(declare-fun lt!646799 () SeekEntryResult!12217)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99399 (_ BitVec 32)) SeekEntryResult!12217)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481517 (= res!1006836 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47977 a!2862) j!93) mask!2687) (select (arr!47977 a!2862) j!93) a!2862 mask!2687) lt!646799))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1481517 (= lt!646799 (Intermediate!12217 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481518 () Bool)

(declare-fun res!1006833 () Bool)

(assert (=> b!1481518 (=> (not res!1006833) (not e!830907))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1481518 (= res!1006833 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48527 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48527 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48527 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1481519 () Bool)

(declare-fun res!1006837 () Bool)

(assert (=> b!1481519 (=> (not res!1006837) (not e!830907))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481519 (= res!1006837 (validKeyInArray!0 (select (arr!47977 a!2862) j!93)))))

(declare-fun b!1481520 () Bool)

(declare-fun lt!646803 () array!99399)

(declare-fun lt!646800 () (_ BitVec 64))

(declare-fun e!830908 () Bool)

(declare-fun lt!646802 () SeekEntryResult!12217)

(assert (=> b!1481520 (= e!830908 (= lt!646802 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646800 lt!646803 mask!2687)))))

(declare-fun b!1481521 () Bool)

(declare-fun res!1006845 () Bool)

(assert (=> b!1481521 (=> (not res!1006845) (not e!830909))))

(assert (=> b!1481521 (= res!1006845 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47977 a!2862) j!93) a!2862 mask!2687) lt!646799))))

(declare-fun b!1481522 () Bool)

(declare-fun res!1006841 () Bool)

(declare-fun e!830906 () Bool)

(assert (=> b!1481522 (=> (not res!1006841) (not e!830906))))

(assert (=> b!1481522 (= res!1006841 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481523 () Bool)

(assert (=> b!1481523 (= e!830906 (not (or (and (= (select (arr!47977 a!2862) index!646) (select (store (arr!47977 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47977 a!2862) index!646) (select (arr!47977 a!2862) j!93))) (= (select (arr!47977 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (= (select (store (arr!47977 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!830912 () Bool)

(assert (=> b!1481523 e!830912))

(declare-fun res!1006839 () Bool)

(assert (=> b!1481523 (=> (not res!1006839) (not e!830912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99399 (_ BitVec 32)) Bool)

(assert (=> b!1481523 (= res!1006839 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49774 0))(
  ( (Unit!49775) )
))
(declare-fun lt!646801 () Unit!49774)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99399 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49774)

(assert (=> b!1481523 (= lt!646801 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481524 () Bool)

(declare-fun res!1006843 () Bool)

(assert (=> b!1481524 (=> (not res!1006843) (not e!830907))))

(declare-datatypes ((List!34478 0))(
  ( (Nil!34475) (Cons!34474 (h!35845 (_ BitVec 64)) (t!49172 List!34478)) )
))
(declare-fun arrayNoDuplicates!0 (array!99399 (_ BitVec 32) List!34478) Bool)

(assert (=> b!1481524 (= res!1006843 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34475))))

(declare-fun b!1481525 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99399 (_ BitVec 32)) SeekEntryResult!12217)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99399 (_ BitVec 32)) SeekEntryResult!12217)

(assert (=> b!1481525 (= e!830908 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646800 lt!646803 mask!2687) (seekEntryOrOpen!0 lt!646800 lt!646803 mask!2687)))))

(declare-fun b!1481526 () Bool)

(assert (=> b!1481526 (= e!830912 (and (or (= (select (arr!47977 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47977 a!2862) intermediateBeforeIndex!19) (select (arr!47977 a!2862) j!93))) (or (and (= (select (arr!47977 a!2862) index!646) (select (store (arr!47977 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47977 a!2862) index!646) (select (arr!47977 a!2862) j!93))) (= (select (arr!47977 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (= index!646 intermediateAfterIndex!19))))))

(declare-fun b!1481527 () Bool)

(declare-fun res!1006832 () Bool)

(assert (=> b!1481527 (=> (not res!1006832) (not e!830912))))

(assert (=> b!1481527 (= res!1006832 (= (seekEntryOrOpen!0 (select (arr!47977 a!2862) j!93) a!2862 mask!2687) (Found!12217 j!93)))))

(declare-fun b!1481528 () Bool)

(assert (=> b!1481528 (= e!830909 e!830906)))

(declare-fun res!1006834 () Bool)

(assert (=> b!1481528 (=> (not res!1006834) (not e!830906))))

(assert (=> b!1481528 (= res!1006834 (= lt!646802 (Intermediate!12217 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1481528 (= lt!646802 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646800 mask!2687) lt!646800 lt!646803 mask!2687))))

(assert (=> b!1481528 (= lt!646800 (select (store (arr!47977 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1481529 () Bool)

(declare-fun res!1006846 () Bool)

(assert (=> b!1481529 (=> (not res!1006846) (not e!830907))))

(assert (=> b!1481529 (= res!1006846 (validKeyInArray!0 (select (arr!47977 a!2862) i!1006)))))

(declare-fun b!1481530 () Bool)

(declare-fun res!1006835 () Bool)

(assert (=> b!1481530 (=> (not res!1006835) (not e!830907))))

(assert (=> b!1481530 (= res!1006835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1481531 () Bool)

(declare-fun res!1006838 () Bool)

(assert (=> b!1481531 (=> (not res!1006838) (not e!830906))))

(assert (=> b!1481531 (= res!1006838 e!830908)))

(declare-fun c!136863 () Bool)

(assert (=> b!1481531 (= c!136863 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1481532 () Bool)

(assert (=> b!1481532 (= e!830907 e!830911)))

(declare-fun res!1006840 () Bool)

(assert (=> b!1481532 (=> (not res!1006840) (not e!830911))))

(assert (=> b!1481532 (= res!1006840 (= (select (store (arr!47977 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1481532 (= lt!646803 (array!99400 (store (arr!47977 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48527 a!2862)))))

(assert (= (and start!126380 res!1006844) b!1481516))

(assert (= (and b!1481516 res!1006842) b!1481529))

(assert (= (and b!1481529 res!1006846) b!1481519))

(assert (= (and b!1481519 res!1006837) b!1481530))

(assert (= (and b!1481530 res!1006835) b!1481524))

(assert (= (and b!1481524 res!1006843) b!1481518))

(assert (= (and b!1481518 res!1006833) b!1481532))

(assert (= (and b!1481532 res!1006840) b!1481517))

(assert (= (and b!1481517 res!1006836) b!1481521))

(assert (= (and b!1481521 res!1006845) b!1481528))

(assert (= (and b!1481528 res!1006834) b!1481531))

(assert (= (and b!1481531 c!136863) b!1481520))

(assert (= (and b!1481531 (not c!136863)) b!1481525))

(assert (= (and b!1481531 res!1006838) b!1481522))

(assert (= (and b!1481522 res!1006841) b!1481523))

(assert (= (and b!1481523 res!1006839) b!1481527))

(assert (= (and b!1481527 res!1006832) b!1481526))

(declare-fun m!1367255 () Bool)

(assert (=> b!1481517 m!1367255))

(assert (=> b!1481517 m!1367255))

(declare-fun m!1367257 () Bool)

(assert (=> b!1481517 m!1367257))

(assert (=> b!1481517 m!1367257))

(assert (=> b!1481517 m!1367255))

(declare-fun m!1367259 () Bool)

(assert (=> b!1481517 m!1367259))

(assert (=> b!1481519 m!1367255))

(assert (=> b!1481519 m!1367255))

(declare-fun m!1367261 () Bool)

(assert (=> b!1481519 m!1367261))

(declare-fun m!1367263 () Bool)

(assert (=> b!1481525 m!1367263))

(declare-fun m!1367265 () Bool)

(assert (=> b!1481525 m!1367265))

(declare-fun m!1367267 () Bool)

(assert (=> b!1481529 m!1367267))

(assert (=> b!1481529 m!1367267))

(declare-fun m!1367269 () Bool)

(assert (=> b!1481529 m!1367269))

(declare-fun m!1367271 () Bool)

(assert (=> b!1481532 m!1367271))

(declare-fun m!1367273 () Bool)

(assert (=> b!1481532 m!1367273))

(declare-fun m!1367275 () Bool)

(assert (=> b!1481523 m!1367275))

(assert (=> b!1481523 m!1367271))

(declare-fun m!1367277 () Bool)

(assert (=> b!1481523 m!1367277))

(declare-fun m!1367279 () Bool)

(assert (=> b!1481523 m!1367279))

(declare-fun m!1367281 () Bool)

(assert (=> b!1481523 m!1367281))

(assert (=> b!1481523 m!1367255))

(assert (=> b!1481527 m!1367255))

(assert (=> b!1481527 m!1367255))

(declare-fun m!1367283 () Bool)

(assert (=> b!1481527 m!1367283))

(declare-fun m!1367285 () Bool)

(assert (=> b!1481524 m!1367285))

(declare-fun m!1367287 () Bool)

(assert (=> b!1481520 m!1367287))

(declare-fun m!1367289 () Bool)

(assert (=> b!1481530 m!1367289))

(declare-fun m!1367291 () Bool)

(assert (=> start!126380 m!1367291))

(declare-fun m!1367293 () Bool)

(assert (=> start!126380 m!1367293))

(assert (=> b!1481526 m!1367271))

(declare-fun m!1367295 () Bool)

(assert (=> b!1481526 m!1367295))

(assert (=> b!1481526 m!1367277))

(assert (=> b!1481526 m!1367279))

(assert (=> b!1481526 m!1367255))

(assert (=> b!1481521 m!1367255))

(assert (=> b!1481521 m!1367255))

(declare-fun m!1367297 () Bool)

(assert (=> b!1481521 m!1367297))

(declare-fun m!1367299 () Bool)

(assert (=> b!1481528 m!1367299))

(assert (=> b!1481528 m!1367299))

(declare-fun m!1367301 () Bool)

(assert (=> b!1481528 m!1367301))

(assert (=> b!1481528 m!1367271))

(declare-fun m!1367303 () Bool)

(assert (=> b!1481528 m!1367303))

(push 1)

