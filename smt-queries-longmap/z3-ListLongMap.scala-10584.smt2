; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124612 () Bool)

(assert start!124612)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!813442 () Bool)

(declare-datatypes ((array!98038 0))(
  ( (array!98039 (arr!47308 (Array (_ BitVec 32) (_ BitVec 64))) (size!47860 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98038)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun b!1443598 () Bool)

(assert (=> b!1443598 (= e!813442 (or (= (select (arr!47308 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47308 a!2862) intermediateBeforeIndex!19) (select (arr!47308 a!2862) j!93))))))

(declare-fun b!1443599 () Bool)

(declare-fun e!813439 () Bool)

(assert (=> b!1443599 (= e!813439 true)))

(declare-fun lt!633750 () array!98038)

(declare-datatypes ((SeekEntryResult!11585 0))(
  ( (MissingZero!11585 (index!48732 (_ BitVec 32))) (Found!11585 (index!48733 (_ BitVec 32))) (Intermediate!11585 (undefined!12397 Bool) (index!48734 (_ BitVec 32)) (x!130429 (_ BitVec 32))) (Undefined!11585) (MissingVacant!11585 (index!48735 (_ BitVec 32))) )
))
(declare-fun lt!633745 () SeekEntryResult!11585)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!633748 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98038 (_ BitVec 32)) SeekEntryResult!11585)

(assert (=> b!1443599 (= lt!633745 (seekEntryOrOpen!0 lt!633748 lt!633750 mask!2687))))

(declare-fun b!1443600 () Bool)

(declare-fun e!813437 () Bool)

(declare-fun e!813444 () Bool)

(assert (=> b!1443600 (= e!813437 e!813444)))

(declare-fun res!975786 () Bool)

(assert (=> b!1443600 (=> (not res!975786) (not e!813444))))

(declare-fun lt!633747 () SeekEntryResult!11585)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98038 (_ BitVec 32)) SeekEntryResult!11585)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443600 (= res!975786 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47308 a!2862) j!93) mask!2687) (select (arr!47308 a!2862) j!93) a!2862 mask!2687) lt!633747))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1443600 (= lt!633747 (Intermediate!11585 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443601 () Bool)

(declare-fun res!975791 () Bool)

(declare-fun e!813443 () Bool)

(assert (=> b!1443601 (=> (not res!975791) (not e!813443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443601 (= res!975791 (validKeyInArray!0 (select (arr!47308 a!2862) j!93)))))

(declare-fun b!1443602 () Bool)

(declare-fun e!813440 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98038 (_ BitVec 32)) SeekEntryResult!11585)

(assert (=> b!1443602 (= e!813440 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633748 lt!633750 mask!2687) (seekEntryOrOpen!0 lt!633748 lt!633750 mask!2687)))))

(declare-fun b!1443603 () Bool)

(declare-fun e!813438 () Bool)

(assert (=> b!1443603 (= e!813438 (not e!813439))))

(declare-fun res!975787 () Bool)

