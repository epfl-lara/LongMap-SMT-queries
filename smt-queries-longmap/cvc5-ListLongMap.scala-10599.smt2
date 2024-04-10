; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124732 () Bool)

(assert start!124732)

(declare-fun res!977929 () Bool)

(declare-fun e!814527 () Bool)

(assert (=> start!124732 (=> (not res!977929) (not e!814527))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124732 (= res!977929 (validMask!0 mask!2687))))

(assert (=> start!124732 e!814527))

(assert (=> start!124732 true))

(declare-datatypes ((array!98180 0))(
  ( (array!98181 (arr!47378 (Array (_ BitVec 32) (_ BitVec 64))) (size!47928 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98180)

(declare-fun array_inv!36406 (array!98180) Bool)

(assert (=> start!124732 (array_inv!36406 a!2862)))

(declare-fun b!1446122 () Bool)

(declare-fun res!977924 () Bool)

(declare-fun e!814529 () Bool)

(assert (=> b!1446122 (=> (not res!977924) (not e!814529))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11630 0))(
  ( (MissingZero!11630 (index!48912 (_ BitVec 32))) (Found!11630 (index!48913 (_ BitVec 32))) (Intermediate!11630 (undefined!12442 Bool) (index!48914 (_ BitVec 32)) (x!130599 (_ BitVec 32))) (Undefined!11630) (MissingVacant!11630 (index!48915 (_ BitVec 32))) )
))
(declare-fun lt!634698 () SeekEntryResult!11630)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98180 (_ BitVec 32)) SeekEntryResult!11630)

(assert (=> b!1446122 (= res!977924 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47378 a!2862) j!93) a!2862 mask!2687) lt!634698))))

(declare-fun b!1446123 () Bool)

(declare-fun res!977925 () Bool)

(assert (=> b!1446123 (=> (not res!977925) (not e!814527))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446123 (= res!977925 (validKeyInArray!0 (select (arr!47378 a!2862) j!93)))))

(declare-fun b!1446124 () Bool)

(declare-fun e!814528 () Bool)

(assert (=> b!1446124 (= e!814528 e!814529)))

(declare-fun res!977921 () Bool)

(assert (=> b!1446124 (=> (not res!977921) (not e!814529))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446124 (= res!977921 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47378 a!2862) j!93) mask!2687) (select (arr!47378 a!2862) j!93) a!2862 mask!2687) lt!634698))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1446124 (= lt!634698 (Intermediate!11630 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1446125 () Bool)

(declare-fun res!977915 () Bool)

(assert (=> b!1446125 (=> (not res!977915) (not e!814527))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1446125 (= res!977915 (validKeyInArray!0 (select (arr!47378 a!2862) i!1006)))))

(declare-fun lt!634699 () array!98180)

(declare-fun lt!634697 () SeekEntryResult!11630)

(declare-fun lt!634700 () (_ BitVec 64))

(declare-fun b!1446126 () Bool)

(declare-fun e!814525 () Bool)

(assert (=> b!1446126 (= e!814525 (= lt!634697 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634700 lt!634699 mask!2687)))))

(declare-fun b!1446127 () Bool)

(assert (=> b!1446127 (= e!814527 e!814528)))

(declare-fun res!977928 () Bool)

