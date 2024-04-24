; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125214 () Bool)

(assert start!125214)

(declare-fun b!1454853 () Bool)

(declare-fun e!818951 () Bool)

(declare-fun e!818949 () Bool)

(assert (=> b!1454853 (= e!818951 e!818949)))

(declare-fun res!985044 () Bool)

(assert (=> b!1454853 (=> (not res!985044) (not e!818949))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98557 0))(
  ( (array!98558 (arr!47563 (Array (_ BitVec 32) (_ BitVec 64))) (size!48114 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98557)

(assert (=> b!1454853 (= res!985044 (= (select (store (arr!47563 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!637747 () array!98557)

(assert (=> b!1454853 (= lt!637747 (array!98558 (store (arr!47563 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48114 a!2862)))))

(declare-fun res!985045 () Bool)

(assert (=> start!125214 (=> (not res!985045) (not e!818951))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125214 (= res!985045 (validMask!0 mask!2687))))

(assert (=> start!125214 e!818951))

(assert (=> start!125214 true))

(declare-fun array_inv!36844 (array!98557) Bool)

(assert (=> start!125214 (array_inv!36844 a!2862)))

(declare-fun b!1454854 () Bool)

(declare-fun e!818948 () Bool)

(declare-fun e!818954 () Bool)

(assert (=> b!1454854 (= e!818948 e!818954)))

(declare-fun res!985035 () Bool)

(assert (=> b!1454854 (=> (not res!985035) (not e!818954))))

(declare-datatypes ((SeekEntryResult!11712 0))(
  ( (MissingZero!11712 (index!49240 (_ BitVec 32))) (Found!11712 (index!49241 (_ BitVec 32))) (Intermediate!11712 (undefined!12524 Bool) (index!49242 (_ BitVec 32)) (x!131057 (_ BitVec 32))) (Undefined!11712) (MissingVacant!11712 (index!49243 (_ BitVec 32))) )
))
(declare-fun lt!637745 () SeekEntryResult!11712)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1454854 (= res!985035 (= lt!637745 (Intermediate!11712 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!637743 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98557 (_ BitVec 32)) SeekEntryResult!11712)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454854 (= lt!637745 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637743 mask!2687) lt!637743 lt!637747 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1454854 (= lt!637743 (select (store (arr!47563 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1454855 () Bool)

(declare-fun e!818955 () Bool)

(declare-fun e!818952 () Bool)

(assert (=> b!1454855 (= e!818955 e!818952)))

(declare-fun res!985031 () Bool)

(assert (=> b!1454855 (=> (not res!985031) (not e!818952))))

(declare-fun lt!637744 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1454855 (= res!985031 (and (= index!646 intermediateAfterIndex!19) (= lt!637744 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1454856 () Bool)

(declare-fun res!985043 () Bool)

(assert (=> b!1454856 (=> (not res!985043) (not e!818951))))

(assert (=> b!1454856 (= res!985043 (and (= (size!48114 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48114 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48114 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1454857 () Bool)

(declare-fun res!985046 () Bool)

(assert (=> b!1454857 (=> (not res!985046) (not e!818954))))

(declare-fun e!818953 () Bool)

(assert (=> b!1454857 (= res!985046 e!818953)))

(declare-fun c!134431 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1454857 (= c!134431 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1454858 () Bool)

(declare-fun res!985033 () Bool)

(assert (=> b!1454858 (=> (not res!985033) (not e!818948))))

(declare-fun lt!637742 () SeekEntryResult!11712)

(assert (=> b!1454858 (= res!985033 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47563 a!2862) j!93) a!2862 mask!2687) lt!637742))))

(declare-fun b!1454859 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98557 (_ BitVec 32)) SeekEntryResult!11712)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98557 (_ BitVec 32)) SeekEntryResult!11712)

(assert (=> b!1454859 (= e!818952 (= (seekEntryOrOpen!0 lt!637743 lt!637747 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637743 lt!637747 mask!2687)))))

(declare-fun b!1454860 () Bool)

(assert (=> b!1454860 (= e!818949 e!818948)))

(declare-fun res!985036 () Bool)

(assert (=> b!1454860 (=> (not res!985036) (not e!818948))))

(assert (=> b!1454860 (= res!985036 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47563 a!2862) j!93) mask!2687) (select (arr!47563 a!2862) j!93) a!2862 mask!2687) lt!637742))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1454860 (= lt!637742 (Intermediate!11712 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1454861 () Bool)

(declare-fun res!985039 () Bool)

(assert (=> b!1454861 (=> (not res!985039) (not e!818951))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1454861 (= res!985039 (validKeyInArray!0 (select (arr!47563 a!2862) i!1006)))))

(declare-fun b!1454862 () Bool)

(assert (=> b!1454862 (= e!818953 (= lt!637745 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637743 lt!637747 mask!2687)))))

(declare-fun b!1454863 () Bool)

(declare-fun e!818950 () Bool)

(assert (=> b!1454863 (= e!818950 e!818955)))

(declare-fun res!985032 () Bool)

(assert (=> b!1454863 (=> res!985032 e!818955)))

(assert (=> b!1454863 (= res!985032 (or (and (= (select (arr!47563 a!2862) index!646) lt!637744) (= (select (arr!47563 a!2862) index!646) (select (arr!47563 a!2862) j!93))) (= (select (arr!47563 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1454863 (= lt!637744 (select (store (arr!47563 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1454864 () Bool)

(declare-fun res!985030 () Bool)

(assert (=> b!1454864 (=> (not res!985030) (not e!818951))))

(assert (=> b!1454864 (= res!985030 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48114 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48114 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48114 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1454865 () Bool)

(assert (=> b!1454865 (= e!818954 (not (or (and (= (select (arr!47563 a!2862) index!646) (select (store (arr!47563 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47563 a!2862) index!646) (select (arr!47563 a!2862) j!93))) (= (select (arr!47563 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvslt mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000)))))))

(assert (=> b!1454865 e!818950))

(declare-fun res!985037 () Bool)

(assert (=> b!1454865 (=> (not res!985037) (not e!818950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98557 (_ BitVec 32)) Bool)

(assert (=> b!1454865 (= res!985037 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48953 0))(
  ( (Unit!48954) )
))
(declare-fun lt!637746 () Unit!48953)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98557 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48953)

(assert (=> b!1454865 (= lt!637746 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1454866 () Bool)

(declare-fun res!985041 () Bool)

(assert (=> b!1454866 (=> (not res!985041) (not e!818951))))

(assert (=> b!1454866 (= res!985041 (validKeyInArray!0 (select (arr!47563 a!2862) j!93)))))

(declare-fun b!1454867 () Bool)

(declare-fun res!985038 () Bool)

(assert (=> b!1454867 (=> (not res!985038) (not e!818950))))

(assert (=> b!1454867 (= res!985038 (or (= (select (arr!47563 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47563 a!2862) intermediateBeforeIndex!19) (select (arr!47563 a!2862) j!93))))))

(declare-fun b!1454868 () Bool)

(declare-fun res!985042 () Bool)

(assert (=> b!1454868 (=> (not res!985042) (not e!818954))))

(assert (=> b!1454868 (= res!985042 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1454869 () Bool)

(declare-fun res!985029 () Bool)

(assert (=> b!1454869 (=> (not res!985029) (not e!818950))))

(assert (=> b!1454869 (= res!985029 (= (seekEntryOrOpen!0 (select (arr!47563 a!2862) j!93) a!2862 mask!2687) (Found!11712 j!93)))))

(declare-fun b!1454870 () Bool)

(declare-fun res!985040 () Bool)

(assert (=> b!1454870 (=> (not res!985040) (not e!818951))))

(assert (=> b!1454870 (= res!985040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1454871 () Bool)

(declare-fun res!985034 () Bool)

(assert (=> b!1454871 (=> (not res!985034) (not e!818951))))

(declare-datatypes ((List!34051 0))(
  ( (Nil!34048) (Cons!34047 (h!35408 (_ BitVec 64)) (t!48737 List!34051)) )
))
(declare-fun arrayNoDuplicates!0 (array!98557 (_ BitVec 32) List!34051) Bool)

(assert (=> b!1454871 (= res!985034 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34048))))

(declare-fun b!1454872 () Bool)

(assert (=> b!1454872 (= e!818953 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637743 lt!637747 mask!2687) (seekEntryOrOpen!0 lt!637743 lt!637747 mask!2687)))))

(assert (= (and start!125214 res!985045) b!1454856))

(assert (= (and b!1454856 res!985043) b!1454861))

(assert (= (and b!1454861 res!985039) b!1454866))

(assert (= (and b!1454866 res!985041) b!1454870))

(assert (= (and b!1454870 res!985040) b!1454871))

(assert (= (and b!1454871 res!985034) b!1454864))

(assert (= (and b!1454864 res!985030) b!1454853))

(assert (= (and b!1454853 res!985044) b!1454860))

(assert (= (and b!1454860 res!985036) b!1454858))

(assert (= (and b!1454858 res!985033) b!1454854))

(assert (= (and b!1454854 res!985035) b!1454857))

(assert (= (and b!1454857 c!134431) b!1454862))

(assert (= (and b!1454857 (not c!134431)) b!1454872))

(assert (= (and b!1454857 res!985046) b!1454868))

(assert (= (and b!1454868 res!985042) b!1454865))

(assert (= (and b!1454865 res!985037) b!1454869))

(assert (= (and b!1454869 res!985029) b!1454867))

(assert (= (and b!1454867 res!985038) b!1454863))

(assert (= (and b!1454863 (not res!985032)) b!1454855))

(assert (= (and b!1454855 res!985031) b!1454859))

(declare-fun m!1343431 () Bool)

(assert (=> start!125214 m!1343431))

(declare-fun m!1343433 () Bool)

(assert (=> start!125214 m!1343433))

(declare-fun m!1343435 () Bool)

(assert (=> b!1454860 m!1343435))

(assert (=> b!1454860 m!1343435))

(declare-fun m!1343437 () Bool)

(assert (=> b!1454860 m!1343437))

(assert (=> b!1454860 m!1343437))

(assert (=> b!1454860 m!1343435))

(declare-fun m!1343439 () Bool)

(assert (=> b!1454860 m!1343439))

(declare-fun m!1343441 () Bool)

(assert (=> b!1454859 m!1343441))

(declare-fun m!1343443 () Bool)

(assert (=> b!1454859 m!1343443))

(declare-fun m!1343445 () Bool)

(assert (=> b!1454865 m!1343445))

(declare-fun m!1343447 () Bool)

(assert (=> b!1454865 m!1343447))

(declare-fun m!1343449 () Bool)

(assert (=> b!1454865 m!1343449))

(declare-fun m!1343451 () Bool)

(assert (=> b!1454865 m!1343451))

(declare-fun m!1343453 () Bool)

(assert (=> b!1454865 m!1343453))

(assert (=> b!1454865 m!1343435))

(declare-fun m!1343455 () Bool)

(assert (=> b!1454870 m!1343455))

(assert (=> b!1454853 m!1343447))

(declare-fun m!1343457 () Bool)

(assert (=> b!1454853 m!1343457))

(declare-fun m!1343459 () Bool)

(assert (=> b!1454854 m!1343459))

(assert (=> b!1454854 m!1343459))

(declare-fun m!1343461 () Bool)

(assert (=> b!1454854 m!1343461))

(assert (=> b!1454854 m!1343447))

(declare-fun m!1343463 () Bool)

(assert (=> b!1454854 m!1343463))

(declare-fun m!1343465 () Bool)

(assert (=> b!1454867 m!1343465))

(assert (=> b!1454867 m!1343435))

(assert (=> b!1454872 m!1343443))

(assert (=> b!1454872 m!1343441))

(assert (=> b!1454858 m!1343435))

(assert (=> b!1454858 m!1343435))

(declare-fun m!1343467 () Bool)

(assert (=> b!1454858 m!1343467))

(assert (=> b!1454869 m!1343435))

(assert (=> b!1454869 m!1343435))

(declare-fun m!1343469 () Bool)

(assert (=> b!1454869 m!1343469))

(assert (=> b!1454863 m!1343451))

(assert (=> b!1454863 m!1343435))

(assert (=> b!1454863 m!1343447))

(assert (=> b!1454863 m!1343449))

(assert (=> b!1454866 m!1343435))

(assert (=> b!1454866 m!1343435))

(declare-fun m!1343471 () Bool)

(assert (=> b!1454866 m!1343471))

(declare-fun m!1343473 () Bool)

(assert (=> b!1454871 m!1343473))

(declare-fun m!1343475 () Bool)

(assert (=> b!1454862 m!1343475))

(declare-fun m!1343477 () Bool)

(assert (=> b!1454861 m!1343477))

(assert (=> b!1454861 m!1343477))

(declare-fun m!1343479 () Bool)

(assert (=> b!1454861 m!1343479))

(check-sat (not b!1454865) (not b!1454866) (not b!1454858) (not b!1454854) (not start!125214) (not b!1454860) (not b!1454869) (not b!1454870) (not b!1454859) (not b!1454871) (not b!1454872) (not b!1454861) (not b!1454862))
(check-sat)
