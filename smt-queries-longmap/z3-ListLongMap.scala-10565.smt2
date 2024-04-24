; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124746 () Bool)

(assert start!124746)

(declare-fun b!1442392 () Bool)

(declare-fun res!973979 () Bool)

(declare-fun e!813239 () Bool)

(assert (=> b!1442392 (=> (not res!973979) (not e!813239))))

(declare-datatypes ((array!98089 0))(
  ( (array!98090 (arr!47329 (Array (_ BitVec 32) (_ BitVec 64))) (size!47880 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98089)

(declare-datatypes ((List!33817 0))(
  ( (Nil!33814) (Cons!33813 (h!35174 (_ BitVec 64)) (t!48503 List!33817)) )
))
(declare-fun arrayNoDuplicates!0 (array!98089 (_ BitVec 32) List!33817) Bool)

(assert (=> b!1442392 (= res!973979 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33814))))

(declare-fun b!1442393 () Bool)

(declare-fun res!973975 () Bool)

(declare-fun e!813237 () Bool)

(assert (=> b!1442393 (=> (not res!973975) (not e!813237))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11478 0))(
  ( (MissingZero!11478 (index!48304 (_ BitVec 32))) (Found!11478 (index!48305 (_ BitVec 32))) (Intermediate!11478 (undefined!12290 Bool) (index!48306 (_ BitVec 32)) (x!130199 (_ BitVec 32))) (Undefined!11478) (MissingVacant!11478 (index!48307 (_ BitVec 32))) )
))
(declare-fun lt!633575 () SeekEntryResult!11478)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98089 (_ BitVec 32)) SeekEntryResult!11478)

(assert (=> b!1442393 (= res!973975 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47329 a!2862) j!93) a!2862 mask!2687) lt!633575))))

(declare-fun res!973973 () Bool)

(assert (=> start!124746 (=> (not res!973973) (not e!813239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124746 (= res!973973 (validMask!0 mask!2687))))

(assert (=> start!124746 e!813239))

(assert (=> start!124746 true))

(declare-fun array_inv!36610 (array!98089) Bool)

(assert (=> start!124746 (array_inv!36610 a!2862)))

(declare-fun lt!633574 () (_ BitVec 64))

(declare-fun lt!633576 () array!98089)

(declare-fun b!1442394 () Bool)

(declare-fun e!813238 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98089 (_ BitVec 32)) SeekEntryResult!11478)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98089 (_ BitVec 32)) SeekEntryResult!11478)

(assert (=> b!1442394 (= e!813238 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633574 lt!633576 mask!2687) (seekEntryOrOpen!0 lt!633574 lt!633576 mask!2687))))))

(declare-fun b!1442395 () Bool)

(declare-fun res!973977 () Bool)

