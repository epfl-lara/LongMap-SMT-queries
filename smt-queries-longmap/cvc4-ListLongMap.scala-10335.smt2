; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121498 () Bool)

(assert start!121498)

(declare-fun res!949003 () Bool)

(declare-fun e!798911 () Bool)

(assert (=> start!121498 (=> (not res!949003) (not e!798911))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121498 (= res!949003 (validMask!0 mask!2840))))

(assert (=> start!121498 e!798911))

(assert (=> start!121498 true))

(declare-datatypes ((array!96499 0))(
  ( (array!96500 (arr!46588 (Array (_ BitVec 32) (_ BitVec 64))) (size!47138 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96499)

(declare-fun array_inv!35616 (array!96499) Bool)

(assert (=> start!121498 (array_inv!35616 a!2901)))

(declare-fun b!1411768 () Bool)

(declare-fun res!948999 () Bool)

(assert (=> b!1411768 (=> (not res!948999) (not e!798911))))

(declare-datatypes ((List!33107 0))(
  ( (Nil!33104) (Cons!33103 (h!34375 (_ BitVec 64)) (t!47801 List!33107)) )
))
(declare-fun arrayNoDuplicates!0 (array!96499 (_ BitVec 32) List!33107) Bool)

(assert (=> b!1411768 (= res!948999 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33104))))

(declare-fun b!1411769 () Bool)

(declare-fun res!949001 () Bool)

(assert (=> b!1411769 (=> (not res!949001) (not e!798911))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411769 (= res!949001 (validKeyInArray!0 (select (arr!46588 a!2901) i!1037)))))

(declare-fun b!1411770 () Bool)

(declare-fun e!798907 () Bool)

(assert (=> b!1411770 (= e!798907 true)))

(declare-datatypes ((SeekEntryResult!10899 0))(
  ( (MissingZero!10899 (index!45973 (_ BitVec 32))) (Found!10899 (index!45974 (_ BitVec 32))) (Intermediate!10899 (undefined!11711 Bool) (index!45975 (_ BitVec 32)) (x!127558 (_ BitVec 32))) (Undefined!10899) (MissingVacant!10899 (index!45976 (_ BitVec 32))) )
))
(declare-fun lt!621936 () SeekEntryResult!10899)

(declare-fun lt!621937 () SeekEntryResult!10899)

(assert (=> b!1411770 (and (not (undefined!11711 lt!621936)) (= (index!45975 lt!621936) i!1037) (bvslt (x!127558 lt!621936) (x!127558 lt!621937)) (= (select (store (arr!46588 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45975 lt!621936)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47772 0))(
  ( (Unit!47773) )
))
(declare-fun lt!621938 () Unit!47772)

(declare-fun lt!621939 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96499 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47772)

(assert (=> b!1411770 (= lt!621938 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621939 (x!127558 lt!621937) (index!45975 lt!621937) (x!127558 lt!621936) (index!45975 lt!621936) (undefined!11711 lt!621936) mask!2840))))

(declare-fun b!1411771 () Bool)

(declare-fun e!798908 () Bool)

(assert (=> b!1411771 (= e!798911 (not e!798908))))

(declare-fun res!949000 () Bool)

(assert (=> b!1411771 (=> res!949000 e!798908)))

(assert (=> b!1411771 (= res!949000 (or (not (is-Intermediate!10899 lt!621937)) (undefined!11711 lt!621937)))))

(declare-fun e!798910 () Bool)

(assert (=> b!1411771 e!798910))

(declare-fun res!949002 () Bool)

(assert (=> b!1411771 (=> (not res!949002) (not e!798910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96499 (_ BitVec 32)) Bool)

(assert (=> b!1411771 (= res!949002 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621934 () Unit!47772)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96499 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47772)

(assert (=> b!1411771 (= lt!621934 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96499 (_ BitVec 32)) SeekEntryResult!10899)

(assert (=> b!1411771 (= lt!621937 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621939 (select (arr!46588 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411771 (= lt!621939 (toIndex!0 (select (arr!46588 a!2901) j!112) mask!2840))))

(declare-fun b!1411772 () Bool)

(declare-fun res!948996 () Bool)

(assert (=> b!1411772 (=> (not res!948996) (not e!798911))))

(assert (=> b!1411772 (= res!948996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411773 () Bool)

(assert (=> b!1411773 (= e!798908 e!798907)))

(declare-fun res!948995 () Bool)

(assert (=> b!1411773 (=> res!948995 e!798907)))

(assert (=> b!1411773 (= res!948995 (or (= lt!621937 lt!621936) (not (is-Intermediate!10899 lt!621936))))))

(declare-fun lt!621935 () (_ BitVec 64))

(assert (=> b!1411773 (= lt!621936 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621935 mask!2840) lt!621935 (array!96500 (store (arr!46588 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47138 a!2901)) mask!2840))))

(assert (=> b!1411773 (= lt!621935 (select (store (arr!46588 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1411774 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96499 (_ BitVec 32)) SeekEntryResult!10899)

(assert (=> b!1411774 (= e!798910 (= (seekEntryOrOpen!0 (select (arr!46588 a!2901) j!112) a!2901 mask!2840) (Found!10899 j!112)))))

(declare-fun b!1411775 () Bool)

(declare-fun res!948997 () Bool)

(assert (=> b!1411775 (=> (not res!948997) (not e!798911))))

(assert (=> b!1411775 (= res!948997 (validKeyInArray!0 (select (arr!46588 a!2901) j!112)))))

(declare-fun b!1411776 () Bool)

(declare-fun res!948998 () Bool)

(assert (=> b!1411776 (=> (not res!948998) (not e!798911))))

(assert (=> b!1411776 (= res!948998 (and (= (size!47138 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47138 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47138 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121498 res!949003) b!1411776))

(assert (= (and b!1411776 res!948998) b!1411769))

(assert (= (and b!1411769 res!949001) b!1411775))

(assert (= (and b!1411775 res!948997) b!1411772))

(assert (= (and b!1411772 res!948996) b!1411768))

(assert (= (and b!1411768 res!948999) b!1411771))

(assert (= (and b!1411771 res!949002) b!1411774))

(assert (= (and b!1411771 (not res!949000)) b!1411773))

(assert (= (and b!1411773 (not res!948995)) b!1411770))

(declare-fun m!1301749 () Bool)

(assert (=> b!1411773 m!1301749))

(declare-fun m!1301751 () Bool)

(assert (=> b!1411773 m!1301751))

(assert (=> b!1411773 m!1301749))

(declare-fun m!1301753 () Bool)

(assert (=> b!1411773 m!1301753))

(declare-fun m!1301755 () Bool)

(assert (=> b!1411773 m!1301755))

(declare-fun m!1301757 () Bool)

(assert (=> b!1411768 m!1301757))

(declare-fun m!1301759 () Bool)

(assert (=> b!1411769 m!1301759))

(assert (=> b!1411769 m!1301759))

(declare-fun m!1301761 () Bool)

(assert (=> b!1411769 m!1301761))

(declare-fun m!1301763 () Bool)

(assert (=> b!1411771 m!1301763))

(declare-fun m!1301765 () Bool)

(assert (=> b!1411771 m!1301765))

(assert (=> b!1411771 m!1301763))

(declare-fun m!1301767 () Bool)

(assert (=> b!1411771 m!1301767))

(declare-fun m!1301769 () Bool)

(assert (=> b!1411771 m!1301769))

(assert (=> b!1411771 m!1301763))

(declare-fun m!1301771 () Bool)

(assert (=> b!1411771 m!1301771))

(assert (=> b!1411770 m!1301751))

(declare-fun m!1301773 () Bool)

(assert (=> b!1411770 m!1301773))

(declare-fun m!1301775 () Bool)

(assert (=> b!1411770 m!1301775))

(assert (=> b!1411774 m!1301763))

(assert (=> b!1411774 m!1301763))

(declare-fun m!1301777 () Bool)

(assert (=> b!1411774 m!1301777))

(assert (=> b!1411775 m!1301763))

(assert (=> b!1411775 m!1301763))

(declare-fun m!1301779 () Bool)

(assert (=> b!1411775 m!1301779))

(declare-fun m!1301781 () Bool)

(assert (=> b!1411772 m!1301781))

(declare-fun m!1301783 () Bool)

(assert (=> start!121498 m!1301783))

(declare-fun m!1301785 () Bool)

(assert (=> start!121498 m!1301785))

(push 1)

