; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124764 () Bool)

(assert start!124764)

(declare-fun b!1442743 () Bool)

(declare-fun res!974274 () Bool)

(declare-fun e!813401 () Bool)

(assert (=> b!1442743 (=> (not res!974274) (not e!813401))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98107 0))(
  ( (array!98108 (arr!47338 (Array (_ BitVec 32) (_ BitVec 64))) (size!47889 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98107)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1442743 (= res!974274 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47889 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47889 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47889 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1442745 () Bool)

(declare-fun res!974270 () Bool)

(assert (=> b!1442745 (=> (not res!974270) (not e!813401))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442745 (= res!974270 (validKeyInArray!0 (select (arr!47338 a!2862) i!1006)))))

(declare-fun lt!633711 () array!98107)

(declare-fun b!1442746 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!633708 () (_ BitVec 64))

(declare-fun e!813398 () Bool)

(declare-datatypes ((SeekEntryResult!11487 0))(
  ( (MissingZero!11487 (index!48340 (_ BitVec 32))) (Found!11487 (index!48341 (_ BitVec 32))) (Intermediate!11487 (undefined!12299 Bool) (index!48342 (_ BitVec 32)) (x!130232 (_ BitVec 32))) (Undefined!11487) (MissingVacant!11487 (index!48343 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98107 (_ BitVec 32)) SeekEntryResult!11487)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98107 (_ BitVec 32)) SeekEntryResult!11487)

(assert (=> b!1442746 (= e!813398 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633708 lt!633711 mask!2687) (seekEntryOrOpen!0 lt!633708 lt!633711 mask!2687))))))

(declare-fun b!1442747 () Bool)

(declare-fun res!974275 () Bool)

(assert (=> b!1442747 (=> (not res!974275) (not e!813401))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1442747 (= res!974275 (validKeyInArray!0 (select (arr!47338 a!2862) j!93)))))

(declare-fun b!1442748 () Bool)

(declare-fun res!974271 () Bool)

(assert (=> b!1442748 (=> (not res!974271) (not e!813401))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98107 (_ BitVec 32)) Bool)

(assert (=> b!1442748 (= res!974271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442749 () Bool)

(declare-fun res!974272 () Bool)

(assert (=> b!1442749 (=> (not res!974272) (not e!813401))))

(assert (=> b!1442749 (= res!974272 (and (= (size!47889 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47889 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47889 a!2862)) (not (= i!1006 j!93))))))

(declare-fun lt!633709 () SeekEntryResult!11487)

(declare-fun b!1442750 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98107 (_ BitVec 32)) SeekEntryResult!11487)

(assert (=> b!1442750 (= e!813398 (not (= lt!633709 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633708 lt!633711 mask!2687))))))

(declare-fun b!1442751 () Bool)

(declare-fun e!813402 () Bool)

(assert (=> b!1442751 (= e!813401 e!813402)))

(declare-fun res!974276 () Bool)

(assert (=> b!1442751 (=> (not res!974276) (not e!813402))))

(assert (=> b!1442751 (= res!974276 (= (select (store (arr!47338 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442751 (= lt!633711 (array!98108 (store (arr!47338 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47889 a!2862)))))

(declare-fun res!974269 () Bool)

(assert (=> start!124764 (=> (not res!974269) (not e!813401))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124764 (= res!974269 (validMask!0 mask!2687))))

(assert (=> start!124764 e!813401))

(assert (=> start!124764 true))

(declare-fun array_inv!36619 (array!98107) Bool)

(assert (=> start!124764 (array_inv!36619 a!2862)))

(declare-fun b!1442744 () Bool)

(declare-fun res!974273 () Bool)

(declare-fun e!813397 () Bool)

(assert (=> b!1442744 (=> (not res!974273) (not e!813397))))

(declare-fun lt!633710 () SeekEntryResult!11487)

(assert (=> b!1442744 (= res!974273 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47338 a!2862) j!93) a!2862 mask!2687) lt!633710))))

(declare-fun b!1442752 () Bool)

(assert (=> b!1442752 (= e!813402 e!813397)))

(declare-fun res!974279 () Bool)

(assert (=> b!1442752 (=> (not res!974279) (not e!813397))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442752 (= res!974279 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47338 a!2862) j!93) mask!2687) (select (arr!47338 a!2862) j!93) a!2862 mask!2687) lt!633710))))

