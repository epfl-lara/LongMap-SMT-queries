; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124650 () Bool)

(assert start!124650)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98098 0))(
  ( (array!98099 (arr!47337 (Array (_ BitVec 32) (_ BitVec 64))) (size!47887 (_ BitVec 32))) )
))
(declare-fun lt!634051 () array!98098)

(declare-datatypes ((SeekEntryResult!11589 0))(
  ( (MissingZero!11589 (index!48748 (_ BitVec 32))) (Found!11589 (index!48749 (_ BitVec 32))) (Intermediate!11589 (undefined!12401 Bool) (index!48750 (_ BitVec 32)) (x!130446 (_ BitVec 32))) (Undefined!11589) (MissingVacant!11589 (index!48751 (_ BitVec 32))) )
))
(declare-fun lt!634056 () SeekEntryResult!11589)

(declare-fun lt!634053 () (_ BitVec 64))

(declare-fun b!1444009 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!813656 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98098 (_ BitVec 32)) SeekEntryResult!11589)

(assert (=> b!1444009 (= e!813656 (= lt!634056 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634053 lt!634051 mask!2687)))))

(declare-fun b!1444010 () Bool)

(declare-fun res!976051 () Bool)

(declare-fun e!813654 () Bool)

(assert (=> b!1444010 (=> (not res!976051) (not e!813654))))

(declare-fun a!2862 () array!98098)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98098 (_ BitVec 32)) SeekEntryResult!11589)

(assert (=> b!1444010 (= res!976051 (= (seekEntryOrOpen!0 (select (arr!47337 a!2862) j!93) a!2862 mask!2687) (Found!11589 j!93)))))

(declare-fun b!1444011 () Bool)

(declare-fun e!813655 () Bool)

(declare-fun e!813653 () Bool)

(assert (=> b!1444011 (= e!813655 e!813653)))

(declare-fun res!976058 () Bool)

(assert (=> b!1444011 (=> (not res!976058) (not e!813653))))

