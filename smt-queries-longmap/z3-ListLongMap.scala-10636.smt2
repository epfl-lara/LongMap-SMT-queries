; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125172 () Bool)

(assert start!125172)

(declare-fun b!1453686 () Bool)

(declare-fun res!983997 () Bool)

(declare-fun e!818440 () Bool)

(assert (=> b!1453686 (=> (not res!983997) (not e!818440))))

(declare-datatypes ((array!98515 0))(
  ( (array!98516 (arr!47542 (Array (_ BitVec 32) (_ BitVec 64))) (size!48093 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98515)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98515 (_ BitVec 32)) Bool)

(assert (=> b!1453686 (= res!983997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453687 () Bool)

(declare-fun res!983998 () Bool)

(assert (=> b!1453687 (=> (not res!983998) (not e!818440))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453687 (= res!983998 (validKeyInArray!0 (select (arr!47542 a!2862) i!1006)))))

(declare-fun b!1453688 () Bool)

(declare-fun e!818444 () Bool)

(assert (=> b!1453688 (= e!818440 e!818444)))

(declare-fun res!983989 () Bool)

(assert (=> b!1453688 (=> (not res!983989) (not e!818444))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1453688 (= res!983989 (= (select (store (arr!47542 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!637402 () array!98515)

(assert (=> b!1453688 (= lt!637402 (array!98516 (store (arr!47542 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48093 a!2862)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!818445 () Bool)

(declare-datatypes ((SeekEntryResult!11691 0))(
  ( (MissingZero!11691 (index!49156 (_ BitVec 32))) (Found!11691 (index!49157 (_ BitVec 32))) (Intermediate!11691 (undefined!12503 Bool) (index!49158 (_ BitVec 32)) (x!130980 (_ BitVec 32))) (Undefined!11691) (MissingVacant!11691 (index!49159 (_ BitVec 32))) )
))
(declare-fun lt!637401 () SeekEntryResult!11691)

(declare-fun lt!637400 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1453689 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98515 (_ BitVec 32)) SeekEntryResult!11691)

(assert (=> b!1453689 (= e!818445 (= lt!637401 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637400 lt!637402 mask!2687)))))

(declare-fun b!1453690 () Bool)

(declare-fun res!983999 () Bool)

(assert (=> b!1453690 (=> (not res!983999) (not e!818440))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1453690 (= res!983999 (and (= (size!48093 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48093 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48093 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1453691 () Bool)

(declare-fun res!984000 () Bool)

(declare-fun e!818439 () Bool)

(assert (=> b!1453691 (=> (not res!984000) (not e!818439))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98515 (_ BitVec 32)) SeekEntryResult!11691)

(assert (=> b!1453691 (= res!984000 (= (seekEntryOrOpen!0 (select (arr!47542 a!2862) j!93) a!2862 mask!2687) (Found!11691 j!93)))))

(declare-fun b!1453692 () Bool)

(declare-fun res!983996 () Bool)

(declare-fun e!818441 () Bool)

(assert (=> b!1453692 (=> (not res!983996) (not e!818441))))

(assert (=> b!1453692 (= res!983996 e!818445)))

(declare-fun c!134368 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1453692 (= c!134368 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1453693 () Bool)

(declare-fun res!983994 () Bool)

(assert (=> b!1453693 (=> (not res!983994) (not e!818440))))

(assert (=> b!1453693 (= res!983994 (validKeyInArray!0 (select (arr!47542 a!2862) j!93)))))

(declare-fun b!1453694 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98515 (_ BitVec 32)) SeekEntryResult!11691)

(assert (=> b!1453694 (= e!818445 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637400 lt!637402 mask!2687) (seekEntryOrOpen!0 lt!637400 lt!637402 mask!2687)))))

(declare-fun b!1453695 () Bool)

(declare-fun res!983988 () Bool)

(declare-fun e!818442 () Bool)

(assert (=> b!1453695 (=> (not res!983988) (not e!818442))))

(declare-fun lt!637398 () SeekEntryResult!11691)

(assert (=> b!1453695 (= res!983988 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47542 a!2862) j!93) a!2862 mask!2687) lt!637398))))

(declare-fun b!1453696 () Bool)

(assert (=> b!1453696 (= e!818442 e!818441)))

(declare-fun res!983995 () Bool)

(assert (=> b!1453696 (=> (not res!983995) (not e!818441))))

(assert (=> b!1453696 (= res!983995 (= lt!637401 (Intermediate!11691 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453696 (= lt!637401 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637400 mask!2687) lt!637400 lt!637402 mask!2687))))

(assert (=> b!1453696 (= lt!637400 (select (store (arr!47542 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!984002 () Bool)

(assert (=> start!125172 (=> (not res!984002) (not e!818440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125172 (= res!984002 (validMask!0 mask!2687))))

(assert (=> start!125172 e!818440))

(assert (=> start!125172 true))

(declare-fun array_inv!36823 (array!98515) Bool)

(assert (=> start!125172 (array_inv!36823 a!2862)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1453697 () Bool)

(assert (=> b!1453697 (= e!818439 (and (or (= (select (arr!47542 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47542 a!2862) intermediateBeforeIndex!19) (select (arr!47542 a!2862) j!93))) (or (and (= (select (arr!47542 a!2862) index!646) (select (store (arr!47542 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47542 a!2862) index!646) (select (arr!47542 a!2862) j!93))) (= (select (arr!47542 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47542 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1453698 () Bool)

(declare-fun res!983990 () Bool)

(assert (=> b!1453698 (=> (not res!983990) (not e!818440))))

(declare-datatypes ((List!34030 0))(
  ( (Nil!34027) (Cons!34026 (h!35387 (_ BitVec 64)) (t!48716 List!34030)) )
))
(declare-fun arrayNoDuplicates!0 (array!98515 (_ BitVec 32) List!34030) Bool)

(assert (=> b!1453698 (= res!983990 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34027))))

(declare-fun b!1453699 () Bool)

(assert (=> b!1453699 (= e!818444 e!818442)))

(declare-fun res!983993 () Bool)

(assert (=> b!1453699 (=> (not res!983993) (not e!818442))))

(assert (=> b!1453699 (= res!983993 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47542 a!2862) j!93) mask!2687) (select (arr!47542 a!2862) j!93) a!2862 mask!2687) lt!637398))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1453699 (= lt!637398 (Intermediate!11691 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1453700 () Bool)

(declare-fun res!983992 () Bool)

(assert (=> b!1453700 (=> (not res!983992) (not e!818441))))

(assert (=> b!1453700 (= res!983992 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1453701 () Bool)

(assert (=> b!1453701 (= e!818441 (not true))))

(assert (=> b!1453701 e!818439))

(declare-fun res!983991 () Bool)

(assert (=> b!1453701 (=> (not res!983991) (not e!818439))))

(assert (=> b!1453701 (= res!983991 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48911 0))(
  ( (Unit!48912) )
))
(declare-fun lt!637399 () Unit!48911)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98515 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48911)

(assert (=> b!1453701 (= lt!637399 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1453702 () Bool)

(declare-fun res!984001 () Bool)

(assert (=> b!1453702 (=> (not res!984001) (not e!818440))))

(assert (=> b!1453702 (= res!984001 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48093 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48093 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48093 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!125172 res!984002) b!1453690))

(assert (= (and b!1453690 res!983999) b!1453687))

(assert (= (and b!1453687 res!983998) b!1453693))

(assert (= (and b!1453693 res!983994) b!1453686))

(assert (= (and b!1453686 res!983997) b!1453698))

(assert (= (and b!1453698 res!983990) b!1453702))

(assert (= (and b!1453702 res!984001) b!1453688))

(assert (= (and b!1453688 res!983989) b!1453699))

(assert (= (and b!1453699 res!983993) b!1453695))

(assert (= (and b!1453695 res!983988) b!1453696))

(assert (= (and b!1453696 res!983995) b!1453692))

(assert (= (and b!1453692 c!134368) b!1453689))

(assert (= (and b!1453692 (not c!134368)) b!1453694))

(assert (= (and b!1453692 res!983996) b!1453700))

(assert (= (and b!1453700 res!983992) b!1453701))

(assert (= (and b!1453701 res!983991) b!1453691))

(assert (= (and b!1453691 res!984000) b!1453697))

(declare-fun m!1342375 () Bool)

(assert (=> b!1453699 m!1342375))

(assert (=> b!1453699 m!1342375))

(declare-fun m!1342377 () Bool)

(assert (=> b!1453699 m!1342377))

(assert (=> b!1453699 m!1342377))

(assert (=> b!1453699 m!1342375))

(declare-fun m!1342379 () Bool)

(assert (=> b!1453699 m!1342379))

(assert (=> b!1453695 m!1342375))

(assert (=> b!1453695 m!1342375))

(declare-fun m!1342381 () Bool)

(assert (=> b!1453695 m!1342381))

(assert (=> b!1453691 m!1342375))

(assert (=> b!1453691 m!1342375))

(declare-fun m!1342383 () Bool)

(assert (=> b!1453691 m!1342383))

(assert (=> b!1453693 m!1342375))

(assert (=> b!1453693 m!1342375))

(declare-fun m!1342385 () Bool)

(assert (=> b!1453693 m!1342385))

(declare-fun m!1342387 () Bool)

(assert (=> b!1453686 m!1342387))

(declare-fun m!1342389 () Bool)

(assert (=> b!1453689 m!1342389))

(declare-fun m!1342391 () Bool)

(assert (=> b!1453687 m!1342391))

(assert (=> b!1453687 m!1342391))

(declare-fun m!1342393 () Bool)

(assert (=> b!1453687 m!1342393))

(declare-fun m!1342395 () Bool)

(assert (=> b!1453697 m!1342395))

(declare-fun m!1342397 () Bool)

(assert (=> b!1453697 m!1342397))

(declare-fun m!1342399 () Bool)

(assert (=> b!1453697 m!1342399))

(declare-fun m!1342401 () Bool)

(assert (=> b!1453697 m!1342401))

(assert (=> b!1453697 m!1342375))

(assert (=> b!1453688 m!1342395))

(declare-fun m!1342403 () Bool)

(assert (=> b!1453688 m!1342403))

(declare-fun m!1342405 () Bool)

(assert (=> b!1453701 m!1342405))

(declare-fun m!1342407 () Bool)

(assert (=> b!1453701 m!1342407))

(declare-fun m!1342409 () Bool)

(assert (=> start!125172 m!1342409))

(declare-fun m!1342411 () Bool)

(assert (=> start!125172 m!1342411))

(declare-fun m!1342413 () Bool)

(assert (=> b!1453698 m!1342413))

(declare-fun m!1342415 () Bool)

(assert (=> b!1453694 m!1342415))

(declare-fun m!1342417 () Bool)

(assert (=> b!1453694 m!1342417))

(declare-fun m!1342419 () Bool)

(assert (=> b!1453696 m!1342419))

(assert (=> b!1453696 m!1342419))

(declare-fun m!1342421 () Bool)

(assert (=> b!1453696 m!1342421))

(assert (=> b!1453696 m!1342395))

(declare-fun m!1342423 () Bool)

(assert (=> b!1453696 m!1342423))

(check-sat (not b!1453691) (not b!1453687) (not b!1453699) (not b!1453698) (not b!1453694) (not b!1453695) (not start!125172) (not b!1453701) (not b!1453689) (not b!1453696) (not b!1453693) (not b!1453686))
(check-sat)
