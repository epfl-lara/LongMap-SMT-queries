; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124842 () Bool)

(assert start!124842)

(declare-fun b!1449225 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!816129 () Bool)

(declare-datatypes ((array!98290 0))(
  ( (array!98291 (arr!47433 (Array (_ BitVec 32) (_ BitVec 64))) (size!47983 (_ BitVec 32))) )
))
(declare-fun lt!635825 () array!98290)

(declare-fun lt!635820 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11685 0))(
  ( (MissingZero!11685 (index!49132 (_ BitVec 32))) (Found!11685 (index!49133 (_ BitVec 32))) (Intermediate!11685 (undefined!12497 Bool) (index!49134 (_ BitVec 32)) (x!130798 (_ BitVec 32))) (Undefined!11685) (MissingVacant!11685 (index!49135 (_ BitVec 32))) )
))
(declare-fun lt!635823 () SeekEntryResult!11685)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98290 (_ BitVec 32)) SeekEntryResult!11685)

(assert (=> b!1449225 (= e!816129 (= lt!635823 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635820 lt!635825 mask!2687)))))

(declare-fun b!1449226 () Bool)

(declare-fun res!980704 () Bool)

(declare-fun e!816132 () Bool)

(assert (=> b!1449226 (=> (not res!980704) (not e!816132))))

(declare-fun a!2862 () array!98290)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449226 (= res!980704 (validKeyInArray!0 (select (arr!47433 a!2862) i!1006)))))

(declare-fun b!1449227 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98290 (_ BitVec 32)) SeekEntryResult!11685)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98290 (_ BitVec 32)) SeekEntryResult!11685)

(assert (=> b!1449227 (= e!816129 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635820 lt!635825 mask!2687) (seekEntryOrOpen!0 lt!635820 lt!635825 mask!2687)))))

(declare-fun b!1449228 () Bool)

(declare-fun e!816131 () Bool)

(assert (=> b!1449228 (= e!816131 true)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!635826 () SeekEntryResult!11685)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1449228 (= lt!635826 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47433 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1449229 () Bool)

(declare-fun res!980693 () Bool)

(declare-fun e!816127 () Bool)

(assert (=> b!1449229 (=> (not res!980693) (not e!816127))))

(declare-fun lt!635822 () SeekEntryResult!11685)

(assert (=> b!1449229 (= res!980693 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47433 a!2862) j!93) a!2862 mask!2687) lt!635822))))

(declare-fun b!1449230 () Bool)

(declare-fun e!816126 () Bool)

(assert (=> b!1449230 (= e!816126 e!816127)))

(declare-fun res!980688 () Bool)

