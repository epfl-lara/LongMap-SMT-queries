; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125036 () Bool)

(assert start!125036)

(declare-fun b!1454832 () Bool)

(declare-fun e!818705 () Bool)

(declare-fun e!818711 () Bool)

(assert (=> b!1454832 (= e!818705 e!818711)))

(declare-fun res!985609 () Bool)

(assert (=> b!1454832 (=> (not res!985609) (not e!818711))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98484 0))(
  ( (array!98485 (arr!47530 (Array (_ BitVec 32) (_ BitVec 64))) (size!48080 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98484)

(assert (=> b!1454832 (= res!985609 (= (select (store (arr!47530 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!637735 () array!98484)

(assert (=> b!1454832 (= lt!637735 (array!98485 (store (arr!47530 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48080 a!2862)))))

(declare-fun b!1454833 () Bool)

(declare-fun e!818702 () Bool)

(assert (=> b!1454833 (= e!818702 true)))

(declare-fun lt!637733 () Bool)

(declare-fun e!818709 () Bool)

(assert (=> b!1454833 (= lt!637733 e!818709)))

(declare-fun c!134124 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1454833 (= c!134124 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun lt!637734 () (_ BitVec 64))

(declare-fun b!1454834 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11782 0))(
  ( (MissingZero!11782 (index!49520 (_ BitVec 32))) (Found!11782 (index!49521 (_ BitVec 32))) (Intermediate!11782 (undefined!12594 Bool) (index!49522 (_ BitVec 32)) (x!131151 (_ BitVec 32))) (Undefined!11782) (MissingVacant!11782 (index!49523 (_ BitVec 32))) )
))
(declare-fun lt!637736 () SeekEntryResult!11782)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!818703 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98484 (_ BitVec 32)) SeekEntryResult!11782)

(assert (=> b!1454834 (= e!818703 (= lt!637736 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637734 lt!637735 mask!2687)))))

(declare-fun b!1454835 () Bool)

(declare-fun res!985619 () Bool)

(declare-fun e!818707 () Bool)

(assert (=> b!1454835 (=> (not res!985619) (not e!818707))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98484 (_ BitVec 32)) SeekEntryResult!11782)

(assert (=> b!1454835 (= res!985619 (= (seekEntryOrOpen!0 (select (arr!47530 a!2862) j!93) a!2862 mask!2687) (Found!11782 j!93)))))

(declare-fun b!1454837 () Bool)

(declare-fun res!985617 () Bool)

(assert (=> b!1454837 (=> (not res!985617) (not e!818705))))

(declare-datatypes ((List!34031 0))(
  ( (Nil!34028) (Cons!34027 (h!35377 (_ BitVec 64)) (t!48725 List!34031)) )
))
(declare-fun arrayNoDuplicates!0 (array!98484 (_ BitVec 32) List!34031) Bool)

(assert (=> b!1454837 (= res!985617 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34028))))

(declare-fun b!1454838 () Bool)

(declare-fun res!985620 () Bool)

(declare-fun e!818706 () Bool)

(assert (=> b!1454838 (=> (not res!985620) (not e!818706))))

(assert (=> b!1454838 (= res!985620 e!818703)))

(declare-fun c!134123 () Bool)

(assert (=> b!1454838 (= c!134123 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1454839 () Bool)

(declare-fun res!985613 () Bool)

(declare-fun e!818708 () Bool)

(assert (=> b!1454839 (=> (not res!985613) (not e!818708))))

(declare-fun lt!637730 () SeekEntryResult!11782)

(assert (=> b!1454839 (= res!985613 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47530 a!2862) j!93) a!2862 mask!2687) lt!637730))))

(declare-fun b!1454840 () Bool)

(declare-fun res!985611 () Bool)

(assert (=> b!1454840 (=> res!985611 e!818702)))

(declare-fun lt!637732 () (_ BitVec 32))

(assert (=> b!1454840 (= res!985611 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637732 (select (arr!47530 a!2862) j!93) a!2862 mask!2687) lt!637730)))))

(declare-fun b!1454841 () Bool)

(declare-fun res!985624 () Bool)

(assert (=> b!1454841 (=> (not res!985624) (not e!818705))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1454841 (= res!985624 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48080 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48080 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48080 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1454842 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98484 (_ BitVec 32)) SeekEntryResult!11782)

(assert (=> b!1454842 (= e!818703 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637734 lt!637735 mask!2687) (seekEntryOrOpen!0 lt!637734 lt!637735 mask!2687)))))

(declare-fun lt!637737 () SeekEntryResult!11782)

(declare-fun b!1454843 () Bool)

(assert (=> b!1454843 (= e!818709 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637732 intermediateAfterIndex!19 lt!637734 lt!637735 mask!2687) lt!637737)))))

(declare-fun b!1454844 () Bool)

(declare-fun res!985608 () Bool)

