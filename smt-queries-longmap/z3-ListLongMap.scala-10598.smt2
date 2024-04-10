; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124728 () Bool)

(assert start!124728)

(declare-fun b!1446020 () Bool)

(declare-fun e!814483 () Bool)

(assert (=> b!1446020 (= e!814483 (not true))))

(declare-fun e!814482 () Bool)

(assert (=> b!1446020 e!814482))

(declare-fun res!977838 () Bool)

(assert (=> b!1446020 (=> (not res!977838) (not e!814482))))

(declare-datatypes ((array!98176 0))(
  ( (array!98177 (arr!47376 (Array (_ BitVec 32) (_ BitVec 64))) (size!47926 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98176)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98176 (_ BitVec 32)) Bool)

(assert (=> b!1446020 (= res!977838 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48752 0))(
  ( (Unit!48753) )
))
(declare-fun lt!634667 () Unit!48752)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98176 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48752)

(assert (=> b!1446020 (= lt!634667 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1446021 () Bool)

(declare-fun res!977837 () Bool)

(declare-fun e!814485 () Bool)

(assert (=> b!1446021 (=> (not res!977837) (not e!814485))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11628 0))(
  ( (MissingZero!11628 (index!48904 (_ BitVec 32))) (Found!11628 (index!48905 (_ BitVec 32))) (Intermediate!11628 (undefined!12440 Bool) (index!48906 (_ BitVec 32)) (x!130589 (_ BitVec 32))) (Undefined!11628) (MissingVacant!11628 (index!48907 (_ BitVec 32))) )
))
(declare-fun lt!634668 () SeekEntryResult!11628)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98176 (_ BitVec 32)) SeekEntryResult!11628)

(assert (=> b!1446021 (= res!977837 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47376 a!2862) j!93) a!2862 mask!2687) lt!634668))))

(declare-fun lt!634671 () array!98176)

(declare-fun e!814481 () Bool)

(declare-fun b!1446022 () Bool)

(declare-fun lt!634670 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98176 (_ BitVec 32)) SeekEntryResult!11628)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98176 (_ BitVec 32)) SeekEntryResult!11628)

(assert (=> b!1446022 (= e!814481 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634670 lt!634671 mask!2687) (seekEntryOrOpen!0 lt!634670 lt!634671 mask!2687)))))

(declare-fun b!1446024 () Bool)

(declare-fun lt!634669 () SeekEntryResult!11628)

(assert (=> b!1446024 (= e!814481 (= lt!634669 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634670 lt!634671 mask!2687)))))

(declare-fun b!1446025 () Bool)

(declare-fun res!977833 () Bool)

(assert (=> b!1446025 (=> (not res!977833) (not e!814483))))

(assert (=> b!1446025 (= res!977833 e!814481)))

