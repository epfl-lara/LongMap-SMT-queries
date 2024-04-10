; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125240 () Bool)

(assert start!125240)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1461393 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!640120 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!640116 () (_ BitVec 64))

(declare-fun e!821597 () Bool)

(declare-datatypes ((array!98688 0))(
  ( (array!98689 (arr!47632 (Array (_ BitVec 32) (_ BitVec 64))) (size!48182 (_ BitVec 32))) )
))
(declare-fun lt!640119 () array!98688)

(declare-datatypes ((SeekEntryResult!11884 0))(
  ( (MissingZero!11884 (index!49928 (_ BitVec 32))) (Found!11884 (index!49929 (_ BitVec 32))) (Intermediate!11884 (undefined!12696 Bool) (index!49930 (_ BitVec 32)) (x!131525 (_ BitVec 32))) (Undefined!11884) (MissingVacant!11884 (index!49931 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98688 (_ BitVec 32)) SeekEntryResult!11884)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98688 (_ BitVec 32)) SeekEntryResult!11884)

(assert (=> b!1461393 (= e!821597 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640120 intermediateAfterIndex!19 lt!640116 lt!640119 mask!2687) (seekEntryOrOpen!0 lt!640116 lt!640119 mask!2687))))))

(declare-fun b!1461394 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!821593 () Bool)

(declare-fun a!2862 () array!98688)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1461394 (= e!821593 (or (= (select (arr!47632 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47632 a!2862) intermediateBeforeIndex!19) (select (arr!47632 a!2862) j!93))))))

(declare-fun b!1461396 () Bool)

(declare-fun res!991024 () Bool)

(declare-fun e!821592 () Bool)

(assert (=> b!1461396 (=> (not res!991024) (not e!821592))))

(declare-datatypes ((List!34133 0))(
  ( (Nil!34130) (Cons!34129 (h!35479 (_ BitVec 64)) (t!48827 List!34133)) )
))
(declare-fun arrayNoDuplicates!0 (array!98688 (_ BitVec 32) List!34133) Bool)

(assert (=> b!1461396 (= res!991024 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34130))))

(declare-fun b!1461397 () Bool)

(declare-fun res!991030 () Bool)

(declare-fun e!821598 () Bool)

(assert (=> b!1461397 (=> res!991030 e!821598)))

(declare-fun lt!640118 () SeekEntryResult!11884)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98688 (_ BitVec 32)) SeekEntryResult!11884)

(assert (=> b!1461397 (= res!991030 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640120 (select (arr!47632 a!2862) j!93) a!2862 mask!2687) lt!640118)))))

(declare-fun b!1461398 () Bool)

(declare-fun e!821594 () Bool)

(declare-fun e!821595 () Bool)

(assert (=> b!1461398 (= e!821594 e!821595)))

(declare-fun res!991018 () Bool)

