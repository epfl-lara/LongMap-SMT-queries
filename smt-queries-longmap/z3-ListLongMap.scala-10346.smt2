; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121628 () Bool)

(assert start!121628)

(declare-fun b!1413036 () Bool)

(declare-fun e!799660 () Bool)

(declare-fun e!799663 () Bool)

(assert (=> b!1413036 (= e!799660 (not e!799663))))

(declare-fun res!950027 () Bool)

(assert (=> b!1413036 (=> res!950027 e!799663)))

(declare-datatypes ((SeekEntryResult!10931 0))(
  ( (MissingZero!10931 (index!46104 (_ BitVec 32))) (Found!10931 (index!46105 (_ BitVec 32))) (Intermediate!10931 (undefined!11743 Bool) (index!46106 (_ BitVec 32)) (x!127690 (_ BitVec 32))) (Undefined!10931) (MissingVacant!10931 (index!46107 (_ BitVec 32))) )
))
(declare-fun lt!622756 () SeekEntryResult!10931)

(get-info :version)

(assert (=> b!1413036 (= res!950027 (or (not ((_ is Intermediate!10931) lt!622756)) (undefined!11743 lt!622756)))))

(declare-fun e!799661 () Bool)

(assert (=> b!1413036 e!799661))

(declare-fun res!950029 () Bool)

(assert (=> b!1413036 (=> (not res!950029) (not e!799661))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96566 0))(
  ( (array!96567 (arr!46620 (Array (_ BitVec 32) (_ BitVec 64))) (size!47170 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96566)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96566 (_ BitVec 32)) Bool)

(assert (=> b!1413036 (= res!950029 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47836 0))(
  ( (Unit!47837) )
))
(declare-fun lt!622758 () Unit!47836)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96566 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47836)