(assert (=> b!1446127 (=> (not res!977928) (not e!814528))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1446127 (= res!977928 (= (select (store (arr!47378 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1446127 (= lt!634699 (array!98181 (store (arr!47378 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47928 a!2862)))))

(declare-fun b!1446128 () Bool)

(declare-fun res!977923 () Bool)

(assert (=> b!1446128 (=> (not res!977923) (not e!814527))))

(declare-datatypes ((List!33879 0))(
  ( (Nil!33876) (Cons!33875 (h!35225 (_ BitVec 64)) (t!48573 List!33879)) )
))
(declare-fun arrayNoDuplicates!0 (array!98180 (_ BitVec 32) List!33879) Bool)

(assert (=> b!1446128 (= res!977923 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33876))))

(declare-fun b!1446129 () Bool)

(declare-fun res!977920 () Bool)

(assert (=> b!1446129 (=> (not res!977920) (not e!814527))))

(assert (=> b!1446129 (= res!977920 (and (= (size!47928 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47928 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47928 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1446130 () Bool)

(declare-fun e!814524 () Bool)

(assert (=> b!1446130 (= e!814524 (not true))))

(declare-fun e!814526 () Bool)

(assert (=> b!1446130 e!814526))

(declare-fun res!977917 () Bool)

(assert (=> b!1446130 (=> (not res!977917) (not e!814526))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98180 (_ BitVec 32)) Bool)

(assert (=> b!1446130 (= res!977917 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48756 0))(
  ( (Unit!48757) )
))
(declare-fun lt!634701 () Unit!48756)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98180 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48756)

(assert (=> b!1446130 (= lt!634701 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1446131 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98180 (_ BitVec 32)) SeekEntryResult!11630)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98180 (_ BitVec 32)) SeekEntryResult!11630)

(assert (=> b!1446131 (= e!814525 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634700 lt!634699 mask!2687) (seekEntryOrOpen!0 lt!634700 lt!634699 mask!2687)))))

(declare-fun b!1446132 () Bool)

(assert (=> b!1446132 (= e!814529 e!814524)))

(declare-fun res!977927 () Bool)

(assert (=> b!1446132 (=> (not res!977927) (not e!814524))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1446132 (= res!977927 (= lt!634697 (Intermediate!11630 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1446132 (= lt!634697 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634700 mask!2687) lt!634700 lt!634699 mask!2687))))

(assert (=> b!1446132 (= lt!634700 (select (store (arr!47378 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446133 () Bool)

(assert (=> b!1446133 (= e!814526 (or (= (select (arr!47378 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47378 a!2862) intermediateBeforeIndex!19) (select (arr!47378 a!2862) j!93))))))

(declare-fun b!1446134 () Bool)

(declare-fun res!977918 () Bool)

(assert (=> b!1446134 (=> (not res!977918) (not e!814526))))

(assert (=> b!1446134 (= res!977918 (= (seekEntryOrOpen!0 (select (arr!47378 a!2862) j!93) a!2862 mask!2687) (Found!11630 j!93)))))

(declare-fun b!1446135 () Bool)

(declare-fun res!977919 () Bool)

(assert (=> b!1446135 (=> (not res!977919) (not e!814524))))

(assert (=> b!1446135 (= res!977919 e!814525)))

(declare-fun c!133614 () Bool)

(assert (=> b!1446135 (= c!133614 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1446136 () Bool)

(declare-fun res!977922 () Bool)

(assert (=> b!1446136 (=> (not res!977922) (not e!814527))))

(assert (=> b!1446136 (= res!977922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446137 () Bool)

(declare-fun res!977916 () Bool)

(assert (=> b!1446137 (=> (not res!977916) (not e!814527))))

(assert (=> b!1446137 (= res!977916 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47928 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47928 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47928 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1446138 () Bool)

(declare-fun res!977926 () Bool)

(assert (=> b!1446138 (=> (not res!977926) (not e!814524))))

(assert (=> b!1446138 (= res!977926 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!124732 res!977929) b!1446129))

(assert (= (and b!1446129 res!977920) b!1446125))

(assert (= (and b!1446125 res!977915) b!1446123))

(assert (= (and b!1446123 res!977925) b!1446136))

(assert (= (and b!1446136 res!977922) b!1446128))

(assert (= (and b!1446128 res!977923) b!1446137))

(assert (= (and b!1446137 res!977916) b!1446127))

(assert (= (and b!1446127 res!977928) b!1446124))

(assert (= (and b!1446124 res!977921) b!1446122))

(assert (= (and b!1446122 res!977924) b!1446132))

(assert (= (and b!1446132 res!977927) b!1446135))

(assert (= (and b!1446135 c!133614) b!1446126))

(assert (= (and b!1446135 (not c!133614)) b!1446131))

(assert (= (and b!1446135 res!977919) b!1446138))

(assert (= (and b!1446138 res!977926) b!1446130))

(assert (= (and b!1446130 res!977917) b!1446134))

(assert (= (and b!1446134 res!977918) b!1446133))

(declare-fun m!1335025 () Bool)

(assert (=> b!1446127 m!1335025))

(declare-fun m!1335027 () Bool)

(assert (=> b!1446127 m!1335027))

(declare-fun m!1335029 () Bool)

(assert (=> b!1446130 m!1335029))

(declare-fun m!1335031 () Bool)

(assert (=> b!1446130 m!1335031))

(declare-fun m!1335033 () Bool)

(assert (=> b!1446124 m!1335033))

(assert (=> b!1446124 m!1335033))

(declare-fun m!1335035 () Bool)

(assert (=> b!1446124 m!1335035))

(assert (=> b!1446124 m!1335035))

(assert (=> b!1446124 m!1335033))

(declare-fun m!1335037 () Bool)

(assert (=> b!1446124 m!1335037))

(declare-fun m!1335039 () Bool)

(assert (=> start!124732 m!1335039))

(declare-fun m!1335041 () Bool)

(assert (=> start!124732 m!1335041))

(assert (=> b!1446122 m!1335033))

(assert (=> b!1446122 m!1335033))

(declare-fun m!1335043 () Bool)

(assert (=> b!1446122 m!1335043))

(declare-fun m!1335045 () Bool)

(assert (=> b!1446133 m!1335045))

(assert (=> b!1446133 m!1335033))

(declare-fun m!1335047 () Bool)

(assert (=> b!1446136 m!1335047))

(declare-fun m!1335049 () Bool)

(assert (=> b!1446132 m!1335049))

(assert (=> b!1446132 m!1335049))

(declare-fun m!1335051 () Bool)

(assert (=> b!1446132 m!1335051))

(assert (=> b!1446132 m!1335025))

(declare-fun m!1335053 () Bool)

(assert (=> b!1446132 m!1335053))

(declare-fun m!1335055 () Bool)

(assert (=> b!1446128 m!1335055))

(declare-fun m!1335057 () Bool)

(assert (=> b!1446125 m!1335057))

(assert (=> b!1446125 m!1335057))

(declare-fun m!1335059 () Bool)

(assert (=> b!1446125 m!1335059))

(assert (=> b!1446134 m!1335033))

(assert (=> b!1446134 m!1335033))

(declare-fun m!1335061 () Bool)

(assert (=> b!1446134 m!1335061))

(assert (=> b!1446123 m!1335033))

(assert (=> b!1446123 m!1335033))

(declare-fun m!1335063 () Bool)

(assert (=> b!1446123 m!1335063))

(declare-fun m!1335065 () Bool)

(assert (=> b!1446131 m!1335065))

(declare-fun m!1335067 () Bool)

(assert (=> b!1446131 m!1335067))

(declare-fun m!1335069 () Bool)

(assert (=> b!1446126 m!1335069))

(push 1)

