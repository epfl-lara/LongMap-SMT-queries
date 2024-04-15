; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119726 () Bool)

(assert start!119726)

(declare-fun b!1394685 () Bool)

(declare-fun res!934150 () Bool)

(declare-fun e!789613 () Bool)

(assert (=> b!1394685 (=> (not res!934150) (not e!789613))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95361 0))(
  ( (array!95362 (arr!46039 (Array (_ BitVec 32) (_ BitVec 64))) (size!46591 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95361)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394685 (= res!934150 (and (= (size!46591 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46591 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46591 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394686 () Bool)

(declare-fun e!789612 () Bool)

(declare-fun e!789610 () Bool)

(assert (=> b!1394686 (= e!789612 e!789610)))

(declare-fun res!934145 () Bool)

(assert (=> b!1394686 (=> res!934145 e!789610)))

(assert (=> b!1394686 (= res!934145 (bvslt mask!2840 #b00000000000000000000000000000000))))

(declare-fun lt!612539 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10382 0))(
  ( (MissingZero!10382 (index!43899 (_ BitVec 32))) (Found!10382 (index!43900 (_ BitVec 32))) (Intermediate!10382 (undefined!11194 Bool) (index!43901 (_ BitVec 32)) (x!125559 (_ BitVec 32))) (Undefined!10382) (MissingVacant!10382 (index!43902 (_ BitVec 32))) )
))
(declare-fun lt!612533 () SeekEntryResult!10382)

(declare-fun lt!612536 () array!95361)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95361 (_ BitVec 32)) SeekEntryResult!10382)

(assert (=> b!1394686 (= lt!612533 (seekEntryOrOpen!0 lt!612539 lt!612536 mask!2840))))

(declare-fun lt!612534 () (_ BitVec 32))

(declare-fun lt!612537 () SeekEntryResult!10382)

(declare-datatypes ((Unit!46611 0))(
  ( (Unit!46612) )
))
(declare-fun lt!612535 () Unit!46611)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95361 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46611)

(assert (=> b!1394686 (= lt!612535 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612534 (x!125559 lt!612537) (index!43901 lt!612537) mask!2840))))

(declare-fun b!1394687 () Bool)

(declare-fun e!789614 () Bool)

(assert (=> b!1394687 (= e!789613 (not e!789614))))

(declare-fun res!934144 () Bool)

(assert (=> b!1394687 (=> res!934144 e!789614)))

(get-info :version)

(assert (=> b!1394687 (= res!934144 (or (not ((_ is Intermediate!10382) lt!612537)) (undefined!11194 lt!612537)))))

(assert (=> b!1394687 (= lt!612533 (Found!10382 j!112))))

(assert (=> b!1394687 (= lt!612533 (seekEntryOrOpen!0 (select (arr!46039 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95361 (_ BitVec 32)) Bool)

(assert (=> b!1394687 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612538 () Unit!46611)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95361 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46611)

(assert (=> b!1394687 (= lt!612538 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95361 (_ BitVec 32)) SeekEntryResult!10382)

(assert (=> b!1394687 (= lt!612537 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612534 (select (arr!46039 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394687 (= lt!612534 (toIndex!0 (select (arr!46039 a!2901) j!112) mask!2840))))

(declare-fun res!934152 () Bool)

(assert (=> start!119726 (=> (not res!934152) (not e!789613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119726 (= res!934152 (validMask!0 mask!2840))))

(assert (=> start!119726 e!789613))

(assert (=> start!119726 true))

(declare-fun array_inv!35272 (array!95361) Bool)

(assert (=> start!119726 (array_inv!35272 a!2901)))

(declare-fun b!1394688 () Bool)

(declare-fun res!934148 () Bool)

(assert (=> b!1394688 (=> (not res!934148) (not e!789613))))

(declare-datatypes ((List!32636 0))(
  ( (Nil!32633) (Cons!32632 (h!33865 (_ BitVec 64)) (t!47322 List!32636)) )
))
(declare-fun arrayNoDuplicates!0 (array!95361 (_ BitVec 32) List!32636) Bool)

(assert (=> b!1394688 (= res!934148 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32633))))

(declare-fun b!1394689 () Bool)

(declare-fun res!934151 () Bool)

(assert (=> b!1394689 (=> (not res!934151) (not e!789613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394689 (= res!934151 (validKeyInArray!0 (select (arr!46039 a!2901) i!1037)))))

(declare-fun b!1394690 () Bool)

(declare-fun res!934147 () Bool)

(assert (=> b!1394690 (=> (not res!934147) (not e!789613))))

(assert (=> b!1394690 (= res!934147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394691 () Bool)

(assert (=> b!1394691 (= e!789610 (validKeyInArray!0 lt!612539))))

(declare-fun b!1394692 () Bool)

(declare-fun res!934153 () Bool)

(assert (=> b!1394692 (=> res!934153 e!789612)))

(assert (=> b!1394692 (= res!934153 (or (bvslt (x!125559 lt!612537) #b00000000000000000000000000000000) (bvsgt (x!125559 lt!612537) #b01111111111111111111111111111110) (bvslt lt!612534 #b00000000000000000000000000000000) (bvsge lt!612534 (size!46591 a!2901)) (bvslt (index!43901 lt!612537) #b00000000000000000000000000000000) (bvsge (index!43901 lt!612537) (size!46591 a!2901)) (not (= lt!612537 (Intermediate!10382 false (index!43901 lt!612537) (x!125559 lt!612537))))))))

(declare-fun b!1394693 () Bool)

(assert (=> b!1394693 (= e!789614 e!789612)))

(declare-fun res!934146 () Bool)

(assert (=> b!1394693 (=> res!934146 e!789612)))

(assert (=> b!1394693 (= res!934146 (not (= lt!612537 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612539 mask!2840) lt!612539 lt!612536 mask!2840))))))

(assert (=> b!1394693 (= lt!612539 (select (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394693 (= lt!612536 (array!95362 (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46591 a!2901)))))

(declare-fun b!1394694 () Bool)

(declare-fun res!934149 () Bool)

(assert (=> b!1394694 (=> (not res!934149) (not e!789613))))

(assert (=> b!1394694 (= res!934149 (validKeyInArray!0 (select (arr!46039 a!2901) j!112)))))

(assert (= (and start!119726 res!934152) b!1394685))

(assert (= (and b!1394685 res!934150) b!1394689))

(assert (= (and b!1394689 res!934151) b!1394694))

(assert (= (and b!1394694 res!934149) b!1394690))

(assert (= (and b!1394690 res!934147) b!1394688))

(assert (= (and b!1394688 res!934148) b!1394687))

(assert (= (and b!1394687 (not res!934144)) b!1394693))

(assert (= (and b!1394693 (not res!934146)) b!1394692))

(assert (= (and b!1394692 (not res!934153)) b!1394686))

(assert (= (and b!1394686 (not res!934145)) b!1394691))

(declare-fun m!1280683 () Bool)

(assert (=> b!1394688 m!1280683))

(declare-fun m!1280685 () Bool)

(assert (=> b!1394689 m!1280685))

(assert (=> b!1394689 m!1280685))

(declare-fun m!1280687 () Bool)

(assert (=> b!1394689 m!1280687))

(declare-fun m!1280689 () Bool)

(assert (=> b!1394686 m!1280689))

(declare-fun m!1280691 () Bool)

(assert (=> b!1394686 m!1280691))

(declare-fun m!1280693 () Bool)

(assert (=> start!119726 m!1280693))

(declare-fun m!1280695 () Bool)

(assert (=> start!119726 m!1280695))

(declare-fun m!1280697 () Bool)

(assert (=> b!1394694 m!1280697))

(assert (=> b!1394694 m!1280697))

(declare-fun m!1280699 () Bool)

(assert (=> b!1394694 m!1280699))

(declare-fun m!1280701 () Bool)

(assert (=> b!1394691 m!1280701))

(declare-fun m!1280703 () Bool)

(assert (=> b!1394690 m!1280703))

(assert (=> b!1394687 m!1280697))

(declare-fun m!1280705 () Bool)

(assert (=> b!1394687 m!1280705))

(assert (=> b!1394687 m!1280697))

(assert (=> b!1394687 m!1280697))

(declare-fun m!1280707 () Bool)

(assert (=> b!1394687 m!1280707))

(declare-fun m!1280709 () Bool)

(assert (=> b!1394687 m!1280709))

(assert (=> b!1394687 m!1280697))

(declare-fun m!1280711 () Bool)

(assert (=> b!1394687 m!1280711))

(declare-fun m!1280713 () Bool)

(assert (=> b!1394687 m!1280713))

(declare-fun m!1280715 () Bool)

(assert (=> b!1394693 m!1280715))

(assert (=> b!1394693 m!1280715))

(declare-fun m!1280717 () Bool)

(assert (=> b!1394693 m!1280717))

(declare-fun m!1280719 () Bool)

(assert (=> b!1394693 m!1280719))

(declare-fun m!1280721 () Bool)

(assert (=> b!1394693 m!1280721))

(check-sat (not b!1394688) (not b!1394686) (not b!1394691) (not b!1394687) (not start!119726) (not b!1394689) (not b!1394690) (not b!1394694) (not b!1394693))
(check-sat)