(declare-fun c!133608 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1446025 (= c!133608 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1446026 () Bool)

(assert (=> b!1446026 (= e!814485 e!814483)))

(declare-fun res!977829 () Bool)

(assert (=> b!1446026 (=> (not res!977829) (not e!814483))))

(assert (=> b!1446026 (= res!977829 (= lt!634669 (Intermediate!11628 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446026 (= lt!634669 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634670 mask!2687) lt!634670 lt!634671 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1446026 (= lt!634670 (select (store (arr!47376 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446027 () Bool)

(declare-fun res!977831 () Bool)

(assert (=> b!1446027 (=> (not res!977831) (not e!814483))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1446027 (= res!977831 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446028 () Bool)

(declare-fun res!977825 () Bool)

(declare-fun e!814487 () Bool)

(assert (=> b!1446028 (=> (not res!977825) (not e!814487))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1446028 (= res!977825 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47926 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47926 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47926 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1446029 () Bool)

(declare-fun e!814484 () Bool)

(assert (=> b!1446029 (= e!814487 e!814484)))

(declare-fun res!977828 () Bool)

(assert (=> b!1446029 (=> (not res!977828) (not e!814484))))

(assert (=> b!1446029 (= res!977828 (= (select (store (arr!47376 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1446029 (= lt!634671 (array!98177 (store (arr!47376 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47926 a!2862)))))

(declare-fun b!1446030 () Bool)

(declare-fun res!977830 () Bool)

(assert (=> b!1446030 (=> (not res!977830) (not e!814487))))

(declare-datatypes ((List!33877 0))(
  ( (Nil!33874) (Cons!33873 (h!35223 (_ BitVec 64)) (t!48571 List!33877)) )
))
(declare-fun arrayNoDuplicates!0 (array!98176 (_ BitVec 32) List!33877) Bool)

(assert (=> b!1446030 (= res!977830 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33874))))

(declare-fun b!1446023 () Bool)

(declare-fun res!977826 () Bool)

(assert (=> b!1446023 (=> (not res!977826) (not e!814482))))

(assert (=> b!1446023 (= res!977826 (= (seekEntryOrOpen!0 (select (arr!47376 a!2862) j!93) a!2862 mask!2687) (Found!11628 j!93)))))

(declare-fun res!977834 () Bool)

(assert (=> start!124728 (=> (not res!977834) (not e!814487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124728 (= res!977834 (validMask!0 mask!2687))))

(assert (=> start!124728 e!814487))

(assert (=> start!124728 true))

(declare-fun array_inv!36404 (array!98176) Bool)

(assert (=> start!124728 (array_inv!36404 a!2862)))

(declare-fun b!1446031 () Bool)

(declare-fun res!977835 () Bool)

(assert (=> b!1446031 (=> (not res!977835) (not e!814487))))

(assert (=> b!1446031 (= res!977835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446032 () Bool)

(declare-fun res!977836 () Bool)

(assert (=> b!1446032 (=> (not res!977836) (not e!814487))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446032 (= res!977836 (validKeyInArray!0 (select (arr!47376 a!2862) j!93)))))

(declare-fun b!1446033 () Bool)

(declare-fun res!977832 () Bool)

(assert (=> b!1446033 (=> (not res!977832) (not e!814487))))

(assert (=> b!1446033 (= res!977832 (and (= (size!47926 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47926 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47926 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1446034 () Bool)

(assert (=> b!1446034 (= e!814484 e!814485)))

(declare-fun res!977827 () Bool)

(assert (=> b!1446034 (=> (not res!977827) (not e!814485))))

(assert (=> b!1446034 (= res!977827 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47376 a!2862) j!93) mask!2687) (select (arr!47376 a!2862) j!93) a!2862 mask!2687) lt!634668))))

(assert (=> b!1446034 (= lt!634668 (Intermediate!11628 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1446035 () Bool)

(assert (=> b!1446035 (= e!814482 (or (= (select (arr!47376 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47376 a!2862) intermediateBeforeIndex!19) (select (arr!47376 a!2862) j!93))))))

(declare-fun b!1446036 () Bool)

(declare-fun res!977839 () Bool)

(assert (=> b!1446036 (=> (not res!977839) (not e!814487))))

(assert (=> b!1446036 (= res!977839 (validKeyInArray!0 (select (arr!47376 a!2862) i!1006)))))

(assert (= (and start!124728 res!977834) b!1446033))

(assert (= (and b!1446033 res!977832) b!1446036))

(assert (= (and b!1446036 res!977839) b!1446032))

(assert (= (and b!1446032 res!977836) b!1446031))

(assert (= (and b!1446031 res!977835) b!1446030))

(assert (= (and b!1446030 res!977830) b!1446028))

(assert (= (and b!1446028 res!977825) b!1446029))

(assert (= (and b!1446029 res!977828) b!1446034))

(assert (= (and b!1446034 res!977827) b!1446021))

(assert (= (and b!1446021 res!977837) b!1446026))

(assert (= (and b!1446026 res!977829) b!1446025))

(assert (= (and b!1446025 c!133608) b!1446024))

(assert (= (and b!1446025 (not c!133608)) b!1446022))

(assert (= (and b!1446025 res!977833) b!1446027))

(assert (= (and b!1446027 res!977831) b!1446020))

(assert (= (and b!1446020 res!977838) b!1446023))

(assert (= (and b!1446023 res!977826) b!1446035))

(declare-fun m!1334933 () Bool)

(assert (=> b!1446029 m!1334933))

(declare-fun m!1334935 () Bool)

(assert (=> b!1446029 m!1334935))

(declare-fun m!1334937 () Bool)

(assert (=> b!1446022 m!1334937))

(declare-fun m!1334939 () Bool)

(assert (=> b!1446022 m!1334939))

(declare-fun m!1334941 () Bool)

(assert (=> b!1446035 m!1334941))

(declare-fun m!1334943 () Bool)

(assert (=> b!1446035 m!1334943))

(assert (=> b!1446034 m!1334943))

(assert (=> b!1446034 m!1334943))

(declare-fun m!1334945 () Bool)

(assert (=> b!1446034 m!1334945))

(assert (=> b!1446034 m!1334945))

(assert (=> b!1446034 m!1334943))

(declare-fun m!1334947 () Bool)

(assert (=> b!1446034 m!1334947))

(declare-fun m!1334949 () Bool)

(assert (=> b!1446030 m!1334949))

(assert (=> b!1446032 m!1334943))

(assert (=> b!1446032 m!1334943))

(declare-fun m!1334951 () Bool)

(assert (=> b!1446032 m!1334951))

(assert (=> b!1446023 m!1334943))

(assert (=> b!1446023 m!1334943))

(declare-fun m!1334953 () Bool)

(assert (=> b!1446023 m!1334953))

(declare-fun m!1334955 () Bool)

(assert (=> start!124728 m!1334955))

(declare-fun m!1334957 () Bool)

(assert (=> start!124728 m!1334957))

(declare-fun m!1334959 () Bool)

(assert (=> b!1446031 m!1334959))

(declare-fun m!1334961 () Bool)

(assert (=> b!1446026 m!1334961))

(assert (=> b!1446026 m!1334961))

(declare-fun m!1334963 () Bool)

(assert (=> b!1446026 m!1334963))

(assert (=> b!1446026 m!1334933))

(declare-fun m!1334965 () Bool)

(assert (=> b!1446026 m!1334965))

(declare-fun m!1334967 () Bool)

(assert (=> b!1446020 m!1334967))

(declare-fun m!1334969 () Bool)

(assert (=> b!1446020 m!1334969))

(declare-fun m!1334971 () Bool)

(assert (=> b!1446024 m!1334971))

(assert (=> b!1446021 m!1334943))

(assert (=> b!1446021 m!1334943))

(declare-fun m!1334973 () Bool)

(assert (=> b!1446021 m!1334973))

(declare-fun m!1334975 () Bool)

(assert (=> b!1446036 m!1334975))

(assert (=> b!1446036 m!1334975))

(declare-fun m!1334977 () Bool)

(assert (=> b!1446036 m!1334977))

(check-sat (not b!1446030) (not b!1446032) (not b!1446034) (not b!1446020) (not b!1446022) (not b!1446026) (not b!1446023) (not start!124728) (not b!1446036) (not b!1446021) (not b!1446024) (not b!1446031))
(check-sat)
