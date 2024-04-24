; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121790 () Bool)

(assert start!121790)

(declare-fun b!1413786 () Bool)

(declare-fun e!800168 () Bool)

(declare-fun e!800163 () Bool)

(assert (=> b!1413786 (= e!800168 e!800163)))

(declare-fun res!950097 () Bool)

(assert (=> b!1413786 (=> res!950097 e!800163)))

(declare-datatypes ((SeekEntryResult!10874 0))(
  ( (MissingZero!10874 (index!45876 (_ BitVec 32))) (Found!10874 (index!45877 (_ BitVec 32))) (Intermediate!10874 (undefined!11686 Bool) (index!45878 (_ BitVec 32)) (x!127620 (_ BitVec 32))) (Undefined!10874) (MissingVacant!10874 (index!45879 (_ BitVec 32))) )
))
(declare-fun lt!622879 () SeekEntryResult!10874)

(declare-fun lt!622880 () SeekEntryResult!10874)

(get-info :version)

(assert (=> b!1413786 (= res!950097 (or (= lt!622879 lt!622880) (not ((_ is Intermediate!10874) lt!622880))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!622878 () (_ BitVec 64))

(declare-datatypes ((array!96650 0))(
  ( (array!96651 (arr!46660 (Array (_ BitVec 32) (_ BitVec 64))) (size!47211 (_ BitVec 32))) )
))
(declare-fun lt!622883 () array!96650)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96650 (_ BitVec 32)) SeekEntryResult!10874)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413786 (= lt!622880 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622878 mask!2840) lt!622878 lt!622883 mask!2840))))