(assert (=> b!1461398 (=> (not res!991018) (not e!821595))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461398 (= res!991018 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47632 a!2862) j!93) mask!2687) (select (arr!47632 a!2862) j!93) a!2862 mask!2687) lt!640118))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1461398 (= lt!640118 (Intermediate!11884 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1461399 () Bool)

(declare-fun res!991021 () Bool)

(assert (=> b!1461399 (=> (not res!991021) (not e!821592))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1461399 (= res!991021 (validKeyInArray!0 (select (arr!47632 a!2862) j!93)))))

(declare-fun b!1461400 () Bool)

(declare-fun e!821596 () Bool)

(assert (=> b!1461400 (= e!821596 e!821598)))

(declare-fun res!991017 () Bool)

(assert (=> b!1461400 (=> res!991017 e!821598)))

(assert (=> b!1461400 (= res!991017 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640120 #b00000000000000000000000000000000) (bvsge lt!640120 (size!48182 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461400 (= lt!640120 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1461401 () Bool)

(declare-fun e!821591 () Bool)

(assert (=> b!1461401 (= e!821591 (not e!821596))))

(declare-fun res!991032 () Bool)

(assert (=> b!1461401 (=> res!991032 e!821596)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1461401 (= res!991032 (or (and (= (select (arr!47632 a!2862) index!646) (select (store (arr!47632 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47632 a!2862) index!646) (select (arr!47632 a!2862) j!93))) (= (select (arr!47632 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1461401 e!821593))

(declare-fun res!991029 () Bool)

(assert (=> b!1461401 (=> (not res!991029) (not e!821593))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98688 (_ BitVec 32)) Bool)

(assert (=> b!1461401 (= res!991029 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49264 0))(
  ( (Unit!49265) )
))
(declare-fun lt!640122 () Unit!49264)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98688 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49264)

(assert (=> b!1461401 (= lt!640122 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1461402 () Bool)

(declare-fun res!991019 () Bool)

(assert (=> b!1461402 (=> (not res!991019) (not e!821591))))

(declare-fun e!821600 () Bool)

(assert (=> b!1461402 (= res!991019 e!821600)))

(declare-fun c!134700 () Bool)

(assert (=> b!1461402 (= c!134700 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1461403 () Bool)

(declare-fun res!991020 () Bool)

(assert (=> b!1461403 (=> (not res!991020) (not e!821592))))

(assert (=> b!1461403 (= res!991020 (validKeyInArray!0 (select (arr!47632 a!2862) i!1006)))))

(declare-fun b!1461404 () Bool)

(assert (=> b!1461404 (= e!821598 true)))

(declare-fun lt!640121 () Bool)

(assert (=> b!1461404 (= lt!640121 e!821597)))

(declare-fun c!134699 () Bool)

(assert (=> b!1461404 (= c!134699 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1461405 () Bool)

(declare-fun res!991026 () Bool)

(assert (=> b!1461405 (=> (not res!991026) (not e!821592))))

(assert (=> b!1461405 (= res!991026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!640117 () SeekEntryResult!11884)

(declare-fun b!1461406 () Bool)

(assert (=> b!1461406 (= e!821597 (not (= lt!640117 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640120 lt!640116 lt!640119 mask!2687))))))

(declare-fun b!1461407 () Bool)

(declare-fun res!991016 () Bool)

(assert (=> b!1461407 (=> (not res!991016) (not e!821593))))

(assert (=> b!1461407 (= res!991016 (= (seekEntryOrOpen!0 (select (arr!47632 a!2862) j!93) a!2862 mask!2687) (Found!11884 j!93)))))

(declare-fun b!1461408 () Bool)

(declare-fun res!991028 () Bool)

(assert (=> b!1461408 (=> (not res!991028) (not e!821595))))

(assert (=> b!1461408 (= res!991028 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47632 a!2862) j!93) a!2862 mask!2687) lt!640118))))

(declare-fun b!1461409 () Bool)

(declare-fun res!991023 () Bool)

(assert (=> b!1461409 (=> (not res!991023) (not e!821592))))

(assert (=> b!1461409 (= res!991023 (and (= (size!48182 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48182 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48182 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1461395 () Bool)

(declare-fun res!991027 () Bool)

(assert (=> b!1461395 (=> (not res!991027) (not e!821592))))

(assert (=> b!1461395 (= res!991027 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48182 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48182 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48182 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!991031 () Bool)

(assert (=> start!125240 (=> (not res!991031) (not e!821592))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125240 (= res!991031 (validMask!0 mask!2687))))

(assert (=> start!125240 e!821592))

(assert (=> start!125240 true))

(declare-fun array_inv!36660 (array!98688) Bool)

(assert (=> start!125240 (array_inv!36660 a!2862)))

(declare-fun b!1461410 () Bool)

(assert (=> b!1461410 (= e!821592 e!821594)))

(declare-fun res!991022 () Bool)

(assert (=> b!1461410 (=> (not res!991022) (not e!821594))))

(assert (=> b!1461410 (= res!991022 (= (select (store (arr!47632 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1461410 (= lt!640119 (array!98689 (store (arr!47632 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48182 a!2862)))))

(declare-fun b!1461411 () Bool)

(declare-fun res!991033 () Bool)

(assert (=> b!1461411 (=> (not res!991033) (not e!821591))))

(assert (=> b!1461411 (= res!991033 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1461412 () Bool)

(assert (=> b!1461412 (= e!821595 e!821591)))

(declare-fun res!991025 () Bool)

(assert (=> b!1461412 (=> (not res!991025) (not e!821591))))

(assert (=> b!1461412 (= res!991025 (= lt!640117 (Intermediate!11884 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1461412 (= lt!640117 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640116 mask!2687) lt!640116 lt!640119 mask!2687))))

(assert (=> b!1461412 (= lt!640116 (select (store (arr!47632 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1461413 () Bool)

(assert (=> b!1461413 (= e!821600 (= lt!640117 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640116 lt!640119 mask!2687)))))

(declare-fun b!1461414 () Bool)

(assert (=> b!1461414 (= e!821600 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640116 lt!640119 mask!2687) (seekEntryOrOpen!0 lt!640116 lt!640119 mask!2687)))))

(assert (= (and start!125240 res!991031) b!1461409))

(assert (= (and b!1461409 res!991023) b!1461403))

(assert (= (and b!1461403 res!991020) b!1461399))

(assert (= (and b!1461399 res!991021) b!1461405))

(assert (= (and b!1461405 res!991026) b!1461396))

(assert (= (and b!1461396 res!991024) b!1461395))

(assert (= (and b!1461395 res!991027) b!1461410))

(assert (= (and b!1461410 res!991022) b!1461398))

(assert (= (and b!1461398 res!991018) b!1461408))

(assert (= (and b!1461408 res!991028) b!1461412))

(assert (= (and b!1461412 res!991025) b!1461402))

(assert (= (and b!1461402 c!134700) b!1461413))

(assert (= (and b!1461402 (not c!134700)) b!1461414))

(assert (= (and b!1461402 res!991019) b!1461411))

(assert (= (and b!1461411 res!991033) b!1461401))

(assert (= (and b!1461401 res!991029) b!1461407))

(assert (= (and b!1461407 res!991016) b!1461394))

(assert (= (and b!1461401 (not res!991032)) b!1461400))

(assert (= (and b!1461400 (not res!991017)) b!1461397))

(assert (= (and b!1461397 (not res!991030)) b!1461404))

(assert (= (and b!1461404 c!134699) b!1461406))

(assert (= (and b!1461404 (not c!134699)) b!1461393))

(declare-fun m!1348977 () Bool)

(assert (=> b!1461400 m!1348977))

(declare-fun m!1348979 () Bool)

(assert (=> b!1461414 m!1348979))

(declare-fun m!1348981 () Bool)

(assert (=> b!1461414 m!1348981))

(declare-fun m!1348983 () Bool)

(assert (=> b!1461394 m!1348983))

(declare-fun m!1348985 () Bool)

(assert (=> b!1461394 m!1348985))

(declare-fun m!1348987 () Bool)

(assert (=> b!1461396 m!1348987))

(declare-fun m!1348989 () Bool)

(assert (=> b!1461405 m!1348989))

(declare-fun m!1348991 () Bool)

(assert (=> b!1461413 m!1348991))

(declare-fun m!1348993 () Bool)

(assert (=> b!1461410 m!1348993))

(declare-fun m!1348995 () Bool)

(assert (=> b!1461410 m!1348995))

(assert (=> b!1461407 m!1348985))

(assert (=> b!1461407 m!1348985))

(declare-fun m!1348997 () Bool)

(assert (=> b!1461407 m!1348997))

(assert (=> b!1461408 m!1348985))

(assert (=> b!1461408 m!1348985))

(declare-fun m!1348999 () Bool)

(assert (=> b!1461408 m!1348999))

(declare-fun m!1349001 () Bool)

(assert (=> b!1461406 m!1349001))

(declare-fun m!1349003 () Bool)

(assert (=> b!1461412 m!1349003))

(assert (=> b!1461412 m!1349003))

(declare-fun m!1349005 () Bool)

(assert (=> b!1461412 m!1349005))

(assert (=> b!1461412 m!1348993))

(declare-fun m!1349007 () Bool)

(assert (=> b!1461412 m!1349007))

(assert (=> b!1461397 m!1348985))

(assert (=> b!1461397 m!1348985))

(declare-fun m!1349009 () Bool)

(assert (=> b!1461397 m!1349009))

(declare-fun m!1349011 () Bool)

(assert (=> b!1461393 m!1349011))

(assert (=> b!1461393 m!1348981))

(declare-fun m!1349013 () Bool)

(assert (=> start!125240 m!1349013))

(declare-fun m!1349015 () Bool)

(assert (=> start!125240 m!1349015))

(declare-fun m!1349017 () Bool)

(assert (=> b!1461401 m!1349017))

(assert (=> b!1461401 m!1348993))

(declare-fun m!1349019 () Bool)

(assert (=> b!1461401 m!1349019))

(declare-fun m!1349021 () Bool)

(assert (=> b!1461401 m!1349021))

(declare-fun m!1349023 () Bool)

(assert (=> b!1461401 m!1349023))

(assert (=> b!1461401 m!1348985))

(assert (=> b!1461399 m!1348985))

(assert (=> b!1461399 m!1348985))

(declare-fun m!1349025 () Bool)

(assert (=> b!1461399 m!1349025))

(assert (=> b!1461398 m!1348985))

(assert (=> b!1461398 m!1348985))

(declare-fun m!1349027 () Bool)

(assert (=> b!1461398 m!1349027))

(assert (=> b!1461398 m!1349027))

(assert (=> b!1461398 m!1348985))

(declare-fun m!1349029 () Bool)

(assert (=> b!1461398 m!1349029))

(declare-fun m!1349031 () Bool)

(assert (=> b!1461403 m!1349031))

(assert (=> b!1461403 m!1349031))

(declare-fun m!1349033 () Bool)

(assert (=> b!1461403 m!1349033))

(push 1)

