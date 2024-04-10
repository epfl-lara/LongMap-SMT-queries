; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124526 () Bool)

(assert start!124526)

(declare-fun b!1441026 () Bool)

(declare-fun e!812383 () Bool)

(assert (=> b!1441026 (= e!812383 false)))

(declare-fun lt!633084 () Bool)

(declare-fun e!812380 () Bool)

(assert (=> b!1441026 (= lt!633084 e!812380)))

(declare-fun c!133305 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1441026 (= c!133305 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441027 () Bool)

(declare-fun res!973443 () Bool)

(declare-fun e!812379 () Bool)

(assert (=> b!1441027 (=> (not res!973443) (not e!812379))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!97974 0))(
  ( (array!97975 (arr!47275 (Array (_ BitVec 32) (_ BitVec 64))) (size!47825 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97974)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1441027 (= res!973443 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47825 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47825 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47825 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!633080 () (_ BitVec 64))

(declare-fun b!1441028 () Bool)

(declare-fun lt!633083 () array!97974)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11527 0))(
  ( (MissingZero!11527 (index!48500 (_ BitVec 32))) (Found!11527 (index!48501 (_ BitVec 32))) (Intermediate!11527 (undefined!12339 Bool) (index!48502 (_ BitVec 32)) (x!130216 (_ BitVec 32))) (Undefined!11527) (MissingVacant!11527 (index!48503 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97974 (_ BitVec 32)) SeekEntryResult!11527)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97974 (_ BitVec 32)) SeekEntryResult!11527)

(assert (=> b!1441028 (= e!812380 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633080 lt!633083 mask!2687) (seekEntryOrOpen!0 lt!633080 lt!633083 mask!2687))))))

(declare-fun res!973441 () Bool)

(assert (=> start!124526 (=> (not res!973441) (not e!812379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124526 (= res!973441 (validMask!0 mask!2687))))

(assert (=> start!124526 e!812379))

(assert (=> start!124526 true))

(declare-fun array_inv!36303 (array!97974) Bool)

(assert (=> start!124526 (array_inv!36303 a!2862)))

(declare-fun b!1441029 () Bool)

(declare-fun res!973439 () Bool)

(declare-fun e!812384 () Bool)

(assert (=> b!1441029 (=> (not res!973439) (not e!812384))))

(declare-fun lt!633082 () SeekEntryResult!11527)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97974 (_ BitVec 32)) SeekEntryResult!11527)

(assert (=> b!1441029 (= res!973439 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47275 a!2862) j!93) a!2862 mask!2687) lt!633082))))

(declare-fun b!1441030 () Bool)

(declare-fun res!973446 () Bool)

(assert (=> b!1441030 (=> (not res!973446) (not e!812379))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441030 (= res!973446 (validKeyInArray!0 (select (arr!47275 a!2862) j!93)))))

(declare-fun b!1441031 () Bool)

(declare-fun e!812381 () Bool)

(assert (=> b!1441031 (= e!812381 e!812384)))

(declare-fun res!973444 () Bool)

(assert (=> b!1441031 (=> (not res!973444) (not e!812384))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441031 (= res!973444 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47275 a!2862) j!93) mask!2687) (select (arr!47275 a!2862) j!93) a!2862 mask!2687) lt!633082))))

