; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121490 () Bool)

(assert start!121490)

(declare-fun b!1411660 () Bool)

(declare-fun res!948890 () Bool)

(declare-fun e!798849 () Bool)

(assert (=> b!1411660 (=> (not res!948890) (not e!798849))))

(declare-datatypes ((array!96491 0))(
  ( (array!96492 (arr!46584 (Array (_ BitVec 32) (_ BitVec 64))) (size!47134 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96491)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411660 (= res!948890 (validKeyInArray!0 (select (arr!46584 a!2901) i!1037)))))

(declare-fun b!1411661 () Bool)

(declare-fun res!948892 () Bool)

(assert (=> b!1411661 (=> (not res!948892) (not e!798849))))

(declare-datatypes ((List!33103 0))(
  ( (Nil!33100) (Cons!33099 (h!34371 (_ BitVec 64)) (t!47797 List!33103)) )
))
(declare-fun arrayNoDuplicates!0 (array!96491 (_ BitVec 32) List!33103) Bool)

(assert (=> b!1411661 (= res!948892 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33100))))

(declare-fun b!1411662 () Bool)

(declare-fun res!948893 () Bool)

(assert (=> b!1411662 (=> (not res!948893) (not e!798849))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96491 (_ BitVec 32)) Bool)

(assert (=> b!1411662 (= res!948893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411663 () Bool)

(declare-fun res!948889 () Bool)

(assert (=> b!1411663 (=> (not res!948889) (not e!798849))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1411663 (= res!948889 (and (= (size!47134 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47134 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47134 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411664 () Bool)

(declare-fun e!798848 () Bool)

(assert (=> b!1411664 (= e!798848 true)))

(declare-datatypes ((SeekEntryResult!10895 0))(
  ( (MissingZero!10895 (index!45957 (_ BitVec 32))) (Found!10895 (index!45958 (_ BitVec 32))) (Intermediate!10895 (undefined!11707 Bool) (index!45959 (_ BitVec 32)) (x!127546 (_ BitVec 32))) (Undefined!10895) (MissingVacant!10895 (index!45960 (_ BitVec 32))) )
))
(declare-fun lt!621867 () SeekEntryResult!10895)

(declare-fun lt!621866 () SeekEntryResult!10895)

(assert (=> b!1411664 (and (not (undefined!11707 lt!621867)) (= (index!45959 lt!621867) i!1037) (bvslt (x!127546 lt!621867) (x!127546 lt!621866)) (= (select (store (arr!46584 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45959 lt!621867)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47764 0))(
  ( (Unit!47765) )
))
(declare-fun lt!621865 () Unit!47764)

(declare-fun lt!621862 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96491 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47764)

(assert (=> b!1411664 (= lt!621865 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621862 (x!127546 lt!621866) (index!45959 lt!621866) (x!127546 lt!621867) (index!45959 lt!621867) (undefined!11707 lt!621867) mask!2840))))

(declare-fun res!948888 () Bool)

(assert (=> start!121490 (=> (not res!948888) (not e!798849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121490 (= res!948888 (validMask!0 mask!2840))))

(assert (=> start!121490 e!798849))

(assert (=> start!121490 true))

(declare-fun array_inv!35612 (array!96491) Bool)

(assert (=> start!121490 (array_inv!35612 a!2901)))

(declare-fun b!1411665 () Bool)

(declare-fun e!798847 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96491 (_ BitVec 32)) SeekEntryResult!10895)

(assert (=> b!1411665 (= e!798847 (= (seekEntryOrOpen!0 (select (arr!46584 a!2901) j!112) a!2901 mask!2840) (Found!10895 j!112)))))

(declare-fun b!1411666 () Bool)

(declare-fun e!798850 () Bool)

(assert (=> b!1411666 (= e!798850 e!798848)))

(declare-fun res!948891 () Bool)

(assert (=> b!1411666 (=> res!948891 e!798848)))

(get-info :version)

(assert (=> b!1411666 (= res!948891 (or (= lt!621866 lt!621867) (not ((_ is Intermediate!10895) lt!621867))))))

(declare-fun lt!621863 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96491 (_ BitVec 32)) SeekEntryResult!10895)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411666 (= lt!621867 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621863 mask!2840) lt!621863 (array!96492 (store (arr!46584 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47134 a!2901)) mask!2840))))

(assert (=> b!1411666 (= lt!621863 (select (store (arr!46584 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1411667 () Bool)

(assert (=> b!1411667 (= e!798849 (not e!798850))))

(declare-fun res!948895 () Bool)

(assert (=> b!1411667 (=> res!948895 e!798850)))

(assert (=> b!1411667 (= res!948895 (or (not ((_ is Intermediate!10895) lt!621866)) (undefined!11707 lt!621866)))))

(assert (=> b!1411667 e!798847))

(declare-fun res!948894 () Bool)

(assert (=> b!1411667 (=> (not res!948894) (not e!798847))))

(assert (=> b!1411667 (= res!948894 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621864 () Unit!47764)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96491 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47764)

(assert (=> b!1411667 (= lt!621864 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1411667 (= lt!621866 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621862 (select (arr!46584 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1411667 (= lt!621862 (toIndex!0 (select (arr!46584 a!2901) j!112) mask!2840))))

(declare-fun b!1411668 () Bool)

(declare-fun res!948887 () Bool)

(assert (=> b!1411668 (=> (not res!948887) (not e!798849))))

(assert (=> b!1411668 (= res!948887 (validKeyInArray!0 (select (arr!46584 a!2901) j!112)))))

(assert (= (and start!121490 res!948888) b!1411663))

(assert (= (and b!1411663 res!948889) b!1411660))

(assert (= (and b!1411660 res!948890) b!1411668))

(assert (= (and b!1411668 res!948887) b!1411662))

(assert (= (and b!1411662 res!948893) b!1411661))

(assert (= (and b!1411661 res!948892) b!1411667))

(assert (= (and b!1411667 res!948894) b!1411665))

(assert (= (and b!1411667 (not res!948895)) b!1411666))

(assert (= (and b!1411666 (not res!948891)) b!1411664))

(declare-fun m!1301597 () Bool)

(assert (=> b!1411661 m!1301597))

(declare-fun m!1301599 () Bool)

(assert (=> b!1411662 m!1301599))

(declare-fun m!1301601 () Bool)

(assert (=> b!1411664 m!1301601))

(declare-fun m!1301603 () Bool)

(assert (=> b!1411664 m!1301603))

(declare-fun m!1301605 () Bool)

(assert (=> b!1411664 m!1301605))

(declare-fun m!1301607 () Bool)

(assert (=> b!1411667 m!1301607))

(declare-fun m!1301609 () Bool)

(assert (=> b!1411667 m!1301609))

(assert (=> b!1411667 m!1301607))

(assert (=> b!1411667 m!1301607))

(declare-fun m!1301611 () Bool)

(assert (=> b!1411667 m!1301611))

(declare-fun m!1301613 () Bool)

(assert (=> b!1411667 m!1301613))

(declare-fun m!1301615 () Bool)

(assert (=> b!1411667 m!1301615))

(declare-fun m!1301617 () Bool)

(assert (=> b!1411660 m!1301617))

(assert (=> b!1411660 m!1301617))

(declare-fun m!1301619 () Bool)

(assert (=> b!1411660 m!1301619))

(assert (=> b!1411665 m!1301607))

(assert (=> b!1411665 m!1301607))

(declare-fun m!1301621 () Bool)

(assert (=> b!1411665 m!1301621))

(declare-fun m!1301623 () Bool)

(assert (=> b!1411666 m!1301623))

(assert (=> b!1411666 m!1301601))

(assert (=> b!1411666 m!1301623))

(declare-fun m!1301625 () Bool)

(assert (=> b!1411666 m!1301625))

(declare-fun m!1301627 () Bool)

(assert (=> b!1411666 m!1301627))

(declare-fun m!1301629 () Bool)

(assert (=> start!121490 m!1301629))

(declare-fun m!1301631 () Bool)

(assert (=> start!121490 m!1301631))

(assert (=> b!1411668 m!1301607))

(assert (=> b!1411668 m!1301607))

(declare-fun m!1301633 () Bool)

(assert (=> b!1411668 m!1301633))

(check-sat (not b!1411662) (not b!1411668) (not b!1411661) (not b!1411660) (not b!1411667) (not b!1411664) (not start!121490) (not b!1411665) (not b!1411666))
(check-sat)
