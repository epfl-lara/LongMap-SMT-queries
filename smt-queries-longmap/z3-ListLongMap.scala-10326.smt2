; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121442 () Bool)

(assert start!121442)

(declare-fun b!1411004 () Bool)

(declare-fun res!948233 () Bool)

(declare-fun e!798485 () Bool)

(assert (=> b!1411004 (=> (not res!948233) (not e!798485))))

(declare-datatypes ((array!96443 0))(
  ( (array!96444 (arr!46560 (Array (_ BitVec 32) (_ BitVec 64))) (size!47110 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96443)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411004 (= res!948233 (validKeyInArray!0 (select (arr!46560 a!2901) j!112)))))

(declare-fun b!1411005 () Bool)

(declare-fun e!798484 () Bool)

(declare-fun e!798486 () Bool)

(assert (=> b!1411005 (= e!798484 e!798486)))

(declare-fun res!948231 () Bool)

(assert (=> b!1411005 (=> res!948231 e!798486)))

(declare-datatypes ((SeekEntryResult!10871 0))(
  ( (MissingZero!10871 (index!45861 (_ BitVec 32))) (Found!10871 (index!45862 (_ BitVec 32))) (Intermediate!10871 (undefined!11683 Bool) (index!45863 (_ BitVec 32)) (x!127458 (_ BitVec 32))) (Undefined!10871) (MissingVacant!10871 (index!45864 (_ BitVec 32))) )
))
(declare-fun lt!621462 () SeekEntryResult!10871)

(declare-fun lt!621464 () SeekEntryResult!10871)

(declare-fun lt!621463 () (_ BitVec 32))

(get-info :version)

(assert (=> b!1411005 (= res!948231 (or (= lt!621462 lt!621464) (not ((_ is Intermediate!10871) lt!621464)) (bvslt (x!127458 lt!621462) #b00000000000000000000000000000000) (bvsgt (x!127458 lt!621462) #b01111111111111111111111111111110) (bvslt lt!621463 #b00000000000000000000000000000000) (bvsge lt!621463 (size!47110 a!2901)) (bvslt (index!45863 lt!621462) #b00000000000000000000000000000000) (bvsge (index!45863 lt!621462) (size!47110 a!2901)) (not (= lt!621462 (Intermediate!10871 false (index!45863 lt!621462) (x!127458 lt!621462))))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!621466 () array!96443)

(declare-fun lt!621468 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96443 (_ BitVec 32)) SeekEntryResult!10871)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411005 (= lt!621464 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621468 mask!2840) lt!621468 lt!621466 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1411005 (= lt!621468 (select (store (arr!46560 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1411005 (= lt!621466 (array!96444 (store (arr!46560 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47110 a!2901)))))

(declare-fun b!1411006 () Bool)

(declare-fun res!948240 () Bool)

(assert (=> b!1411006 (=> (not res!948240) (not e!798485))))

(declare-datatypes ((List!33079 0))(
  ( (Nil!33076) (Cons!33075 (h!34347 (_ BitVec 64)) (t!47773 List!33079)) )
))
(declare-fun arrayNoDuplicates!0 (array!96443 (_ BitVec 32) List!33079) Bool)

(assert (=> b!1411006 (= res!948240 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33076))))

(declare-fun b!1411007 () Bool)

(declare-fun res!948237 () Bool)

(assert (=> b!1411007 (=> (not res!948237) (not e!798485))))

(assert (=> b!1411007 (= res!948237 (validKeyInArray!0 (select (arr!46560 a!2901) i!1037)))))

(declare-fun b!1411008 () Bool)

(assert (=> b!1411008 (= e!798485 (not e!798484))))

(declare-fun res!948239 () Bool)

(assert (=> b!1411008 (=> res!948239 e!798484)))

(assert (=> b!1411008 (= res!948239 (or (not ((_ is Intermediate!10871) lt!621462)) (undefined!11683 lt!621462)))))

(declare-fun e!798487 () Bool)

(assert (=> b!1411008 e!798487))

(declare-fun res!948234 () Bool)

(assert (=> b!1411008 (=> (not res!948234) (not e!798487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96443 (_ BitVec 32)) Bool)

(assert (=> b!1411008 (= res!948234 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47716 0))(
  ( (Unit!47717) )
))
(declare-fun lt!621465 () Unit!47716)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96443 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47716)

(assert (=> b!1411008 (= lt!621465 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1411008 (= lt!621462 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621463 (select (arr!46560 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1411008 (= lt!621463 (toIndex!0 (select (arr!46560 a!2901) j!112) mask!2840))))

(declare-fun b!1411009 () Bool)

(declare-fun res!948235 () Bool)

(assert (=> b!1411009 (=> (not res!948235) (not e!798485))))

(assert (=> b!1411009 (= res!948235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411010 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96443 (_ BitVec 32)) SeekEntryResult!10871)

(assert (=> b!1411010 (= e!798487 (= (seekEntryOrOpen!0 (select (arr!46560 a!2901) j!112) a!2901 mask!2840) (Found!10871 j!112)))))

(declare-fun res!948236 () Bool)

(assert (=> start!121442 (=> (not res!948236) (not e!798485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121442 (= res!948236 (validMask!0 mask!2840))))

(assert (=> start!121442 e!798485))

(assert (=> start!121442 true))

(declare-fun array_inv!35588 (array!96443) Bool)

(assert (=> start!121442 (array_inv!35588 a!2901)))

(declare-fun b!1411011 () Bool)

(declare-fun e!798488 () Bool)

(assert (=> b!1411011 (= e!798488 (or (undefined!11683 lt!621464) (not (= (index!45863 lt!621462) (index!45863 lt!621464))) (not (= (x!127458 lt!621462) (x!127458 lt!621464)))))))

(declare-fun b!1411012 () Bool)

(assert (=> b!1411012 (= e!798486 e!798488)))

(declare-fun res!948238 () Bool)

(assert (=> b!1411012 (=> res!948238 e!798488)))

(declare-fun lt!621467 () SeekEntryResult!10871)

(assert (=> b!1411012 (= res!948238 (not (= lt!621464 lt!621467)))))

(assert (=> b!1411012 (= lt!621467 (Intermediate!10871 (undefined!11683 lt!621464) (index!45863 lt!621464) (x!127458 lt!621464)))))

(declare-fun b!1411013 () Bool)

(declare-fun res!948232 () Bool)

(assert (=> b!1411013 (=> (not res!948232) (not e!798485))))

(assert (=> b!1411013 (= res!948232 (and (= (size!47110 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47110 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47110 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411014 () Bool)

(declare-fun res!948241 () Bool)

(assert (=> b!1411014 (=> res!948241 e!798488)))

(assert (=> b!1411014 (= res!948241 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621463 lt!621468 lt!621466 mask!2840) lt!621467)))))

(assert (= (and start!121442 res!948236) b!1411013))

(assert (= (and b!1411013 res!948232) b!1411007))

(assert (= (and b!1411007 res!948237) b!1411004))

(assert (= (and b!1411004 res!948233) b!1411009))

(assert (= (and b!1411009 res!948235) b!1411006))

(assert (= (and b!1411006 res!948240) b!1411008))

(assert (= (and b!1411008 res!948234) b!1411010))

(assert (= (and b!1411008 (not res!948239)) b!1411005))

(assert (= (and b!1411005 (not res!948231)) b!1411012))

(assert (= (and b!1411012 (not res!948238)) b!1411014))

(assert (= (and b!1411014 (not res!948241)) b!1411011))

(declare-fun m!1300713 () Bool)

(assert (=> b!1411014 m!1300713))

(declare-fun m!1300715 () Bool)

(assert (=> start!121442 m!1300715))

(declare-fun m!1300717 () Bool)

(assert (=> start!121442 m!1300717))

(declare-fun m!1300719 () Bool)

(assert (=> b!1411006 m!1300719))

(declare-fun m!1300721 () Bool)

(assert (=> b!1411007 m!1300721))

(assert (=> b!1411007 m!1300721))

(declare-fun m!1300723 () Bool)

(assert (=> b!1411007 m!1300723))

(declare-fun m!1300725 () Bool)

(assert (=> b!1411010 m!1300725))

(assert (=> b!1411010 m!1300725))

(declare-fun m!1300727 () Bool)

(assert (=> b!1411010 m!1300727))

(assert (=> b!1411008 m!1300725))

(declare-fun m!1300729 () Bool)

(assert (=> b!1411008 m!1300729))

(assert (=> b!1411008 m!1300725))

(declare-fun m!1300731 () Bool)

(assert (=> b!1411008 m!1300731))

(assert (=> b!1411008 m!1300725))

(declare-fun m!1300733 () Bool)

(assert (=> b!1411008 m!1300733))

(declare-fun m!1300735 () Bool)

(assert (=> b!1411008 m!1300735))

(declare-fun m!1300737 () Bool)

(assert (=> b!1411009 m!1300737))

(assert (=> b!1411004 m!1300725))

(assert (=> b!1411004 m!1300725))

(declare-fun m!1300739 () Bool)

(assert (=> b!1411004 m!1300739))

(declare-fun m!1300741 () Bool)

(assert (=> b!1411005 m!1300741))

(assert (=> b!1411005 m!1300741))

(declare-fun m!1300743 () Bool)

(assert (=> b!1411005 m!1300743))

(declare-fun m!1300745 () Bool)

(assert (=> b!1411005 m!1300745))

(declare-fun m!1300747 () Bool)

(assert (=> b!1411005 m!1300747))

(check-sat (not b!1411004) (not b!1411009) (not b!1411005) (not b!1411007) (not start!121442) (not b!1411006) (not b!1411008) (not b!1411014) (not b!1411010))
(check-sat)
