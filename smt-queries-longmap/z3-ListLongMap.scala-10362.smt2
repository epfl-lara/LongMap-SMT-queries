; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121982 () Bool)

(assert start!121982)

(declare-fun b!1415684 () Bool)

(declare-fun e!801262 () Bool)

(declare-fun e!801259 () Bool)

(assert (=> b!1415684 (= e!801262 e!801259)))

(declare-fun res!951786 () Bool)

(assert (=> b!1415684 (=> res!951786 e!801259)))

(declare-datatypes ((SeekEntryResult!10979 0))(
  ( (MissingZero!10979 (index!46308 (_ BitVec 32))) (Found!10979 (index!46309 (_ BitVec 32))) (Intermediate!10979 (undefined!11791 Bool) (index!46310 (_ BitVec 32)) (x!127911 (_ BitVec 32))) (Undefined!10979) (MissingVacant!10979 (index!46311 (_ BitVec 32))) )
))
(declare-fun lt!624180 () SeekEntryResult!10979)

(declare-fun lt!624175 () SeekEntryResult!10979)

(get-info :version)

(assert (=> b!1415684 (= res!951786 (or (= lt!624180 lt!624175) (not ((_ is Intermediate!10979) lt!624175))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!624177 () (_ BitVec 64))

(declare-datatypes ((array!96621 0))(
  ( (array!96622 (arr!46642 (Array (_ BitVec 32) (_ BitVec 64))) (size!47194 (_ BitVec 32))) )
))
(declare-fun lt!624182 () array!96621)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96621 (_ BitVec 32)) SeekEntryResult!10979)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415684 (= lt!624175 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624177 mask!2840) lt!624177 lt!624182 mask!2840))))

(declare-fun a!2901 () array!96621)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1415684 (= lt!624177 (select (store (arr!46642 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415684 (= lt!624182 (array!96622 (store (arr!46642 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47194 a!2901)))))

(declare-fun b!1415685 () Bool)

(declare-fun e!801260 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96621 (_ BitVec 32)) SeekEntryResult!10979)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96621 (_ BitVec 32)) SeekEntryResult!10979)

(assert (=> b!1415685 (= e!801260 (= (seekEntryOrOpen!0 lt!624177 lt!624182 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127911 lt!624175) (index!46310 lt!624175) (index!46310 lt!624175) (select (arr!46642 a!2901) j!112) lt!624182 mask!2840)))))

(declare-fun b!1415686 () Bool)

(declare-fun res!951778 () Bool)

(declare-fun e!801263 () Bool)

