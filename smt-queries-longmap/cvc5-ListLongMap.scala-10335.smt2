; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121494 () Bool)

(assert start!121494)

(declare-fun b!1411714 () Bool)

(declare-fun res!948947 () Bool)

(declare-fun e!798877 () Bool)

(assert (=> b!1411714 (=> (not res!948947) (not e!798877))))

(declare-datatypes ((array!96495 0))(
  ( (array!96496 (arr!46586 (Array (_ BitVec 32) (_ BitVec 64))) (size!47136 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96495)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411714 (= res!948947 (validKeyInArray!0 (select (arr!46586 a!2901) i!1037)))))

(declare-fun res!948946 () Bool)

(assert (=> start!121494 (=> (not res!948946) (not e!798877))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121494 (= res!948946 (validMask!0 mask!2840))))

(assert (=> start!121494 e!798877))

(assert (=> start!121494 true))

(declare-fun array_inv!35614 (array!96495) Bool)

(assert (=> start!121494 (array_inv!35614 a!2901)))

(declare-fun b!1411715 () Bool)

(declare-fun res!948949 () Bool)

(assert (=> b!1411715 (=> (not res!948949) (not e!798877))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1411715 (= res!948949 (validKeyInArray!0 (select (arr!46586 a!2901) j!112)))))

(declare-fun b!1411716 () Bool)

(declare-fun res!948944 () Bool)

(assert (=> b!1411716 (=> (not res!948944) (not e!798877))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96495 (_ BitVec 32)) Bool)

(assert (=> b!1411716 (= res!948944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411717 () Bool)

(declare-fun e!798880 () Bool)

(declare-fun e!798879 () Bool)

(assert (=> b!1411717 (= e!798880 e!798879)))

(declare-fun res!948948 () Bool)

(assert (=> b!1411717 (=> res!948948 e!798879)))

(declare-datatypes ((SeekEntryResult!10897 0))(
  ( (MissingZero!10897 (index!45965 (_ BitVec 32))) (Found!10897 (index!45966 (_ BitVec 32))) (Intermediate!10897 (undefined!11709 Bool) (index!45967 (_ BitVec 32)) (x!127556 (_ BitVec 32))) (Undefined!10897) (MissingVacant!10897 (index!45968 (_ BitVec 32))) )
))
(declare-fun lt!621900 () SeekEntryResult!10897)

(declare-fun lt!621899 () SeekEntryResult!10897)

(assert (=> b!1411717 (= res!948948 (or (= lt!621900 lt!621899) (not (is-Intermediate!10897 lt!621899))))))

(declare-fun lt!621898 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96495 (_ BitVec 32)) SeekEntryResult!10897)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411717 (= lt!621899 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621898 mask!2840) lt!621898 (array!96496 (store (arr!46586 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47136 a!2901)) mask!2840))))