(assert (=> b!1442752 (= lt!633710 (Intermediate!11487 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442753 () Bool)

(declare-fun e!813399 () Bool)

(assert (=> b!1442753 (= e!813397 e!813399)))

(declare-fun res!974278 () Bool)

(assert (=> b!1442753 (=> (not res!974278) (not e!813399))))

(assert (=> b!1442753 (= res!974278 (= lt!633709 (Intermediate!11487 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1442753 (= lt!633709 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633708 mask!2687) lt!633708 lt!633711 mask!2687))))

(assert (=> b!1442753 (= lt!633708 (select (store (arr!47338 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1442754 () Bool)

(assert (=> b!1442754 (= e!813399 false)))

(declare-fun lt!633712 () Bool)

(assert (=> b!1442754 (= lt!633712 e!813398)))

(declare-fun c!133756 () Bool)

(assert (=> b!1442754 (= c!133756 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442755 () Bool)

(declare-fun res!974277 () Bool)

(assert (=> b!1442755 (=> (not res!974277) (not e!813401))))

(declare-datatypes ((List!33826 0))(
  ( (Nil!33823) (Cons!33822 (h!35183 (_ BitVec 64)) (t!48512 List!33826)) )
))
(declare-fun arrayNoDuplicates!0 (array!98107 (_ BitVec 32) List!33826) Bool)

(assert (=> b!1442755 (= res!974277 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33823))))

(assert (= (and start!124764 res!974269) b!1442749))

(assert (= (and b!1442749 res!974272) b!1442745))

(assert (= (and b!1442745 res!974270) b!1442747))

(assert (= (and b!1442747 res!974275) b!1442748))

(assert (= (and b!1442748 res!974271) b!1442755))

(assert (= (and b!1442755 res!974277) b!1442743))

(assert (= (and b!1442743 res!974274) b!1442751))

(assert (= (and b!1442751 res!974276) b!1442752))

(assert (= (and b!1442752 res!974279) b!1442744))

(assert (= (and b!1442744 res!974273) b!1442753))

(assert (= (and b!1442753 res!974278) b!1442754))

(assert (= (and b!1442754 c!133756) b!1442750))

(assert (= (and b!1442754 (not c!133756)) b!1442746))

(declare-fun m!1332079 () Bool)

(assert (=> b!1442751 m!1332079))

(declare-fun m!1332081 () Bool)

(assert (=> b!1442751 m!1332081))

(declare-fun m!1332083 () Bool)

(assert (=> b!1442745 m!1332083))

(assert (=> b!1442745 m!1332083))

(declare-fun m!1332085 () Bool)

(assert (=> b!1442745 m!1332085))

(declare-fun m!1332087 () Bool)

(assert (=> b!1442746 m!1332087))

(declare-fun m!1332089 () Bool)

(assert (=> b!1442746 m!1332089))

(declare-fun m!1332091 () Bool)

(assert (=> b!1442744 m!1332091))

(assert (=> b!1442744 m!1332091))

(declare-fun m!1332093 () Bool)

(assert (=> b!1442744 m!1332093))

(declare-fun m!1332095 () Bool)

(assert (=> start!124764 m!1332095))

(declare-fun m!1332097 () Bool)

(assert (=> start!124764 m!1332097))

(assert (=> b!1442747 m!1332091))

(assert (=> b!1442747 m!1332091))

(declare-fun m!1332099 () Bool)

(assert (=> b!1442747 m!1332099))

(declare-fun m!1332101 () Bool)

(assert (=> b!1442755 m!1332101))

(assert (=> b!1442752 m!1332091))

(assert (=> b!1442752 m!1332091))

(declare-fun m!1332103 () Bool)

(assert (=> b!1442752 m!1332103))

(assert (=> b!1442752 m!1332103))

(assert (=> b!1442752 m!1332091))

(declare-fun m!1332105 () Bool)

(assert (=> b!1442752 m!1332105))

(declare-fun m!1332107 () Bool)

(assert (=> b!1442750 m!1332107))

(declare-fun m!1332109 () Bool)

(assert (=> b!1442753 m!1332109))

(assert (=> b!1442753 m!1332109))

(declare-fun m!1332111 () Bool)

(assert (=> b!1442753 m!1332111))

(assert (=> b!1442753 m!1332079))

(declare-fun m!1332113 () Bool)

(assert (=> b!1442753 m!1332113))

(declare-fun m!1332115 () Bool)

(assert (=> b!1442748 m!1332115))

(check-sat (not b!1442744) (not b!1442747) (not b!1442752) (not b!1442748) (not b!1442750) (not start!124764) (not b!1442745) (not b!1442755) (not b!1442753) (not b!1442746))
(check-sat)
