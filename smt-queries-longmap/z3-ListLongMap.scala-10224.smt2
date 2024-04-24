; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120584 () Bool)

(assert start!120584)

(declare-fun b!1402682 () Bool)

(declare-fun e!794339 () Bool)

(declare-fun e!794338 () Bool)

(assert (=> b!1402682 (= e!794339 (not e!794338))))

(declare-fun res!940519 () Bool)

(assert (=> b!1402682 (=> res!940519 e!794338)))

(declare-datatypes ((SeekEntryResult!10526 0))(
  ( (MissingZero!10526 (index!44481 (_ BitVec 32))) (Found!10526 (index!44482 (_ BitVec 32))) (Intermediate!10526 (undefined!11338 Bool) (index!44483 (_ BitVec 32)) (x!126268 (_ BitVec 32))) (Undefined!10526) (MissingVacant!10526 (index!44484 (_ BitVec 32))) )
))
(declare-fun lt!617410 () SeekEntryResult!10526)

(get-info :version)

(assert (=> b!1402682 (= res!940519 (or (not ((_ is Intermediate!10526) lt!617410)) (undefined!11338 lt!617410)))))

(declare-fun e!794340 () Bool)

(assert (=> b!1402682 e!794340))

(declare-fun res!940515 () Bool)

(assert (=> b!1402682 (=> (not res!940515) (not e!794340))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95915 0))(
  ( (array!95916 (arr!46306 (Array (_ BitVec 32) (_ BitVec 64))) (size!46857 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95915)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95915 (_ BitVec 32)) Bool)

(assert (=> b!1402682 (= res!940515 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47083 0))(
  ( (Unit!47084) )
))
(declare-fun lt!617407 () Unit!47083)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95915 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47083)

