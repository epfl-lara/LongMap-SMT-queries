; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125568 () Bool)

(assert start!125568)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98854 0))(
  ( (array!98855 (arr!47710 (Array (_ BitVec 32) (_ BitVec 64))) (size!48261 (_ BitVec 32))) )
))
(declare-fun lt!641279 () array!98854)

(declare-fun lt!641283 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11859 0))(
  ( (MissingZero!11859 (index!49828 (_ BitVec 32))) (Found!11859 (index!49829 (_ BitVec 32))) (Intermediate!11859 (undefined!12671 Bool) (index!49830 (_ BitVec 32)) (x!131605 (_ BitVec 32))) (Undefined!11859) (MissingVacant!11859 (index!49831 (_ BitVec 32))) )
))
(declare-fun lt!641284 () SeekEntryResult!11859)

(declare-fun e!823407 () Bool)

(declare-fun lt!641278 () (_ BitVec 64))

(declare-fun b!1464751 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98854 (_ BitVec 32)) SeekEntryResult!11859)

(assert (=> b!1464751 (= e!823407 (not (= lt!641284 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641283 lt!641278 lt!641279 mask!2687))))))

(declare-fun b!1464752 () Bool)

(declare-fun e!823409 () Bool)

(declare-fun e!823412 () Bool)

(assert (=> b!1464752 (= e!823409 e!823412)))

(declare-fun res!992987 () Bool)

(assert (=> b!1464752 (=> res!992987 e!823412)))

(declare-fun a!2862 () array!98854)

(assert (=> b!1464752 (= res!992987 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641283 #b00000000000000000000000000000000) (bvsge lt!641283 (size!48261 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464752 (= lt!641283 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1464753 () Bool)

(declare-fun e!823410 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1464753 (= e!823410 (or (= (select (arr!47710 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47710 a!2862) intermediateBeforeIndex!19) (select (arr!47710 a!2862) j!93))))))

(declare-fun b!1464754 () Bool)

(declare-fun e!823413 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98854 (_ BitVec 32)) SeekEntryResult!11859)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98854 (_ BitVec 32)) SeekEntryResult!11859)

(assert (=> b!1464754 (= e!823413 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641278 lt!641279 mask!2687) (seekEntryOrOpen!0 lt!641278 lt!641279 mask!2687)))))

(declare-fun b!1464755 () Bool)

(assert (=> b!1464755 (= e!823413 (= lt!641284 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641278 lt!641279 mask!2687)))))

(declare-fun b!1464756 () Bool)

(declare-fun res!992985 () Bool)

(declare-fun e!823404 () Bool)

(assert (=> b!1464756 (=> (not res!992985) (not e!823404))))

(declare-fun lt!641280 () SeekEntryResult!11859)

(assert (=> b!1464756 (= res!992985 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47710 a!2862) j!93) a!2862 mask!2687) lt!641280))))

(declare-fun b!1464757 () Bool)

(declare-fun res!992978 () Bool)

(declare-fun e!823405 () Bool)

(assert (=> b!1464757 (=> (not res!992978) (not e!823405))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1464757 (= res!992978 (validKeyInArray!0 (select (arr!47710 a!2862) i!1006)))))

(declare-fun b!1464759 () Bool)

(declare-fun e!823411 () Bool)

(assert (=> b!1464759 (= e!823405 e!823411)))

(declare-fun res!992993 () Bool)

(assert (=> b!1464759 (=> (not res!992993) (not e!823411))))

(assert (=> b!1464759 (= res!992993 (= (select (store (arr!47710 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1464759 (= lt!641279 (array!98855 (store (arr!47710 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48261 a!2862)))))

(declare-fun b!1464760 () Bool)

(assert (=> b!1464760 (= e!823412 true)))

(declare-fun lt!641281 () Bool)

(assert (=> b!1464760 (= lt!641281 e!823407)))

(declare-fun c!135408 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1464760 (= c!135408 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1464761 () Bool)

(assert (=> b!1464761 (= e!823411 e!823404)))

(declare-fun res!992991 () Bool)

(assert (=> b!1464761 (=> (not res!992991) (not e!823404))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464761 (= res!992991 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47710 a!2862) j!93) mask!2687) (select (arr!47710 a!2862) j!93) a!2862 mask!2687) lt!641280))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1464761 (= lt!641280 (Intermediate!11859 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1464762 () Bool)

(declare-fun res!992976 () Bool)

(assert (=> b!1464762 (=> res!992976 e!823412)))

(assert (=> b!1464762 (= res!992976 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641283 (select (arr!47710 a!2862) j!93) a!2862 mask!2687) lt!641280)))))

(declare-fun b!1464763 () Bool)

(assert (=> b!1464763 (= e!823407 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641283 intermediateAfterIndex!19 lt!641278 lt!641279 mask!2687) (seekEntryOrOpen!0 lt!641278 lt!641279 mask!2687))))))