(assert (=> b!1411717 (= lt!621898 (select (store (arr!46586 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1411718 () Bool)

(declare-fun res!948943 () Bool)

(assert (=> b!1411718 (=> (not res!948943) (not e!798877))))

(declare-datatypes ((List!33105 0))(
  ( (Nil!33102) (Cons!33101 (h!34373 (_ BitVec 64)) (t!47799 List!33105)) )
))
(declare-fun arrayNoDuplicates!0 (array!96495 (_ BitVec 32) List!33105) Bool)

(assert (=> b!1411718 (= res!948943 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33102))))

(declare-fun b!1411719 () Bool)

(assert (=> b!1411719 (= e!798877 (not e!798880))))

(declare-fun res!948941 () Bool)

(assert (=> b!1411719 (=> res!948941 e!798880)))

(assert (=> b!1411719 (= res!948941 (or (not (is-Intermediate!10897 lt!621900)) (undefined!11709 lt!621900)))))

(declare-fun e!798878 () Bool)

(assert (=> b!1411719 e!798878))

(declare-fun res!948942 () Bool)

(assert (=> b!1411719 (=> (not res!948942) (not e!798878))))

(assert (=> b!1411719 (= res!948942 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47768 0))(
  ( (Unit!47769) )
))
(declare-fun lt!621902 () Unit!47768)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96495 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47768)

(assert (=> b!1411719 (= lt!621902 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621901 () (_ BitVec 32))

(assert (=> b!1411719 (= lt!621900 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621901 (select (arr!46586 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1411719 (= lt!621901 (toIndex!0 (select (arr!46586 a!2901) j!112) mask!2840))))

(declare-fun b!1411720 () Bool)

(assert (=> b!1411720 (= e!798879 true)))

(assert (=> b!1411720 (and (not (undefined!11709 lt!621899)) (= (index!45967 lt!621899) i!1037) (bvslt (x!127556 lt!621899) (x!127556 lt!621900)) (= (select (store (arr!46586 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45967 lt!621899)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!621903 () Unit!47768)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96495 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47768)

(assert (=> b!1411720 (= lt!621903 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621901 (x!127556 lt!621900) (index!45967 lt!621900) (x!127556 lt!621899) (index!45967 lt!621899) (undefined!11709 lt!621899) mask!2840))))

(declare-fun b!1411721 () Bool)

(declare-fun res!948945 () Bool)

(assert (=> b!1411721 (=> (not res!948945) (not e!798877))))

(assert (=> b!1411721 (= res!948945 (and (= (size!47136 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47136 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47136 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411722 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96495 (_ BitVec 32)) SeekEntryResult!10897)

(assert (=> b!1411722 (= e!798878 (= (seekEntryOrOpen!0 (select (arr!46586 a!2901) j!112) a!2901 mask!2840) (Found!10897 j!112)))))

(assert (= (and start!121494 res!948946) b!1411721))

(assert (= (and b!1411721 res!948945) b!1411714))

(assert (= (and b!1411714 res!948947) b!1411715))

(assert (= (and b!1411715 res!948949) b!1411716))

(assert (= (and b!1411716 res!948944) b!1411718))

(assert (= (and b!1411718 res!948943) b!1411719))

(assert (= (and b!1411719 res!948942) b!1411722))

(assert (= (and b!1411719 (not res!948941)) b!1411717))

(assert (= (and b!1411717 (not res!948948)) b!1411720))

(declare-fun m!1301673 () Bool)

(assert (=> b!1411722 m!1301673))

(assert (=> b!1411722 m!1301673))

(declare-fun m!1301675 () Bool)

(assert (=> b!1411722 m!1301675))

(declare-fun m!1301677 () Bool)

(assert (=> b!1411716 m!1301677))

(declare-fun m!1301679 () Bool)

(assert (=> start!121494 m!1301679))

(declare-fun m!1301681 () Bool)

(assert (=> start!121494 m!1301681))

(declare-fun m!1301683 () Bool)

(assert (=> b!1411720 m!1301683))

(declare-fun m!1301685 () Bool)

(assert (=> b!1411720 m!1301685))

(declare-fun m!1301687 () Bool)

(assert (=> b!1411720 m!1301687))

(declare-fun m!1301689 () Bool)

(assert (=> b!1411717 m!1301689))

(assert (=> b!1411717 m!1301683))

(assert (=> b!1411717 m!1301689))

(declare-fun m!1301691 () Bool)

(assert (=> b!1411717 m!1301691))

(declare-fun m!1301693 () Bool)

(assert (=> b!1411717 m!1301693))

(assert (=> b!1411715 m!1301673))

(assert (=> b!1411715 m!1301673))

(declare-fun m!1301695 () Bool)

(assert (=> b!1411715 m!1301695))

(declare-fun m!1301697 () Bool)

(assert (=> b!1411714 m!1301697))

(assert (=> b!1411714 m!1301697))

(declare-fun m!1301699 () Bool)

(assert (=> b!1411714 m!1301699))

(assert (=> b!1411719 m!1301673))

(declare-fun m!1301701 () Bool)

(assert (=> b!1411719 m!1301701))

(assert (=> b!1411719 m!1301673))

(assert (=> b!1411719 m!1301673))

(declare-fun m!1301703 () Bool)

(assert (=> b!1411719 m!1301703))

(declare-fun m!1301705 () Bool)

(assert (=> b!1411719 m!1301705))

(declare-fun m!1301707 () Bool)

(assert (=> b!1411719 m!1301707))

(declare-fun m!1301709 () Bool)

(assert (=> b!1411718 m!1301709))

(push 1)

