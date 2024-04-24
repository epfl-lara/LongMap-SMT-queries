; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121640 () Bool)

(assert start!121640)

(declare-fun b!1412287 () Bool)

(declare-fun e!799301 () Bool)

(declare-fun e!799303 () Bool)

(assert (=> b!1412287 (= e!799301 (not e!799303))))

(declare-fun res!948834 () Bool)

(assert (=> b!1412287 (=> res!948834 e!799303)))

(declare-datatypes ((SeekEntryResult!10832 0))(
  ( (MissingZero!10832 (index!45705 (_ BitVec 32))) (Found!10832 (index!45706 (_ BitVec 32))) (Intermediate!10832 (undefined!11644 Bool) (index!45707 (_ BitVec 32)) (x!127454 (_ BitVec 32))) (Undefined!10832) (MissingVacant!10832 (index!45708 (_ BitVec 32))) )
))
(declare-fun lt!621946 () SeekEntryResult!10832)

(get-info :version)

(assert (=> b!1412287 (= res!948834 (or (not ((_ is Intermediate!10832) lt!621946)) (undefined!11644 lt!621946)))))

(declare-fun e!799300 () Bool)

(assert (=> b!1412287 e!799300))

(declare-fun res!948837 () Bool)

(assert (=> b!1412287 (=> (not res!948837) (not e!799300))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((array!96563 0))(
  ( (array!96564 (arr!46618 (Array (_ BitVec 32) (_ BitVec 64))) (size!47169 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96563)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96563 (_ BitVec 32)) Bool)

(assert (=> b!1412287 (= res!948837 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47665 0))(
  ( (Unit!47666) )
))
(declare-fun lt!621944 () Unit!47665)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96563 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47665)

(assert (=> b!1412287 (= lt!621944 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621947 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96563 (_ BitVec 32)) SeekEntryResult!10832)

(assert (=> b!1412287 (= lt!621946 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621947 (select (arr!46618 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412287 (= lt!621947 (toIndex!0 (select (arr!46618 a!2901) j!112) mask!2840))))

(declare-fun b!1412288 () Bool)

(declare-fun res!948833 () Bool)

(assert (=> b!1412288 (=> (not res!948833) (not e!799301))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412288 (= res!948833 (validKeyInArray!0 (select (arr!46618 a!2901) j!112)))))

(declare-fun b!1412289 () Bool)

(declare-fun res!948832 () Bool)

(assert (=> b!1412289 (=> (not res!948832) (not e!799301))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1412289 (= res!948832 (and (= (size!47169 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47169 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47169 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!948831 () Bool)

(assert (=> start!121640 (=> (not res!948831) (not e!799301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121640 (= res!948831 (validMask!0 mask!2840))))

(assert (=> start!121640 e!799301))

(assert (=> start!121640 true))

(declare-fun array_inv!35899 (array!96563) Bool)

(assert (=> start!121640 (array_inv!35899 a!2901)))

(declare-fun b!1412290 () Bool)

(declare-fun res!948835 () Bool)

(assert (=> b!1412290 (=> (not res!948835) (not e!799301))))

(assert (=> b!1412290 (= res!948835 (validKeyInArray!0 (select (arr!46618 a!2901) i!1037)))))

(declare-fun b!1412291 () Bool)

(declare-fun res!948836 () Bool)

(assert (=> b!1412291 (=> (not res!948836) (not e!799301))))

(assert (=> b!1412291 (= res!948836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412292 () Bool)

(declare-fun e!799304 () Bool)

(assert (=> b!1412292 (= e!799303 e!799304)))

(declare-fun res!948830 () Bool)

(assert (=> b!1412292 (=> res!948830 e!799304)))

(declare-fun lt!621943 () SeekEntryResult!10832)

(assert (=> b!1412292 (= res!948830 (or (= lt!621946 lt!621943) (not ((_ is Intermediate!10832) lt!621943))))))

(assert (=> b!1412292 (= lt!621943 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46618 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46618 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96564 (store (arr!46618 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47169 a!2901)) mask!2840))))

(declare-fun b!1412293 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96563 (_ BitVec 32)) SeekEntryResult!10832)

(assert (=> b!1412293 (= e!799300 (= (seekEntryOrOpen!0 (select (arr!46618 a!2901) j!112) a!2901 mask!2840) (Found!10832 j!112)))))

(declare-fun b!1412294 () Bool)

(assert (=> b!1412294 (= e!799304 true)))

(assert (=> b!1412294 (and (not (undefined!11644 lt!621943)) (= (index!45707 lt!621943) i!1037) (bvslt (x!127454 lt!621943) (x!127454 lt!621946)))))

(declare-fun lt!621945 () Unit!47665)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96563 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47665)

(assert (=> b!1412294 (= lt!621945 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621947 (x!127454 lt!621946) (index!45707 lt!621946) (x!127454 lt!621943) (index!45707 lt!621943) (undefined!11644 lt!621943) mask!2840))))

(declare-fun b!1412295 () Bool)

(declare-fun res!948838 () Bool)

(assert (=> b!1412295 (=> (not res!948838) (not e!799301))))

(declare-datatypes ((List!33124 0))(
  ( (Nil!33121) (Cons!33120 (h!34400 (_ BitVec 64)) (t!47810 List!33124)) )
))
(declare-fun arrayNoDuplicates!0 (array!96563 (_ BitVec 32) List!33124) Bool)

(assert (=> b!1412295 (= res!948838 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33121))))

(assert (= (and start!121640 res!948831) b!1412289))

(assert (= (and b!1412289 res!948832) b!1412290))

(assert (= (and b!1412290 res!948835) b!1412288))

(assert (= (and b!1412288 res!948833) b!1412291))

(assert (= (and b!1412291 res!948836) b!1412295))

(assert (= (and b!1412295 res!948838) b!1412287))

(assert (= (and b!1412287 res!948837) b!1412293))

(assert (= (and b!1412287 (not res!948834)) b!1412292))

(assert (= (and b!1412292 (not res!948830)) b!1412294))

(declare-fun m!1302265 () Bool)

(assert (=> b!1412290 m!1302265))

(assert (=> b!1412290 m!1302265))

(declare-fun m!1302267 () Bool)

(assert (=> b!1412290 m!1302267))

(declare-fun m!1302269 () Bool)

(assert (=> b!1412287 m!1302269))

(declare-fun m!1302271 () Bool)

(assert (=> b!1412287 m!1302271))

(assert (=> b!1412287 m!1302269))

(declare-fun m!1302273 () Bool)

(assert (=> b!1412287 m!1302273))

(assert (=> b!1412287 m!1302269))

(declare-fun m!1302275 () Bool)

(assert (=> b!1412287 m!1302275))

(declare-fun m!1302277 () Bool)

(assert (=> b!1412287 m!1302277))

(declare-fun m!1302279 () Bool)

(assert (=> b!1412291 m!1302279))

(declare-fun m!1302281 () Bool)

(assert (=> b!1412292 m!1302281))

(declare-fun m!1302283 () Bool)

(assert (=> b!1412292 m!1302283))

(assert (=> b!1412292 m!1302283))

(declare-fun m!1302285 () Bool)

(assert (=> b!1412292 m!1302285))

(assert (=> b!1412292 m!1302285))

(assert (=> b!1412292 m!1302283))

(declare-fun m!1302287 () Bool)

(assert (=> b!1412292 m!1302287))

(declare-fun m!1302289 () Bool)

(assert (=> b!1412295 m!1302289))

(assert (=> b!1412293 m!1302269))

(assert (=> b!1412293 m!1302269))

(declare-fun m!1302291 () Bool)

(assert (=> b!1412293 m!1302291))

(declare-fun m!1302293 () Bool)

(assert (=> b!1412294 m!1302293))

(declare-fun m!1302295 () Bool)

(assert (=> start!121640 m!1302295))

(declare-fun m!1302297 () Bool)

(assert (=> start!121640 m!1302297))

(assert (=> b!1412288 m!1302269))

(assert (=> b!1412288 m!1302269))

(declare-fun m!1302299 () Bool)

(assert (=> b!1412288 m!1302299))

(check-sat (not b!1412294) (not b!1412287) (not b!1412295) (not b!1412290) (not b!1412288) (not b!1412292) (not b!1412293) (not start!121640) (not b!1412291))
(check-sat)
