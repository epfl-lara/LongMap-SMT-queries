; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124744 () Bool)

(assert start!124744)

(declare-fun b!1447092 () Bool)

(declare-fun res!978888 () Bool)

(declare-fun e!814995 () Bool)

(assert (=> b!1447092 (=> (not res!978888) (not e!814995))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11651 0))(
  ( (MissingZero!11651 (index!48996 (_ BitVec 32))) (Found!11651 (index!48997 (_ BitVec 32))) (Intermediate!11651 (undefined!12463 Bool) (index!48998 (_ BitVec 32)) (x!130671 (_ BitVec 32))) (Undefined!11651) (MissingVacant!11651 (index!48999 (_ BitVec 32))) )
))
(declare-fun lt!634873 () SeekEntryResult!11651)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98170 0))(
  ( (array!98171 (arr!47374 (Array (_ BitVec 32) (_ BitVec 64))) (size!47926 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98170)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98170 (_ BitVec 32)) SeekEntryResult!11651)

(assert (=> b!1447092 (= res!978888 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47374 a!2862) j!93) a!2862 mask!2687) lt!634873))))

(declare-fun b!1447093 () Bool)

(declare-fun e!814989 () Bool)

(declare-fun e!814998 () Bool)

(assert (=> b!1447093 (= e!814989 e!814998)))

(declare-fun res!978887 () Bool)

