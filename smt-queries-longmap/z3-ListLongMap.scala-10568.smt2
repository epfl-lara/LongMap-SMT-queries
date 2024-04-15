; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124516 () Bool)

(assert start!124516)

(declare-fun b!1441221 () Bool)

(declare-fun res!973694 () Bool)

(declare-fun e!812446 () Bool)

(assert (=> b!1441221 (=> (not res!973694) (not e!812446))))

(declare-datatypes ((array!97942 0))(
  ( (array!97943 (arr!47260 (Array (_ BitVec 32) (_ BitVec 64))) (size!47812 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97942)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441221 (= res!973694 (validKeyInArray!0 (select (arr!47260 a!2862) j!93)))))

(declare-fun b!1441222 () Bool)

(declare-fun res!973697 () Bool)

(declare-fun e!812448 () Bool)

(assert (=> b!1441222 (=> (not res!973697) (not e!812448))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11537 0))(
  ( (MissingZero!11537 (index!48540 (_ BitVec 32))) (Found!11537 (index!48541 (_ BitVec 32))) (Intermediate!11537 (undefined!12349 Bool) (index!48542 (_ BitVec 32)) (x!130253 (_ BitVec 32))) (Undefined!11537) (MissingVacant!11537 (index!48543 (_ BitVec 32))) )
))
(declare-fun lt!632999 () SeekEntryResult!11537)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97942 (_ BitVec 32)) SeekEntryResult!11537)

(assert (=> b!1441222 (= res!973697 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47260 a!2862) j!93) a!2862 mask!2687) lt!632999))))

(declare-fun b!1441223 () Bool)

(declare-fun res!973692 () Bool)

(assert (=> b!1441223 (=> (not res!973692) (not e!812446))))

(declare-datatypes ((List!33839 0))(
  ( (Nil!33836) (Cons!33835 (h!35185 (_ BitVec 64)) (t!48525 List!33839)) )
))
(declare-fun arrayNoDuplicates!0 (array!97942 (_ BitVec 32) List!33839) Bool)

(assert (=> b!1441223 (= res!973692 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33836))))

(declare-fun b!1441224 () Bool)

(declare-fun res!973696 () Bool)

(assert (=> b!1441224 (=> (not res!973696) (not e!812446))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97942 (_ BitVec 32)) Bool)

