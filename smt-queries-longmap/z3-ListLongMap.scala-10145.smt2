; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119636 () Bool)

(assert start!119636)

(declare-fun b!1393571 () Bool)

(declare-fun res!932985 () Bool)

(declare-fun e!789085 () Bool)

(assert (=> b!1393571 (=> (not res!932985) (not e!789085))))

(declare-datatypes ((array!95318 0))(
  ( (array!95319 (arr!46017 (Array (_ BitVec 32) (_ BitVec 64))) (size!46567 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95318)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95318 (_ BitVec 32)) Bool)

(assert (=> b!1393571 (= res!932985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!789083 () Bool)

(declare-fun b!1393572 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10334 0))(
  ( (MissingZero!10334 (index!43707 (_ BitVec 32))) (Found!10334 (index!43708 (_ BitVec 32))) (Intermediate!10334 (undefined!11146 Bool) (index!43709 (_ BitVec 32)) (x!125386 (_ BitVec 32))) (Undefined!10334) (MissingVacant!10334 (index!43710 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95318 (_ BitVec 32)) SeekEntryResult!10334)

(assert (=> b!1393572 (= e!789083 (= (seekEntryOrOpen!0 (select (arr!46017 a!2901) j!112) a!2901 mask!2840) (Found!10334 j!112)))))

(declare-fun b!1393573 () Bool)

(declare-fun res!932983 () Bool)

(assert (=> b!1393573 (=> (not res!932983) (not e!789085))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393573 (= res!932983 (validKeyInArray!0 (select (arr!46017 a!2901) i!1037)))))

(declare-fun res!932986 () Bool)

(assert (=> start!119636 (=> (not res!932986) (not e!789085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119636 (= res!932986 (validMask!0 mask!2840))))

(assert (=> start!119636 e!789085))

(assert (=> start!119636 true))

(declare-fun array_inv!35045 (array!95318) Bool)

(assert (=> start!119636 (array_inv!35045 a!2901)))

(declare-fun b!1393574 () Bool)

(declare-fun res!932984 () Bool)

(assert (=> b!1393574 (=> (not res!932984) (not e!789085))))

(assert (=> b!1393574 (= res!932984 (and (= (size!46567 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46567 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46567 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393575 () Bool)

(declare-fun e!789084 () Bool)

(assert (=> b!1393575 (= e!789085 (not e!789084))))

(declare-fun res!932982 () Bool)

(assert (=> b!1393575 (=> res!932982 e!789084)))

(declare-fun lt!612040 () SeekEntryResult!10334)

(get-info :version)

(assert (=> b!1393575 (= res!932982 (or (not ((_ is Intermediate!10334) lt!612040)) (undefined!11146 lt!612040)))))

(assert (=> b!1393575 e!789083))

(declare-fun res!932979 () Bool)

(assert (=> b!1393575 (=> (not res!932979) (not e!789083))))

(assert (=> b!1393575 (= res!932979 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46672 0))(
  ( (Unit!46673) )
))
(declare-fun lt!612041 () Unit!46672)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95318 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46672)

(assert (=> b!1393575 (= lt!612041 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95318 (_ BitVec 32)) SeekEntryResult!10334)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393575 (= lt!612040 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46017 a!2901) j!112) mask!2840) (select (arr!46017 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393576 () Bool)

(declare-fun res!932980 () Bool)

(assert (=> b!1393576 (=> (not res!932980) (not e!789085))))

(assert (=> b!1393576 (= res!932980 (validKeyInArray!0 (select (arr!46017 a!2901) j!112)))))

(declare-fun b!1393577 () Bool)

(declare-fun res!932981 () Bool)

(assert (=> b!1393577 (=> (not res!932981) (not e!789085))))

(declare-datatypes ((List!32536 0))(
  ( (Nil!32533) (Cons!32532 (h!33765 (_ BitVec 64)) (t!47230 List!32536)) )
))
(declare-fun arrayNoDuplicates!0 (array!95318 (_ BitVec 32) List!32536) Bool)

(assert (=> b!1393577 (= res!932981 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32533))))

(declare-fun b!1393578 () Bool)

(assert (=> b!1393578 (= e!789084 true)))

(declare-fun lt!612042 () SeekEntryResult!10334)

(assert (=> b!1393578 (= lt!612042 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46017 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46017 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95319 (store (arr!46017 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46567 a!2901)) mask!2840))))

(assert (= (and start!119636 res!932986) b!1393574))

(assert (= (and b!1393574 res!932984) b!1393573))

(assert (= (and b!1393573 res!932983) b!1393576))

(assert (= (and b!1393576 res!932980) b!1393571))

(assert (= (and b!1393571 res!932985) b!1393577))

(assert (= (and b!1393577 res!932981) b!1393575))

(assert (= (and b!1393575 res!932979) b!1393572))

(assert (= (and b!1393575 (not res!932982)) b!1393578))

(declare-fun m!1279537 () Bool)

(assert (=> b!1393572 m!1279537))

(assert (=> b!1393572 m!1279537))

(declare-fun m!1279539 () Bool)

(assert (=> b!1393572 m!1279539))

(declare-fun m!1279541 () Bool)

(assert (=> start!119636 m!1279541))

(declare-fun m!1279543 () Bool)

(assert (=> start!119636 m!1279543))

(assert (=> b!1393575 m!1279537))

(declare-fun m!1279545 () Bool)

(assert (=> b!1393575 m!1279545))

(assert (=> b!1393575 m!1279537))

(declare-fun m!1279547 () Bool)

(assert (=> b!1393575 m!1279547))

(assert (=> b!1393575 m!1279545))

(assert (=> b!1393575 m!1279537))

(declare-fun m!1279549 () Bool)

(assert (=> b!1393575 m!1279549))

(declare-fun m!1279551 () Bool)

(assert (=> b!1393575 m!1279551))

(declare-fun m!1279553 () Bool)

(assert (=> b!1393571 m!1279553))

(declare-fun m!1279555 () Bool)

(assert (=> b!1393577 m!1279555))

(declare-fun m!1279557 () Bool)

(assert (=> b!1393573 m!1279557))

(assert (=> b!1393573 m!1279557))

(declare-fun m!1279559 () Bool)

(assert (=> b!1393573 m!1279559))

(assert (=> b!1393576 m!1279537))

(assert (=> b!1393576 m!1279537))

(declare-fun m!1279561 () Bool)

(assert (=> b!1393576 m!1279561))

(declare-fun m!1279563 () Bool)

(assert (=> b!1393578 m!1279563))

(declare-fun m!1279565 () Bool)

(assert (=> b!1393578 m!1279565))

(assert (=> b!1393578 m!1279565))

(declare-fun m!1279567 () Bool)

(assert (=> b!1393578 m!1279567))

(assert (=> b!1393578 m!1279567))

(assert (=> b!1393578 m!1279565))

(declare-fun m!1279569 () Bool)

(assert (=> b!1393578 m!1279569))

(check-sat (not b!1393578) (not b!1393577) (not b!1393571) (not b!1393573) (not b!1393575) (not b!1393576) (not b!1393572) (not start!119636))
