; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124806 () Bool)

(assert start!124806)

(declare-fun b!1443714 () Bool)

(declare-fun res!975123 () Bool)

(declare-fun e!813797 () Bool)

(assert (=> b!1443714 (=> (not res!975123) (not e!813797))))

(declare-datatypes ((array!98149 0))(
  ( (array!98150 (arr!47359 (Array (_ BitVec 32) (_ BitVec 64))) (size!47910 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98149)

(declare-datatypes ((List!33847 0))(
  ( (Nil!33844) (Cons!33843 (h!35204 (_ BitVec 64)) (t!48533 List!33847)) )
))
(declare-fun arrayNoDuplicates!0 (array!98149 (_ BitVec 32) List!33847) Bool)

(assert (=> b!1443714 (= res!975123 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33844))))

(declare-fun b!1443715 () Bool)

(declare-fun e!813795 () Bool)

(assert (=> b!1443715 (= e!813797 e!813795)))

(declare-fun res!975119 () Bool)

(assert (=> b!1443715 (=> (not res!975119) (not e!813795))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1443715 (= res!975119 (= (select (store (arr!47359 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!634025 () array!98149)

(assert (=> b!1443715 (= lt!634025 (array!98150 (store (arr!47359 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47910 a!2862)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1443716 () Bool)

(declare-fun e!813801 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1443716 (= e!813801 (or (= (select (arr!47359 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47359 a!2862) intermediateBeforeIndex!19) (select (arr!47359 a!2862) j!93))))))

(declare-fun b!1443717 () Bool)

(declare-fun res!975122 () Bool)

(assert (=> b!1443717 (=> (not res!975122) (not e!813797))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443717 (= res!975122 (validKeyInArray!0 (select (arr!47359 a!2862) j!93)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!813798 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1443718 () Bool)

(declare-fun lt!634027 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11508 0))(
  ( (MissingZero!11508 (index!48424 (_ BitVec 32))) (Found!11508 (index!48425 (_ BitVec 32))) (Intermediate!11508 (undefined!12320 Bool) (index!48426 (_ BitVec 32)) (x!130309 (_ BitVec 32))) (Undefined!11508) (MissingVacant!11508 (index!48427 (_ BitVec 32))) )
))
(declare-fun lt!634023 () SeekEntryResult!11508)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98149 (_ BitVec 32)) SeekEntryResult!11508)

(assert (=> b!1443718 (= e!813798 (= lt!634023 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634027 lt!634025 mask!2687)))))

(declare-fun b!1443719 () Bool)

(declare-fun e!813800 () Bool)

(assert (=> b!1443719 (= e!813795 e!813800)))

(declare-fun res!975117 () Bool)

(assert (=> b!1443719 (=> (not res!975117) (not e!813800))))

(declare-fun lt!634026 () SeekEntryResult!11508)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443719 (= res!975117 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47359 a!2862) j!93) mask!2687) (select (arr!47359 a!2862) j!93) a!2862 mask!2687) lt!634026))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1443719 (= lt!634026 (Intermediate!11508 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443720 () Bool)

(declare-fun e!813799 () Bool)

(assert (=> b!1443720 (= e!813799 (not true))))

(assert (=> b!1443720 e!813801))

(declare-fun res!975126 () Bool)

(assert (=> b!1443720 (=> (not res!975126) (not e!813801))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98149 (_ BitVec 32)) Bool)

(assert (=> b!1443720 (= res!975126 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48545 0))(
  ( (Unit!48546) )
))
(declare-fun lt!634024 () Unit!48545)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98149 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48545)

(assert (=> b!1443720 (= lt!634024 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!975121 () Bool)

(assert (=> start!124806 (=> (not res!975121) (not e!813797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124806 (= res!975121 (validMask!0 mask!2687))))

(assert (=> start!124806 e!813797))

(assert (=> start!124806 true))

(declare-fun array_inv!36640 (array!98149) Bool)

(assert (=> start!124806 (array_inv!36640 a!2862)))

(declare-fun b!1443721 () Bool)

(declare-fun res!975116 () Bool)

(assert (=> b!1443721 (=> (not res!975116) (not e!813799))))

(assert (=> b!1443721 (= res!975116 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443722 () Bool)

(declare-fun res!975120 () Bool)

(assert (=> b!1443722 (=> (not res!975120) (not e!813797))))

(assert (=> b!1443722 (= res!975120 (and (= (size!47910 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47910 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47910 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1443723 () Bool)

(declare-fun res!975115 () Bool)

(assert (=> b!1443723 (=> (not res!975115) (not e!813797))))

(assert (=> b!1443723 (= res!975115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443724 () Bool)

(declare-fun res!975125 () Bool)

(assert (=> b!1443724 (=> (not res!975125) (not e!813797))))

(assert (=> b!1443724 (= res!975125 (validKeyInArray!0 (select (arr!47359 a!2862) i!1006)))))

(declare-fun b!1443725 () Bool)

(declare-fun res!975127 () Bool)

(assert (=> b!1443725 (=> (not res!975127) (not e!813800))))

(assert (=> b!1443725 (= res!975127 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47359 a!2862) j!93) a!2862 mask!2687) lt!634026))))

(declare-fun b!1443726 () Bool)

(declare-fun res!975128 () Bool)

(assert (=> b!1443726 (=> (not res!975128) (not e!813801))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98149 (_ BitVec 32)) SeekEntryResult!11508)

(assert (=> b!1443726 (= res!975128 (= (seekEntryOrOpen!0 (select (arr!47359 a!2862) j!93) a!2862 mask!2687) (Found!11508 j!93)))))

(declare-fun b!1443727 () Bool)

(declare-fun res!975114 () Bool)

(assert (=> b!1443727 (=> (not res!975114) (not e!813799))))

(assert (=> b!1443727 (= res!975114 e!813798)))

(declare-fun c!133819 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1443727 (= c!133819 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443728 () Bool)

(declare-fun res!975124 () Bool)

(assert (=> b!1443728 (=> (not res!975124) (not e!813797))))

(assert (=> b!1443728 (= res!975124 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47910 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47910 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47910 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443729 () Bool)

(assert (=> b!1443729 (= e!813800 e!813799)))

(declare-fun res!975118 () Bool)

(assert (=> b!1443729 (=> (not res!975118) (not e!813799))))

(assert (=> b!1443729 (= res!975118 (= lt!634023 (Intermediate!11508 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1443729 (= lt!634023 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634027 mask!2687) lt!634027 lt!634025 mask!2687))))

(assert (=> b!1443729 (= lt!634027 (select (store (arr!47359 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443730 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98149 (_ BitVec 32)) SeekEntryResult!11508)

(assert (=> b!1443730 (= e!813798 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634027 lt!634025 mask!2687) (seekEntryOrOpen!0 lt!634027 lt!634025 mask!2687)))))

(assert (= (and start!124806 res!975121) b!1443722))

(assert (= (and b!1443722 res!975120) b!1443724))

(assert (= (and b!1443724 res!975125) b!1443717))

(assert (= (and b!1443717 res!975122) b!1443723))

(assert (= (and b!1443723 res!975115) b!1443714))

(assert (= (and b!1443714 res!975123) b!1443728))

(assert (= (and b!1443728 res!975124) b!1443715))

(assert (= (and b!1443715 res!975119) b!1443719))

(assert (= (and b!1443719 res!975117) b!1443725))

(assert (= (and b!1443725 res!975127) b!1443729))

(assert (= (and b!1443729 res!975118) b!1443727))

(assert (= (and b!1443727 c!133819) b!1443718))

(assert (= (and b!1443727 (not c!133819)) b!1443730))

(assert (= (and b!1443727 res!975114) b!1443721))

(assert (= (and b!1443721 res!975116) b!1443720))

(assert (= (and b!1443720 res!975126) b!1443726))

(assert (= (and b!1443726 res!975128) b!1443716))

(declare-fun m!1332985 () Bool)

(assert (=> b!1443716 m!1332985))

(declare-fun m!1332987 () Bool)

(assert (=> b!1443716 m!1332987))

(declare-fun m!1332989 () Bool)

(assert (=> start!124806 m!1332989))

(declare-fun m!1332991 () Bool)

(assert (=> start!124806 m!1332991))

(declare-fun m!1332993 () Bool)

(assert (=> b!1443714 m!1332993))

(assert (=> b!1443719 m!1332987))

(assert (=> b!1443719 m!1332987))

(declare-fun m!1332995 () Bool)

(assert (=> b!1443719 m!1332995))

(assert (=> b!1443719 m!1332995))

(assert (=> b!1443719 m!1332987))

(declare-fun m!1332997 () Bool)

(assert (=> b!1443719 m!1332997))

(declare-fun m!1332999 () Bool)

(assert (=> b!1443720 m!1332999))

(declare-fun m!1333001 () Bool)

(assert (=> b!1443720 m!1333001))

(declare-fun m!1333003 () Bool)

(assert (=> b!1443724 m!1333003))

(assert (=> b!1443724 m!1333003))

(declare-fun m!1333005 () Bool)

(assert (=> b!1443724 m!1333005))

(declare-fun m!1333007 () Bool)

(assert (=> b!1443723 m!1333007))

(assert (=> b!1443717 m!1332987))

(assert (=> b!1443717 m!1332987))

(declare-fun m!1333009 () Bool)

(assert (=> b!1443717 m!1333009))

(declare-fun m!1333011 () Bool)

(assert (=> b!1443715 m!1333011))

(declare-fun m!1333013 () Bool)

(assert (=> b!1443715 m!1333013))

(declare-fun m!1333015 () Bool)

(assert (=> b!1443730 m!1333015))

(declare-fun m!1333017 () Bool)

(assert (=> b!1443730 m!1333017))

(declare-fun m!1333019 () Bool)

(assert (=> b!1443718 m!1333019))

(assert (=> b!1443726 m!1332987))

(assert (=> b!1443726 m!1332987))

(declare-fun m!1333021 () Bool)

(assert (=> b!1443726 m!1333021))

(assert (=> b!1443725 m!1332987))

(assert (=> b!1443725 m!1332987))

(declare-fun m!1333023 () Bool)

(assert (=> b!1443725 m!1333023))

(declare-fun m!1333025 () Bool)

(assert (=> b!1443729 m!1333025))

(assert (=> b!1443729 m!1333025))

(declare-fun m!1333027 () Bool)

(assert (=> b!1443729 m!1333027))

(assert (=> b!1443729 m!1333011))

(declare-fun m!1333029 () Bool)

(assert (=> b!1443729 m!1333029))

(check-sat (not b!1443725) (not start!124806) (not b!1443730) (not b!1443726) (not b!1443729) (not b!1443723) (not b!1443719) (not b!1443718) (not b!1443724) (not b!1443714) (not b!1443717) (not b!1443720))
(check-sat)