(assert (=> b!1402682 (= lt!617407 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!617406 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95915 (_ BitVec 32)) SeekEntryResult!10526)

(assert (=> b!1402682 (= lt!617410 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617406 (select (arr!46306 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402682 (= lt!617406 (toIndex!0 (select (arr!46306 a!2901) j!112) mask!2840))))

(declare-fun b!1402683 () Bool)

(declare-fun e!794337 () Bool)

(assert (=> b!1402683 (= e!794338 e!794337)))

(declare-fun res!940513 () Bool)

(assert (=> b!1402683 (=> res!940513 e!794337)))

(declare-fun lt!617408 () SeekEntryResult!10526)

(assert (=> b!1402683 (= res!940513 (or (= lt!617410 lt!617408) (not ((_ is Intermediate!10526) lt!617408))))))

(declare-fun lt!617405 () (_ BitVec 64))

(declare-fun lt!617411 () array!95915)

(assert (=> b!1402683 (= lt!617408 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617405 mask!2840) lt!617405 lt!617411 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1402683 (= lt!617405 (select (store (arr!46306 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402683 (= lt!617411 (array!95916 (store (arr!46306 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46857 a!2901)))))

(declare-fun e!794336 () Bool)

(declare-fun b!1402684 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95915 (_ BitVec 32)) SeekEntryResult!10526)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95915 (_ BitVec 32)) SeekEntryResult!10526)

(assert (=> b!1402684 (= e!794336 (= (seekEntryOrOpen!0 lt!617405 lt!617411 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126268 lt!617408) (index!44483 lt!617408) (index!44483 lt!617408) (select (arr!46306 a!2901) j!112) lt!617411 mask!2840)))))

(declare-fun b!1402685 () Bool)

(declare-fun e!794342 () Bool)

(assert (=> b!1402685 (= e!794342 true)))

(declare-fun lt!617409 () SeekEntryResult!10526)

(assert (=> b!1402685 (= lt!617409 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617406 lt!617405 lt!617411 mask!2840))))

(declare-fun b!1402686 () Bool)

(declare-fun res!940511 () Bool)

(assert (=> b!1402686 (=> (not res!940511) (not e!794339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402686 (= res!940511 (validKeyInArray!0 (select (arr!46306 a!2901) i!1037)))))

(declare-fun b!1402687 () Bool)

(declare-fun res!940514 () Bool)

(assert (=> b!1402687 (=> (not res!940514) (not e!794339))))

(declare-datatypes ((List!32812 0))(
  ( (Nil!32809) (Cons!32808 (h!34064 (_ BitVec 64)) (t!47498 List!32812)) )
))
(declare-fun arrayNoDuplicates!0 (array!95915 (_ BitVec 32) List!32812) Bool)

(assert (=> b!1402687 (= res!940514 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32809))))

(declare-fun res!940516 () Bool)

(assert (=> start!120584 (=> (not res!940516) (not e!794339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120584 (= res!940516 (validMask!0 mask!2840))))

(assert (=> start!120584 e!794339))

(assert (=> start!120584 true))

(declare-fun array_inv!35587 (array!95915) Bool)

(assert (=> start!120584 (array_inv!35587 a!2901)))

(declare-fun b!1402688 () Bool)

(assert (=> b!1402688 (= e!794340 (= (seekEntryOrOpen!0 (select (arr!46306 a!2901) j!112) a!2901 mask!2840) (Found!10526 j!112)))))

(declare-fun b!1402689 () Bool)

(declare-fun res!940517 () Bool)

(assert (=> b!1402689 (=> (not res!940517) (not e!794339))))

(assert (=> b!1402689 (= res!940517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402690 () Bool)

(assert (=> b!1402690 (= e!794337 e!794342)))

(declare-fun res!940510 () Bool)

(assert (=> b!1402690 (=> res!940510 e!794342)))

(assert (=> b!1402690 (= res!940510 (or (bvslt (x!126268 lt!617410) #b00000000000000000000000000000000) (bvsgt (x!126268 lt!617410) #b01111111111111111111111111111110) (bvslt (x!126268 lt!617408) #b00000000000000000000000000000000) (bvsgt (x!126268 lt!617408) #b01111111111111111111111111111110) (bvslt lt!617406 #b00000000000000000000000000000000) (bvsge lt!617406 (size!46857 a!2901)) (bvslt (index!44483 lt!617410) #b00000000000000000000000000000000) (bvsge (index!44483 lt!617410) (size!46857 a!2901)) (bvslt (index!44483 lt!617408) #b00000000000000000000000000000000) (bvsge (index!44483 lt!617408) (size!46857 a!2901)) (not (= lt!617410 (Intermediate!10526 false (index!44483 lt!617410) (x!126268 lt!617410)))) (not (= lt!617408 (Intermediate!10526 false (index!44483 lt!617408) (x!126268 lt!617408))))))))

(assert (=> b!1402690 e!794336))

(declare-fun res!940509 () Bool)

(assert (=> b!1402690 (=> (not res!940509) (not e!794336))))

(assert (=> b!1402690 (= res!940509 (and (not (undefined!11338 lt!617408)) (= (index!44483 lt!617408) i!1037) (bvslt (x!126268 lt!617408) (x!126268 lt!617410)) (= (select (store (arr!46306 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44483 lt!617408)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!617404 () Unit!47083)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95915 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47083)

(assert (=> b!1402690 (= lt!617404 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617406 (x!126268 lt!617410) (index!44483 lt!617410) (x!126268 lt!617408) (index!44483 lt!617408) (undefined!11338 lt!617408) mask!2840))))

(declare-fun b!1402691 () Bool)

(declare-fun res!940518 () Bool)

(assert (=> b!1402691 (=> (not res!940518) (not e!794339))))

(assert (=> b!1402691 (= res!940518 (and (= (size!46857 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46857 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46857 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402692 () Bool)

(declare-fun res!940512 () Bool)

(assert (=> b!1402692 (=> (not res!940512) (not e!794339))))

(assert (=> b!1402692 (= res!940512 (validKeyInArray!0 (select (arr!46306 a!2901) j!112)))))

(assert (= (and start!120584 res!940516) b!1402691))

(assert (= (and b!1402691 res!940518) b!1402686))

(assert (= (and b!1402686 res!940511) b!1402692))

(assert (= (and b!1402692 res!940512) b!1402689))

(assert (= (and b!1402689 res!940517) b!1402687))

(assert (= (and b!1402687 res!940514) b!1402682))

(assert (= (and b!1402682 res!940515) b!1402688))

(assert (= (and b!1402682 (not res!940519)) b!1402683))

(assert (= (and b!1402683 (not res!940513)) b!1402690))

(assert (= (and b!1402690 res!940509) b!1402684))

(assert (= (and b!1402690 (not res!940510)) b!1402685))

(declare-fun m!1290733 () Bool)

(assert (=> b!1402685 m!1290733))

(declare-fun m!1290735 () Bool)

(assert (=> b!1402683 m!1290735))

(assert (=> b!1402683 m!1290735))

(declare-fun m!1290737 () Bool)

(assert (=> b!1402683 m!1290737))

(declare-fun m!1290739 () Bool)

(assert (=> b!1402683 m!1290739))

(declare-fun m!1290741 () Bool)

(assert (=> b!1402683 m!1290741))

(declare-fun m!1290743 () Bool)

(assert (=> b!1402689 m!1290743))

(declare-fun m!1290745 () Bool)

(assert (=> b!1402692 m!1290745))

(assert (=> b!1402692 m!1290745))

(declare-fun m!1290747 () Bool)

(assert (=> b!1402692 m!1290747))

(assert (=> b!1402688 m!1290745))

(assert (=> b!1402688 m!1290745))

(declare-fun m!1290749 () Bool)

(assert (=> b!1402688 m!1290749))

(assert (=> b!1402690 m!1290739))

(declare-fun m!1290751 () Bool)

(assert (=> b!1402690 m!1290751))

(declare-fun m!1290753 () Bool)

(assert (=> b!1402690 m!1290753))

(assert (=> b!1402682 m!1290745))

(declare-fun m!1290755 () Bool)

(assert (=> b!1402682 m!1290755))

(assert (=> b!1402682 m!1290745))

(declare-fun m!1290757 () Bool)

(assert (=> b!1402682 m!1290757))

(assert (=> b!1402682 m!1290745))

(declare-fun m!1290759 () Bool)

(assert (=> b!1402682 m!1290759))

(declare-fun m!1290761 () Bool)

(assert (=> b!1402682 m!1290761))

(declare-fun m!1290763 () Bool)

(assert (=> b!1402684 m!1290763))

(assert (=> b!1402684 m!1290745))

(assert (=> b!1402684 m!1290745))

(declare-fun m!1290765 () Bool)

(assert (=> b!1402684 m!1290765))

(declare-fun m!1290767 () Bool)

(assert (=> b!1402687 m!1290767))

(declare-fun m!1290769 () Bool)

(assert (=> start!120584 m!1290769))

(declare-fun m!1290771 () Bool)

(assert (=> start!120584 m!1290771))

(declare-fun m!1290773 () Bool)

(assert (=> b!1402686 m!1290773))

(assert (=> b!1402686 m!1290773))

(declare-fun m!1290775 () Bool)

(assert (=> b!1402686 m!1290775))

(check-sat (not b!1402688) (not b!1402684) (not b!1402692) (not start!120584) (not b!1402683) (not b!1402690) (not b!1402686) (not b!1402687) (not b!1402682) (not b!1402685) (not b!1402689))
(check-sat)