(assert (=> b!1441031 (= lt!633082 (Intermediate!11527 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441032 () Bool)

(declare-fun lt!633081 () SeekEntryResult!11527)

(assert (=> b!1441032 (= e!812380 (not (= lt!633081 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633080 lt!633083 mask!2687))))))

(declare-fun b!1441033 () Bool)

(declare-fun res!973445 () Bool)

(assert (=> b!1441033 (=> (not res!973445) (not e!812379))))

(declare-datatypes ((List!33776 0))(
  ( (Nil!33773) (Cons!33772 (h!35122 (_ BitVec 64)) (t!48470 List!33776)) )
))
(declare-fun arrayNoDuplicates!0 (array!97974 (_ BitVec 32) List!33776) Bool)

(assert (=> b!1441033 (= res!973445 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33773))))

(declare-fun b!1441034 () Bool)

(assert (=> b!1441034 (= e!812379 e!812381)))

(declare-fun res!973437 () Bool)

(assert (=> b!1441034 (=> (not res!973437) (not e!812381))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1441034 (= res!973437 (= (select (store (arr!47275 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1441034 (= lt!633083 (array!97975 (store (arr!47275 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47825 a!2862)))))

(declare-fun b!1441035 () Bool)

(assert (=> b!1441035 (= e!812384 e!812383)))

(declare-fun res!973438 () Bool)

(assert (=> b!1441035 (=> (not res!973438) (not e!812383))))

(assert (=> b!1441035 (= res!973438 (= lt!633081 (Intermediate!11527 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1441035 (= lt!633081 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633080 mask!2687) lt!633080 lt!633083 mask!2687))))

(assert (=> b!1441035 (= lt!633080 (select (store (arr!47275 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441036 () Bool)

(declare-fun res!973442 () Bool)

(assert (=> b!1441036 (=> (not res!973442) (not e!812379))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97974 (_ BitVec 32)) Bool)

(assert (=> b!1441036 (= res!973442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441037 () Bool)

(declare-fun res!973440 () Bool)

(assert (=> b!1441037 (=> (not res!973440) (not e!812379))))

(assert (=> b!1441037 (= res!973440 (and (= (size!47825 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47825 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47825 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441038 () Bool)

(declare-fun res!973447 () Bool)

(assert (=> b!1441038 (=> (not res!973447) (not e!812379))))

(assert (=> b!1441038 (= res!973447 (validKeyInArray!0 (select (arr!47275 a!2862) i!1006)))))

(assert (= (and start!124526 res!973441) b!1441037))

(assert (= (and b!1441037 res!973440) b!1441038))

(assert (= (and b!1441038 res!973447) b!1441030))

(assert (= (and b!1441030 res!973446) b!1441036))

(assert (= (and b!1441036 res!973442) b!1441033))

(assert (= (and b!1441033 res!973445) b!1441027))

(assert (= (and b!1441027 res!973443) b!1441034))

(assert (= (and b!1441034 res!973437) b!1441031))

(assert (= (and b!1441031 res!973444) b!1441029))

(assert (= (and b!1441029 res!973439) b!1441035))

(assert (= (and b!1441035 res!973438) b!1441026))

(assert (= (and b!1441026 c!133305) b!1441032))

(assert (= (and b!1441026 (not c!133305)) b!1441028))

(declare-fun m!1330259 () Bool)

(assert (=> b!1441030 m!1330259))

(assert (=> b!1441030 m!1330259))

(declare-fun m!1330261 () Bool)

(assert (=> b!1441030 m!1330261))

(declare-fun m!1330263 () Bool)

(assert (=> b!1441038 m!1330263))

(assert (=> b!1441038 m!1330263))

(declare-fun m!1330265 () Bool)

(assert (=> b!1441038 m!1330265))

(assert (=> b!1441029 m!1330259))

(assert (=> b!1441029 m!1330259))

(declare-fun m!1330267 () Bool)

(assert (=> b!1441029 m!1330267))

(declare-fun m!1330269 () Bool)

(assert (=> b!1441036 m!1330269))

(declare-fun m!1330271 () Bool)

(assert (=> b!1441032 m!1330271))

(declare-fun m!1330273 () Bool)

(assert (=> start!124526 m!1330273))

(declare-fun m!1330275 () Bool)

(assert (=> start!124526 m!1330275))

(assert (=> b!1441031 m!1330259))

(assert (=> b!1441031 m!1330259))

(declare-fun m!1330277 () Bool)

(assert (=> b!1441031 m!1330277))

(assert (=> b!1441031 m!1330277))

(assert (=> b!1441031 m!1330259))

(declare-fun m!1330279 () Bool)

(assert (=> b!1441031 m!1330279))

(declare-fun m!1330281 () Bool)

(assert (=> b!1441033 m!1330281))

(declare-fun m!1330283 () Bool)

(assert (=> b!1441028 m!1330283))

(declare-fun m!1330285 () Bool)

(assert (=> b!1441028 m!1330285))

(declare-fun m!1330287 () Bool)

(assert (=> b!1441034 m!1330287))

(declare-fun m!1330289 () Bool)

(assert (=> b!1441034 m!1330289))

(declare-fun m!1330291 () Bool)

(assert (=> b!1441035 m!1330291))

(assert (=> b!1441035 m!1330291))

(declare-fun m!1330293 () Bool)

(assert (=> b!1441035 m!1330293))

(assert (=> b!1441035 m!1330287))

(declare-fun m!1330295 () Bool)

(assert (=> b!1441035 m!1330295))

(push 1)

(assert (not b!1441038))

(assert (not b!1441032))