(assert (=> b!1443603 (=> res!975787 e!813439)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1443603 (= res!975787 (or (not (= (select (arr!47308 a!2862) index!646) (select (store (arr!47308 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47308 a!2862) index!646) (select (arr!47308 a!2862) j!93)))))))

(assert (=> b!1443603 e!813442))

(declare-fun res!975779 () Bool)

(assert (=> b!1443603 (=> (not res!975779) (not e!813442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98038 (_ BitVec 32)) Bool)

(assert (=> b!1443603 (= res!975779 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48507 0))(
  ( (Unit!48508) )
))
(declare-fun lt!633746 () Unit!48507)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98038 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48507)

(assert (=> b!1443603 (= lt!633746 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!975790 () Bool)

(assert (=> start!124612 (=> (not res!975790) (not e!813443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124612 (= res!975790 (validMask!0 mask!2687))))

(assert (=> start!124612 e!813443))

(assert (=> start!124612 true))

(declare-fun array_inv!36541 (array!98038) Bool)

(assert (=> start!124612 (array_inv!36541 a!2862)))

(declare-fun b!1443604 () Bool)

(declare-fun res!975783 () Bool)

(assert (=> b!1443604 (=> (not res!975783) (not e!813442))))

(assert (=> b!1443604 (= res!975783 (= (seekEntryOrOpen!0 (select (arr!47308 a!2862) j!93) a!2862 mask!2687) (Found!11585 j!93)))))

(declare-fun b!1443605 () Bool)

(declare-fun res!975781 () Bool)

(assert (=> b!1443605 (=> (not res!975781) (not e!813443))))

(assert (=> b!1443605 (= res!975781 (validKeyInArray!0 (select (arr!47308 a!2862) i!1006)))))

(declare-fun b!1443606 () Bool)

(assert (=> b!1443606 (= e!813444 e!813438)))

(declare-fun res!975785 () Bool)

(assert (=> b!1443606 (=> (not res!975785) (not e!813438))))

(declare-fun lt!633749 () SeekEntryResult!11585)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1443606 (= res!975785 (= lt!633749 (Intermediate!11585 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1443606 (= lt!633749 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633748 mask!2687) lt!633748 lt!633750 mask!2687))))

(assert (=> b!1443606 (= lt!633748 (select (store (arr!47308 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443607 () Bool)

(declare-fun res!975792 () Bool)

(assert (=> b!1443607 (=> (not res!975792) (not e!813443))))

(assert (=> b!1443607 (= res!975792 (and (= (size!47860 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47860 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47860 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1443608 () Bool)

(declare-fun res!975782 () Bool)

(assert (=> b!1443608 (=> (not res!975782) (not e!813438))))

(assert (=> b!1443608 (= res!975782 e!813440)))

(declare-fun c!133423 () Bool)

(assert (=> b!1443608 (= c!133423 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443609 () Bool)

(assert (=> b!1443609 (= e!813443 e!813437)))

(declare-fun res!975778 () Bool)

(assert (=> b!1443609 (=> (not res!975778) (not e!813437))))

(assert (=> b!1443609 (= res!975778 (= (select (store (arr!47308 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1443609 (= lt!633750 (array!98039 (store (arr!47308 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47860 a!2862)))))

(declare-fun b!1443610 () Bool)

(declare-fun res!975784 () Bool)

(assert (=> b!1443610 (=> (not res!975784) (not e!813438))))

(assert (=> b!1443610 (= res!975784 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443611 () Bool)

(declare-fun res!975793 () Bool)

(assert (=> b!1443611 (=> (not res!975793) (not e!813443))))

(declare-datatypes ((List!33887 0))(
  ( (Nil!33884) (Cons!33883 (h!35233 (_ BitVec 64)) (t!48573 List!33887)) )
))
(declare-fun arrayNoDuplicates!0 (array!98038 (_ BitVec 32) List!33887) Bool)

(assert (=> b!1443611 (= res!975793 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33884))))

(declare-fun b!1443612 () Bool)

(declare-fun res!975789 () Bool)

(assert (=> b!1443612 (=> (not res!975789) (not e!813444))))

(assert (=> b!1443612 (= res!975789 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47308 a!2862) j!93) a!2862 mask!2687) lt!633747))))

(declare-fun b!1443613 () Bool)

(declare-fun res!975788 () Bool)

(assert (=> b!1443613 (=> (not res!975788) (not e!813443))))

(assert (=> b!1443613 (= res!975788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443614 () Bool)

(declare-fun res!975780 () Bool)

(assert (=> b!1443614 (=> (not res!975780) (not e!813443))))

(assert (=> b!1443614 (= res!975780 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47860 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47860 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47860 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443615 () Bool)

(assert (=> b!1443615 (= e!813440 (= lt!633749 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633748 lt!633750 mask!2687)))))

(assert (= (and start!124612 res!975790) b!1443607))

(assert (= (and b!1443607 res!975792) b!1443605))

(assert (= (and b!1443605 res!975781) b!1443601))

(assert (= (and b!1443601 res!975791) b!1443613))

(assert (= (and b!1443613 res!975788) b!1443611))

(assert (= (and b!1443611 res!975793) b!1443614))

(assert (= (and b!1443614 res!975780) b!1443609))

(assert (= (and b!1443609 res!975778) b!1443600))

(assert (= (and b!1443600 res!975786) b!1443612))

(assert (= (and b!1443612 res!975789) b!1443606))

(assert (= (and b!1443606 res!975785) b!1443608))

(assert (= (and b!1443608 c!133423) b!1443615))

(assert (= (and b!1443608 (not c!133423)) b!1443602))

(assert (= (and b!1443608 res!975782) b!1443610))

(assert (= (and b!1443610 res!975784) b!1443603))

(assert (= (and b!1443603 res!975779) b!1443604))

(assert (= (and b!1443604 res!975783) b!1443598))

(assert (= (and b!1443603 (not res!975787)) b!1443599))

(declare-fun m!1332177 () Bool)

(assert (=> b!1443611 m!1332177))

(declare-fun m!1332179 () Bool)

(assert (=> b!1443605 m!1332179))

(assert (=> b!1443605 m!1332179))

(declare-fun m!1332181 () Bool)

(assert (=> b!1443605 m!1332181))

(declare-fun m!1332183 () Bool)

(assert (=> b!1443604 m!1332183))

(assert (=> b!1443604 m!1332183))

(declare-fun m!1332185 () Bool)

(assert (=> b!1443604 m!1332185))

(declare-fun m!1332187 () Bool)

(assert (=> b!1443598 m!1332187))

(assert (=> b!1443598 m!1332183))

(declare-fun m!1332189 () Bool)

(assert (=> b!1443603 m!1332189))

(declare-fun m!1332191 () Bool)

(assert (=> b!1443603 m!1332191))

(declare-fun m!1332193 () Bool)

(assert (=> b!1443603 m!1332193))

(declare-fun m!1332195 () Bool)

(assert (=> b!1443603 m!1332195))

(declare-fun m!1332197 () Bool)

(assert (=> b!1443603 m!1332197))

(assert (=> b!1443603 m!1332183))

(assert (=> b!1443600 m!1332183))

(assert (=> b!1443600 m!1332183))

(declare-fun m!1332199 () Bool)

(assert (=> b!1443600 m!1332199))

(assert (=> b!1443600 m!1332199))

(assert (=> b!1443600 m!1332183))

(declare-fun m!1332201 () Bool)

(assert (=> b!1443600 m!1332201))

(declare-fun m!1332203 () Bool)

(assert (=> b!1443606 m!1332203))

(assert (=> b!1443606 m!1332203))

(declare-fun m!1332205 () Bool)

(assert (=> b!1443606 m!1332205))

(assert (=> b!1443606 m!1332191))

(declare-fun m!1332207 () Bool)

(assert (=> b!1443606 m!1332207))

(assert (=> b!1443609 m!1332191))

(declare-fun m!1332209 () Bool)

(assert (=> b!1443609 m!1332209))

(declare-fun m!1332211 () Bool)

(assert (=> b!1443615 m!1332211))

(declare-fun m!1332213 () Bool)

(assert (=> start!124612 m!1332213))

(declare-fun m!1332215 () Bool)

(assert (=> start!124612 m!1332215))

(declare-fun m!1332217 () Bool)

(assert (=> b!1443599 m!1332217))

(assert (=> b!1443612 m!1332183))

(assert (=> b!1443612 m!1332183))

(declare-fun m!1332219 () Bool)

(assert (=> b!1443612 m!1332219))

(declare-fun m!1332221 () Bool)

(assert (=> b!1443602 m!1332221))

(assert (=> b!1443602 m!1332217))

(assert (=> b!1443601 m!1332183))

(assert (=> b!1443601 m!1332183))

(declare-fun m!1332223 () Bool)

(assert (=> b!1443601 m!1332223))

(declare-fun m!1332225 () Bool)

(assert (=> b!1443613 m!1332225))

(check-sat (not b!1443605) (not b!1443612) (not b!1443613) (not start!124612) (not b!1443611) (not b!1443606) (not b!1443604) (not b!1443599) (not b!1443602) (not b!1443615) (not b!1443603) (not b!1443600) (not b!1443601))
(check-sat)