(assert (=> b!1454844 (=> (not res!985608) (not e!818705))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1454844 (= res!985608 (validKeyInArray!0 (select (arr!47530 a!2862) j!93)))))

(declare-fun b!1454845 () Bool)

(declare-fun res!985623 () Bool)

(assert (=> b!1454845 (=> (not res!985623) (not e!818705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98484 (_ BitVec 32)) Bool)

(assert (=> b!1454845 (= res!985623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1454846 () Bool)

(declare-fun res!985614 () Bool)

(assert (=> b!1454846 (=> (not res!985614) (not e!818706))))

(assert (=> b!1454846 (= res!985614 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1454847 () Bool)

(assert (=> b!1454847 (= e!818709 (not (= lt!637736 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637732 lt!637734 lt!637735 mask!2687))))))

(declare-fun b!1454848 () Bool)

(declare-fun e!818704 () Bool)

(assert (=> b!1454848 (= e!818706 (not e!818704))))

(declare-fun res!985607 () Bool)

(assert (=> b!1454848 (=> res!985607 e!818704)))

(assert (=> b!1454848 (= res!985607 (or (and (= (select (arr!47530 a!2862) index!646) (select (store (arr!47530 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47530 a!2862) index!646) (select (arr!47530 a!2862) j!93))) (= (select (arr!47530 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1454848 e!818707))

(declare-fun res!985621 () Bool)

(assert (=> b!1454848 (=> (not res!985621) (not e!818707))))

(assert (=> b!1454848 (= res!985621 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49060 0))(
  ( (Unit!49061) )
))
(declare-fun lt!637731 () Unit!49060)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98484 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49060)

(assert (=> b!1454848 (= lt!637731 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1454849 () Bool)

(assert (=> b!1454849 (= e!818708 e!818706)))

(declare-fun res!985616 () Bool)

(assert (=> b!1454849 (=> (not res!985616) (not e!818706))))

(assert (=> b!1454849 (= res!985616 (= lt!637736 (Intermediate!11782 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454849 (= lt!637736 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637734 mask!2687) lt!637734 lt!637735 mask!2687))))

(assert (=> b!1454849 (= lt!637734 (select (store (arr!47530 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1454850 () Bool)

(assert (=> b!1454850 (= e!818707 (and (or (= (select (arr!47530 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47530 a!2862) intermediateBeforeIndex!19) (select (arr!47530 a!2862) j!93))) (let ((bdg!53095 (select (store (arr!47530 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47530 a!2862) index!646) bdg!53095) (= (select (arr!47530 a!2862) index!646) (select (arr!47530 a!2862) j!93))) (= (select (arr!47530 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53095 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1454851 () Bool)

(assert (=> b!1454851 (= e!818711 e!818708)))

(declare-fun res!985610 () Bool)

(assert (=> b!1454851 (=> (not res!985610) (not e!818708))))

(assert (=> b!1454851 (= res!985610 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47530 a!2862) j!93) mask!2687) (select (arr!47530 a!2862) j!93) a!2862 mask!2687) lt!637730))))

(assert (=> b!1454851 (= lt!637730 (Intermediate!11782 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1454836 () Bool)

(declare-fun res!985612 () Bool)

(assert (=> b!1454836 (=> (not res!985612) (not e!818705))))

(assert (=> b!1454836 (= res!985612 (and (= (size!48080 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48080 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48080 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!985618 () Bool)

(assert (=> start!125036 (=> (not res!985618) (not e!818705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125036 (= res!985618 (validMask!0 mask!2687))))

(assert (=> start!125036 e!818705))

(assert (=> start!125036 true))

(declare-fun array_inv!36558 (array!98484) Bool)

(assert (=> start!125036 (array_inv!36558 a!2862)))

(declare-fun b!1454852 () Bool)

(assert (=> b!1454852 (= e!818704 e!818702)))

(declare-fun res!985622 () Bool)

(assert (=> b!1454852 (=> res!985622 e!818702)))

(assert (=> b!1454852 (= res!985622 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637732 #b00000000000000000000000000000000) (bvsge lt!637732 (size!48080 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454852 (= lt!637732 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1454852 (= lt!637737 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637734 lt!637735 mask!2687))))

(assert (=> b!1454852 (= lt!637737 (seekEntryOrOpen!0 lt!637734 lt!637735 mask!2687))))

(declare-fun b!1454853 () Bool)

(declare-fun res!985615 () Bool)

(assert (=> b!1454853 (=> (not res!985615) (not e!818705))))

(assert (=> b!1454853 (= res!985615 (validKeyInArray!0 (select (arr!47530 a!2862) i!1006)))))

(assert (= (and start!125036 res!985618) b!1454836))

(assert (= (and b!1454836 res!985612) b!1454853))

(assert (= (and b!1454853 res!985615) b!1454844))

(assert (= (and b!1454844 res!985608) b!1454845))

(assert (= (and b!1454845 res!985623) b!1454837))

(assert (= (and b!1454837 res!985617) b!1454841))

(assert (= (and b!1454841 res!985624) b!1454832))

(assert (= (and b!1454832 res!985609) b!1454851))

(assert (= (and b!1454851 res!985610) b!1454839))

(assert (= (and b!1454839 res!985613) b!1454849))

(assert (= (and b!1454849 res!985616) b!1454838))

(assert (= (and b!1454838 c!134123) b!1454834))

(assert (= (and b!1454838 (not c!134123)) b!1454842))

(assert (= (and b!1454838 res!985620) b!1454846))

(assert (= (and b!1454846 res!985614) b!1454848))

(assert (= (and b!1454848 res!985621) b!1454835))

(assert (= (and b!1454835 res!985619) b!1454850))

(assert (= (and b!1454848 (not res!985607)) b!1454852))

(assert (= (and b!1454852 (not res!985622)) b!1454840))

(assert (= (and b!1454840 (not res!985611)) b!1454833))

(assert (= (and b!1454833 c!134124) b!1454847))

(assert (= (and b!1454833 (not c!134124)) b!1454843))

(declare-fun m!1343127 () Bool)

(assert (=> b!1454852 m!1343127))

(declare-fun m!1343129 () Bool)

(assert (=> b!1454852 m!1343129))

(declare-fun m!1343131 () Bool)

(assert (=> b!1454852 m!1343131))

(declare-fun m!1343133 () Bool)

(assert (=> b!1454850 m!1343133))

(declare-fun m!1343135 () Bool)

(assert (=> b!1454850 m!1343135))

(declare-fun m!1343137 () Bool)

(assert (=> b!1454850 m!1343137))

(declare-fun m!1343139 () Bool)

(assert (=> b!1454850 m!1343139))

(declare-fun m!1343141 () Bool)

(assert (=> b!1454850 m!1343141))

(declare-fun m!1343143 () Bool)

(assert (=> start!125036 m!1343143))

(declare-fun m!1343145 () Bool)

(assert (=> start!125036 m!1343145))

(assert (=> b!1454840 m!1343141))

(assert (=> b!1454840 m!1343141))

(declare-fun m!1343147 () Bool)

(assert (=> b!1454840 m!1343147))

(declare-fun m!1343149 () Bool)

(assert (=> b!1454843 m!1343149))

(assert (=> b!1454832 m!1343133))

(declare-fun m!1343151 () Bool)

(assert (=> b!1454832 m!1343151))

(assert (=> b!1454835 m!1343141))

(assert (=> b!1454835 m!1343141))

(declare-fun m!1343153 () Bool)

(assert (=> b!1454835 m!1343153))

(declare-fun m!1343155 () Bool)

(assert (=> b!1454837 m!1343155))

(declare-fun m!1343157 () Bool)

(assert (=> b!1454848 m!1343157))

(assert (=> b!1454848 m!1343133))

(assert (=> b!1454848 m!1343137))

(assert (=> b!1454848 m!1343139))

(declare-fun m!1343159 () Bool)

(assert (=> b!1454848 m!1343159))

(assert (=> b!1454848 m!1343141))

(declare-fun m!1343161 () Bool)

(assert (=> b!1454853 m!1343161))

(assert (=> b!1454853 m!1343161))

(declare-fun m!1343163 () Bool)

(assert (=> b!1454853 m!1343163))

(declare-fun m!1343165 () Bool)

(assert (=> b!1454847 m!1343165))

(assert (=> b!1454839 m!1343141))

(assert (=> b!1454839 m!1343141))

(declare-fun m!1343167 () Bool)

(assert (=> b!1454839 m!1343167))

(assert (=> b!1454842 m!1343129))

(assert (=> b!1454842 m!1343131))

(assert (=> b!1454844 m!1343141))

(assert (=> b!1454844 m!1343141))

(declare-fun m!1343169 () Bool)

(assert (=> b!1454844 m!1343169))

(declare-fun m!1343171 () Bool)

(assert (=> b!1454849 m!1343171))

(assert (=> b!1454849 m!1343171))

(declare-fun m!1343173 () Bool)

(assert (=> b!1454849 m!1343173))

(assert (=> b!1454849 m!1343133))

(declare-fun m!1343175 () Bool)

(assert (=> b!1454849 m!1343175))

(declare-fun m!1343177 () Bool)

(assert (=> b!1454834 m!1343177))

(assert (=> b!1454851 m!1343141))

(assert (=> b!1454851 m!1343141))

(declare-fun m!1343179 () Bool)

(assert (=> b!1454851 m!1343179))

(assert (=> b!1454851 m!1343179))

(assert (=> b!1454851 m!1343141))

(declare-fun m!1343181 () Bool)

(assert (=> b!1454851 m!1343181))

(declare-fun m!1343183 () Bool)

(assert (=> b!1454845 m!1343183))

(push 1)

