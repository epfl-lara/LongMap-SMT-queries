; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121670 () Bool)

(assert start!121670)

(declare-fun b!1412692 () Bool)

(declare-fun res!949241 () Bool)

(declare-fun e!799529 () Bool)

(assert (=> b!1412692 (=> (not res!949241) (not e!799529))))

(declare-datatypes ((array!96593 0))(
  ( (array!96594 (arr!46633 (Array (_ BitVec 32) (_ BitVec 64))) (size!47184 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96593)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412692 (= res!949241 (validKeyInArray!0 (select (arr!46633 a!2901) i!1037)))))

(declare-fun b!1412694 () Bool)

(declare-fun res!949237 () Bool)

(assert (=> b!1412694 (=> (not res!949237) (not e!799529))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96593 (_ BitVec 32)) Bool)

(assert (=> b!1412694 (= res!949237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412695 () Bool)

(declare-fun e!799525 () Bool)

(assert (=> b!1412695 (= e!799525 true)))

(declare-datatypes ((SeekEntryResult!10847 0))(
  ( (MissingZero!10847 (index!45765 (_ BitVec 32))) (Found!10847 (index!45766 (_ BitVec 32))) (Intermediate!10847 (undefined!11659 Bool) (index!45767 (_ BitVec 32)) (x!127509 (_ BitVec 32))) (Undefined!10847) (MissingVacant!10847 (index!45768 (_ BitVec 32))) )
))
(declare-fun lt!622193 () SeekEntryResult!10847)

(declare-fun lt!622190 () SeekEntryResult!10847)

(assert (=> b!1412695 (and (not (undefined!11659 lt!622193)) (= (index!45767 lt!622193) i!1037) (bvslt (x!127509 lt!622193) (x!127509 lt!622190)) (= (select (store (arr!46633 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45767 lt!622193)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47695 0))(
  ( (Unit!47696) )
))
(declare-fun lt!622192 () Unit!47695)

(declare-fun lt!622191 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96593 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47695)

(assert (=> b!1412695 (= lt!622192 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622191 (x!127509 lt!622190) (index!45767 lt!622190) (x!127509 lt!622193) (index!45767 lt!622193) (undefined!11659 lt!622193) mask!2840))))

(declare-fun b!1412696 () Bool)

(declare-fun e!799527 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96593 (_ BitVec 32)) SeekEntryResult!10847)

(assert (=> b!1412696 (= e!799527 (= (seekEntryOrOpen!0 (select (arr!46633 a!2901) j!112) a!2901 mask!2840) (Found!10847 j!112)))))

(declare-fun b!1412697 () Bool)

(declare-fun res!949243 () Bool)

(assert (=> b!1412697 (=> (not res!949243) (not e!799529))))

(assert (=> b!1412697 (= res!949243 (and (= (size!47184 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47184 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47184 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412698 () Bool)

(declare-fun res!949236 () Bool)

(assert (=> b!1412698 (=> (not res!949236) (not e!799529))))

(declare-datatypes ((List!33139 0))(
  ( (Nil!33136) (Cons!33135 (h!34415 (_ BitVec 64)) (t!47825 List!33139)) )
))
(declare-fun arrayNoDuplicates!0 (array!96593 (_ BitVec 32) List!33139) Bool)

(assert (=> b!1412698 (= res!949236 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33136))))

(declare-fun b!1412699 () Bool)

(declare-fun res!949242 () Bool)

(assert (=> b!1412699 (=> (not res!949242) (not e!799529))))

(assert (=> b!1412699 (= res!949242 (validKeyInArray!0 (select (arr!46633 a!2901) j!112)))))

(declare-fun b!1412700 () Bool)

(declare-fun e!799526 () Bool)

(assert (=> b!1412700 (= e!799526 e!799525)))

(declare-fun res!949238 () Bool)

(assert (=> b!1412700 (=> res!949238 e!799525)))

(get-info :version)

(assert (=> b!1412700 (= res!949238 (or (= lt!622190 lt!622193) (not ((_ is Intermediate!10847) lt!622193))))))

(declare-fun lt!622189 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96593 (_ BitVec 32)) SeekEntryResult!10847)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412700 (= lt!622193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622189 mask!2840) lt!622189 (array!96594 (store (arr!46633 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47184 a!2901)) mask!2840))))

(assert (=> b!1412700 (= lt!622189 (select (store (arr!46633 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1412693 () Bool)

(assert (=> b!1412693 (= e!799529 (not e!799526))))

(declare-fun res!949239 () Bool)

(assert (=> b!1412693 (=> res!949239 e!799526)))

(assert (=> b!1412693 (= res!949239 (or (not ((_ is Intermediate!10847) lt!622190)) (undefined!11659 lt!622190)))))

(assert (=> b!1412693 e!799527))

(declare-fun res!949240 () Bool)

(assert (=> b!1412693 (=> (not res!949240) (not e!799527))))

(assert (=> b!1412693 (= res!949240 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622188 () Unit!47695)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96593 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47695)

(assert (=> b!1412693 (= lt!622188 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1412693 (= lt!622190 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622191 (select (arr!46633 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1412693 (= lt!622191 (toIndex!0 (select (arr!46633 a!2901) j!112) mask!2840))))

(declare-fun res!949235 () Bool)

(assert (=> start!121670 (=> (not res!949235) (not e!799529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121670 (= res!949235 (validMask!0 mask!2840))))

(assert (=> start!121670 e!799529))

(assert (=> start!121670 true))

(declare-fun array_inv!35914 (array!96593) Bool)

(assert (=> start!121670 (array_inv!35914 a!2901)))

(assert (= (and start!121670 res!949235) b!1412697))

(assert (= (and b!1412697 res!949243) b!1412692))

(assert (= (and b!1412692 res!949241) b!1412699))

(assert (= (and b!1412699 res!949242) b!1412694))

(assert (= (and b!1412694 res!949237) b!1412698))

(assert (= (and b!1412698 res!949236) b!1412693))

(assert (= (and b!1412693 res!949240) b!1412696))

(assert (= (and b!1412693 (not res!949239)) b!1412700))

(assert (= (and b!1412700 (not res!949238)) b!1412695))

(declare-fun m!1302817 () Bool)

(assert (=> b!1412694 m!1302817))

(declare-fun m!1302819 () Bool)

(assert (=> b!1412695 m!1302819))

(declare-fun m!1302821 () Bool)

(assert (=> b!1412695 m!1302821))

(declare-fun m!1302823 () Bool)

(assert (=> b!1412695 m!1302823))

(declare-fun m!1302825 () Bool)

(assert (=> b!1412700 m!1302825))

(assert (=> b!1412700 m!1302819))

(assert (=> b!1412700 m!1302825))

(declare-fun m!1302827 () Bool)

(assert (=> b!1412700 m!1302827))

(declare-fun m!1302829 () Bool)

(assert (=> b!1412700 m!1302829))

(declare-fun m!1302831 () Bool)

(assert (=> b!1412696 m!1302831))

(assert (=> b!1412696 m!1302831))

(declare-fun m!1302833 () Bool)

(assert (=> b!1412696 m!1302833))

(declare-fun m!1302835 () Bool)

(assert (=> start!121670 m!1302835))

(declare-fun m!1302837 () Bool)

(assert (=> start!121670 m!1302837))

(assert (=> b!1412693 m!1302831))

(declare-fun m!1302839 () Bool)

(assert (=> b!1412693 m!1302839))

(assert (=> b!1412693 m!1302831))

(declare-fun m!1302841 () Bool)

(assert (=> b!1412693 m!1302841))

(assert (=> b!1412693 m!1302831))

(declare-fun m!1302843 () Bool)

(assert (=> b!1412693 m!1302843))

(declare-fun m!1302845 () Bool)

(assert (=> b!1412693 m!1302845))

(assert (=> b!1412699 m!1302831))

(assert (=> b!1412699 m!1302831))

(declare-fun m!1302847 () Bool)

(assert (=> b!1412699 m!1302847))

(declare-fun m!1302849 () Bool)

(assert (=> b!1412692 m!1302849))

(assert (=> b!1412692 m!1302849))

(declare-fun m!1302851 () Bool)

(assert (=> b!1412692 m!1302851))

(declare-fun m!1302853 () Bool)

(assert (=> b!1412698 m!1302853))

(check-sat (not b!1412696) (not b!1412694) (not b!1412699) (not b!1412698) (not b!1412693) (not b!1412695) (not b!1412700) (not b!1412692) (not start!121670))
(check-sat)
