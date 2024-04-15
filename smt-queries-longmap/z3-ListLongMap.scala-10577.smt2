; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124570 () Bool)

(assert start!124570)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1442499 () Bool)

(declare-datatypes ((array!97996 0))(
  ( (array!97997 (arr!47287 (Array (_ BitVec 32) (_ BitVec 64))) (size!47839 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97996)

(declare-fun e!812971 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1442499 (= e!812971 (or (= (select (arr!47287 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47287 a!2862) intermediateBeforeIndex!19) (select (arr!47287 a!2862) j!93))))))

(declare-fun b!1442500 () Bool)

(declare-fun e!812970 () Bool)

(declare-fun e!812968 () Bool)

(assert (=> b!1442500 (= e!812970 e!812968)))

(declare-fun res!974812 () Bool)

(assert (=> b!1442500 (=> (not res!974812) (not e!812968))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11564 0))(
  ( (MissingZero!11564 (index!48648 (_ BitVec 32))) (Found!11564 (index!48649 (_ BitVec 32))) (Intermediate!11564 (undefined!12376 Bool) (index!48650 (_ BitVec 32)) (x!130352 (_ BitVec 32))) (Undefined!11564) (MissingVacant!11564 (index!48651 (_ BitVec 32))) )
))
(declare-fun lt!633402 () SeekEntryResult!11564)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97996 (_ BitVec 32)) SeekEntryResult!11564)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442500 (= res!974812 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47287 a!2862) j!93) mask!2687) (select (arr!47287 a!2862) j!93) a!2862 mask!2687) lt!633402))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1442500 (= lt!633402 (Intermediate!11564 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442501 () Bool)

(declare-fun e!812973 () Bool)

(assert (=> b!1442501 (= e!812973 (not true))))

(assert (=> b!1442501 e!812971))

(declare-fun res!974814 () Bool)

(assert (=> b!1442501 (=> (not res!974814) (not e!812971))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97996 (_ BitVec 32)) Bool)

(assert (=> b!1442501 (= res!974814 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48465 0))(
  ( (Unit!48466) )
))
(declare-fun lt!633404 () Unit!48465)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97996 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48465)

