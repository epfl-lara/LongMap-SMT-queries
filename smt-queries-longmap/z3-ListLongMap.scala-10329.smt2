; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121646 () Bool)

(assert start!121646)

(declare-fun b!1412369 () Bool)

(declare-fun res!948914 () Bool)

(declare-fun e!799348 () Bool)

(assert (=> b!1412369 (=> (not res!948914) (not e!799348))))

(declare-datatypes ((array!96569 0))(
  ( (array!96570 (arr!46621 (Array (_ BitVec 32) (_ BitVec 64))) (size!47172 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96569)

(declare-datatypes ((List!33127 0))(
  ( (Nil!33124) (Cons!33123 (h!34403 (_ BitVec 64)) (t!47813 List!33127)) )
))
(declare-fun arrayNoDuplicates!0 (array!96569 (_ BitVec 32) List!33127) Bool)

(assert (=> b!1412369 (= res!948914 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33124))))

(declare-fun b!1412370 () Bool)

(declare-fun res!948911 () Bool)

(assert (=> b!1412370 (=> (not res!948911) (not e!799348))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412370 (= res!948911 (validKeyInArray!0 (select (arr!46621 a!2901) j!112)))))

(declare-fun b!1412371 () Bool)

(declare-fun e!799345 () Bool)

(assert (=> b!1412371 (= e!799345 true)))

(declare-datatypes ((SeekEntryResult!10835 0))(
  ( (MissingZero!10835 (index!45717 (_ BitVec 32))) (Found!10835 (index!45718 (_ BitVec 32))) (Intermediate!10835 (undefined!11647 Bool) (index!45719 (_ BitVec 32)) (x!127465 (_ BitVec 32))) (Undefined!10835) (MissingVacant!10835 (index!45720 (_ BitVec 32))) )
))
(declare-fun lt!621990 () SeekEntryResult!10835)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!621992 () SeekEntryResult!10835)

(assert (=> b!1412371 (and (not (undefined!11647 lt!621990)) (= (index!45719 lt!621990) i!1037) (bvslt (x!127465 lt!621990) (x!127465 lt!621992)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!621988 () (_ BitVec 32))

(declare-datatypes ((Unit!47671 0))(
  ( (Unit!47672) )
))
(declare-fun lt!621989 () Unit!47671)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96569 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47671)

(assert (=> b!1412371 (= lt!621989 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621988 (x!127465 lt!621992) (index!45719 lt!621992) (x!127465 lt!621990) (index!45719 lt!621990) (undefined!11647 lt!621990) mask!2840))))

(declare-fun b!1412372 () Bool)

(declare-fun e!799347 () Bool)

(assert (=> b!1412372 (= e!799348 (not e!799347))))

(declare-fun res!948915 () Bool)

(assert (=> b!1412372 (=> res!948915 e!799347)))

(get-info :version)

(assert (=> b!1412372 (= res!948915 (or (not ((_ is Intermediate!10835) lt!621992)) (undefined!11647 lt!621992)))))

(declare-fun e!799346 () Bool)

(assert (=> b!1412372 e!799346))

(declare-fun res!948912 () Bool)

(assert (=> b!1412372 (=> (not res!948912) (not e!799346))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96569 (_ BitVec 32)) Bool)

(assert (=> b!1412372 (= res!948912 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621991 () Unit!47671)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96569 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47671)

(assert (=> b!1412372 (= lt!621991 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96569 (_ BitVec 32)) SeekEntryResult!10835)

(assert (=> b!1412372 (= lt!621992 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621988 (select (arr!46621 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412372 (= lt!621988 (toIndex!0 (select (arr!46621 a!2901) j!112) mask!2840))))

(declare-fun b!1412373 () Bool)

(declare-fun res!948917 () Bool)

(assert (=> b!1412373 (=> (not res!948917) (not e!799348))))

(assert (=> b!1412373 (= res!948917 (validKeyInArray!0 (select (arr!46621 a!2901) i!1037)))))

(declare-fun b!1412374 () Bool)

(declare-fun res!948916 () Bool)

(assert (=> b!1412374 (=> (not res!948916) (not e!799348))))

(assert (=> b!1412374 (= res!948916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412375 () Bool)

(assert (=> b!1412375 (= e!799347 e!799345)))

(declare-fun res!948918 () Bool)

(assert (=> b!1412375 (=> res!948918 e!799345)))

(assert (=> b!1412375 (= res!948918 (or (= lt!621992 lt!621990) (not ((_ is Intermediate!10835) lt!621990))))))

(assert (=> b!1412375 (= lt!621990 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46621 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46621 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96570 (store (arr!46621 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47172 a!2901)) mask!2840))))

(declare-fun b!1412376 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96569 (_ BitVec 32)) SeekEntryResult!10835)

(assert (=> b!1412376 (= e!799346 (= (seekEntryOrOpen!0 (select (arr!46621 a!2901) j!112) a!2901 mask!2840) (Found!10835 j!112)))))

(declare-fun res!948913 () Bool)

(assert (=> start!121646 (=> (not res!948913) (not e!799348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121646 (= res!948913 (validMask!0 mask!2840))))

(assert (=> start!121646 e!799348))

(assert (=> start!121646 true))

(declare-fun array_inv!35902 (array!96569) Bool)

(assert (=> start!121646 (array_inv!35902 a!2901)))

(declare-fun b!1412368 () Bool)

(declare-fun res!948919 () Bool)

(assert (=> b!1412368 (=> (not res!948919) (not e!799348))))

(assert (=> b!1412368 (= res!948919 (and (= (size!47172 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47172 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47172 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121646 res!948913) b!1412368))

(assert (= (and b!1412368 res!948919) b!1412373))

(assert (= (and b!1412373 res!948917) b!1412370))

(assert (= (and b!1412370 res!948911) b!1412374))

(assert (= (and b!1412374 res!948916) b!1412369))

(assert (= (and b!1412369 res!948914) b!1412372))

(assert (= (and b!1412372 res!948912) b!1412376))

(assert (= (and b!1412372 (not res!948915)) b!1412375))

(assert (= (and b!1412375 (not res!948918)) b!1412371))

(declare-fun m!1302373 () Bool)

(assert (=> b!1412374 m!1302373))

(declare-fun m!1302375 () Bool)

(assert (=> b!1412371 m!1302375))

(declare-fun m!1302377 () Bool)

(assert (=> start!121646 m!1302377))

(declare-fun m!1302379 () Bool)

(assert (=> start!121646 m!1302379))

(declare-fun m!1302381 () Bool)

(assert (=> b!1412375 m!1302381))

(declare-fun m!1302383 () Bool)

(assert (=> b!1412375 m!1302383))

(assert (=> b!1412375 m!1302383))

(declare-fun m!1302385 () Bool)

(assert (=> b!1412375 m!1302385))

(assert (=> b!1412375 m!1302385))

(assert (=> b!1412375 m!1302383))

(declare-fun m!1302387 () Bool)

(assert (=> b!1412375 m!1302387))

(declare-fun m!1302389 () Bool)

(assert (=> b!1412373 m!1302389))

(assert (=> b!1412373 m!1302389))

(declare-fun m!1302391 () Bool)

(assert (=> b!1412373 m!1302391))

(declare-fun m!1302393 () Bool)

(assert (=> b!1412376 m!1302393))

(assert (=> b!1412376 m!1302393))

(declare-fun m!1302395 () Bool)

(assert (=> b!1412376 m!1302395))

(declare-fun m!1302397 () Bool)

(assert (=> b!1412369 m!1302397))

(assert (=> b!1412372 m!1302393))

(declare-fun m!1302399 () Bool)

(assert (=> b!1412372 m!1302399))

(assert (=> b!1412372 m!1302393))

(declare-fun m!1302401 () Bool)

(assert (=> b!1412372 m!1302401))

(declare-fun m!1302403 () Bool)

(assert (=> b!1412372 m!1302403))

(assert (=> b!1412372 m!1302393))

(declare-fun m!1302405 () Bool)

(assert (=> b!1412372 m!1302405))

(assert (=> b!1412370 m!1302393))

(assert (=> b!1412370 m!1302393))

(declare-fun m!1302407 () Bool)

(assert (=> b!1412370 m!1302407))

(check-sat (not b!1412370) (not start!121646) (not b!1412373) (not b!1412376) (not b!1412374) (not b!1412369) (not b!1412372) (not b!1412371) (not b!1412375))
(check-sat)