(assert (=> b!1449230 (=> (not res!980688) (not e!816127))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449230 (= res!980688 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47433 a!2862) j!93) mask!2687) (select (arr!47433 a!2862) j!93) a!2862 mask!2687) lt!635822))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1449230 (= lt!635822 (Intermediate!11685 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1449231 () Bool)

(declare-fun res!980690 () Bool)

(assert (=> b!1449231 (=> (not res!980690) (not e!816132))))

(assert (=> b!1449231 (= res!980690 (and (= (size!47983 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47983 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47983 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1449232 () Bool)

(declare-fun e!816125 () Bool)

(declare-fun e!816130 () Bool)

(assert (=> b!1449232 (= e!816125 e!816130)))

(declare-fun res!980692 () Bool)

(assert (=> b!1449232 (=> res!980692 e!816130)))

(assert (=> b!1449232 (= res!980692 (or (and (= (select (arr!47433 a!2862) index!646) (select (store (arr!47433 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47433 a!2862) index!646) (select (arr!47433 a!2862) j!93))) (not (= (select (arr!47433 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449233 () Bool)

(declare-fun res!980695 () Bool)

(assert (=> b!1449233 (=> (not res!980695) (not e!816132))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1449233 (= res!980695 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47983 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47983 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47983 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449234 () Bool)

(declare-fun res!980702 () Bool)

(assert (=> b!1449234 (=> (not res!980702) (not e!816132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98290 (_ BitVec 32)) Bool)

(assert (=> b!1449234 (= res!980702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!980701 () Bool)

(assert (=> start!124842 (=> (not res!980701) (not e!816132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124842 (= res!980701 (validMask!0 mask!2687))))

(assert (=> start!124842 e!816132))

(assert (=> start!124842 true))

(declare-fun array_inv!36461 (array!98290) Bool)

(assert (=> start!124842 (array_inv!36461 a!2862)))

(declare-fun b!1449235 () Bool)

(declare-fun res!980698 () Bool)

(declare-fun e!816128 () Bool)

(assert (=> b!1449235 (=> (not res!980698) (not e!816128))))

(assert (=> b!1449235 (= res!980698 e!816129)))

(declare-fun c!133779 () Bool)

(assert (=> b!1449235 (= c!133779 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1449236 () Bool)

(assert (=> b!1449236 (= e!816127 e!816128)))

(declare-fun res!980699 () Bool)

(assert (=> b!1449236 (=> (not res!980699) (not e!816128))))

(assert (=> b!1449236 (= res!980699 (= lt!635823 (Intermediate!11685 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1449236 (= lt!635823 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635820 mask!2687) lt!635820 lt!635825 mask!2687))))

(assert (=> b!1449236 (= lt!635820 (select (store (arr!47433 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1449237 () Bool)

(declare-fun res!980694 () Bool)

(assert (=> b!1449237 (=> (not res!980694) (not e!816132))))

(assert (=> b!1449237 (= res!980694 (validKeyInArray!0 (select (arr!47433 a!2862) j!93)))))

(declare-fun b!1449238 () Bool)

(declare-fun e!816133 () Bool)

(assert (=> b!1449238 (= e!816130 e!816133)))

(declare-fun res!980703 () Bool)

(assert (=> b!1449238 (=> (not res!980703) (not e!816133))))

(declare-fun lt!635821 () SeekEntryResult!11685)

(assert (=> b!1449238 (= res!980703 (= lt!635821 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47433 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1449239 () Bool)

(declare-fun res!980689 () Bool)

(assert (=> b!1449239 (=> (not res!980689) (not e!816128))))

(assert (=> b!1449239 (= res!980689 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1449240 () Bool)

(assert (=> b!1449240 (= e!816133 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1449241 () Bool)

(declare-fun res!980697 () Bool)

(assert (=> b!1449241 (=> (not res!980697) (not e!816132))))

(declare-datatypes ((List!33934 0))(
  ( (Nil!33931) (Cons!33930 (h!35280 (_ BitVec 64)) (t!48628 List!33934)) )
))
(declare-fun arrayNoDuplicates!0 (array!98290 (_ BitVec 32) List!33934) Bool)

(assert (=> b!1449241 (= res!980697 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33931))))

(declare-fun b!1449242 () Bool)

(assert (=> b!1449242 (= e!816132 e!816126)))

(declare-fun res!980700 () Bool)

(assert (=> b!1449242 (=> (not res!980700) (not e!816126))))

(assert (=> b!1449242 (= res!980700 (= (select (store (arr!47433 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1449242 (= lt!635825 (array!98291 (store (arr!47433 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47983 a!2862)))))

(declare-fun b!1449243 () Bool)

(assert (=> b!1449243 (= e!816128 (not e!816131))))

(declare-fun res!980696 () Bool)

(assert (=> b!1449243 (=> res!980696 e!816131)))

(assert (=> b!1449243 (= res!980696 (or (and (= (select (arr!47433 a!2862) index!646) (select (store (arr!47433 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47433 a!2862) index!646) (select (arr!47433 a!2862) j!93))) (not (= (select (arr!47433 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47433 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1449243 e!816125))

(declare-fun res!980691 () Bool)

(assert (=> b!1449243 (=> (not res!980691) (not e!816125))))

(assert (=> b!1449243 (= res!980691 (and (= lt!635821 (Found!11685 j!93)) (or (= (select (arr!47433 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47433 a!2862) intermediateBeforeIndex!19) (select (arr!47433 a!2862) j!93)))))))

(assert (=> b!1449243 (= lt!635821 (seekEntryOrOpen!0 (select (arr!47433 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1449243 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48866 0))(
  ( (Unit!48867) )
))
(declare-fun lt!635824 () Unit!48866)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98290 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48866)

(assert (=> b!1449243 (= lt!635824 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!124842 res!980701) b!1449231))

(assert (= (and b!1449231 res!980690) b!1449226))

(assert (= (and b!1449226 res!980704) b!1449237))

(assert (= (and b!1449237 res!980694) b!1449234))

(assert (= (and b!1449234 res!980702) b!1449241))

(assert (= (and b!1449241 res!980697) b!1449233))

(assert (= (and b!1449233 res!980695) b!1449242))

(assert (= (and b!1449242 res!980700) b!1449230))

(assert (= (and b!1449230 res!980688) b!1449229))

(assert (= (and b!1449229 res!980693) b!1449236))

(assert (= (and b!1449236 res!980699) b!1449235))

(assert (= (and b!1449235 c!133779) b!1449225))

(assert (= (and b!1449235 (not c!133779)) b!1449227))

(assert (= (and b!1449235 res!980698) b!1449239))

(assert (= (and b!1449239 res!980689) b!1449243))

(assert (= (and b!1449243 res!980691) b!1449232))

(assert (= (and b!1449232 (not res!980692)) b!1449238))

(assert (= (and b!1449238 res!980703) b!1449240))

(assert (= (and b!1449243 (not res!980696)) b!1449228))

(declare-fun m!1337947 () Bool)

(assert (=> b!1449243 m!1337947))

(declare-fun m!1337949 () Bool)

(assert (=> b!1449243 m!1337949))

(declare-fun m!1337951 () Bool)

(assert (=> b!1449243 m!1337951))

(declare-fun m!1337953 () Bool)

(assert (=> b!1449243 m!1337953))

(declare-fun m!1337955 () Bool)

(assert (=> b!1449243 m!1337955))

(declare-fun m!1337957 () Bool)

(assert (=> b!1449243 m!1337957))

(declare-fun m!1337959 () Bool)

(assert (=> b!1449243 m!1337959))

(declare-fun m!1337961 () Bool)

(assert (=> b!1449243 m!1337961))

(assert (=> b!1449243 m!1337957))

(assert (=> b!1449238 m!1337957))

(assert (=> b!1449238 m!1337957))

(declare-fun m!1337963 () Bool)

(assert (=> b!1449238 m!1337963))

(declare-fun m!1337965 () Bool)

(assert (=> b!1449236 m!1337965))

(assert (=> b!1449236 m!1337965))

(declare-fun m!1337967 () Bool)

(assert (=> b!1449236 m!1337967))

(assert (=> b!1449236 m!1337949))

(declare-fun m!1337969 () Bool)

(assert (=> b!1449236 m!1337969))

(declare-fun m!1337971 () Bool)

(assert (=> b!1449227 m!1337971))

(declare-fun m!1337973 () Bool)

(assert (=> b!1449227 m!1337973))

(assert (=> b!1449229 m!1337957))

(assert (=> b!1449229 m!1337957))

(declare-fun m!1337975 () Bool)

(assert (=> b!1449229 m!1337975))

(assert (=> b!1449232 m!1337955))

(assert (=> b!1449232 m!1337949))

(assert (=> b!1449232 m!1337953))

(assert (=> b!1449232 m!1337957))

(declare-fun m!1337977 () Bool)

(assert (=> b!1449241 m!1337977))

(declare-fun m!1337979 () Bool)

(assert (=> b!1449226 m!1337979))

(assert (=> b!1449226 m!1337979))

(declare-fun m!1337981 () Bool)

(assert (=> b!1449226 m!1337981))

(assert (=> b!1449242 m!1337949))

(declare-fun m!1337983 () Bool)

(assert (=> b!1449242 m!1337983))

(assert (=> b!1449230 m!1337957))

(assert (=> b!1449230 m!1337957))

(declare-fun m!1337985 () Bool)

(assert (=> b!1449230 m!1337985))

(assert (=> b!1449230 m!1337985))

(assert (=> b!1449230 m!1337957))

(declare-fun m!1337987 () Bool)

(assert (=> b!1449230 m!1337987))

(declare-fun m!1337989 () Bool)

(assert (=> b!1449234 m!1337989))

(assert (=> b!1449237 m!1337957))

(assert (=> b!1449237 m!1337957))

(declare-fun m!1337991 () Bool)

(assert (=> b!1449237 m!1337991))

(declare-fun m!1337993 () Bool)

(assert (=> b!1449225 m!1337993))

(declare-fun m!1337995 () Bool)

(assert (=> start!124842 m!1337995))

(declare-fun m!1337997 () Bool)

(assert (=> start!124842 m!1337997))

(assert (=> b!1449228 m!1337957))

(assert (=> b!1449228 m!1337957))

(declare-fun m!1337999 () Bool)

(assert (=> b!1449228 m!1337999))

(check-sat (not b!1449234) (not b!1449227) (not b!1449241) (not b!1449228) (not b!1449243) (not b!1449226) (not b!1449237) (not b!1449230) (not b!1449229) (not b!1449238) (not b!1449236) (not start!124842) (not b!1449225))
(check-sat)
