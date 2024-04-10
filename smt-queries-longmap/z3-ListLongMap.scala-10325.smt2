; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121436 () Bool)

(assert start!121436)

(declare-fun b!1410909 () Bool)

(declare-fun res!948145 () Bool)

(declare-fun e!798430 () Bool)

(assert (=> b!1410909 (=> (not res!948145) (not e!798430))))

(declare-datatypes ((array!96437 0))(
  ( (array!96438 (arr!46557 (Array (_ BitVec 32) (_ BitVec 64))) (size!47107 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96437)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410909 (= res!948145 (validKeyInArray!0 (select (arr!46557 a!2901) i!1037)))))

(declare-fun b!1410910 () Bool)

(declare-fun e!798431 () Bool)

(declare-fun e!798432 () Bool)

(assert (=> b!1410910 (= e!798431 e!798432)))

(declare-fun res!948139 () Bool)

(assert (=> b!1410910 (=> res!948139 e!798432)))

(declare-fun lt!621401 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10868 0))(
  ( (MissingZero!10868 (index!45849 (_ BitVec 32))) (Found!10868 (index!45850 (_ BitVec 32))) (Intermediate!10868 (undefined!11680 Bool) (index!45851 (_ BitVec 32)) (x!127447 (_ BitVec 32))) (Undefined!10868) (MissingVacant!10868 (index!45852 (_ BitVec 32))) )
))
(declare-fun lt!621399 () SeekEntryResult!10868)

(declare-fun lt!621400 () SeekEntryResult!10868)

(get-info :version)

