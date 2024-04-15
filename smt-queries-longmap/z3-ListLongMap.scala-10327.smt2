; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121442 () Bool)

(assert start!121442)

(declare-fun b!1410985 () Bool)

(declare-fun e!798479 () Bool)

(assert (=> b!1410985 (= e!798479 true)))

(declare-datatypes ((SeekEntryResult!10874 0))(
  ( (MissingZero!10874 (index!45873 (_ BitVec 32))) (Found!10874 (index!45874 (_ BitVec 32))) (Intermediate!10874 (undefined!11686 Bool) (index!45875 (_ BitVec 32)) (x!127466 (_ BitVec 32))) (Undefined!10874) (MissingVacant!10874 (index!45876 (_ BitVec 32))) )
))
(declare-fun lt!621310 () SeekEntryResult!10874)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!621311 () SeekEntryResult!10874)

(assert (=> b!1410985 (and (not (undefined!11686 lt!621310)) (= (index!45875 lt!621310) i!1037) (bvslt (x!127466 lt!621310) (x!127466 lt!621311)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96396 0))(
  ( (array!96397 (arr!46537 (Array (_ BitVec 32) (_ BitVec 64))) (size!47089 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96396)

(declare-fun lt!621312 () (_ BitVec 32))

(declare-datatypes ((Unit!47565 0))(
  ( (Unit!47566) )
))
(declare-fun lt!621313 () Unit!47565)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96396 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47565)

(assert (=> b!1410985 (= lt!621313 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621312 (x!127466 lt!621311) (index!45875 lt!621311) (x!127466 lt!621310) (index!45875 lt!621310) (undefined!11686 lt!621310) mask!2840))))

(declare-fun b!1410987 () Bool)

(declare-fun e!798478 () Bool)

(assert (=> b!1410987 (= e!798478 e!798479)))

(declare-fun res!948269 () Bool)

(assert (=> b!1410987 (=> res!948269 e!798479)))

(get-info :version)

(assert (=> b!1410987 (= res!948269 (or (= lt!621311 lt!621310) (not ((_ is Intermediate!10874) lt!621310))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96396 (_ BitVec 32)) SeekEntryResult!10874)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410987 (= lt!621310 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46537 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46537 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96397 (store (arr!46537 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47089 a!2901)) mask!2840))))

(declare-fun b!1410988 () Bool)

(declare-fun res!948264 () Bool)

(declare-fun e!798481 () Bool)

(assert (=> b!1410988 (=> (not res!948264) (not e!798481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96396 (_ BitVec 32)) Bool)

(assert (=> b!1410988 (= res!948264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410989 () Bool)

(declare-fun res!948267 () Bool)

(assert (=> b!1410989 (=> (not res!948267) (not e!798481))))

(assert (=> b!1410989 (= res!948267 (and (= (size!47089 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47089 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47089 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1410990 () Bool)

(assert (=> b!1410990 (= e!798481 (not e!798478))))

(declare-fun res!948271 () Bool)

(assert (=> b!1410990 (=> res!948271 e!798478)))

(assert (=> b!1410990 (= res!948271 (or (not ((_ is Intermediate!10874) lt!621311)) (undefined!11686 lt!621311)))))

(declare-fun e!798480 () Bool)

(assert (=> b!1410990 e!798480))

(declare-fun res!948270 () Bool)

(assert (=> b!1410990 (=> (not res!948270) (not e!798480))))

(assert (=> b!1410990 (= res!948270 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621314 () Unit!47565)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96396 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47565)

(assert (=> b!1410990 (= lt!621314 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1410990 (= lt!621311 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621312 (select (arr!46537 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1410990 (= lt!621312 (toIndex!0 (select (arr!46537 a!2901) j!112) mask!2840))))

(declare-fun b!1410991 () Bool)

(declare-fun res!948266 () Bool)

(assert (=> b!1410991 (=> (not res!948266) (not e!798481))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410991 (= res!948266 (validKeyInArray!0 (select (arr!46537 a!2901) j!112)))))

(declare-fun b!1410992 () Bool)

(declare-fun res!948268 () Bool)

(assert (=> b!1410992 (=> (not res!948268) (not e!798481))))

(assert (=> b!1410992 (= res!948268 (validKeyInArray!0 (select (arr!46537 a!2901) i!1037)))))

(declare-fun b!1410993 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96396 (_ BitVec 32)) SeekEntryResult!10874)

(assert (=> b!1410993 (= e!798480 (= (seekEntryOrOpen!0 (select (arr!46537 a!2901) j!112) a!2901 mask!2840) (Found!10874 j!112)))))

(declare-fun res!948263 () Bool)

(assert (=> start!121442 (=> (not res!948263) (not e!798481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121442 (= res!948263 (validMask!0 mask!2840))))

(assert (=> start!121442 e!798481))

(assert (=> start!121442 true))

(declare-fun array_inv!35770 (array!96396) Bool)

(assert (=> start!121442 (array_inv!35770 a!2901)))

(declare-fun b!1410986 () Bool)

(declare-fun res!948265 () Bool)

(assert (=> b!1410986 (=> (not res!948265) (not e!798481))))

(declare-datatypes ((List!33134 0))(
  ( (Nil!33131) (Cons!33130 (h!34402 (_ BitVec 64)) (t!47820 List!33134)) )
))
(declare-fun arrayNoDuplicates!0 (array!96396 (_ BitVec 32) List!33134) Bool)

(assert (=> b!1410986 (= res!948265 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33131))))

(assert (= (and start!121442 res!948263) b!1410989))

(assert (= (and b!1410989 res!948267) b!1410992))

(assert (= (and b!1410992 res!948268) b!1410991))

(assert (= (and b!1410991 res!948266) b!1410988))

(assert (= (and b!1410988 res!948264) b!1410986))

(assert (= (and b!1410986 res!948265) b!1410990))

(assert (= (and b!1410990 res!948270) b!1410993))

(assert (= (and b!1410990 (not res!948271)) b!1410987))

(assert (= (and b!1410987 (not res!948269)) b!1410985))

(declare-fun m!1300249 () Bool)

(assert (=> b!1410991 m!1300249))

(assert (=> b!1410991 m!1300249))

(declare-fun m!1300251 () Bool)

(assert (=> b!1410991 m!1300251))

(declare-fun m!1300253 () Bool)

(assert (=> start!121442 m!1300253))

(declare-fun m!1300255 () Bool)

(assert (=> start!121442 m!1300255))

(declare-fun m!1300257 () Bool)

(assert (=> b!1410988 m!1300257))

(assert (=> b!1410990 m!1300249))

(declare-fun m!1300259 () Bool)

(assert (=> b!1410990 m!1300259))

(assert (=> b!1410990 m!1300249))

(assert (=> b!1410990 m!1300249))

(declare-fun m!1300261 () Bool)

(assert (=> b!1410990 m!1300261))

(declare-fun m!1300263 () Bool)

(assert (=> b!1410990 m!1300263))

(declare-fun m!1300265 () Bool)

(assert (=> b!1410990 m!1300265))

(declare-fun m!1300267 () Bool)

(assert (=> b!1410992 m!1300267))

(assert (=> b!1410992 m!1300267))

(declare-fun m!1300269 () Bool)

(assert (=> b!1410992 m!1300269))

(declare-fun m!1300271 () Bool)

(assert (=> b!1410987 m!1300271))

(declare-fun m!1300273 () Bool)

(assert (=> b!1410987 m!1300273))

(assert (=> b!1410987 m!1300273))

(declare-fun m!1300275 () Bool)

(assert (=> b!1410987 m!1300275))

(assert (=> b!1410987 m!1300275))

(assert (=> b!1410987 m!1300273))

(declare-fun m!1300277 () Bool)

(assert (=> b!1410987 m!1300277))

(assert (=> b!1410993 m!1300249))

(assert (=> b!1410993 m!1300249))

(declare-fun m!1300279 () Bool)

(assert (=> b!1410993 m!1300279))

(declare-fun m!1300281 () Bool)

(assert (=> b!1410986 m!1300281))

(declare-fun m!1300283 () Bool)

(assert (=> b!1410985 m!1300283))

(check-sat (not b!1410993) (not b!1410985) (not b!1410987) (not start!121442) (not b!1410986) (not b!1410988) (not b!1410990) (not b!1410991) (not b!1410992))
(check-sat)
