; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124932 () Bool)

(assert start!124932)

(declare-fun b!1446991 () Bool)

(declare-fun e!815173 () Bool)

(declare-fun e!815172 () Bool)

(assert (=> b!1446991 (= e!815173 e!815172)))

(declare-fun res!978019 () Bool)

(assert (=> b!1446991 (=> (not res!978019) (not e!815172))))

(declare-datatypes ((SeekEntryResult!11571 0))(
  ( (MissingZero!11571 (index!48676 (_ BitVec 32))) (Found!11571 (index!48677 (_ BitVec 32))) (Intermediate!11571 (undefined!12383 Bool) (index!48678 (_ BitVec 32)) (x!130540 (_ BitVec 32))) (Undefined!11571) (MissingVacant!11571 (index!48679 (_ BitVec 32))) )
))
(declare-fun lt!635044 () SeekEntryResult!11571)

(declare-datatypes ((array!98275 0))(
  ( (array!98276 (arr!47422 (Array (_ BitVec 32) (_ BitVec 64))) (size!47973 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98275)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98275 (_ BitVec 32)) SeekEntryResult!11571)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446991 (= res!978019 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47422 a!2862) j!93) mask!2687) (select (arr!47422 a!2862) j!93) a!2862 mask!2687) lt!635044))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1446991 (= lt!635044 (Intermediate!11571 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1446992 () Bool)

(declare-fun res!978018 () Bool)

(declare-fun e!815177 () Bool)

(assert (=> b!1446992 (=> (not res!978018) (not e!815177))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1446992 (= res!978018 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47973 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47973 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47973 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1446993 () Bool)

(declare-fun res!978017 () Bool)

(assert (=> b!1446993 (=> (not res!978017) (not e!815177))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446993 (= res!978017 (validKeyInArray!0 (select (arr!47422 a!2862) j!93)))))

(declare-fun b!1446994 () Bool)

(declare-fun res!978014 () Bool)

(declare-fun e!815174 () Bool)

(assert (=> b!1446994 (=> (not res!978014) (not e!815174))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98275 (_ BitVec 32)) SeekEntryResult!11571)

(assert (=> b!1446994 (= res!978014 (= (seekEntryOrOpen!0 (select (arr!47422 a!2862) j!93) a!2862 mask!2687) (Found!11571 j!93)))))

(declare-fun b!1446995 () Bool)

(declare-fun res!978012 () Bool)

(assert (=> b!1446995 (=> (not res!978012) (not e!815177))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98275 (_ BitVec 32)) Bool)

(assert (=> b!1446995 (= res!978012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446996 () Bool)

(declare-fun res!978020 () Bool)

(assert (=> b!1446996 (=> (not res!978020) (not e!815177))))

(declare-datatypes ((List!33910 0))(
  ( (Nil!33907) (Cons!33906 (h!35267 (_ BitVec 64)) (t!48596 List!33910)) )
))
(declare-fun arrayNoDuplicates!0 (array!98275 (_ BitVec 32) List!33910) Bool)

(assert (=> b!1446996 (= res!978020 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33907))))

(declare-fun b!1446997 () Bool)

(declare-fun e!815175 () Bool)

(assert (=> b!1446997 (= e!815172 e!815175)))

(declare-fun res!978016 () Bool)

(assert (=> b!1446997 (=> (not res!978016) (not e!815175))))

(declare-fun lt!635040 () SeekEntryResult!11571)

(assert (=> b!1446997 (= res!978016 (= lt!635040 (Intermediate!11571 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!635041 () array!98275)

(declare-fun lt!635042 () (_ BitVec 64))

(assert (=> b!1446997 (= lt!635040 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635042 mask!2687) lt!635042 lt!635041 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1446997 (= lt!635042 (select (store (arr!47422 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446998 () Bool)

(declare-fun res!978025 () Bool)

(assert (=> b!1446998 (=> (not res!978025) (not e!815175))))

(assert (=> b!1446998 (= res!978025 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446999 () Bool)

(declare-fun res!978021 () Bool)

(assert (=> b!1446999 (=> (not res!978021) (not e!815177))))

(assert (=> b!1446999 (= res!978021 (validKeyInArray!0 (select (arr!47422 a!2862) i!1006)))))

(declare-fun b!1447000 () Bool)

(declare-fun e!815178 () Bool)

(assert (=> b!1447000 (= e!815178 (= lt!635040 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635042 lt!635041 mask!2687)))))

(declare-fun b!1447001 () Bool)

(declare-fun res!978023 () Bool)

(assert (=> b!1447001 (=> (not res!978023) (not e!815175))))

(assert (=> b!1447001 (= res!978023 e!815178)))

(declare-fun c!134008 () Bool)

(assert (=> b!1447001 (= c!134008 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447002 () Bool)

(declare-fun res!978026 () Bool)

(assert (=> b!1447002 (=> (not res!978026) (not e!815172))))

(assert (=> b!1447002 (= res!978026 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47422 a!2862) j!93) a!2862 mask!2687) lt!635044))))

(declare-fun b!1447003 () Bool)

(assert (=> b!1447003 (= e!815175 (not (or (and (= (select (arr!47422 a!2862) index!646) (select (store (arr!47422 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47422 a!2862) index!646) (select (arr!47422 a!2862) j!93))) (not (= (select (arr!47422 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(assert (=> b!1447003 e!815174))

(declare-fun res!978013 () Bool)

(assert (=> b!1447003 (=> (not res!978013) (not e!815174))))

(assert (=> b!1447003 (= res!978013 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48671 0))(
  ( (Unit!48672) )
))
(declare-fun lt!635043 () Unit!48671)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98275 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48671)

(assert (=> b!1447003 (= lt!635043 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447004 () Bool)

(assert (=> b!1447004 (= e!815177 e!815173)))

(declare-fun res!978015 () Bool)

(assert (=> b!1447004 (=> (not res!978015) (not e!815173))))

(assert (=> b!1447004 (= res!978015 (= (select (store (arr!47422 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1447004 (= lt!635041 (array!98276 (store (arr!47422 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47973 a!2862)))))

(declare-fun res!978022 () Bool)

(assert (=> start!124932 (=> (not res!978022) (not e!815177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124932 (= res!978022 (validMask!0 mask!2687))))

(assert (=> start!124932 e!815177))

(assert (=> start!124932 true))

(declare-fun array_inv!36703 (array!98275) Bool)

(assert (=> start!124932 (array_inv!36703 a!2862)))

(declare-fun b!1446990 () Bool)

(assert (=> b!1446990 (= e!815174 (or (= (select (arr!47422 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47422 a!2862) intermediateBeforeIndex!19) (select (arr!47422 a!2862) j!93))))))

(declare-fun b!1447005 () Bool)

(declare-fun res!978024 () Bool)

(assert (=> b!1447005 (=> (not res!978024) (not e!815177))))

(assert (=> b!1447005 (= res!978024 (and (= (size!47973 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47973 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47973 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1447006 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98275 (_ BitVec 32)) SeekEntryResult!11571)

(assert (=> b!1447006 (= e!815178 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635042 lt!635041 mask!2687) (seekEntryOrOpen!0 lt!635042 lt!635041 mask!2687)))))

(assert (= (and start!124932 res!978022) b!1447005))

(assert (= (and b!1447005 res!978024) b!1446999))

(assert (= (and b!1446999 res!978021) b!1446993))

(assert (= (and b!1446993 res!978017) b!1446995))

(assert (= (and b!1446995 res!978012) b!1446996))

(assert (= (and b!1446996 res!978020) b!1446992))

(assert (= (and b!1446992 res!978018) b!1447004))

(assert (= (and b!1447004 res!978015) b!1446991))

(assert (= (and b!1446991 res!978019) b!1447002))

(assert (= (and b!1447002 res!978026) b!1446997))

(assert (= (and b!1446997 res!978016) b!1447001))

(assert (= (and b!1447001 c!134008) b!1447000))

(assert (= (and b!1447001 (not c!134008)) b!1447006))

(assert (= (and b!1447001 res!978023) b!1446998))

(assert (= (and b!1446998 res!978025) b!1447003))

(assert (= (and b!1447003 res!978013) b!1446994))

(assert (= (and b!1446994 res!978014) b!1446990))

(declare-fun m!1336039 () Bool)

(assert (=> b!1446997 m!1336039))

(assert (=> b!1446997 m!1336039))

(declare-fun m!1336041 () Bool)

(assert (=> b!1446997 m!1336041))

(declare-fun m!1336043 () Bool)

(assert (=> b!1446997 m!1336043))

(declare-fun m!1336045 () Bool)

(assert (=> b!1446997 m!1336045))

(declare-fun m!1336047 () Bool)

(assert (=> b!1447002 m!1336047))

(assert (=> b!1447002 m!1336047))

(declare-fun m!1336049 () Bool)

(assert (=> b!1447002 m!1336049))

(declare-fun m!1336051 () Bool)

(assert (=> b!1447000 m!1336051))

(declare-fun m!1336053 () Bool)

(assert (=> b!1446995 m!1336053))

(assert (=> b!1446991 m!1336047))

(assert (=> b!1446991 m!1336047))

(declare-fun m!1336055 () Bool)

(assert (=> b!1446991 m!1336055))

(assert (=> b!1446991 m!1336055))

(assert (=> b!1446991 m!1336047))

(declare-fun m!1336057 () Bool)

(assert (=> b!1446991 m!1336057))

(declare-fun m!1336059 () Bool)

(assert (=> b!1446996 m!1336059))

(declare-fun m!1336061 () Bool)

(assert (=> b!1447003 m!1336061))

(assert (=> b!1447003 m!1336043))

(declare-fun m!1336063 () Bool)

(assert (=> b!1447003 m!1336063))

(declare-fun m!1336065 () Bool)

(assert (=> b!1447003 m!1336065))

(declare-fun m!1336067 () Bool)

(assert (=> b!1447003 m!1336067))

(assert (=> b!1447003 m!1336047))

(declare-fun m!1336069 () Bool)

(assert (=> b!1447006 m!1336069))

(declare-fun m!1336071 () Bool)

(assert (=> b!1447006 m!1336071))

(assert (=> b!1446993 m!1336047))

(assert (=> b!1446993 m!1336047))

(declare-fun m!1336073 () Bool)

(assert (=> b!1446993 m!1336073))

(declare-fun m!1336075 () Bool)

(assert (=> start!124932 m!1336075))

(declare-fun m!1336077 () Bool)

(assert (=> start!124932 m!1336077))

(declare-fun m!1336079 () Bool)

(assert (=> b!1446999 m!1336079))

(assert (=> b!1446999 m!1336079))

(declare-fun m!1336081 () Bool)

(assert (=> b!1446999 m!1336081))

(assert (=> b!1447004 m!1336043))

(declare-fun m!1336083 () Bool)

(assert (=> b!1447004 m!1336083))

(declare-fun m!1336085 () Bool)

(assert (=> b!1446990 m!1336085))

(assert (=> b!1446990 m!1336047))

(assert (=> b!1446994 m!1336047))

(assert (=> b!1446994 m!1336047))

(declare-fun m!1336087 () Bool)

(assert (=> b!1446994 m!1336087))

(check-sat (not start!124932) (not b!1446999) (not b!1447003) (not b!1446994) (not b!1447006) (not b!1446991) (not b!1447002) (not b!1447000) (not b!1446993) (not b!1446995) (not b!1446996) (not b!1446997))
(check-sat)