(declare-fun lt!634055 () SeekEntryResult!11589)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444011 (= res!976058 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47337 a!2862) j!93) mask!2687) (select (arr!47337 a!2862) j!93) a!2862 mask!2687) lt!634055))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1444011 (= lt!634055 (Intermediate!11589 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444012 () Bool)

(declare-fun res!976062 () Bool)

(declare-fun e!813652 () Bool)

(assert (=> b!1444012 (=> (not res!976062) (not e!813652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98098 (_ BitVec 32)) Bool)

(assert (=> b!1444012 (= res!976062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444013 () Bool)

(declare-fun res!976060 () Bool)

(assert (=> b!1444013 (=> (not res!976060) (not e!813652))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1444013 (= res!976060 (and (= (size!47887 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47887 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47887 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1444014 () Bool)

(declare-fun res!976059 () Bool)

(declare-fun e!813650 () Bool)

(assert (=> b!1444014 (=> (not res!976059) (not e!813650))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1444014 (= res!976059 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444015 () Bool)

(declare-fun res!976049 () Bool)

(assert (=> b!1444015 (=> (not res!976049) (not e!813652))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444015 (= res!976049 (validKeyInArray!0 (select (arr!47337 a!2862) i!1006)))))

(declare-fun res!976056 () Bool)

(assert (=> start!124650 (=> (not res!976056) (not e!813652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124650 (= res!976056 (validMask!0 mask!2687))))

(assert (=> start!124650 e!813652))

(assert (=> start!124650 true))

(declare-fun array_inv!36365 (array!98098) Bool)

(assert (=> start!124650 (array_inv!36365 a!2862)))

(declare-fun b!1444016 () Bool)

(assert (=> b!1444016 (= e!813654 (or (= (select (arr!47337 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47337 a!2862) intermediateBeforeIndex!19) (select (arr!47337 a!2862) j!93))))))

(declare-fun b!1444017 () Bool)

(declare-fun e!813651 () Bool)

(assert (=> b!1444017 (= e!813650 (not e!813651))))

(declare-fun res!976050 () Bool)

(assert (=> b!1444017 (=> res!976050 e!813651)))

(assert (=> b!1444017 (= res!976050 (or (not (= (select (arr!47337 a!2862) index!646) (select (store (arr!47337 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47337 a!2862) index!646) (select (arr!47337 a!2862) j!93)))))))

(assert (=> b!1444017 e!813654))

(declare-fun res!976052 () Bool)

(assert (=> b!1444017 (=> (not res!976052) (not e!813654))))

(assert (=> b!1444017 (= res!976052 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48674 0))(
  ( (Unit!48675) )
))
(declare-fun lt!634054 () Unit!48674)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48674)

(assert (=> b!1444017 (= lt!634054 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1444018 () Bool)

(assert (=> b!1444018 (= e!813653 e!813650)))

(declare-fun res!976063 () Bool)

(assert (=> b!1444018 (=> (not res!976063) (not e!813650))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1444018 (= res!976063 (= lt!634056 (Intermediate!11589 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1444018 (= lt!634056 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634053 mask!2687) lt!634053 lt!634051 mask!2687))))

(assert (=> b!1444018 (= lt!634053 (select (store (arr!47337 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1444019 () Bool)

(declare-fun res!976054 () Bool)

(assert (=> b!1444019 (=> (not res!976054) (not e!813653))))

(assert (=> b!1444019 (= res!976054 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47337 a!2862) j!93) a!2862 mask!2687) lt!634055))))

(declare-fun b!1444020 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98098 (_ BitVec 32)) SeekEntryResult!11589)

(assert (=> b!1444020 (= e!813656 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634053 lt!634051 mask!2687) (seekEntryOrOpen!0 lt!634053 lt!634051 mask!2687)))))

(declare-fun b!1444021 () Bool)

(declare-fun res!976061 () Bool)

(assert (=> b!1444021 (=> (not res!976061) (not e!813650))))

(assert (=> b!1444021 (= res!976061 e!813656)))

(declare-fun c!133491 () Bool)

(assert (=> b!1444021 (= c!133491 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444022 () Bool)

(assert (=> b!1444022 (= e!813651 true)))

(declare-fun lt!634052 () SeekEntryResult!11589)

(assert (=> b!1444022 (= lt!634052 (seekEntryOrOpen!0 lt!634053 lt!634051 mask!2687))))

(declare-fun b!1444023 () Bool)

(declare-fun res!976055 () Bool)

(assert (=> b!1444023 (=> (not res!976055) (not e!813652))))

(assert (=> b!1444023 (= res!976055 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47887 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47887 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47887 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444024 () Bool)

(declare-fun res!976048 () Bool)

(assert (=> b!1444024 (=> (not res!976048) (not e!813652))))

(declare-datatypes ((List!33838 0))(
  ( (Nil!33835) (Cons!33834 (h!35184 (_ BitVec 64)) (t!48532 List!33838)) )
))
(declare-fun arrayNoDuplicates!0 (array!98098 (_ BitVec 32) List!33838) Bool)

(assert (=> b!1444024 (= res!976048 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33835))))

(declare-fun b!1444025 () Bool)

(declare-fun res!976053 () Bool)

(assert (=> b!1444025 (=> (not res!976053) (not e!813652))))

(assert (=> b!1444025 (= res!976053 (validKeyInArray!0 (select (arr!47337 a!2862) j!93)))))

(declare-fun b!1444026 () Bool)

(assert (=> b!1444026 (= e!813652 e!813655)))

(declare-fun res!976057 () Bool)

(assert (=> b!1444026 (=> (not res!976057) (not e!813655))))

(assert (=> b!1444026 (= res!976057 (= (select (store (arr!47337 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1444026 (= lt!634051 (array!98099 (store (arr!47337 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47887 a!2862)))))

(assert (= (and start!124650 res!976056) b!1444013))

(assert (= (and b!1444013 res!976060) b!1444015))

(assert (= (and b!1444015 res!976049) b!1444025))

(assert (= (and b!1444025 res!976053) b!1444012))

(assert (= (and b!1444012 res!976062) b!1444024))

(assert (= (and b!1444024 res!976048) b!1444023))

(assert (= (and b!1444023 res!976055) b!1444026))

(assert (= (and b!1444026 res!976057) b!1444011))

(assert (= (and b!1444011 res!976058) b!1444019))

(assert (= (and b!1444019 res!976054) b!1444018))

(assert (= (and b!1444018 res!976063) b!1444021))

(assert (= (and b!1444021 c!133491) b!1444009))

(assert (= (and b!1444021 (not c!133491)) b!1444020))

(assert (= (and b!1444021 res!976061) b!1444014))

(assert (= (and b!1444014 res!976059) b!1444017))

(assert (= (and b!1444017 res!976052) b!1444010))

(assert (= (and b!1444010 res!976051) b!1444016))

(assert (= (and b!1444017 (not res!976050)) b!1444022))

(declare-fun m!1333053 () Bool)

(assert (=> b!1444024 m!1333053))

(declare-fun m!1333055 () Bool)

(assert (=> b!1444019 m!1333055))

(assert (=> b!1444019 m!1333055))

(declare-fun m!1333057 () Bool)

(assert (=> b!1444019 m!1333057))

(declare-fun m!1333059 () Bool)

(assert (=> b!1444009 m!1333059))

(declare-fun m!1333061 () Bool)

(assert (=> b!1444018 m!1333061))

(assert (=> b!1444018 m!1333061))

(declare-fun m!1333063 () Bool)

(assert (=> b!1444018 m!1333063))

(declare-fun m!1333065 () Bool)

(assert (=> b!1444018 m!1333065))

(declare-fun m!1333067 () Bool)

(assert (=> b!1444018 m!1333067))

(assert (=> b!1444010 m!1333055))

(assert (=> b!1444010 m!1333055))

(declare-fun m!1333069 () Bool)

(assert (=> b!1444010 m!1333069))

(declare-fun m!1333071 () Bool)

(assert (=> b!1444016 m!1333071))

(assert (=> b!1444016 m!1333055))

(assert (=> b!1444026 m!1333065))

(declare-fun m!1333073 () Bool)

(assert (=> b!1444026 m!1333073))

(declare-fun m!1333075 () Bool)

(assert (=> b!1444020 m!1333075))

(declare-fun m!1333077 () Bool)

(assert (=> b!1444020 m!1333077))

(declare-fun m!1333079 () Bool)

(assert (=> b!1444017 m!1333079))

(assert (=> b!1444017 m!1333065))

(declare-fun m!1333081 () Bool)

(assert (=> b!1444017 m!1333081))

(declare-fun m!1333083 () Bool)

(assert (=> b!1444017 m!1333083))

(declare-fun m!1333085 () Bool)

(assert (=> b!1444017 m!1333085))

(assert (=> b!1444017 m!1333055))

(declare-fun m!1333087 () Bool)

(assert (=> start!124650 m!1333087))

(declare-fun m!1333089 () Bool)

(assert (=> start!124650 m!1333089))

(assert (=> b!1444022 m!1333077))

(declare-fun m!1333091 () Bool)

(assert (=> b!1444012 m!1333091))

(assert (=> b!1444011 m!1333055))

(assert (=> b!1444011 m!1333055))

(declare-fun m!1333093 () Bool)

(assert (=> b!1444011 m!1333093))

(assert (=> b!1444011 m!1333093))

(assert (=> b!1444011 m!1333055))

(declare-fun m!1333095 () Bool)

(assert (=> b!1444011 m!1333095))

(assert (=> b!1444025 m!1333055))

(assert (=> b!1444025 m!1333055))

(declare-fun m!1333097 () Bool)

(assert (=> b!1444025 m!1333097))

(declare-fun m!1333099 () Bool)

(assert (=> b!1444015 m!1333099))

(assert (=> b!1444015 m!1333099))

(declare-fun m!1333101 () Bool)

(assert (=> b!1444015 m!1333101))

(check-sat (not b!1444019) (not b!1444020) (not b!1444015) (not b!1444024) (not b!1444022) (not start!124650) (not b!1444025) (not b!1444017) (not b!1444012) (not b!1444009) (not b!1444018) (not b!1444010) (not b!1444011))
(check-sat)
