; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121634 () Bool)

(assert start!121634)

(declare-fun b!1412206 () Bool)

(declare-fun res!948753 () Bool)

(declare-fun e!799259 () Bool)

(assert (=> b!1412206 (=> (not res!948753) (not e!799259))))

(declare-datatypes ((array!96557 0))(
  ( (array!96558 (arr!46615 (Array (_ BitVec 32) (_ BitVec 64))) (size!47166 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96557)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412206 (= res!948753 (validKeyInArray!0 (select (arr!46615 a!2901) i!1037)))))

(declare-fun b!1412207 () Bool)

(declare-fun e!799256 () Bool)

(declare-fun e!799258 () Bool)

(assert (=> b!1412207 (= e!799256 e!799258)))

(declare-fun res!948752 () Bool)

(assert (=> b!1412207 (=> res!948752 e!799258)))

(declare-datatypes ((SeekEntryResult!10829 0))(
  ( (MissingZero!10829 (index!45693 (_ BitVec 32))) (Found!10829 (index!45694 (_ BitVec 32))) (Intermediate!10829 (undefined!11641 Bool) (index!45695 (_ BitVec 32)) (x!127443 (_ BitVec 32))) (Undefined!10829) (MissingVacant!10829 (index!45696 (_ BitVec 32))) )
))
(declare-fun lt!621901 () SeekEntryResult!10829)

(declare-fun lt!621902 () SeekEntryResult!10829)

(get-info :version)

(assert (=> b!1412207 (= res!948752 (or (= lt!621901 lt!621902) (not ((_ is Intermediate!10829) lt!621902))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96557 (_ BitVec 32)) SeekEntryResult!10829)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412207 (= lt!621902 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46615 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46615 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96558 (store (arr!46615 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47166 a!2901)) mask!2840))))

(declare-fun b!1412208 () Bool)

(assert (=> b!1412208 (= e!799258 true)))

(assert (=> b!1412208 (and (not (undefined!11641 lt!621902)) (= (index!45695 lt!621902) i!1037) (bvslt (x!127443 lt!621902) (x!127443 lt!621901)))))

(declare-datatypes ((Unit!47659 0))(
  ( (Unit!47660) )
))
(declare-fun lt!621899 () Unit!47659)

(declare-fun lt!621900 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96557 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47659)

(assert (=> b!1412208 (= lt!621899 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621900 (x!127443 lt!621901) (index!45695 lt!621901) (x!127443 lt!621902) (index!45695 lt!621902) (undefined!11641 lt!621902) mask!2840))))

(declare-fun res!948750 () Bool)

