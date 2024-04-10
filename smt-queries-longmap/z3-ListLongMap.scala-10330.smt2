; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121466 () Bool)

(assert start!121466)

(declare-fun b!1411336 () Bool)

(declare-fun res!948563 () Bool)

(declare-fun e!798668 () Bool)

(assert (=> b!1411336 (=> (not res!948563) (not e!798668))))

(declare-datatypes ((array!96467 0))(
  ( (array!96468 (arr!46572 (Array (_ BitVec 32) (_ BitVec 64))) (size!47122 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96467)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96467 (_ BitVec 32)) Bool)

(assert (=> b!1411336 (= res!948563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411337 () Bool)

(declare-fun res!948565 () Bool)

(assert (=> b!1411337 (=> (not res!948565) (not e!798668))))

(declare-datatypes ((List!33091 0))(
  ( (Nil!33088) (Cons!33087 (h!34359 (_ BitVec 64)) (t!47785 List!33091)) )
))
(declare-fun arrayNoDuplicates!0 (array!96467 (_ BitVec 32) List!33091) Bool)

(assert (=> b!1411337 (= res!948565 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33088))))

(declare-fun b!1411339 () Bool)

(declare-fun res!948567 () Bool)

(assert (=> b!1411339 (=> (not res!948567) (not e!798668))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411339 (= res!948567 (validKeyInArray!0 (select (arr!46572 a!2901) i!1037)))))

(declare-fun b!1411340 () Bool)

(declare-fun e!798670 () Bool)

(assert (=> b!1411340 (= e!798668 (not e!798670))))

(declare-fun res!948564 () Bool)

(assert (=> b!1411340 (=> res!948564 e!798670)))

(declare-datatypes ((SeekEntryResult!10883 0))(
  ( (MissingZero!10883 (index!45909 (_ BitVec 32))) (Found!10883 (index!45910 (_ BitVec 32))) (Intermediate!10883 (undefined!11695 Bool) (index!45911 (_ BitVec 32)) (x!127502 (_ BitVec 32))) (Undefined!10883) (MissingVacant!10883 (index!45912 (_ BitVec 32))) )
))
(declare-fun lt!621650 () SeekEntryResult!10883)

(get-info :version)

(assert (=> b!1411340 (= res!948564 (or (not ((_ is Intermediate!10883) lt!621650)) (undefined!11695 lt!621650)))))

(declare-fun e!798667 () Bool)

(assert (=> b!1411340 e!798667))

(declare-fun res!948568 () Bool)

(assert (=> b!1411340 (=> (not res!948568) (not e!798667))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1411340 (= res!948568 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47740 0))(
  ( (Unit!47741) )
))
(declare-fun lt!621653 () Unit!47740)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96467 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47740)

(assert (=> b!1411340 (= lt!621653 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621651 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96467 (_ BitVec 32)) SeekEntryResult!10883)

(assert (=> b!1411340 (= lt!621650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621651 (select (arr!46572 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411340 (= lt!621651 (toIndex!0 (select (arr!46572 a!2901) j!112) mask!2840))))

(declare-fun b!1411341 () Bool)

(declare-fun res!948566 () Bool)

(assert (=> b!1411341 (=> (not res!948566) (not e!798668))))

(assert (=> b!1411341 (= res!948566 (and (= (size!47122 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47122 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47122 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411342 () Bool)

(declare-fun e!798669 () Bool)

(declare-fun lt!621652 () SeekEntryResult!10883)

(assert (=> b!1411342 (= e!798669 (and (bvsge (index!45911 lt!621652) #b00000000000000000000000000000000) (bvslt (index!45911 lt!621652) (size!47122 a!2901))))))

(assert (=> b!1411342 (and (not (undefined!11695 lt!621652)) (= (index!45911 lt!621652) i!1037) (bvslt (x!127502 lt!621652) (x!127502 lt!621650)))))

(declare-fun lt!621654 () Unit!47740)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96467 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47740)

(assert (=> b!1411342 (= lt!621654 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621651 (x!127502 lt!621650) (index!45911 lt!621650) (x!127502 lt!621652) (index!45911 lt!621652) (undefined!11695 lt!621652) mask!2840))))

(declare-fun b!1411343 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96467 (_ BitVec 32)) SeekEntryResult!10883)

(assert (=> b!1411343 (= e!798667 (= (seekEntryOrOpen!0 (select (arr!46572 a!2901) j!112) a!2901 mask!2840) (Found!10883 j!112)))))

(declare-fun b!1411344 () Bool)

(assert (=> b!1411344 (= e!798670 e!798669)))

(declare-fun res!948570 () Bool)

(assert (=> b!1411344 (=> res!948570 e!798669)))

(assert (=> b!1411344 (= res!948570 (or (= lt!621650 lt!621652) (not ((_ is Intermediate!10883) lt!621652))))))

(assert (=> b!1411344 (= lt!621652 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46572 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46572 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96468 (store (arr!46572 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47122 a!2901)) mask!2840))))

(declare-fun res!948569 () Bool)

(assert (=> start!121466 (=> (not res!948569) (not e!798668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121466 (= res!948569 (validMask!0 mask!2840))))

(assert (=> start!121466 e!798668))

(assert (=> start!121466 true))

(declare-fun array_inv!35600 (array!96467) Bool)

(assert (=> start!121466 (array_inv!35600 a!2901)))

(declare-fun b!1411338 () Bool)

(declare-fun res!948571 () Bool)

(assert (=> b!1411338 (=> (not res!948571) (not e!798668))))

(assert (=> b!1411338 (= res!948571 (validKeyInArray!0 (select (arr!46572 a!2901) j!112)))))

(assert (= (and start!121466 res!948569) b!1411341))

(assert (= (and b!1411341 res!948566) b!1411339))

(assert (= (and b!1411339 res!948567) b!1411338))

(assert (= (and b!1411338 res!948571) b!1411336))

(assert (= (and b!1411336 res!948563) b!1411337))

(assert (= (and b!1411337 res!948565) b!1411340))

(assert (= (and b!1411340 res!948568) b!1411343))

(assert (= (and b!1411340 (not res!948564)) b!1411344))

(assert (= (and b!1411344 (not res!948570)) b!1411342))

(declare-fun m!1301145 () Bool)

(assert (=> b!1411337 m!1301145))

(declare-fun m!1301147 () Bool)

(assert (=> b!1411339 m!1301147))

(assert (=> b!1411339 m!1301147))

(declare-fun m!1301149 () Bool)

(assert (=> b!1411339 m!1301149))

(declare-fun m!1301151 () Bool)

(assert (=> b!1411338 m!1301151))

(assert (=> b!1411338 m!1301151))

(declare-fun m!1301153 () Bool)

(assert (=> b!1411338 m!1301153))

(declare-fun m!1301155 () Bool)

(assert (=> start!121466 m!1301155))

(declare-fun m!1301157 () Bool)

(assert (=> start!121466 m!1301157))

(declare-fun m!1301159 () Bool)

(assert (=> b!1411342 m!1301159))

(declare-fun m!1301161 () Bool)

(assert (=> b!1411344 m!1301161))

(declare-fun m!1301163 () Bool)

(assert (=> b!1411344 m!1301163))

(assert (=> b!1411344 m!1301163))

(declare-fun m!1301165 () Bool)

(assert (=> b!1411344 m!1301165))

(assert (=> b!1411344 m!1301165))

(assert (=> b!1411344 m!1301163))

(declare-fun m!1301167 () Bool)

(assert (=> b!1411344 m!1301167))

(assert (=> b!1411340 m!1301151))

(declare-fun m!1301169 () Bool)

(assert (=> b!1411340 m!1301169))

(assert (=> b!1411340 m!1301151))

(declare-fun m!1301171 () Bool)

(assert (=> b!1411340 m!1301171))

(assert (=> b!1411340 m!1301151))

(declare-fun m!1301173 () Bool)

(assert (=> b!1411340 m!1301173))

(declare-fun m!1301175 () Bool)

(assert (=> b!1411340 m!1301175))

(assert (=> b!1411343 m!1301151))

(assert (=> b!1411343 m!1301151))

(declare-fun m!1301177 () Bool)

(assert (=> b!1411343 m!1301177))

(declare-fun m!1301179 () Bool)

(assert (=> b!1411336 m!1301179))

(check-sat (not b!1411337) (not b!1411338) (not b!1411343) (not b!1411339) (not start!121466) (not b!1411344) (not b!1411342) (not b!1411336) (not b!1411340))
(check-sat)
