; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121664 () Bool)

(assert start!121664)

(declare-fun b!1412611 () Bool)

(declare-fun e!799483 () Bool)

(declare-fun e!799482 () Bool)

(assert (=> b!1412611 (= e!799483 e!799482)))

(declare-fun res!949161 () Bool)

(assert (=> b!1412611 (=> res!949161 e!799482)))

(declare-datatypes ((SeekEntryResult!10844 0))(
  ( (MissingZero!10844 (index!45753 (_ BitVec 32))) (Found!10844 (index!45754 (_ BitVec 32))) (Intermediate!10844 (undefined!11656 Bool) (index!45755 (_ BitVec 32)) (x!127498 (_ BitVec 32))) (Undefined!10844) (MissingVacant!10844 (index!45756 (_ BitVec 32))) )
))
(declare-fun lt!622136 () SeekEntryResult!10844)

(declare-fun lt!622139 () SeekEntryResult!10844)

(get-info :version)

(assert (=> b!1412611 (= res!949161 (or (= lt!622136 lt!622139) (not ((_ is Intermediate!10844) lt!622139))))))

(declare-fun lt!622137 () (_ BitVec 64))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96587 0))(
  ( (array!96588 (arr!46630 (Array (_ BitVec 32) (_ BitVec 64))) (size!47181 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96587)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96587 (_ BitVec 32)) SeekEntryResult!10844)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412611 (= lt!622139 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622137 mask!2840) lt!622137 (array!96588 (store (arr!46630 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47181 a!2901)) mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1412611 (= lt!622137 (select (store (arr!46630 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun res!949156 () Bool)

(declare-fun e!799484 () Bool)

(assert (=> start!121664 (=> (not res!949156) (not e!799484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121664 (= res!949156 (validMask!0 mask!2840))))

(assert (=> start!121664 e!799484))

(assert (=> start!121664 true))

(declare-fun array_inv!35911 (array!96587) Bool)

(assert (=> start!121664 (array_inv!35911 a!2901)))

(declare-fun b!1412612 () Bool)

(declare-fun res!949159 () Bool)

(assert (=> b!1412612 (=> (not res!949159) (not e!799484))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412612 (= res!949159 (validKeyInArray!0 (select (arr!46630 a!2901) i!1037)))))

(declare-fun e!799480 () Bool)

(declare-fun b!1412613 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96587 (_ BitVec 32)) SeekEntryResult!10844)

(assert (=> b!1412613 (= e!799480 (= (seekEntryOrOpen!0 (select (arr!46630 a!2901) j!112) a!2901 mask!2840) (Found!10844 j!112)))))

(declare-fun b!1412614 () Bool)

(declare-fun res!949157 () Bool)

(assert (=> b!1412614 (=> (not res!949157) (not e!799484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96587 (_ BitVec 32)) Bool)

(assert (=> b!1412614 (= res!949157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412615 () Bool)

(declare-fun res!949158 () Bool)

(assert (=> b!1412615 (=> (not res!949158) (not e!799484))))

(assert (=> b!1412615 (= res!949158 (and (= (size!47181 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47181 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47181 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412616 () Bool)

(assert (=> b!1412616 (= e!799482 true)))

(assert (=> b!1412616 (and (not (undefined!11656 lt!622139)) (= (index!45755 lt!622139) i!1037) (bvslt (x!127498 lt!622139) (x!127498 lt!622136)) (= (select (store (arr!46630 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45755 lt!622139)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47689 0))(
  ( (Unit!47690) )
))
(declare-fun lt!622135 () Unit!47689)

(declare-fun lt!622138 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96587 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47689)

(assert (=> b!1412616 (= lt!622135 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622138 (x!127498 lt!622136) (index!45755 lt!622136) (x!127498 lt!622139) (index!45755 lt!622139) (undefined!11656 lt!622139) mask!2840))))

(declare-fun b!1412617 () Bool)

(declare-fun res!949162 () Bool)

(assert (=> b!1412617 (=> (not res!949162) (not e!799484))))

(declare-datatypes ((List!33136 0))(
  ( (Nil!33133) (Cons!33132 (h!34412 (_ BitVec 64)) (t!47822 List!33136)) )
))
(declare-fun arrayNoDuplicates!0 (array!96587 (_ BitVec 32) List!33136) Bool)

(assert (=> b!1412617 (= res!949162 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33133))))

(declare-fun b!1412618 () Bool)

(declare-fun res!949155 () Bool)

(assert (=> b!1412618 (=> (not res!949155) (not e!799484))))

(assert (=> b!1412618 (= res!949155 (validKeyInArray!0 (select (arr!46630 a!2901) j!112)))))

(declare-fun b!1412619 () Bool)

(assert (=> b!1412619 (= e!799484 (not e!799483))))

(declare-fun res!949154 () Bool)

(assert (=> b!1412619 (=> res!949154 e!799483)))

(assert (=> b!1412619 (= res!949154 (or (not ((_ is Intermediate!10844) lt!622136)) (undefined!11656 lt!622136)))))

(assert (=> b!1412619 e!799480))

(declare-fun res!949160 () Bool)

(assert (=> b!1412619 (=> (not res!949160) (not e!799480))))

(assert (=> b!1412619 (= res!949160 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622134 () Unit!47689)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96587 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47689)

(assert (=> b!1412619 (= lt!622134 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1412619 (= lt!622136 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622138 (select (arr!46630 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1412619 (= lt!622138 (toIndex!0 (select (arr!46630 a!2901) j!112) mask!2840))))

(assert (= (and start!121664 res!949156) b!1412615))

(assert (= (and b!1412615 res!949158) b!1412612))

(assert (= (and b!1412612 res!949159) b!1412618))

(assert (= (and b!1412618 res!949155) b!1412614))

(assert (= (and b!1412614 res!949157) b!1412617))

(assert (= (and b!1412617 res!949162) b!1412619))

(assert (= (and b!1412619 res!949160) b!1412613))

(assert (= (and b!1412619 (not res!949154)) b!1412611))

(assert (= (and b!1412611 (not res!949161)) b!1412616))

(declare-fun m!1302703 () Bool)

(assert (=> b!1412618 m!1302703))

(assert (=> b!1412618 m!1302703))

(declare-fun m!1302705 () Bool)

(assert (=> b!1412618 m!1302705))

(declare-fun m!1302707 () Bool)

(assert (=> b!1412612 m!1302707))

(assert (=> b!1412612 m!1302707))

(declare-fun m!1302709 () Bool)

(assert (=> b!1412612 m!1302709))

(declare-fun m!1302711 () Bool)

(assert (=> b!1412611 m!1302711))

(declare-fun m!1302713 () Bool)

(assert (=> b!1412611 m!1302713))

(assert (=> b!1412611 m!1302711))

(declare-fun m!1302715 () Bool)

(assert (=> b!1412611 m!1302715))

(declare-fun m!1302717 () Bool)

(assert (=> b!1412611 m!1302717))

(assert (=> b!1412613 m!1302703))

(assert (=> b!1412613 m!1302703))

(declare-fun m!1302719 () Bool)

(assert (=> b!1412613 m!1302719))

(declare-fun m!1302721 () Bool)

(assert (=> b!1412617 m!1302721))

(declare-fun m!1302723 () Bool)

(assert (=> b!1412614 m!1302723))

(assert (=> b!1412619 m!1302703))

(declare-fun m!1302725 () Bool)

(assert (=> b!1412619 m!1302725))

(assert (=> b!1412619 m!1302703))

(declare-fun m!1302727 () Bool)

(assert (=> b!1412619 m!1302727))

(assert (=> b!1412619 m!1302703))

(declare-fun m!1302729 () Bool)

(assert (=> b!1412619 m!1302729))

(declare-fun m!1302731 () Bool)

(assert (=> b!1412619 m!1302731))

(declare-fun m!1302733 () Bool)

(assert (=> start!121664 m!1302733))

(declare-fun m!1302735 () Bool)

(assert (=> start!121664 m!1302735))

(assert (=> b!1412616 m!1302713))

(declare-fun m!1302737 () Bool)

(assert (=> b!1412616 m!1302737))

(declare-fun m!1302739 () Bool)

(assert (=> b!1412616 m!1302739))

(check-sat (not b!1412616) (not b!1412612) (not b!1412611) (not start!121664) (not b!1412614) (not b!1412613) (not b!1412617) (not b!1412619) (not b!1412618))
(check-sat)
