; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127094 () Bool)

(assert start!127094)

(declare-fun b!1493548 () Bool)

(declare-fun res!1016023 () Bool)

(declare-fun e!836679 () Bool)

(assert (=> b!1493548 (=> (not res!1016023) (not e!836679))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99741 0))(
  ( (array!99742 (arr!48139 (Array (_ BitVec 32) (_ BitVec 64))) (size!48689 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99741)

(assert (=> b!1493548 (= res!1016023 (and (= (size!48689 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48689 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48689 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1493549 () Bool)

(declare-fun res!1016030 () Bool)

(assert (=> b!1493549 (=> (not res!1016030) (not e!836679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99741 (_ BitVec 32)) Bool)

(assert (=> b!1493549 (= res!1016030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1493550 () Bool)

(declare-fun res!1016020 () Bool)

(declare-fun e!836674 () Bool)

(assert (=> b!1493550 (=> (not res!1016020) (not e!836674))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1493550 (= res!1016020 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun lt!651066 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12379 0))(
  ( (MissingZero!12379 (index!51908 (_ BitVec 32))) (Found!12379 (index!51909 (_ BitVec 32))) (Intermediate!12379 (undefined!13191 Bool) (index!51910 (_ BitVec 32)) (x!133507 (_ BitVec 32))) (Undefined!12379) (MissingVacant!12379 (index!51911 (_ BitVec 32))) )
))
(declare-fun lt!651063 () SeekEntryResult!12379)

(declare-fun lt!651065 () array!99741)

(declare-fun b!1493551 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!836677 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99741 (_ BitVec 32)) SeekEntryResult!12379)

(assert (=> b!1493551 (= e!836677 (= lt!651063 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651066 lt!651065 mask!2687)))))

(declare-fun b!1493552 () Bool)

(declare-fun res!1016035 () Bool)

(assert (=> b!1493552 (=> (not res!1016035) (not e!836679))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1493552 (= res!1016035 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48689 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48689 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48689 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1493553 () Bool)

(declare-fun res!1016022 () Bool)

(assert (=> b!1493553 (=> (not res!1016022) (not e!836679))))

(declare-datatypes ((List!34640 0))(
  ( (Nil!34637) (Cons!34636 (h!36025 (_ BitVec 64)) (t!49334 List!34640)) )
))
(declare-fun arrayNoDuplicates!0 (array!99741 (_ BitVec 32) List!34640) Bool)

(assert (=> b!1493553 (= res!1016022 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34637))))

(declare-fun res!1016029 () Bool)

(assert (=> start!127094 (=> (not res!1016029) (not e!836679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127094 (= res!1016029 (validMask!0 mask!2687))))

(assert (=> start!127094 e!836679))

(assert (=> start!127094 true))

(declare-fun array_inv!37167 (array!99741) Bool)

(assert (=> start!127094 (array_inv!37167 a!2862)))

(declare-fun b!1493554 () Bool)

(declare-fun res!1016031 () Bool)

(assert (=> b!1493554 (=> (not res!1016031) (not e!836679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1493554 (= res!1016031 (validKeyInArray!0 (select (arr!48139 a!2862) j!93)))))

(declare-fun b!1493555 () Bool)

(declare-fun e!836681 () Bool)

(assert (=> b!1493555 (= e!836681 e!836674)))

(declare-fun res!1016034 () Bool)

(assert (=> b!1493555 (=> (not res!1016034) (not e!836674))))

(assert (=> b!1493555 (= res!1016034 (= lt!651063 (Intermediate!12379 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493555 (= lt!651063 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651066 mask!2687) lt!651066 lt!651065 mask!2687))))

(assert (=> b!1493555 (= lt!651066 (select (store (arr!48139 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1493556 () Bool)

(declare-fun e!836676 () Bool)

(assert (=> b!1493556 (= e!836679 e!836676)))

(declare-fun res!1016026 () Bool)

(assert (=> b!1493556 (=> (not res!1016026) (not e!836676))))

(assert (=> b!1493556 (= res!1016026 (= (select (store (arr!48139 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493556 (= lt!651065 (array!99742 (store (arr!48139 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48689 a!2862)))))

(declare-fun b!1493557 () Bool)

(declare-fun res!1016021 () Bool)

(assert (=> b!1493557 (=> (not res!1016021) (not e!836681))))

(declare-fun lt!651061 () SeekEntryResult!12379)

(assert (=> b!1493557 (= res!1016021 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48139 a!2862) j!93) a!2862 mask!2687) lt!651061))))

(declare-fun b!1493558 () Bool)

(declare-fun res!1016028 () Bool)

(assert (=> b!1493558 (=> (not res!1016028) (not e!836679))))

(assert (=> b!1493558 (= res!1016028 (validKeyInArray!0 (select (arr!48139 a!2862) i!1006)))))

(declare-fun e!836678 () Bool)

(declare-fun b!1493559 () Bool)

(assert (=> b!1493559 (= e!836678 (or (= (select (arr!48139 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48139 a!2862) intermediateBeforeIndex!19) (select (arr!48139 a!2862) j!93))))))

(declare-fun b!1493560 () Bool)

(declare-fun res!1016033 () Bool)

(assert (=> b!1493560 (=> (not res!1016033) (not e!836674))))

(assert (=> b!1493560 (= res!1016033 e!836677)))

(declare-fun c!138294 () Bool)

(assert (=> b!1493560 (= c!138294 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1493561 () Bool)

(declare-fun e!836680 () Bool)

(assert (=> b!1493561 (= e!836680 true)))

(declare-fun lt!651064 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493561 (= lt!651064 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1493562 () Bool)

(assert (=> b!1493562 (= e!836674 (not e!836680))))

(declare-fun res!1016024 () Bool)

(assert (=> b!1493562 (=> res!1016024 e!836680)))

(assert (=> b!1493562 (= res!1016024 (or (and (= (select (arr!48139 a!2862) index!646) (select (store (arr!48139 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48139 a!2862) index!646) (select (arr!48139 a!2862) j!93))) (= (select (arr!48139 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1493562 e!836678))

(declare-fun res!1016032 () Bool)

(assert (=> b!1493562 (=> (not res!1016032) (not e!836678))))

(assert (=> b!1493562 (= res!1016032 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50098 0))(
  ( (Unit!50099) )
))
(declare-fun lt!651062 () Unit!50098)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99741 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50098)

(assert (=> b!1493562 (= lt!651062 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1493563 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99741 (_ BitVec 32)) SeekEntryResult!12379)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99741 (_ BitVec 32)) SeekEntryResult!12379)

(assert (=> b!1493563 (= e!836677 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651066 lt!651065 mask!2687) (seekEntryOrOpen!0 lt!651066 lt!651065 mask!2687)))))

(declare-fun b!1493564 () Bool)

(declare-fun res!1016027 () Bool)

(assert (=> b!1493564 (=> (not res!1016027) (not e!836678))))

(assert (=> b!1493564 (= res!1016027 (= (seekEntryOrOpen!0 (select (arr!48139 a!2862) j!93) a!2862 mask!2687) (Found!12379 j!93)))))

(declare-fun b!1493565 () Bool)

(assert (=> b!1493565 (= e!836676 e!836681)))

(declare-fun res!1016025 () Bool)

(assert (=> b!1493565 (=> (not res!1016025) (not e!836681))))

(assert (=> b!1493565 (= res!1016025 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48139 a!2862) j!93) mask!2687) (select (arr!48139 a!2862) j!93) a!2862 mask!2687) lt!651061))))

(assert (=> b!1493565 (= lt!651061 (Intermediate!12379 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!127094 res!1016029) b!1493548))

(assert (= (and b!1493548 res!1016023) b!1493558))

(assert (= (and b!1493558 res!1016028) b!1493554))

(assert (= (and b!1493554 res!1016031) b!1493549))

(assert (= (and b!1493549 res!1016030) b!1493553))

(assert (= (and b!1493553 res!1016022) b!1493552))

(assert (= (and b!1493552 res!1016035) b!1493556))

(assert (= (and b!1493556 res!1016026) b!1493565))

(assert (= (and b!1493565 res!1016025) b!1493557))

(assert (= (and b!1493557 res!1016021) b!1493555))

(assert (= (and b!1493555 res!1016034) b!1493560))

(assert (= (and b!1493560 c!138294) b!1493551))

(assert (= (and b!1493560 (not c!138294)) b!1493563))

(assert (= (and b!1493560 res!1016033) b!1493550))

(assert (= (and b!1493550 res!1016020) b!1493562))

(assert (= (and b!1493562 res!1016032) b!1493564))

(assert (= (and b!1493564 res!1016027) b!1493559))

(assert (= (and b!1493562 (not res!1016024)) b!1493561))

(declare-fun m!1377327 () Bool)

(assert (=> b!1493558 m!1377327))

(assert (=> b!1493558 m!1377327))

(declare-fun m!1377329 () Bool)

(assert (=> b!1493558 m!1377329))

(declare-fun m!1377331 () Bool)

(assert (=> b!1493553 m!1377331))

(declare-fun m!1377333 () Bool)

(assert (=> b!1493557 m!1377333))

(assert (=> b!1493557 m!1377333))

(declare-fun m!1377335 () Bool)

(assert (=> b!1493557 m!1377335))

(declare-fun m!1377337 () Bool)

(assert (=> b!1493556 m!1377337))

(declare-fun m!1377339 () Bool)

(assert (=> b!1493556 m!1377339))

(declare-fun m!1377341 () Bool)

(assert (=> b!1493555 m!1377341))

(assert (=> b!1493555 m!1377341))

(declare-fun m!1377343 () Bool)

(assert (=> b!1493555 m!1377343))

(assert (=> b!1493555 m!1377337))

(declare-fun m!1377345 () Bool)

(assert (=> b!1493555 m!1377345))

(assert (=> b!1493565 m!1377333))

(assert (=> b!1493565 m!1377333))

(declare-fun m!1377347 () Bool)

(assert (=> b!1493565 m!1377347))

(assert (=> b!1493565 m!1377347))

(assert (=> b!1493565 m!1377333))

(declare-fun m!1377349 () Bool)

(assert (=> b!1493565 m!1377349))

(declare-fun m!1377351 () Bool)

(assert (=> b!1493551 m!1377351))

(declare-fun m!1377353 () Bool)

(assert (=> b!1493562 m!1377353))

(assert (=> b!1493562 m!1377337))

(declare-fun m!1377355 () Bool)

(assert (=> b!1493562 m!1377355))

(declare-fun m!1377357 () Bool)

(assert (=> b!1493562 m!1377357))

(declare-fun m!1377359 () Bool)

(assert (=> b!1493562 m!1377359))

(assert (=> b!1493562 m!1377333))

(declare-fun m!1377361 () Bool)

(assert (=> b!1493549 m!1377361))

(declare-fun m!1377363 () Bool)

(assert (=> b!1493559 m!1377363))

(assert (=> b!1493559 m!1377333))

(assert (=> b!1493564 m!1377333))

(assert (=> b!1493564 m!1377333))

(declare-fun m!1377365 () Bool)

(assert (=> b!1493564 m!1377365))

(assert (=> b!1493554 m!1377333))

(assert (=> b!1493554 m!1377333))

(declare-fun m!1377367 () Bool)

(assert (=> b!1493554 m!1377367))

(declare-fun m!1377369 () Bool)

(assert (=> start!127094 m!1377369))

(declare-fun m!1377371 () Bool)

(assert (=> start!127094 m!1377371))

(declare-fun m!1377373 () Bool)

(assert (=> b!1493561 m!1377373))

(declare-fun m!1377375 () Bool)

(assert (=> b!1493563 m!1377375))

(declare-fun m!1377377 () Bool)

(assert (=> b!1493563 m!1377377))

(push 1)