(assert (=> start!121634 (=> (not res!948750) (not e!799259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121634 (= res!948750 (validMask!0 mask!2840))))

(assert (=> start!121634 e!799259))

(assert (=> start!121634 true))

(declare-fun array_inv!35896 (array!96557) Bool)

(assert (=> start!121634 (array_inv!35896 a!2901)))

(declare-fun b!1412209 () Bool)

(declare-fun res!948755 () Bool)

(assert (=> b!1412209 (=> (not res!948755) (not e!799259))))

(declare-datatypes ((List!33121 0))(
  ( (Nil!33118) (Cons!33117 (h!34397 (_ BitVec 64)) (t!47807 List!33121)) )
))
(declare-fun arrayNoDuplicates!0 (array!96557 (_ BitVec 32) List!33121) Bool)

(assert (=> b!1412209 (= res!948755 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33118))))

(declare-fun b!1412210 () Bool)

(assert (=> b!1412210 (= e!799259 (not e!799256))))

(declare-fun res!948751 () Bool)

(assert (=> b!1412210 (=> res!948751 e!799256)))

(assert (=> b!1412210 (= res!948751 (or (not ((_ is Intermediate!10829) lt!621901)) (undefined!11641 lt!621901)))))

(declare-fun e!799257 () Bool)

(assert (=> b!1412210 e!799257))

(declare-fun res!948756 () Bool)

(assert (=> b!1412210 (=> (not res!948756) (not e!799257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96557 (_ BitVec 32)) Bool)

(assert (=> b!1412210 (= res!948756 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621898 () Unit!47659)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96557 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47659)

(assert (=> b!1412210 (= lt!621898 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1412210 (= lt!621901 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621900 (select (arr!46615 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1412210 (= lt!621900 (toIndex!0 (select (arr!46615 a!2901) j!112) mask!2840))))

(declare-fun b!1412211 () Bool)

(declare-fun res!948754 () Bool)

(assert (=> b!1412211 (=> (not res!948754) (not e!799259))))

(assert (=> b!1412211 (= res!948754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412212 () Bool)

(declare-fun res!948757 () Bool)

(assert (=> b!1412212 (=> (not res!948757) (not e!799259))))

(assert (=> b!1412212 (= res!948757 (validKeyInArray!0 (select (arr!46615 a!2901) j!112)))))

(declare-fun b!1412213 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96557 (_ BitVec 32)) SeekEntryResult!10829)

(assert (=> b!1412213 (= e!799257 (= (seekEntryOrOpen!0 (select (arr!46615 a!2901) j!112) a!2901 mask!2840) (Found!10829 j!112)))))

(declare-fun b!1412214 () Bool)

(declare-fun res!948749 () Bool)

(assert (=> b!1412214 (=> (not res!948749) (not e!799259))))

(assert (=> b!1412214 (= res!948749 (and (= (size!47166 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47166 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47166 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121634 res!948750) b!1412214))

(assert (= (and b!1412214 res!948749) b!1412206))

(assert (= (and b!1412206 res!948753) b!1412212))

(assert (= (and b!1412212 res!948757) b!1412211))

(assert (= (and b!1412211 res!948754) b!1412209))

(assert (= (and b!1412209 res!948755) b!1412210))

(assert (= (and b!1412210 res!948756) b!1412213))

(assert (= (and b!1412210 (not res!948751)) b!1412207))

(assert (= (and b!1412207 (not res!948752)) b!1412208))

(declare-fun m!1302157 () Bool)

(assert (=> b!1412206 m!1302157))

(assert (=> b!1412206 m!1302157))

(declare-fun m!1302159 () Bool)

(assert (=> b!1412206 m!1302159))

(declare-fun m!1302161 () Bool)

(assert (=> b!1412209 m!1302161))

(declare-fun m!1302163 () Bool)

(assert (=> b!1412211 m!1302163))

(declare-fun m!1302165 () Bool)

(assert (=> b!1412210 m!1302165))

(declare-fun m!1302167 () Bool)

(assert (=> b!1412210 m!1302167))

(assert (=> b!1412210 m!1302165))

(assert (=> b!1412210 m!1302165))

(declare-fun m!1302169 () Bool)

(assert (=> b!1412210 m!1302169))

(declare-fun m!1302171 () Bool)

(assert (=> b!1412210 m!1302171))

(declare-fun m!1302173 () Bool)

(assert (=> b!1412210 m!1302173))

(assert (=> b!1412212 m!1302165))

(assert (=> b!1412212 m!1302165))

(declare-fun m!1302175 () Bool)

(assert (=> b!1412212 m!1302175))

(declare-fun m!1302177 () Bool)

(assert (=> b!1412208 m!1302177))

(declare-fun m!1302179 () Bool)

(assert (=> b!1412207 m!1302179))

(declare-fun m!1302181 () Bool)

(assert (=> b!1412207 m!1302181))

(assert (=> b!1412207 m!1302181))

(declare-fun m!1302183 () Bool)

(assert (=> b!1412207 m!1302183))

(assert (=> b!1412207 m!1302183))

(assert (=> b!1412207 m!1302181))

(declare-fun m!1302185 () Bool)

(assert (=> b!1412207 m!1302185))

(assert (=> b!1412213 m!1302165))

(assert (=> b!1412213 m!1302165))

(declare-fun m!1302187 () Bool)

(assert (=> b!1412213 m!1302187))

(declare-fun m!1302189 () Bool)

(assert (=> start!121634 m!1302189))

(declare-fun m!1302191 () Bool)

(assert (=> start!121634 m!1302191))

(check-sat (not b!1412208) (not b!1412206) (not b!1412212) (not b!1412207) (not b!1412211) (not b!1412210) (not b!1412213) (not start!121634) (not b!1412209))
(check-sat)