(declare-fun b!1464764 () Bool)

(declare-fun res!992979 () Bool)

(assert (=> b!1464764 (=> (not res!992979) (not e!823410))))

(assert (=> b!1464764 (= res!992979 (= (seekEntryOrOpen!0 (select (arr!47710 a!2862) j!93) a!2862 mask!2687) (Found!11859 j!93)))))

(declare-fun b!1464765 () Bool)

(declare-fun res!992992 () Bool)

(assert (=> b!1464765 (=> (not res!992992) (not e!823405))))

(declare-datatypes ((List!34198 0))(
  ( (Nil!34195) (Cons!34194 (h!35558 (_ BitVec 64)) (t!48884 List!34198)) )
))
(declare-fun arrayNoDuplicates!0 (array!98854 (_ BitVec 32) List!34198) Bool)

(assert (=> b!1464765 (= res!992992 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34195))))

(declare-fun b!1464766 () Bool)

(declare-fun res!992988 () Bool)

(declare-fun e!823408 () Bool)

(assert (=> b!1464766 (=> (not res!992988) (not e!823408))))

(assert (=> b!1464766 (= res!992988 e!823413)))

(declare-fun c!135409 () Bool)

(assert (=> b!1464766 (= c!135409 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1464767 () Bool)

(assert (=> b!1464767 (= e!823404 e!823408)))

(declare-fun res!992986 () Bool)

(assert (=> b!1464767 (=> (not res!992986) (not e!823408))))

(assert (=> b!1464767 (= res!992986 (= lt!641284 (Intermediate!11859 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1464767 (= lt!641284 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641278 mask!2687) lt!641278 lt!641279 mask!2687))))

(assert (=> b!1464767 (= lt!641278 (select (store (arr!47710 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1464768 () Bool)

(declare-fun res!992982 () Bool)

(assert (=> b!1464768 (=> (not res!992982) (not e!823405))))

(assert (=> b!1464768 (= res!992982 (validKeyInArray!0 (select (arr!47710 a!2862) j!93)))))

(declare-fun b!1464769 () Bool)

(declare-fun res!992990 () Bool)

(assert (=> b!1464769 (=> (not res!992990) (not e!823405))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98854 (_ BitVec 32)) Bool)

(assert (=> b!1464769 (= res!992990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1464758 () Bool)

(declare-fun res!992981 () Bool)

(assert (=> b!1464758 (=> (not res!992981) (not e!823405))))

(assert (=> b!1464758 (= res!992981 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48261 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48261 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48261 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!992989 () Bool)

(assert (=> start!125568 (=> (not res!992989) (not e!823405))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125568 (= res!992989 (validMask!0 mask!2687))))

(assert (=> start!125568 e!823405))

(assert (=> start!125568 true))

(declare-fun array_inv!36991 (array!98854) Bool)

(assert (=> start!125568 (array_inv!36991 a!2862)))

(declare-fun b!1464770 () Bool)

(declare-fun res!992980 () Bool)

(assert (=> b!1464770 (=> (not res!992980) (not e!823405))))

(assert (=> b!1464770 (= res!992980 (and (= (size!48261 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48261 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48261 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1464771 () Bool)

(declare-fun res!992977 () Bool)

(assert (=> b!1464771 (=> (not res!992977) (not e!823408))))

(assert (=> b!1464771 (= res!992977 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1464772 () Bool)

(assert (=> b!1464772 (= e!823408 (not e!823409))))

(declare-fun res!992984 () Bool)

(assert (=> b!1464772 (=> res!992984 e!823409)))

(assert (=> b!1464772 (= res!992984 (or (and (= (select (arr!47710 a!2862) index!646) (select (store (arr!47710 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47710 a!2862) index!646) (select (arr!47710 a!2862) j!93))) (= (select (arr!47710 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1464772 e!823410))

(declare-fun res!992983 () Bool)

(assert (=> b!1464772 (=> (not res!992983) (not e!823410))))

(assert (=> b!1464772 (= res!992983 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49247 0))(
  ( (Unit!49248) )
))
(declare-fun lt!641282 () Unit!49247)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98854 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49247)

(assert (=> b!1464772 (= lt!641282 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125568 res!992989) b!1464770))

(assert (= (and b!1464770 res!992980) b!1464757))

(assert (= (and b!1464757 res!992978) b!1464768))

(assert (= (and b!1464768 res!992982) b!1464769))

(assert (= (and b!1464769 res!992990) b!1464765))

(assert (= (and b!1464765 res!992992) b!1464758))

(assert (= (and b!1464758 res!992981) b!1464759))

(assert (= (and b!1464759 res!992993) b!1464761))

(assert (= (and b!1464761 res!992991) b!1464756))

(assert (= (and b!1464756 res!992985) b!1464767))

(assert (= (and b!1464767 res!992986) b!1464766))

(assert (= (and b!1464766 c!135409) b!1464755))

(assert (= (and b!1464766 (not c!135409)) b!1464754))

(assert (= (and b!1464766 res!992988) b!1464771))

(assert (= (and b!1464771 res!992977) b!1464772))

(assert (= (and b!1464772 res!992983) b!1464764))

(assert (= (and b!1464764 res!992979) b!1464753))

(assert (= (and b!1464772 (not res!992984)) b!1464752))

(assert (= (and b!1464752 (not res!992987)) b!1464762))

(assert (= (and b!1464762 (not res!992976)) b!1464760))

(assert (= (and b!1464760 c!135408) b!1464751))

(assert (= (and b!1464760 (not c!135408)) b!1464763))

(declare-fun m!1352113 () Bool)

(assert (=> b!1464754 m!1352113))

(declare-fun m!1352115 () Bool)

(assert (=> b!1464754 m!1352115))

(declare-fun m!1352117 () Bool)

(assert (=> b!1464767 m!1352117))

(assert (=> b!1464767 m!1352117))

(declare-fun m!1352119 () Bool)

(assert (=> b!1464767 m!1352119))

(declare-fun m!1352121 () Bool)

(assert (=> b!1464767 m!1352121))

(declare-fun m!1352123 () Bool)

(assert (=> b!1464767 m!1352123))

(declare-fun m!1352125 () Bool)

(assert (=> b!1464761 m!1352125))

(assert (=> b!1464761 m!1352125))

(declare-fun m!1352127 () Bool)

(assert (=> b!1464761 m!1352127))

(assert (=> b!1464761 m!1352127))

(assert (=> b!1464761 m!1352125))

(declare-fun m!1352129 () Bool)

(assert (=> b!1464761 m!1352129))

(declare-fun m!1352131 () Bool)

(assert (=> b!1464772 m!1352131))

(assert (=> b!1464772 m!1352121))

(declare-fun m!1352133 () Bool)

(assert (=> b!1464772 m!1352133))

(declare-fun m!1352135 () Bool)

(assert (=> b!1464772 m!1352135))

(declare-fun m!1352137 () Bool)

(assert (=> b!1464772 m!1352137))

(assert (=> b!1464772 m!1352125))

(declare-fun m!1352139 () Bool)

(assert (=> b!1464755 m!1352139))

(declare-fun m!1352141 () Bool)

(assert (=> b!1464751 m!1352141))

(declare-fun m!1352143 () Bool)

(assert (=> b!1464765 m!1352143))

(assert (=> b!1464759 m!1352121))

(declare-fun m!1352145 () Bool)

(assert (=> b!1464759 m!1352145))

(assert (=> b!1464764 m!1352125))

(assert (=> b!1464764 m!1352125))

(declare-fun m!1352147 () Bool)

(assert (=> b!1464764 m!1352147))

(declare-fun m!1352149 () Bool)

(assert (=> start!125568 m!1352149))

(declare-fun m!1352151 () Bool)

(assert (=> start!125568 m!1352151))

(declare-fun m!1352153 () Bool)

(assert (=> b!1464763 m!1352153))

(assert (=> b!1464763 m!1352115))

(declare-fun m!1352155 () Bool)

(assert (=> b!1464769 m!1352155))

(assert (=> b!1464768 m!1352125))

(assert (=> b!1464768 m!1352125))

(declare-fun m!1352157 () Bool)

(assert (=> b!1464768 m!1352157))

(assert (=> b!1464756 m!1352125))

(assert (=> b!1464756 m!1352125))

(declare-fun m!1352159 () Bool)

(assert (=> b!1464756 m!1352159))

(declare-fun m!1352161 () Bool)

(assert (=> b!1464757 m!1352161))

(assert (=> b!1464757 m!1352161))

(declare-fun m!1352163 () Bool)

(assert (=> b!1464757 m!1352163))

(assert (=> b!1464762 m!1352125))

(assert (=> b!1464762 m!1352125))

(declare-fun m!1352165 () Bool)

(assert (=> b!1464762 m!1352165))

(declare-fun m!1352167 () Bool)

(assert (=> b!1464753 m!1352167))

(assert (=> b!1464753 m!1352125))

(declare-fun m!1352169 () Bool)

(assert (=> b!1464752 m!1352169))

(check-sat (not b!1464763) (not b!1464756) (not start!125568) (not b!1464757) (not b!1464767) (not b!1464761) (not b!1464755) (not b!1464752) (not b!1464765) (not b!1464764) (not b!1464768) (not b!1464769) (not b!1464772) (not b!1464751) (not b!1464754) (not b!1464762))
(check-sat)