(assert (=> b!1410910 (= res!948139 (or (= lt!621400 lt!621399) (not ((_ is Intermediate!10868) lt!621399)) (bvslt (x!127447 lt!621400) #b00000000000000000000000000000000) (bvsgt (x!127447 lt!621400) #b01111111111111111111111111111110) (bvslt lt!621401 #b00000000000000000000000000000000) (bvsge lt!621401 (size!47107 a!2901)) (bvslt (index!45851 lt!621400) #b00000000000000000000000000000000) (bvsge (index!45851 lt!621400) (size!47107 a!2901)) (not (= lt!621400 (Intermediate!10868 false (index!45851 lt!621400) (x!127447 lt!621400))))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!621405 () (_ BitVec 64))

(declare-fun lt!621403 () array!96437)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96437 (_ BitVec 32)) SeekEntryResult!10868)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410910 (= lt!621399 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621405 mask!2840) lt!621405 lt!621403 mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1410910 (= lt!621405 (select (store (arr!46557 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1410910 (= lt!621403 (array!96438 (store (arr!46557 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47107 a!2901)))))

(declare-fun b!1410911 () Bool)

(declare-fun e!798429 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96437 (_ BitVec 32)) SeekEntryResult!10868)

(assert (=> b!1410911 (= e!798429 (= (seekEntryOrOpen!0 (select (arr!46557 a!2901) j!112) a!2901 mask!2840) (Found!10868 j!112)))))

(declare-fun b!1410912 () Bool)

(declare-fun e!798434 () Bool)

(assert (=> b!1410912 (= e!798432 e!798434)))

(declare-fun res!948143 () Bool)

(assert (=> b!1410912 (=> res!948143 e!798434)))

(declare-fun lt!621402 () SeekEntryResult!10868)

(assert (=> b!1410912 (= res!948143 (not (= lt!621399 lt!621402)))))

(assert (=> b!1410912 (= lt!621402 (Intermediate!10868 (undefined!11680 lt!621399) (index!45851 lt!621399) (x!127447 lt!621399)))))

(declare-fun b!1410913 () Bool)

(declare-fun res!948142 () Bool)

(assert (=> b!1410913 (=> (not res!948142) (not e!798430))))

(assert (=> b!1410913 (= res!948142 (and (= (size!47107 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47107 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47107 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!948138 () Bool)

(assert (=> start!121436 (=> (not res!948138) (not e!798430))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121436 (= res!948138 (validMask!0 mask!2840))))

(assert (=> start!121436 e!798430))

(assert (=> start!121436 true))

(declare-fun array_inv!35585 (array!96437) Bool)

(assert (=> start!121436 (array_inv!35585 a!2901)))

(declare-fun b!1410914 () Bool)

(declare-fun res!948141 () Bool)

(assert (=> b!1410914 (=> (not res!948141) (not e!798430))))

(assert (=> b!1410914 (= res!948141 (validKeyInArray!0 (select (arr!46557 a!2901) j!112)))))

(declare-fun b!1410915 () Bool)

(declare-fun res!948144 () Bool)

(assert (=> b!1410915 (=> (not res!948144) (not e!798430))))

(declare-datatypes ((List!33076 0))(
  ( (Nil!33073) (Cons!33072 (h!34344 (_ BitVec 64)) (t!47770 List!33076)) )
))
(declare-fun arrayNoDuplicates!0 (array!96437 (_ BitVec 32) List!33076) Bool)

(assert (=> b!1410915 (= res!948144 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33073))))

(declare-fun b!1410916 () Bool)

(assert (=> b!1410916 (= e!798430 (not e!798431))))

(declare-fun res!948140 () Bool)

(assert (=> b!1410916 (=> res!948140 e!798431)))

(assert (=> b!1410916 (= res!948140 (or (not ((_ is Intermediate!10868) lt!621400)) (undefined!11680 lt!621400)))))

(assert (=> b!1410916 e!798429))

(declare-fun res!948137 () Bool)

(assert (=> b!1410916 (=> (not res!948137) (not e!798429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96437 (_ BitVec 32)) Bool)

(assert (=> b!1410916 (= res!948137 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47710 0))(
  ( (Unit!47711) )
))
(declare-fun lt!621404 () Unit!47710)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96437 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47710)

(assert (=> b!1410916 (= lt!621404 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1410916 (= lt!621400 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621401 (select (arr!46557 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1410916 (= lt!621401 (toIndex!0 (select (arr!46557 a!2901) j!112) mask!2840))))

(declare-fun b!1410917 () Bool)

(declare-fun res!948136 () Bool)

(assert (=> b!1410917 (=> (not res!948136) (not e!798430))))

(assert (=> b!1410917 (= res!948136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410918 () Bool)

(assert (=> b!1410918 (= e!798434 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621401 lt!621405 lt!621403 mask!2840) lt!621402))))

(assert (= (and start!121436 res!948138) b!1410913))

(assert (= (and b!1410913 res!948142) b!1410909))

(assert (= (and b!1410909 res!948145) b!1410914))

(assert (= (and b!1410914 res!948141) b!1410917))

(assert (= (and b!1410917 res!948136) b!1410915))

(assert (= (and b!1410915 res!948144) b!1410916))

(assert (= (and b!1410916 res!948137) b!1410911))

(assert (= (and b!1410916 (not res!948140)) b!1410910))

(assert (= (and b!1410910 (not res!948139)) b!1410912))

(assert (= (and b!1410912 (not res!948143)) b!1410918))

(declare-fun m!1300605 () Bool)

(assert (=> b!1410916 m!1300605))

(declare-fun m!1300607 () Bool)

(assert (=> b!1410916 m!1300607))

(assert (=> b!1410916 m!1300605))

(declare-fun m!1300609 () Bool)

(assert (=> b!1410916 m!1300609))

(assert (=> b!1410916 m!1300605))

(declare-fun m!1300611 () Bool)

(assert (=> b!1410916 m!1300611))

(declare-fun m!1300613 () Bool)

(assert (=> b!1410916 m!1300613))

(declare-fun m!1300615 () Bool)

(assert (=> start!121436 m!1300615))

(declare-fun m!1300617 () Bool)

(assert (=> start!121436 m!1300617))

(assert (=> b!1410914 m!1300605))

(assert (=> b!1410914 m!1300605))

(declare-fun m!1300619 () Bool)

(assert (=> b!1410914 m!1300619))

(declare-fun m!1300621 () Bool)

(assert (=> b!1410910 m!1300621))

(assert (=> b!1410910 m!1300621))

(declare-fun m!1300623 () Bool)

(assert (=> b!1410910 m!1300623))

(declare-fun m!1300625 () Bool)

(assert (=> b!1410910 m!1300625))

(declare-fun m!1300627 () Bool)

(assert (=> b!1410910 m!1300627))

(assert (=> b!1410911 m!1300605))

(assert (=> b!1410911 m!1300605))

(declare-fun m!1300629 () Bool)

(assert (=> b!1410911 m!1300629))

(declare-fun m!1300631 () Bool)

(assert (=> b!1410917 m!1300631))

(declare-fun m!1300633 () Bool)

(assert (=> b!1410918 m!1300633))

(declare-fun m!1300635 () Bool)

(assert (=> b!1410909 m!1300635))

(assert (=> b!1410909 m!1300635))

(declare-fun m!1300637 () Bool)

(assert (=> b!1410909 m!1300637))

(declare-fun m!1300639 () Bool)

(assert (=> b!1410915 m!1300639))

(check-sat (not b!1410915) (not b!1410911) (not start!121436) (not b!1410909) (not b!1410917) (not b!1410914) (not b!1410918) (not b!1410910) (not b!1410916))
(check-sat)