(assert (=> b!1442501 (= lt!633404 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1442502 () Bool)

(declare-fun res!974818 () Bool)

(declare-fun e!812969 () Bool)

(assert (=> b!1442502 (=> (not res!974818) (not e!812969))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1442502 (= res!974818 (and (= (size!47839 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47839 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47839 a!2862)) (not (= i!1006 j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!812967 () Bool)

(declare-fun lt!633405 () array!97996)

(declare-fun b!1442503 () Bool)

(declare-fun lt!633401 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97996 (_ BitVec 32)) SeekEntryResult!11564)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97996 (_ BitVec 32)) SeekEntryResult!11564)

(assert (=> b!1442503 (= e!812967 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633401 lt!633405 mask!2687) (seekEntryOrOpen!0 lt!633401 lt!633405 mask!2687)))))

(declare-fun b!1442504 () Bool)

(declare-fun res!974815 () Bool)

(assert (=> b!1442504 (=> (not res!974815) (not e!812969))))

(declare-datatypes ((List!33866 0))(
  ( (Nil!33863) (Cons!33862 (h!35212 (_ BitVec 64)) (t!48552 List!33866)) )
))
(declare-fun arrayNoDuplicates!0 (array!97996 (_ BitVec 32) List!33866) Bool)

(assert (=> b!1442504 (= res!974815 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33863))))

(declare-fun b!1442505 () Bool)

(declare-fun res!974809 () Bool)

(assert (=> b!1442505 (=> (not res!974809) (not e!812973))))

(assert (=> b!1442505 (= res!974809 e!812967)))

(declare-fun c!133360 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1442505 (= c!133360 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442506 () Bool)

(declare-fun res!974804 () Bool)

(assert (=> b!1442506 (=> (not res!974804) (not e!812969))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442506 (= res!974804 (validKeyInArray!0 (select (arr!47287 a!2862) i!1006)))))

(declare-fun b!1442507 () Bool)

(declare-fun res!974811 () Bool)

(assert (=> b!1442507 (=> (not res!974811) (not e!812973))))

(assert (=> b!1442507 (= res!974811 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1442508 () Bool)

(declare-fun res!974805 () Bool)

(assert (=> b!1442508 (=> (not res!974805) (not e!812969))))

(assert (=> b!1442508 (= res!974805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!633403 () SeekEntryResult!11564)

(declare-fun b!1442509 () Bool)

(assert (=> b!1442509 (= e!812967 (= lt!633403 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633401 lt!633405 mask!2687)))))

(declare-fun b!1442510 () Bool)

(declare-fun res!974817 () Bool)

(assert (=> b!1442510 (=> (not res!974817) (not e!812969))))

(assert (=> b!1442510 (= res!974817 (validKeyInArray!0 (select (arr!47287 a!2862) j!93)))))

(declare-fun b!1442498 () Bool)

(assert (=> b!1442498 (= e!812969 e!812970)))

(declare-fun res!974806 () Bool)

(assert (=> b!1442498 (=> (not res!974806) (not e!812970))))

(assert (=> b!1442498 (= res!974806 (= (select (store (arr!47287 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442498 (= lt!633405 (array!97997 (store (arr!47287 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47839 a!2862)))))

(declare-fun res!974813 () Bool)

(assert (=> start!124570 (=> (not res!974813) (not e!812969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124570 (= res!974813 (validMask!0 mask!2687))))

(assert (=> start!124570 e!812969))

(assert (=> start!124570 true))

(declare-fun array_inv!36520 (array!97996) Bool)

(assert (=> start!124570 (array_inv!36520 a!2862)))

(declare-fun b!1442511 () Bool)

(declare-fun res!974816 () Bool)

(assert (=> b!1442511 (=> (not res!974816) (not e!812968))))

(assert (=> b!1442511 (= res!974816 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47287 a!2862) j!93) a!2862 mask!2687) lt!633402))))

(declare-fun b!1442512 () Bool)

(declare-fun res!974807 () Bool)

(assert (=> b!1442512 (=> (not res!974807) (not e!812969))))

(assert (=> b!1442512 (= res!974807 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47839 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47839 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47839 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1442513 () Bool)

(assert (=> b!1442513 (= e!812968 e!812973)))

(declare-fun res!974808 () Bool)

(assert (=> b!1442513 (=> (not res!974808) (not e!812973))))

(assert (=> b!1442513 (= res!974808 (= lt!633403 (Intermediate!11564 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1442513 (= lt!633403 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633401 mask!2687) lt!633401 lt!633405 mask!2687))))

(assert (=> b!1442513 (= lt!633401 (select (store (arr!47287 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1442514 () Bool)

(declare-fun res!974810 () Bool)

(assert (=> b!1442514 (=> (not res!974810) (not e!812971))))

(assert (=> b!1442514 (= res!974810 (= (seekEntryOrOpen!0 (select (arr!47287 a!2862) j!93) a!2862 mask!2687) (Found!11564 j!93)))))

(assert (= (and start!124570 res!974813) b!1442502))

(assert (= (and b!1442502 res!974818) b!1442506))

(assert (= (and b!1442506 res!974804) b!1442510))

(assert (= (and b!1442510 res!974817) b!1442508))

(assert (= (and b!1442508 res!974805) b!1442504))

(assert (= (and b!1442504 res!974815) b!1442512))

(assert (= (and b!1442512 res!974807) b!1442498))

(assert (= (and b!1442498 res!974806) b!1442500))

(assert (= (and b!1442500 res!974812) b!1442511))

(assert (= (and b!1442511 res!974816) b!1442513))

(assert (= (and b!1442513 res!974808) b!1442505))

(assert (= (and b!1442505 c!133360) b!1442509))

(assert (= (and b!1442505 (not c!133360)) b!1442503))

(assert (= (and b!1442505 res!974809) b!1442507))

(assert (= (and b!1442507 res!974811) b!1442501))

(assert (= (and b!1442501 res!974814) b!1442514))

(assert (= (and b!1442514 res!974810) b!1442499))

(declare-fun m!1331145 () Bool)

(assert (=> b!1442501 m!1331145))

(declare-fun m!1331147 () Bool)

(assert (=> b!1442501 m!1331147))

(declare-fun m!1331149 () Bool)

(assert (=> b!1442510 m!1331149))

(assert (=> b!1442510 m!1331149))

(declare-fun m!1331151 () Bool)

(assert (=> b!1442510 m!1331151))

(declare-fun m!1331153 () Bool)

(assert (=> b!1442513 m!1331153))

(assert (=> b!1442513 m!1331153))

(declare-fun m!1331155 () Bool)

(assert (=> b!1442513 m!1331155))

(declare-fun m!1331157 () Bool)

(assert (=> b!1442513 m!1331157))

(declare-fun m!1331159 () Bool)

(assert (=> b!1442513 m!1331159))

(declare-fun m!1331161 () Bool)

(assert (=> b!1442504 m!1331161))

(assert (=> b!1442511 m!1331149))

(assert (=> b!1442511 m!1331149))

(declare-fun m!1331163 () Bool)

(assert (=> b!1442511 m!1331163))

(assert (=> b!1442500 m!1331149))

(assert (=> b!1442500 m!1331149))

(declare-fun m!1331165 () Bool)

(assert (=> b!1442500 m!1331165))

(assert (=> b!1442500 m!1331165))

(assert (=> b!1442500 m!1331149))

(declare-fun m!1331167 () Bool)

(assert (=> b!1442500 m!1331167))

(assert (=> b!1442498 m!1331157))

(declare-fun m!1331169 () Bool)

(assert (=> b!1442498 m!1331169))

(declare-fun m!1331171 () Bool)

(assert (=> b!1442499 m!1331171))

(assert (=> b!1442499 m!1331149))

(declare-fun m!1331173 () Bool)

(assert (=> b!1442509 m!1331173))

(declare-fun m!1331175 () Bool)

(assert (=> b!1442506 m!1331175))

(assert (=> b!1442506 m!1331175))

(declare-fun m!1331177 () Bool)

(assert (=> b!1442506 m!1331177))

(declare-fun m!1331179 () Bool)

(assert (=> start!124570 m!1331179))

(declare-fun m!1331181 () Bool)

(assert (=> start!124570 m!1331181))

(assert (=> b!1442514 m!1331149))

(assert (=> b!1442514 m!1331149))

(declare-fun m!1331183 () Bool)

(assert (=> b!1442514 m!1331183))

(declare-fun m!1331185 () Bool)

(assert (=> b!1442508 m!1331185))

(declare-fun m!1331187 () Bool)

(assert (=> b!1442503 m!1331187))

(declare-fun m!1331189 () Bool)

(assert (=> b!1442503 m!1331189))

(check-sat (not b!1442509) (not b!1442503) (not b!1442511) (not b!1442508) (not b!1442513) (not b!1442504) (not b!1442506) (not b!1442500) (not b!1442514) (not b!1442501) (not start!124570) (not b!1442510))
(check-sat)