(assert (=> b!1441224 (= res!973696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441225 () Bool)

(declare-fun e!812444 () Bool)

(assert (=> b!1441225 (= e!812448 e!812444)))

(declare-fun res!973698 () Bool)

(assert (=> b!1441225 (=> (not res!973698) (not e!812444))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!632998 () SeekEntryResult!11537)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1441225 (= res!973698 (= lt!632998 (Intermediate!11537 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!632997 () (_ BitVec 64))

(declare-fun lt!633000 () array!97942)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441225 (= lt!632998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!632997 mask!2687) lt!632997 lt!633000 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1441225 (= lt!632997 (select (store (arr!47260 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441226 () Bool)

(declare-fun e!812447 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97942 (_ BitVec 32)) SeekEntryResult!11537)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97942 (_ BitVec 32)) SeekEntryResult!11537)

(assert (=> b!1441226 (= e!812447 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!632997 lt!633000 mask!2687) (seekEntryOrOpen!0 lt!632997 lt!633000 mask!2687))))))

(declare-fun b!1441227 () Bool)

(assert (=> b!1441227 (= e!812444 false)))

(declare-fun lt!632996 () Bool)

(assert (=> b!1441227 (= lt!632996 e!812447)))

(declare-fun c!133279 () Bool)

(assert (=> b!1441227 (= c!133279 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441229 () Bool)

(assert (=> b!1441229 (= e!812447 (not (= lt!632998 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!632997 lt!633000 mask!2687))))))

(declare-fun b!1441230 () Bool)

(declare-fun res!973689 () Bool)

(assert (=> b!1441230 (=> (not res!973689) (not e!812446))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441230 (= res!973689 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47812 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47812 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47812 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1441231 () Bool)

(declare-fun res!973695 () Bool)

(assert (=> b!1441231 (=> (not res!973695) (not e!812446))))

(assert (=> b!1441231 (= res!973695 (validKeyInArray!0 (select (arr!47260 a!2862) i!1006)))))

(declare-fun b!1441232 () Bool)

(declare-fun e!812445 () Bool)

(assert (=> b!1441232 (= e!812446 e!812445)))

(declare-fun res!973690 () Bool)

(assert (=> b!1441232 (=> (not res!973690) (not e!812445))))

(assert (=> b!1441232 (= res!973690 (= (select (store (arr!47260 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1441232 (= lt!633000 (array!97943 (store (arr!47260 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47812 a!2862)))))

(declare-fun b!1441233 () Bool)

(assert (=> b!1441233 (= e!812445 e!812448)))

(declare-fun res!973699 () Bool)

(assert (=> b!1441233 (=> (not res!973699) (not e!812448))))

(assert (=> b!1441233 (= res!973699 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47260 a!2862) j!93) mask!2687) (select (arr!47260 a!2862) j!93) a!2862 mask!2687) lt!632999))))

(assert (=> b!1441233 (= lt!632999 (Intermediate!11537 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441228 () Bool)

(declare-fun res!973691 () Bool)

(assert (=> b!1441228 (=> (not res!973691) (not e!812446))))

(assert (=> b!1441228 (= res!973691 (and (= (size!47812 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47812 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47812 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!973693 () Bool)

(assert (=> start!124516 (=> (not res!973693) (not e!812446))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124516 (= res!973693 (validMask!0 mask!2687))))

(assert (=> start!124516 e!812446))

(assert (=> start!124516 true))

(declare-fun array_inv!36493 (array!97942) Bool)

(assert (=> start!124516 (array_inv!36493 a!2862)))

(assert (= (and start!124516 res!973693) b!1441228))

(assert (= (and b!1441228 res!973691) b!1441231))

(assert (= (and b!1441231 res!973695) b!1441221))

(assert (= (and b!1441221 res!973694) b!1441224))

(assert (= (and b!1441224 res!973696) b!1441223))

(assert (= (and b!1441223 res!973692) b!1441230))

(assert (= (and b!1441230 res!973689) b!1441232))

(assert (= (and b!1441232 res!973690) b!1441233))

(assert (= (and b!1441233 res!973699) b!1441222))

(assert (= (and b!1441222 res!973697) b!1441225))

(assert (= (and b!1441225 res!973698) b!1441227))

(assert (= (and b!1441227 c!133279) b!1441229))

(assert (= (and b!1441227 (not c!133279)) b!1441226))

(declare-fun m!1329963 () Bool)

(assert (=> b!1441232 m!1329963))

(declare-fun m!1329965 () Bool)

(assert (=> b!1441232 m!1329965))

(declare-fun m!1329967 () Bool)

(assert (=> b!1441222 m!1329967))

(assert (=> b!1441222 m!1329967))

(declare-fun m!1329969 () Bool)

(assert (=> b!1441222 m!1329969))

(assert (=> b!1441233 m!1329967))

(assert (=> b!1441233 m!1329967))

(declare-fun m!1329971 () Bool)

(assert (=> b!1441233 m!1329971))

(assert (=> b!1441233 m!1329971))

(assert (=> b!1441233 m!1329967))

(declare-fun m!1329973 () Bool)

(assert (=> b!1441233 m!1329973))

(declare-fun m!1329975 () Bool)

(assert (=> start!124516 m!1329975))

(declare-fun m!1329977 () Bool)

(assert (=> start!124516 m!1329977))

(declare-fun m!1329979 () Bool)

(assert (=> b!1441225 m!1329979))

(assert (=> b!1441225 m!1329979))

(declare-fun m!1329981 () Bool)

(assert (=> b!1441225 m!1329981))

(assert (=> b!1441225 m!1329963))

(declare-fun m!1329983 () Bool)

(assert (=> b!1441225 m!1329983))

(assert (=> b!1441221 m!1329967))

(assert (=> b!1441221 m!1329967))

(declare-fun m!1329985 () Bool)

(assert (=> b!1441221 m!1329985))

(declare-fun m!1329987 () Bool)

(assert (=> b!1441224 m!1329987))

(declare-fun m!1329989 () Bool)

(assert (=> b!1441231 m!1329989))

(assert (=> b!1441231 m!1329989))

(declare-fun m!1329991 () Bool)

(assert (=> b!1441231 m!1329991))

(declare-fun m!1329993 () Bool)

(assert (=> b!1441226 m!1329993))

(declare-fun m!1329995 () Bool)

(assert (=> b!1441226 m!1329995))

(declare-fun m!1329997 () Bool)

(assert (=> b!1441229 m!1329997))

(declare-fun m!1329999 () Bool)

(assert (=> b!1441223 m!1329999))

(check-sat (not b!1441223) (not b!1441225) (not b!1441224) (not b!1441222) (not start!124516) (not b!1441229) (not b!1441221) (not b!1441231) (not b!1441226) (not b!1441233))
(check-sat)