(assert (=> b!1447093 (=> res!978887 e!814998)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1447093 (= res!978887 (or (and (= (select (arr!47374 a!2862) index!646) (select (store (arr!47374 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47374 a!2862) index!646) (select (arr!47374 a!2862) j!93))) (not (= (select (arr!47374 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!634874 () (_ BitVec 64))

(declare-fun lt!634875 () array!98170)

(declare-fun e!814992 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1447094 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98170 (_ BitVec 32)) SeekEntryResult!11651)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98170 (_ BitVec 32)) SeekEntryResult!11651)

(assert (=> b!1447094 (= e!814992 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634874 lt!634875 mask!2687) (seekEntryOrOpen!0 lt!634874 lt!634875 mask!2687)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1447095 () Bool)

(declare-fun e!814990 () Bool)

(assert (=> b!1447095 (= e!814990 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1447096 () Bool)

(declare-fun res!978886 () Bool)

(declare-fun e!814993 () Bool)

(assert (=> b!1447096 (=> (not res!978886) (not e!814993))))

(declare-datatypes ((List!33953 0))(
  ( (Nil!33950) (Cons!33949 (h!35299 (_ BitVec 64)) (t!48639 List!33953)) )
))
(declare-fun arrayNoDuplicates!0 (array!98170 (_ BitVec 32) List!33953) Bool)

(assert (=> b!1447096 (= res!978886 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33950))))

(declare-fun res!978876 () Bool)

(assert (=> start!124744 (=> (not res!978876) (not e!814993))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124744 (= res!978876 (validMask!0 mask!2687))))

(assert (=> start!124744 e!814993))

(assert (=> start!124744 true))

(declare-fun array_inv!36607 (array!98170) Bool)

(assert (=> start!124744 (array_inv!36607 a!2862)))

(declare-fun b!1447097 () Bool)

(declare-fun e!814991 () Bool)

(assert (=> b!1447097 (= e!814991 e!814995)))

(declare-fun res!978891 () Bool)

(assert (=> b!1447097 (=> (not res!978891) (not e!814995))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447097 (= res!978891 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47374 a!2862) j!93) mask!2687) (select (arr!47374 a!2862) j!93) a!2862 mask!2687) lt!634873))))

(assert (=> b!1447097 (= lt!634873 (Intermediate!11651 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1447098 () Bool)

(declare-fun lt!634878 () SeekEntryResult!11651)

(assert (=> b!1447098 (= e!814992 (= lt!634878 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634874 lt!634875 mask!2687)))))

(declare-fun b!1447099 () Bool)

(declare-fun e!814997 () Bool)

(declare-fun e!814996 () Bool)

(assert (=> b!1447099 (= e!814997 (not e!814996))))

(declare-fun res!978884 () Bool)

(assert (=> b!1447099 (=> res!978884 e!814996)))

(assert (=> b!1447099 (= res!978884 (or (and (= (select (arr!47374 a!2862) index!646) (select (store (arr!47374 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47374 a!2862) index!646) (select (arr!47374 a!2862) j!93))) (not (= (select (arr!47374 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47374 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1447099 e!814989))

(declare-fun res!978878 () Bool)

(assert (=> b!1447099 (=> (not res!978878) (not e!814989))))

(declare-fun lt!634877 () SeekEntryResult!11651)

(assert (=> b!1447099 (= res!978878 (and (= lt!634877 (Found!11651 j!93)) (or (= (select (arr!47374 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47374 a!2862) intermediateBeforeIndex!19) (select (arr!47374 a!2862) j!93)))))))

(assert (=> b!1447099 (= lt!634877 (seekEntryOrOpen!0 (select (arr!47374 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98170 (_ BitVec 32)) Bool)

(assert (=> b!1447099 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48639 0))(
  ( (Unit!48640) )
))
(declare-fun lt!634872 () Unit!48639)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98170 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48639)

(assert (=> b!1447099 (= lt!634872 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447100 () Bool)

(declare-fun res!978889 () Bool)

(assert (=> b!1447100 (=> (not res!978889) (not e!814993))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447100 (= res!978889 (validKeyInArray!0 (select (arr!47374 a!2862) i!1006)))))

(declare-fun b!1447101 () Bool)

(assert (=> b!1447101 (= e!814995 e!814997)))

(declare-fun res!978890 () Bool)

(assert (=> b!1447101 (=> (not res!978890) (not e!814997))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1447101 (= res!978890 (= lt!634878 (Intermediate!11651 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1447101 (= lt!634878 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634874 mask!2687) lt!634874 lt!634875 mask!2687))))

(assert (=> b!1447101 (= lt!634874 (select (store (arr!47374 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1447102 () Bool)

(declare-fun res!978885 () Bool)

(assert (=> b!1447102 (=> (not res!978885) (not e!814993))))

(assert (=> b!1447102 (= res!978885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447103 () Bool)

(declare-fun res!978880 () Bool)

(assert (=> b!1447103 (=> (not res!978880) (not e!814993))))

(assert (=> b!1447103 (= res!978880 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47926 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47926 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47926 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1447104 () Bool)

(declare-fun res!978892 () Bool)

(assert (=> b!1447104 (=> (not res!978892) (not e!814993))))

(assert (=> b!1447104 (= res!978892 (validKeyInArray!0 (select (arr!47374 a!2862) j!93)))))

(declare-fun b!1447105 () Bool)

(assert (=> b!1447105 (= e!814998 e!814990)))

(declare-fun res!978881 () Bool)

(assert (=> b!1447105 (=> (not res!978881) (not e!814990))))

(assert (=> b!1447105 (= res!978881 (= lt!634877 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47374 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1447106 () Bool)

(declare-fun res!978879 () Bool)

(assert (=> b!1447106 (=> (not res!978879) (not e!814997))))

(assert (=> b!1447106 (= res!978879 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447107 () Bool)

(assert (=> b!1447107 (= e!814996 true)))

(declare-fun lt!634876 () SeekEntryResult!11651)

(assert (=> b!1447107 (= lt!634876 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47374 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1447108 () Bool)

(declare-fun res!978883 () Bool)

(assert (=> b!1447108 (=> (not res!978883) (not e!814993))))

(assert (=> b!1447108 (= res!978883 (and (= (size!47926 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47926 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47926 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1447109 () Bool)

(declare-fun res!978877 () Bool)

(assert (=> b!1447109 (=> (not res!978877) (not e!814997))))

(assert (=> b!1447109 (= res!978877 e!814992)))

(declare-fun c!133621 () Bool)

(assert (=> b!1447109 (= c!133621 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447110 () Bool)

(assert (=> b!1447110 (= e!814993 e!814991)))

(declare-fun res!978882 () Bool)

(assert (=> b!1447110 (=> (not res!978882) (not e!814991))))

(assert (=> b!1447110 (= res!978882 (= (select (store (arr!47374 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1447110 (= lt!634875 (array!98171 (store (arr!47374 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47926 a!2862)))))

(assert (= (and start!124744 res!978876) b!1447108))

(assert (= (and b!1447108 res!978883) b!1447100))

(assert (= (and b!1447100 res!978889) b!1447104))

(assert (= (and b!1447104 res!978892) b!1447102))

(assert (= (and b!1447102 res!978885) b!1447096))

(assert (= (and b!1447096 res!978886) b!1447103))

(assert (= (and b!1447103 res!978880) b!1447110))

(assert (= (and b!1447110 res!978882) b!1447097))

(assert (= (and b!1447097 res!978891) b!1447092))

(assert (= (and b!1447092 res!978888) b!1447101))

(assert (= (and b!1447101 res!978890) b!1447109))

(assert (= (and b!1447109 c!133621) b!1447098))

(assert (= (and b!1447109 (not c!133621)) b!1447094))

(assert (= (and b!1447109 res!978877) b!1447106))

(assert (= (and b!1447106 res!978879) b!1447099))

(assert (= (and b!1447099 res!978878) b!1447093))

(assert (= (and b!1447093 (not res!978887)) b!1447105))

(assert (= (and b!1447105 res!978881) b!1447095))

(assert (= (and b!1447099 (not res!978884)) b!1447107))

(declare-fun m!1335435 () Bool)

(assert (=> b!1447102 m!1335435))

(declare-fun m!1335437 () Bool)

(assert (=> b!1447094 m!1335437))

(declare-fun m!1335439 () Bool)

(assert (=> b!1447094 m!1335439))

(declare-fun m!1335441 () Bool)

(assert (=> b!1447107 m!1335441))

(assert (=> b!1447107 m!1335441))

(declare-fun m!1335443 () Bool)

(assert (=> b!1447107 m!1335443))

(assert (=> b!1447105 m!1335441))

(assert (=> b!1447105 m!1335441))

(declare-fun m!1335445 () Bool)

(assert (=> b!1447105 m!1335445))

(declare-fun m!1335447 () Bool)

(assert (=> b!1447110 m!1335447))

(declare-fun m!1335449 () Bool)

(assert (=> b!1447110 m!1335449))

(declare-fun m!1335451 () Bool)

(assert (=> start!124744 m!1335451))

(declare-fun m!1335453 () Bool)

(assert (=> start!124744 m!1335453))

(declare-fun m!1335455 () Bool)

(assert (=> b!1447100 m!1335455))

(assert (=> b!1447100 m!1335455))

(declare-fun m!1335457 () Bool)

(assert (=> b!1447100 m!1335457))

(assert (=> b!1447097 m!1335441))

(assert (=> b!1447097 m!1335441))

(declare-fun m!1335459 () Bool)

(assert (=> b!1447097 m!1335459))

(assert (=> b!1447097 m!1335459))

(assert (=> b!1447097 m!1335441))

(declare-fun m!1335461 () Bool)

(assert (=> b!1447097 m!1335461))

(assert (=> b!1447092 m!1335441))

(assert (=> b!1447092 m!1335441))

(declare-fun m!1335463 () Bool)

(assert (=> b!1447092 m!1335463))

(declare-fun m!1335465 () Bool)

(assert (=> b!1447099 m!1335465))

(assert (=> b!1447099 m!1335447))

(declare-fun m!1335467 () Bool)

(assert (=> b!1447099 m!1335467))

(declare-fun m!1335469 () Bool)

(assert (=> b!1447099 m!1335469))

(declare-fun m!1335471 () Bool)

(assert (=> b!1447099 m!1335471))

(assert (=> b!1447099 m!1335441))

(declare-fun m!1335473 () Bool)

(assert (=> b!1447099 m!1335473))

(declare-fun m!1335475 () Bool)

(assert (=> b!1447099 m!1335475))

(assert (=> b!1447099 m!1335441))

(assert (=> b!1447104 m!1335441))

(assert (=> b!1447104 m!1335441))

(declare-fun m!1335477 () Bool)

(assert (=> b!1447104 m!1335477))

(declare-fun m!1335479 () Bool)

(assert (=> b!1447101 m!1335479))

(assert (=> b!1447101 m!1335479))

(declare-fun m!1335481 () Bool)

(assert (=> b!1447101 m!1335481))

(assert (=> b!1447101 m!1335447))

(declare-fun m!1335483 () Bool)

(assert (=> b!1447101 m!1335483))

(declare-fun m!1335485 () Bool)

(assert (=> b!1447098 m!1335485))

(assert (=> b!1447093 m!1335471))

(assert (=> b!1447093 m!1335447))

(assert (=> b!1447093 m!1335469))

(assert (=> b!1447093 m!1335441))

(declare-fun m!1335487 () Bool)

(assert (=> b!1447096 m!1335487))

(check-sat (not b!1447100) (not b!1447105) (not start!124744) (not b!1447094) (not b!1447096) (not b!1447097) (not b!1447098) (not b!1447102) (not b!1447092) (not b!1447099) (not b!1447104) (not b!1447107) (not b!1447101))
(check-sat)