(declare-fun a!2901 () array!96650)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1413786 (= lt!622878 (select (store (arr!46660 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413786 (= lt!622883 (array!96651 (store (arr!46660 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47211 a!2901)))))

(declare-fun b!1413787 () Bool)

(declare-fun e!800165 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96650 (_ BitVec 32)) SeekEntryResult!10874)

(assert (=> b!1413787 (= e!800165 (= (seekEntryOrOpen!0 (select (arr!46660 a!2901) j!112) a!2901 mask!2840) (Found!10874 j!112)))))

(declare-fun b!1413788 () Bool)

(assert (=> b!1413788 (= e!800163 true)))

(declare-fun e!800164 () Bool)

(assert (=> b!1413788 e!800164))

(declare-fun res!950093 () Bool)

(assert (=> b!1413788 (=> (not res!950093) (not e!800164))))

(assert (=> b!1413788 (= res!950093 (and (not (undefined!11686 lt!622880)) (= (index!45878 lt!622880) i!1037) (bvslt (x!127620 lt!622880) (x!127620 lt!622879)) (= (select (store (arr!46660 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45878 lt!622880)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622877 () (_ BitVec 32))

(declare-datatypes ((Unit!47749 0))(
  ( (Unit!47750) )
))
(declare-fun lt!622881 () Unit!47749)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96650 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47749)

(assert (=> b!1413788 (= lt!622881 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622877 (x!127620 lt!622879) (index!45878 lt!622879) (x!127620 lt!622880) (index!45878 lt!622880) (undefined!11686 lt!622880) mask!2840))))

(declare-fun b!1413789 () Bool)

(declare-fun res!950099 () Bool)

(declare-fun e!800167 () Bool)

(assert (=> b!1413789 (=> (not res!950099) (not e!800167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413789 (= res!950099 (validKeyInArray!0 (select (arr!46660 a!2901) j!112)))))

(declare-fun b!1413790 () Bool)

(declare-fun res!950095 () Bool)

(assert (=> b!1413790 (=> (not res!950095) (not e!800167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96650 (_ BitVec 32)) Bool)

(assert (=> b!1413790 (= res!950095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413791 () Bool)

(declare-fun res!950100 () Bool)

(assert (=> b!1413791 (=> (not res!950100) (not e!800167))))

(assert (=> b!1413791 (= res!950100 (and (= (size!47211 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47211 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47211 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413792 () Bool)

(assert (=> b!1413792 (= e!800167 (not e!800168))))

(declare-fun res!950094 () Bool)

(assert (=> b!1413792 (=> res!950094 e!800168)))

(assert (=> b!1413792 (= res!950094 (or (not ((_ is Intermediate!10874) lt!622879)) (undefined!11686 lt!622879)))))

(assert (=> b!1413792 e!800165))

(declare-fun res!950098 () Bool)

(assert (=> b!1413792 (=> (not res!950098) (not e!800165))))

(assert (=> b!1413792 (= res!950098 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622882 () Unit!47749)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96650 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47749)

(assert (=> b!1413792 (= lt!622882 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1413792 (= lt!622879 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622877 (select (arr!46660 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1413792 (= lt!622877 (toIndex!0 (select (arr!46660 a!2901) j!112) mask!2840))))

(declare-fun res!950096 () Bool)

(assert (=> start!121790 (=> (not res!950096) (not e!800167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121790 (= res!950096 (validMask!0 mask!2840))))

(assert (=> start!121790 e!800167))

(assert (=> start!121790 true))

(declare-fun array_inv!35941 (array!96650) Bool)

(assert (=> start!121790 (array_inv!35941 a!2901)))

(declare-fun b!1413793 () Bool)

(declare-fun res!950101 () Bool)

(assert (=> b!1413793 (=> (not res!950101) (not e!800167))))

(assert (=> b!1413793 (= res!950101 (validKeyInArray!0 (select (arr!46660 a!2901) i!1037)))))

(declare-fun b!1413794 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96650 (_ BitVec 32)) SeekEntryResult!10874)

(assert (=> b!1413794 (= e!800164 (= (seekEntryOrOpen!0 lt!622878 lt!622883 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127620 lt!622880) (index!45878 lt!622880) (index!45878 lt!622880) (select (arr!46660 a!2901) j!112) lt!622883 mask!2840)))))

(declare-fun b!1413795 () Bool)

(declare-fun res!950092 () Bool)

(assert (=> b!1413795 (=> (not res!950092) (not e!800167))))

(declare-datatypes ((List!33166 0))(
  ( (Nil!33163) (Cons!33162 (h!34445 (_ BitVec 64)) (t!47852 List!33166)) )
))
(declare-fun arrayNoDuplicates!0 (array!96650 (_ BitVec 32) List!33166) Bool)

(assert (=> b!1413795 (= res!950092 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33163))))

(assert (= (and start!121790 res!950096) b!1413791))

(assert (= (and b!1413791 res!950100) b!1413793))

(assert (= (and b!1413793 res!950101) b!1413789))

(assert (= (and b!1413789 res!950099) b!1413790))

(assert (= (and b!1413790 res!950095) b!1413795))

(assert (= (and b!1413795 res!950092) b!1413792))

(assert (= (and b!1413792 res!950098) b!1413787))

(assert (= (and b!1413792 (not res!950094)) b!1413786))

(assert (= (and b!1413786 (not res!950097)) b!1413788))

(assert (= (and b!1413788 res!950093) b!1413794))

(declare-fun m!1304125 () Bool)

(assert (=> start!121790 m!1304125))

(declare-fun m!1304127 () Bool)

(assert (=> start!121790 m!1304127))

(declare-fun m!1304129 () Bool)

(assert (=> b!1413787 m!1304129))

(assert (=> b!1413787 m!1304129))

(declare-fun m!1304131 () Bool)

(assert (=> b!1413787 m!1304131))

(assert (=> b!1413789 m!1304129))

(assert (=> b!1413789 m!1304129))

(declare-fun m!1304133 () Bool)

(assert (=> b!1413789 m!1304133))

(assert (=> b!1413792 m!1304129))

(declare-fun m!1304135 () Bool)

(assert (=> b!1413792 m!1304135))

(assert (=> b!1413792 m!1304129))

(declare-fun m!1304137 () Bool)

(assert (=> b!1413792 m!1304137))

(declare-fun m!1304139 () Bool)

(assert (=> b!1413792 m!1304139))

(assert (=> b!1413792 m!1304129))

(declare-fun m!1304141 () Bool)

(assert (=> b!1413792 m!1304141))

(declare-fun m!1304143 () Bool)

(assert (=> b!1413793 m!1304143))

(assert (=> b!1413793 m!1304143))

(declare-fun m!1304145 () Bool)

(assert (=> b!1413793 m!1304145))

(declare-fun m!1304147 () Bool)

(assert (=> b!1413790 m!1304147))

(declare-fun m!1304149 () Bool)

(assert (=> b!1413788 m!1304149))

(declare-fun m!1304151 () Bool)

(assert (=> b!1413788 m!1304151))

(declare-fun m!1304153 () Bool)

(assert (=> b!1413788 m!1304153))

(declare-fun m!1304155 () Bool)

(assert (=> b!1413795 m!1304155))

(declare-fun m!1304157 () Bool)

(assert (=> b!1413794 m!1304157))

(assert (=> b!1413794 m!1304129))

(assert (=> b!1413794 m!1304129))

(declare-fun m!1304159 () Bool)

(assert (=> b!1413794 m!1304159))

(declare-fun m!1304161 () Bool)

(assert (=> b!1413786 m!1304161))

(assert (=> b!1413786 m!1304161))

(declare-fun m!1304163 () Bool)

(assert (=> b!1413786 m!1304163))

(assert (=> b!1413786 m!1304149))

(declare-fun m!1304165 () Bool)

(assert (=> b!1413786 m!1304165))

(check-sat (not b!1413793) (not b!1413786) (not b!1413792) (not b!1413794) (not b!1413795) (not b!1413788) (not start!121790) (not b!1413789) (not b!1413790) (not b!1413787))
(check-sat)
