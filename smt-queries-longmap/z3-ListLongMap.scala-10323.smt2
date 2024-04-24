; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121610 () Bool)

(assert start!121610)

(declare-fun res!948421 () Bool)

(declare-fun e!799074 () Bool)

(assert (=> start!121610 (=> (not res!948421) (not e!799074))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121610 (= res!948421 (validMask!0 mask!2840))))

(assert (=> start!121610 e!799074))

(assert (=> start!121610 true))

(declare-datatypes ((array!96533 0))(
  ( (array!96534 (arr!46603 (Array (_ BitVec 32) (_ BitVec 64))) (size!47154 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96533)

(declare-fun array_inv!35884 (array!96533) Bool)

(assert (=> start!121610 (array_inv!35884 a!2901)))

(declare-fun b!1411871 () Bool)

(declare-fun res!948420 () Bool)

(assert (=> b!1411871 (=> (not res!948420) (not e!799074))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411871 (= res!948420 (validKeyInArray!0 (select (arr!46603 a!2901) i!1037)))))

(declare-fun lt!621709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10817 0))(
  ( (MissingZero!10817 (index!45645 (_ BitVec 32))) (Found!10817 (index!45646 (_ BitVec 32))) (Intermediate!10817 (undefined!11629 Bool) (index!45647 (_ BitVec 32)) (x!127399 (_ BitVec 32))) (Undefined!10817) (MissingVacant!10817 (index!45648 (_ BitVec 32))) )
))
(declare-fun lt!621710 () SeekEntryResult!10817)

(declare-fun lt!621707 () SeekEntryResult!10817)

(declare-fun b!1411872 () Bool)

(declare-fun e!799073 () Bool)

(get-info :version)

(assert (=> b!1411872 (= e!799073 (or (= lt!621710 lt!621707) (not ((_ is Intermediate!10817) lt!621707)) (bvslt (x!127399 lt!621710) #b00000000000000000000000000000000) (bvsgt (x!127399 lt!621710) #b01111111111111111111111111111110) (bvslt lt!621709 #b00000000000000000000000000000000) (bvsge lt!621709 (size!47154 a!2901)) (bvslt (index!45647 lt!621710) #b00000000000000000000000000000000) (bvsge (index!45647 lt!621710) (size!47154 a!2901)) (not (= lt!621710 (Intermediate!10817 false (index!45647 lt!621710) (x!127399 lt!621710)))) (= lt!621707 (Intermediate!10817 (undefined!11629 lt!621707) (index!45647 lt!621707) (x!127399 lt!621707)))))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96533 (_ BitVec 32)) SeekEntryResult!10817)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411872 (= lt!621707 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46603 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46603 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96534 (store (arr!46603 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47154 a!2901)) mask!2840))))

(declare-fun b!1411873 () Bool)

(assert (=> b!1411873 (= e!799074 (not e!799073))))

(declare-fun res!948417 () Bool)

(assert (=> b!1411873 (=> res!948417 e!799073)))

(assert (=> b!1411873 (= res!948417 (or (not ((_ is Intermediate!10817) lt!621710)) (undefined!11629 lt!621710)))))

(declare-fun e!799075 () Bool)

(assert (=> b!1411873 e!799075))

(declare-fun res!948419 () Bool)

(assert (=> b!1411873 (=> (not res!948419) (not e!799075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96533 (_ BitVec 32)) Bool)

(assert (=> b!1411873 (= res!948419 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47635 0))(
  ( (Unit!47636) )
))
(declare-fun lt!621708 () Unit!47635)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96533 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47635)

(assert (=> b!1411873 (= lt!621708 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1411873 (= lt!621710 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621709 (select (arr!46603 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1411873 (= lt!621709 (toIndex!0 (select (arr!46603 a!2901) j!112) mask!2840))))

(declare-fun b!1411874 () Bool)

(declare-fun res!948416 () Bool)

(assert (=> b!1411874 (=> (not res!948416) (not e!799074))))

(declare-datatypes ((List!33109 0))(
  ( (Nil!33106) (Cons!33105 (h!34385 (_ BitVec 64)) (t!47795 List!33109)) )
))
(declare-fun arrayNoDuplicates!0 (array!96533 (_ BitVec 32) List!33109) Bool)

(assert (=> b!1411874 (= res!948416 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33106))))

(declare-fun b!1411875 () Bool)

(declare-fun res!948414 () Bool)

(assert (=> b!1411875 (=> (not res!948414) (not e!799074))))

(assert (=> b!1411875 (= res!948414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411876 () Bool)

(declare-fun res!948418 () Bool)

(assert (=> b!1411876 (=> (not res!948418) (not e!799074))))

(assert (=> b!1411876 (= res!948418 (validKeyInArray!0 (select (arr!46603 a!2901) j!112)))))

(declare-fun b!1411877 () Bool)

(declare-fun res!948415 () Bool)

(assert (=> b!1411877 (=> (not res!948415) (not e!799074))))

(assert (=> b!1411877 (= res!948415 (and (= (size!47154 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47154 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47154 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411878 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96533 (_ BitVec 32)) SeekEntryResult!10817)

(assert (=> b!1411878 (= e!799075 (= (seekEntryOrOpen!0 (select (arr!46603 a!2901) j!112) a!2901 mask!2840) (Found!10817 j!112)))))

(assert (= (and start!121610 res!948421) b!1411877))

(assert (= (and b!1411877 res!948415) b!1411871))

(assert (= (and b!1411871 res!948420) b!1411876))

(assert (= (and b!1411876 res!948418) b!1411875))

(assert (= (and b!1411875 res!948414) b!1411874))

(assert (= (and b!1411874 res!948416) b!1411873))

(assert (= (and b!1411873 res!948419) b!1411878))

(assert (= (and b!1411873 (not res!948417)) b!1411872))

(declare-fun m!1301737 () Bool)

(assert (=> b!1411872 m!1301737))

(declare-fun m!1301739 () Bool)

(assert (=> b!1411872 m!1301739))

(assert (=> b!1411872 m!1301739))

(declare-fun m!1301741 () Bool)

(assert (=> b!1411872 m!1301741))

(assert (=> b!1411872 m!1301741))

(assert (=> b!1411872 m!1301739))

(declare-fun m!1301743 () Bool)

(assert (=> b!1411872 m!1301743))

(declare-fun m!1301745 () Bool)

(assert (=> start!121610 m!1301745))

(declare-fun m!1301747 () Bool)

(assert (=> start!121610 m!1301747))

(declare-fun m!1301749 () Bool)

(assert (=> b!1411875 m!1301749))

(declare-fun m!1301751 () Bool)

(assert (=> b!1411874 m!1301751))

(declare-fun m!1301753 () Bool)

(assert (=> b!1411878 m!1301753))

(assert (=> b!1411878 m!1301753))

(declare-fun m!1301755 () Bool)

(assert (=> b!1411878 m!1301755))

(assert (=> b!1411873 m!1301753))

(declare-fun m!1301757 () Bool)

(assert (=> b!1411873 m!1301757))

(assert (=> b!1411873 m!1301753))

(declare-fun m!1301759 () Bool)

(assert (=> b!1411873 m!1301759))

(assert (=> b!1411873 m!1301753))

(declare-fun m!1301761 () Bool)

(assert (=> b!1411873 m!1301761))

(declare-fun m!1301763 () Bool)

(assert (=> b!1411873 m!1301763))

(assert (=> b!1411876 m!1301753))

(assert (=> b!1411876 m!1301753))

(declare-fun m!1301765 () Bool)

(assert (=> b!1411876 m!1301765))

(declare-fun m!1301767 () Bool)

(assert (=> b!1411871 m!1301767))

(assert (=> b!1411871 m!1301767))

(declare-fun m!1301769 () Bool)

(assert (=> b!1411871 m!1301769))

(check-sat (not b!1411878) (not b!1411873) (not b!1411871) (not b!1411872) (not b!1411876) (not b!1411875) (not b!1411874) (not start!121610))
(check-sat)