(assert (=> b!1415686 (=> (not res!951778) (not e!801263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96621 (_ BitVec 32)) Bool)

(assert (=> b!1415686 (= res!951778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415687 () Bool)

(declare-fun res!951783 () Bool)

(assert (=> b!1415687 (=> (not res!951783) (not e!801263))))

(declare-datatypes ((List!33239 0))(
  ( (Nil!33236) (Cons!33235 (h!34522 (_ BitVec 64)) (t!47925 List!33239)) )
))
(declare-fun arrayNoDuplicates!0 (array!96621 (_ BitVec 32) List!33239) Bool)

(assert (=> b!1415687 (= res!951783 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33236))))

(declare-fun b!1415688 () Bool)

(declare-fun e!801258 () Bool)

(assert (=> b!1415688 (= e!801258 true)))

(declare-fun lt!624176 () (_ BitVec 32))

(declare-fun lt!624179 () SeekEntryResult!10979)

(assert (=> b!1415688 (= lt!624179 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624176 lt!624177 lt!624182 mask!2840))))

(declare-fun b!1415689 () Bool)

(declare-fun res!951780 () Bool)

(assert (=> b!1415689 (=> (not res!951780) (not e!801263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415689 (= res!951780 (validKeyInArray!0 (select (arr!46642 a!2901) j!112)))))

(declare-fun res!951777 () Bool)

(assert (=> start!121982 (=> (not res!951777) (not e!801263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121982 (= res!951777 (validMask!0 mask!2840))))

(assert (=> start!121982 e!801263))

(assert (=> start!121982 true))

(declare-fun array_inv!35875 (array!96621) Bool)

(assert (=> start!121982 (array_inv!35875 a!2901)))

(declare-fun b!1415690 () Bool)

(declare-fun e!801257 () Bool)

(assert (=> b!1415690 (= e!801257 (= (seekEntryOrOpen!0 (select (arr!46642 a!2901) j!112) a!2901 mask!2840) (Found!10979 j!112)))))

(declare-fun b!1415691 () Bool)

(assert (=> b!1415691 (= e!801259 e!801258)))

(declare-fun res!951784 () Bool)

(assert (=> b!1415691 (=> res!951784 e!801258)))

(assert (=> b!1415691 (= res!951784 (or (bvslt (x!127911 lt!624180) #b00000000000000000000000000000000) (bvsgt (x!127911 lt!624180) #b01111111111111111111111111111110) (bvslt (x!127911 lt!624175) #b00000000000000000000000000000000) (bvsgt (x!127911 lt!624175) #b01111111111111111111111111111110) (bvslt lt!624176 #b00000000000000000000000000000000) (bvsge lt!624176 (size!47194 a!2901)) (bvslt (index!46310 lt!624180) #b00000000000000000000000000000000) (bvsge (index!46310 lt!624180) (size!47194 a!2901)) (bvslt (index!46310 lt!624175) #b00000000000000000000000000000000) (bvsge (index!46310 lt!624175) (size!47194 a!2901)) (not (= lt!624180 (Intermediate!10979 false (index!46310 lt!624180) (x!127911 lt!624180)))) (not (= lt!624175 (Intermediate!10979 false (index!46310 lt!624175) (x!127911 lt!624175))))))))

(assert (=> b!1415691 e!801260))

(declare-fun res!951782 () Bool)

(assert (=> b!1415691 (=> (not res!951782) (not e!801260))))

(assert (=> b!1415691 (= res!951782 (and (not (undefined!11791 lt!624175)) (= (index!46310 lt!624175) i!1037) (bvslt (x!127911 lt!624175) (x!127911 lt!624180)) (= (select (store (arr!46642 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46310 lt!624175)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47775 0))(
  ( (Unit!47776) )
))
(declare-fun lt!624181 () Unit!47775)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96621 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47775)

(assert (=> b!1415691 (= lt!624181 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624176 (x!127911 lt!624180) (index!46310 lt!624180) (x!127911 lt!624175) (index!46310 lt!624175) (undefined!11791 lt!624175) mask!2840))))

(declare-fun b!1415692 () Bool)

(declare-fun res!951779 () Bool)

(assert (=> b!1415692 (=> (not res!951779) (not e!801263))))

(assert (=> b!1415692 (= res!951779 (validKeyInArray!0 (select (arr!46642 a!2901) i!1037)))))

(declare-fun b!1415693 () Bool)

(declare-fun res!951787 () Bool)

(assert (=> b!1415693 (=> (not res!951787) (not e!801263))))

(assert (=> b!1415693 (= res!951787 (and (= (size!47194 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47194 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47194 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415694 () Bool)

(assert (=> b!1415694 (= e!801263 (not e!801262))))

(declare-fun res!951781 () Bool)

(assert (=> b!1415694 (=> res!951781 e!801262)))

(assert (=> b!1415694 (= res!951781 (or (not ((_ is Intermediate!10979) lt!624180)) (undefined!11791 lt!624180)))))

(assert (=> b!1415694 e!801257))

(declare-fun res!951785 () Bool)

(assert (=> b!1415694 (=> (not res!951785) (not e!801257))))

(assert (=> b!1415694 (= res!951785 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!624178 () Unit!47775)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96621 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47775)

(assert (=> b!1415694 (= lt!624178 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1415694 (= lt!624180 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624176 (select (arr!46642 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1415694 (= lt!624176 (toIndex!0 (select (arr!46642 a!2901) j!112) mask!2840))))

(assert (= (and start!121982 res!951777) b!1415693))

(assert (= (and b!1415693 res!951787) b!1415692))

(assert (= (and b!1415692 res!951779) b!1415689))

(assert (= (and b!1415689 res!951780) b!1415686))

(assert (= (and b!1415686 res!951778) b!1415687))

(assert (= (and b!1415687 res!951783) b!1415694))

(assert (= (and b!1415694 res!951785) b!1415690))

(assert (= (and b!1415694 (not res!951781)) b!1415684))

(assert (= (and b!1415684 (not res!951786)) b!1415691))

(assert (= (and b!1415691 res!951782) b!1415685))

(assert (= (and b!1415691 (not res!951784)) b!1415688))

(declare-fun m!1305631 () Bool)

(assert (=> b!1415691 m!1305631))

(declare-fun m!1305633 () Bool)

(assert (=> b!1415691 m!1305633))

(declare-fun m!1305635 () Bool)

(assert (=> b!1415691 m!1305635))

(declare-fun m!1305637 () Bool)

(assert (=> b!1415689 m!1305637))

(assert (=> b!1415689 m!1305637))

(declare-fun m!1305639 () Bool)

(assert (=> b!1415689 m!1305639))

(declare-fun m!1305641 () Bool)

(assert (=> start!121982 m!1305641))

(declare-fun m!1305643 () Bool)

(assert (=> start!121982 m!1305643))

(assert (=> b!1415694 m!1305637))

(declare-fun m!1305645 () Bool)

(assert (=> b!1415694 m!1305645))

(assert (=> b!1415694 m!1305637))

(declare-fun m!1305647 () Bool)

(assert (=> b!1415694 m!1305647))

(declare-fun m!1305649 () Bool)

(assert (=> b!1415694 m!1305649))

(assert (=> b!1415694 m!1305637))

(declare-fun m!1305651 () Bool)

(assert (=> b!1415694 m!1305651))

(declare-fun m!1305653 () Bool)

(assert (=> b!1415685 m!1305653))

(assert (=> b!1415685 m!1305637))

(assert (=> b!1415685 m!1305637))

(declare-fun m!1305655 () Bool)

(assert (=> b!1415685 m!1305655))

(declare-fun m!1305657 () Bool)

(assert (=> b!1415684 m!1305657))

(assert (=> b!1415684 m!1305657))

(declare-fun m!1305659 () Bool)

(assert (=> b!1415684 m!1305659))

(assert (=> b!1415684 m!1305631))

(declare-fun m!1305661 () Bool)

(assert (=> b!1415684 m!1305661))

(assert (=> b!1415690 m!1305637))

(assert (=> b!1415690 m!1305637))

(declare-fun m!1305663 () Bool)

(assert (=> b!1415690 m!1305663))

(declare-fun m!1305665 () Bool)

(assert (=> b!1415692 m!1305665))

(assert (=> b!1415692 m!1305665))

(declare-fun m!1305667 () Bool)

(assert (=> b!1415692 m!1305667))

(declare-fun m!1305669 () Bool)

(assert (=> b!1415688 m!1305669))

(declare-fun m!1305671 () Bool)

(assert (=> b!1415687 m!1305671))

(declare-fun m!1305673 () Bool)

(assert (=> b!1415686 m!1305673))

(check-sat (not b!1415685) (not b!1415687) (not b!1415692) (not b!1415690) (not b!1415684) (not start!121982) (not b!1415686) (not b!1415688) (not b!1415694) (not b!1415689) (not b!1415691))
(check-sat)