(assert (=> b!1413036 (= lt!622758 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622757 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96566 (_ BitVec 32)) SeekEntryResult!10931)

(assert (=> b!1413036 (= lt!622756 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622757 (select (arr!46620 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413036 (= lt!622757 (toIndex!0 (select (arr!46620 a!2901) j!112) mask!2840))))

(declare-fun res!950035 () Bool)

(assert (=> start!121628 (=> (not res!950035) (not e!799660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121628 (= res!950035 (validMask!0 mask!2840))))

(assert (=> start!121628 e!799660))

(assert (=> start!121628 true))

(declare-fun array_inv!35648 (array!96566) Bool)

(assert (=> start!121628 (array_inv!35648 a!2901)))

(declare-fun b!1413037 () Bool)

(declare-fun res!950026 () Bool)

(assert (=> b!1413037 (=> (not res!950026) (not e!799660))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413037 (= res!950026 (validKeyInArray!0 (select (arr!46620 a!2901) i!1037)))))

(declare-fun lt!622752 () array!96566)

(declare-fun b!1413038 () Bool)

(declare-fun e!799664 () Bool)

(declare-fun lt!622753 () SeekEntryResult!10931)

(declare-fun lt!622754 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96566 (_ BitVec 32)) SeekEntryResult!10931)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96566 (_ BitVec 32)) SeekEntryResult!10931)

(assert (=> b!1413038 (= e!799664 (= (seekEntryOrOpen!0 lt!622754 lt!622752 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127690 lt!622753) (index!46106 lt!622753) (index!46106 lt!622753) (select (arr!46620 a!2901) j!112) lt!622752 mask!2840)))))

(declare-fun b!1413039 () Bool)

(declare-fun e!799662 () Bool)

(assert (=> b!1413039 (= e!799662 true)))

(assert (=> b!1413039 e!799664))

(declare-fun res!950034 () Bool)

(assert (=> b!1413039 (=> (not res!950034) (not e!799664))))

(assert (=> b!1413039 (= res!950034 (and (not (undefined!11743 lt!622753)) (= (index!46106 lt!622753) i!1037) (bvslt (x!127690 lt!622753) (x!127690 lt!622756)) (= (select (store (arr!46620 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46106 lt!622753)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622755 () Unit!47836)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96566 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47836)

(assert (=> b!1413039 (= lt!622755 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622757 (x!127690 lt!622756) (index!46106 lt!622756) (x!127690 lt!622753) (index!46106 lt!622753) (undefined!11743 lt!622753) mask!2840))))

(declare-fun b!1413040 () Bool)

(assert (=> b!1413040 (= e!799661 (= (seekEntryOrOpen!0 (select (arr!46620 a!2901) j!112) a!2901 mask!2840) (Found!10931 j!112)))))

(declare-fun b!1413041 () Bool)

(declare-fun res!950030 () Bool)

(assert (=> b!1413041 (=> (not res!950030) (not e!799660))))

(assert (=> b!1413041 (= res!950030 (validKeyInArray!0 (select (arr!46620 a!2901) j!112)))))

(declare-fun b!1413042 () Bool)

(declare-fun res!950028 () Bool)

(assert (=> b!1413042 (=> (not res!950028) (not e!799660))))

(assert (=> b!1413042 (= res!950028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413043 () Bool)

(assert (=> b!1413043 (= e!799663 e!799662)))

(declare-fun res!950033 () Bool)

(assert (=> b!1413043 (=> res!950033 e!799662)))

(assert (=> b!1413043 (= res!950033 (or (= lt!622756 lt!622753) (not ((_ is Intermediate!10931) lt!622753))))))

(assert (=> b!1413043 (= lt!622753 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622754 mask!2840) lt!622754 lt!622752 mask!2840))))

(assert (=> b!1413043 (= lt!622754 (select (store (arr!46620 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413043 (= lt!622752 (array!96567 (store (arr!46620 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47170 a!2901)))))

(declare-fun b!1413044 () Bool)

(declare-fun res!950032 () Bool)

(assert (=> b!1413044 (=> (not res!950032) (not e!799660))))

(declare-datatypes ((List!33139 0))(
  ( (Nil!33136) (Cons!33135 (h!34410 (_ BitVec 64)) (t!47833 List!33139)) )
))
(declare-fun arrayNoDuplicates!0 (array!96566 (_ BitVec 32) List!33139) Bool)

(assert (=> b!1413044 (= res!950032 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33136))))

(declare-fun b!1413045 () Bool)

(declare-fun res!950031 () Bool)

(assert (=> b!1413045 (=> (not res!950031) (not e!799660))))

(assert (=> b!1413045 (= res!950031 (and (= (size!47170 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47170 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47170 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121628 res!950035) b!1413045))

(assert (= (and b!1413045 res!950031) b!1413037))

(assert (= (and b!1413037 res!950026) b!1413041))

(assert (= (and b!1413041 res!950030) b!1413042))

(assert (= (and b!1413042 res!950028) b!1413044))

(assert (= (and b!1413044 res!950032) b!1413036))

(assert (= (and b!1413036 res!950029) b!1413040))

(assert (= (and b!1413036 (not res!950027)) b!1413043))

(assert (= (and b!1413043 (not res!950033)) b!1413039))

(assert (= (and b!1413039 res!950034) b!1413038))

(declare-fun m!1303299 () Bool)

(assert (=> start!121628 m!1303299))

(declare-fun m!1303301 () Bool)

(assert (=> start!121628 m!1303301))

(declare-fun m!1303303 () Bool)

(assert (=> b!1413043 m!1303303))

(assert (=> b!1413043 m!1303303))

(declare-fun m!1303305 () Bool)

(assert (=> b!1413043 m!1303305))

(declare-fun m!1303307 () Bool)

(assert (=> b!1413043 m!1303307))

(declare-fun m!1303309 () Bool)

(assert (=> b!1413043 m!1303309))

(declare-fun m!1303311 () Bool)

(assert (=> b!1413044 m!1303311))

(assert (=> b!1413039 m!1303307))

(declare-fun m!1303313 () Bool)

(assert (=> b!1413039 m!1303313))

(declare-fun m!1303315 () Bool)

(assert (=> b!1413039 m!1303315))

(declare-fun m!1303317 () Bool)

(assert (=> b!1413040 m!1303317))

(assert (=> b!1413040 m!1303317))

(declare-fun m!1303319 () Bool)

(assert (=> b!1413040 m!1303319))

(declare-fun m!1303321 () Bool)

(assert (=> b!1413037 m!1303321))

(assert (=> b!1413037 m!1303321))

(declare-fun m!1303323 () Bool)

(assert (=> b!1413037 m!1303323))

(declare-fun m!1303325 () Bool)

(assert (=> b!1413038 m!1303325))

(assert (=> b!1413038 m!1303317))

(assert (=> b!1413038 m!1303317))

(declare-fun m!1303327 () Bool)

(assert (=> b!1413038 m!1303327))

(assert (=> b!1413041 m!1303317))

(assert (=> b!1413041 m!1303317))

(declare-fun m!1303329 () Bool)

(assert (=> b!1413041 m!1303329))

(declare-fun m!1303331 () Bool)

(assert (=> b!1413042 m!1303331))

(assert (=> b!1413036 m!1303317))

(declare-fun m!1303333 () Bool)

(assert (=> b!1413036 m!1303333))

(assert (=> b!1413036 m!1303317))

(declare-fun m!1303335 () Bool)

(assert (=> b!1413036 m!1303335))

(assert (=> b!1413036 m!1303317))

(declare-fun m!1303337 () Bool)

(assert (=> b!1413036 m!1303337))

(declare-fun m!1303339 () Bool)

(assert (=> b!1413036 m!1303339))

(check-sat (not b!1413037) (not b!1413036) (not b!1413039) (not start!121628) (not b!1413040) (not b!1413042) (not b!1413041) (not b!1413043) (not b!1413038) (not b!1413044))
(check-sat)