(assert (=> b!1442395 (=> (not res!973977) (not e!813239))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1442395 (= res!973977 (and (= (size!47880 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47880 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47880 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1442396 () Bool)

(declare-fun e!813240 () Bool)

(assert (=> b!1442396 (= e!813237 e!813240)))

(declare-fun res!973982 () Bool)

(assert (=> b!1442396 (=> (not res!973982) (not e!813240))))

(declare-fun lt!633577 () SeekEntryResult!11478)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1442396 (= res!973982 (= lt!633577 (Intermediate!11478 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442396 (= lt!633577 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633574 mask!2687) lt!633574 lt!633576 mask!2687))))

(assert (=> b!1442396 (= lt!633574 (select (store (arr!47329 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1442397 () Bool)

(declare-fun res!973980 () Bool)

(assert (=> b!1442397 (=> (not res!973980) (not e!813239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442397 (= res!973980 (validKeyInArray!0 (select (arr!47329 a!2862) j!93)))))

(declare-fun b!1442398 () Bool)

(assert (=> b!1442398 (= e!813240 false)))

(declare-fun lt!633573 () Bool)

(assert (=> b!1442398 (= lt!633573 e!813238)))

(declare-fun c!133729 () Bool)

(assert (=> b!1442398 (= c!133729 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442399 () Bool)

(declare-fun res!973976 () Bool)

(assert (=> b!1442399 (=> (not res!973976) (not e!813239))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1442399 (= res!973976 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47880 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47880 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47880 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1442400 () Bool)

(assert (=> b!1442400 (= e!813238 (not (= lt!633577 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633574 lt!633576 mask!2687))))))

(declare-fun b!1442401 () Bool)

(declare-fun res!973972 () Bool)

(assert (=> b!1442401 (=> (not res!973972) (not e!813239))))

(assert (=> b!1442401 (= res!973972 (validKeyInArray!0 (select (arr!47329 a!2862) i!1006)))))

(declare-fun b!1442402 () Bool)

(declare-fun e!813235 () Bool)

(assert (=> b!1442402 (= e!813235 e!813237)))

(declare-fun res!973974 () Bool)

(assert (=> b!1442402 (=> (not res!973974) (not e!813237))))

(assert (=> b!1442402 (= res!973974 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47329 a!2862) j!93) mask!2687) (select (arr!47329 a!2862) j!93) a!2862 mask!2687) lt!633575))))

(assert (=> b!1442402 (= lt!633575 (Intermediate!11478 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442403 () Bool)

(assert (=> b!1442403 (= e!813239 e!813235)))

(declare-fun res!973981 () Bool)

(assert (=> b!1442403 (=> (not res!973981) (not e!813235))))

(assert (=> b!1442403 (= res!973981 (= (select (store (arr!47329 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442403 (= lt!633576 (array!98090 (store (arr!47329 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47880 a!2862)))))

(declare-fun b!1442404 () Bool)

(declare-fun res!973978 () Bool)

(assert (=> b!1442404 (=> (not res!973978) (not e!813239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98089 (_ BitVec 32)) Bool)

(assert (=> b!1442404 (= res!973978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124746 res!973973) b!1442395))

(assert (= (and b!1442395 res!973977) b!1442401))

(assert (= (and b!1442401 res!973972) b!1442397))

(assert (= (and b!1442397 res!973980) b!1442404))

(assert (= (and b!1442404 res!973978) b!1442392))

(assert (= (and b!1442392 res!973979) b!1442399))

(assert (= (and b!1442399 res!973976) b!1442403))

(assert (= (and b!1442403 res!973981) b!1442402))

(assert (= (and b!1442402 res!973974) b!1442393))

(assert (= (and b!1442393 res!973975) b!1442396))

(assert (= (and b!1442396 res!973982) b!1442398))

(assert (= (and b!1442398 c!133729) b!1442400))

(assert (= (and b!1442398 (not c!133729)) b!1442394))

(declare-fun m!1331737 () Bool)

(assert (=> b!1442404 m!1331737))

(declare-fun m!1331739 () Bool)

(assert (=> start!124746 m!1331739))

(declare-fun m!1331741 () Bool)

(assert (=> start!124746 m!1331741))

(declare-fun m!1331743 () Bool)

(assert (=> b!1442400 m!1331743))

(declare-fun m!1331745 () Bool)

(assert (=> b!1442401 m!1331745))

(assert (=> b!1442401 m!1331745))

(declare-fun m!1331747 () Bool)

(assert (=> b!1442401 m!1331747))

(declare-fun m!1331749 () Bool)

(assert (=> b!1442403 m!1331749))

(declare-fun m!1331751 () Bool)

(assert (=> b!1442403 m!1331751))

(declare-fun m!1331753 () Bool)

(assert (=> b!1442396 m!1331753))

(assert (=> b!1442396 m!1331753))

(declare-fun m!1331755 () Bool)

(assert (=> b!1442396 m!1331755))

(assert (=> b!1442396 m!1331749))

(declare-fun m!1331757 () Bool)

(assert (=> b!1442396 m!1331757))

(declare-fun m!1331759 () Bool)

(assert (=> b!1442397 m!1331759))

(assert (=> b!1442397 m!1331759))

(declare-fun m!1331761 () Bool)

(assert (=> b!1442397 m!1331761))

(assert (=> b!1442402 m!1331759))

(assert (=> b!1442402 m!1331759))

(declare-fun m!1331763 () Bool)

(assert (=> b!1442402 m!1331763))

(assert (=> b!1442402 m!1331763))

(assert (=> b!1442402 m!1331759))

(declare-fun m!1331765 () Bool)

(assert (=> b!1442402 m!1331765))

(declare-fun m!1331767 () Bool)

(assert (=> b!1442392 m!1331767))

(assert (=> b!1442393 m!1331759))

(assert (=> b!1442393 m!1331759))

(declare-fun m!1331769 () Bool)

(assert (=> b!1442393 m!1331769))

(declare-fun m!1331771 () Bool)

(assert (=> b!1442394 m!1331771))

(declare-fun m!1331773 () Bool)

(assert (=> b!1442394 m!1331773))

(check-sat (not b!1442401) (not b!1442394) (not b!1442392) (not b!1442396) (not b!1442402) (not b!1442393) (not b!1442397) (not b!1442400) (not start!124746) (not b!1442404))
(check-sat)
