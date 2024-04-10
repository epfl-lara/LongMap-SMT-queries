; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121496 () Bool)

(assert start!121496)

(declare-fun b!1411741 () Bool)

(declare-fun res!948970 () Bool)

(declare-fun e!798893 () Bool)

(assert (=> b!1411741 (=> (not res!948970) (not e!798893))))

(declare-datatypes ((array!96497 0))(
  ( (array!96498 (arr!46587 (Array (_ BitVec 32) (_ BitVec 64))) (size!47137 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96497)

(declare-datatypes ((List!33106 0))(
  ( (Nil!33103) (Cons!33102 (h!34374 (_ BitVec 64)) (t!47800 List!33106)) )
))
(declare-fun arrayNoDuplicates!0 (array!96497 (_ BitVec 32) List!33106) Bool)

(assert (=> b!1411741 (= res!948970 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33103))))

(declare-fun b!1411742 () Bool)

(declare-fun e!798896 () Bool)

(assert (=> b!1411742 (= e!798896 true)))

(declare-datatypes ((SeekEntryResult!10898 0))(
  ( (MissingZero!10898 (index!45969 (_ BitVec 32))) (Found!10898 (index!45970 (_ BitVec 32))) (Intermediate!10898 (undefined!11710 Bool) (index!45971 (_ BitVec 32)) (x!127557 (_ BitVec 32))) (Undefined!10898) (MissingVacant!10898 (index!45972 (_ BitVec 32))) )
))
(declare-fun lt!621918 () SeekEntryResult!10898)

(declare-fun lt!621921 () SeekEntryResult!10898)

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1411742 (and (not (undefined!11710 lt!621918)) (= (index!45971 lt!621918) i!1037) (bvslt (x!127557 lt!621918) (x!127557 lt!621921)) (= (select (store (arr!46587 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45971 lt!621918)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((Unit!47770 0))(
  ( (Unit!47771) )
))
(declare-fun lt!621917 () Unit!47770)

(declare-fun lt!621919 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47770)

(assert (=> b!1411742 (= lt!621917 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621919 (x!127557 lt!621921) (index!45971 lt!621921) (x!127557 lt!621918) (index!45971 lt!621918) (undefined!11710 lt!621918) mask!2840))))

(declare-fun res!948972 () Bool)

(assert (=> start!121496 (=> (not res!948972) (not e!798893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121496 (= res!948972 (validMask!0 mask!2840))))

(assert (=> start!121496 e!798893))

(assert (=> start!121496 true))

(declare-fun array_inv!35615 (array!96497) Bool)

(assert (=> start!121496 (array_inv!35615 a!2901)))

(declare-fun b!1411743 () Bool)

(declare-fun res!948973 () Bool)

(assert (=> b!1411743 (=> (not res!948973) (not e!798893))))

(assert (=> b!1411743 (= res!948973 (and (= (size!47137 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47137 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47137 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411744 () Bool)

(declare-fun res!948971 () Bool)

(assert (=> b!1411744 (=> (not res!948971) (not e!798893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96497 (_ BitVec 32)) Bool)

(assert (=> b!1411744 (= res!948971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411745 () Bool)

(declare-fun e!798892 () Bool)

(assert (=> b!1411745 (= e!798893 (not e!798892))))

(declare-fun res!948974 () Bool)

(assert (=> b!1411745 (=> res!948974 e!798892)))

(get-info :version)

(assert (=> b!1411745 (= res!948974 (or (not ((_ is Intermediate!10898) lt!621921)) (undefined!11710 lt!621921)))))

(declare-fun e!798895 () Bool)

(assert (=> b!1411745 e!798895))

(declare-fun res!948969 () Bool)

(assert (=> b!1411745 (=> (not res!948969) (not e!798895))))

(assert (=> b!1411745 (= res!948969 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621920 () Unit!47770)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47770)

(assert (=> b!1411745 (= lt!621920 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96497 (_ BitVec 32)) SeekEntryResult!10898)

(assert (=> b!1411745 (= lt!621921 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621919 (select (arr!46587 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411745 (= lt!621919 (toIndex!0 (select (arr!46587 a!2901) j!112) mask!2840))))

(declare-fun b!1411746 () Bool)

(assert (=> b!1411746 (= e!798892 e!798896)))

(declare-fun res!948975 () Bool)

(assert (=> b!1411746 (=> res!948975 e!798896)))

(assert (=> b!1411746 (= res!948975 (or (= lt!621921 lt!621918) (not ((_ is Intermediate!10898) lt!621918))))))

(declare-fun lt!621916 () (_ BitVec 64))

(assert (=> b!1411746 (= lt!621918 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621916 mask!2840) lt!621916 (array!96498 (store (arr!46587 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47137 a!2901)) mask!2840))))

(assert (=> b!1411746 (= lt!621916 (select (store (arr!46587 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1411747 () Bool)

(declare-fun res!948976 () Bool)

(assert (=> b!1411747 (=> (not res!948976) (not e!798893))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411747 (= res!948976 (validKeyInArray!0 (select (arr!46587 a!2901) j!112)))))

(declare-fun b!1411748 () Bool)

(declare-fun res!948968 () Bool)

(assert (=> b!1411748 (=> (not res!948968) (not e!798893))))

(assert (=> b!1411748 (= res!948968 (validKeyInArray!0 (select (arr!46587 a!2901) i!1037)))))

(declare-fun b!1411749 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96497 (_ BitVec 32)) SeekEntryResult!10898)

(assert (=> b!1411749 (= e!798895 (= (seekEntryOrOpen!0 (select (arr!46587 a!2901) j!112) a!2901 mask!2840) (Found!10898 j!112)))))

(assert (= (and start!121496 res!948972) b!1411743))

(assert (= (and b!1411743 res!948973) b!1411748))

(assert (= (and b!1411748 res!948968) b!1411747))

(assert (= (and b!1411747 res!948976) b!1411744))

(assert (= (and b!1411744 res!948971) b!1411741))

(assert (= (and b!1411741 res!948970) b!1411745))

(assert (= (and b!1411745 res!948969) b!1411749))

(assert (= (and b!1411745 (not res!948974)) b!1411746))

(assert (= (and b!1411746 (not res!948975)) b!1411742))

(declare-fun m!1301711 () Bool)

(assert (=> b!1411744 m!1301711))

(declare-fun m!1301713 () Bool)

(assert (=> start!121496 m!1301713))

(declare-fun m!1301715 () Bool)

(assert (=> start!121496 m!1301715))

(declare-fun m!1301717 () Bool)

(assert (=> b!1411746 m!1301717))

(declare-fun m!1301719 () Bool)

(assert (=> b!1411746 m!1301719))

(assert (=> b!1411746 m!1301717))

(declare-fun m!1301721 () Bool)

(assert (=> b!1411746 m!1301721))

(declare-fun m!1301723 () Bool)

(assert (=> b!1411746 m!1301723))

(declare-fun m!1301725 () Bool)

(assert (=> b!1411741 m!1301725))

(declare-fun m!1301727 () Bool)

(assert (=> b!1411749 m!1301727))

(assert (=> b!1411749 m!1301727))

(declare-fun m!1301729 () Bool)

(assert (=> b!1411749 m!1301729))

(declare-fun m!1301731 () Bool)

(assert (=> b!1411748 m!1301731))

(assert (=> b!1411748 m!1301731))

(declare-fun m!1301733 () Bool)

(assert (=> b!1411748 m!1301733))

(assert (=> b!1411742 m!1301719))

(declare-fun m!1301735 () Bool)

(assert (=> b!1411742 m!1301735))

(declare-fun m!1301737 () Bool)

(assert (=> b!1411742 m!1301737))

(assert (=> b!1411747 m!1301727))

(assert (=> b!1411747 m!1301727))

(declare-fun m!1301739 () Bool)

(assert (=> b!1411747 m!1301739))

(assert (=> b!1411745 m!1301727))

(declare-fun m!1301741 () Bool)

(assert (=> b!1411745 m!1301741))

(assert (=> b!1411745 m!1301727))

(declare-fun m!1301743 () Bool)

(assert (=> b!1411745 m!1301743))

(declare-fun m!1301745 () Bool)

(assert (=> b!1411745 m!1301745))

(assert (=> b!1411745 m!1301727))

(declare-fun m!1301747 () Bool)

(assert (=> b!1411745 m!1301747))

(check-sat (not b!1411742) (not b!1411745) (not b!1411741) (not b!1411747) (not b!1411746) (not start!121496) (not b!1411748) (not b!1411749) (not b!1411744))
(check-sat)
