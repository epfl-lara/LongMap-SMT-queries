; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121600 () Bool)

(assert start!121600)

(declare-fun b!1412616 () Bool)

(declare-fun res!949606 () Bool)

(declare-fun e!799407 () Bool)

(assert (=> b!1412616 (=> (not res!949606) (not e!799407))))

(declare-datatypes ((array!96538 0))(
  ( (array!96539 (arr!46606 (Array (_ BitVec 32) (_ BitVec 64))) (size!47156 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96538)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412616 (= res!949606 (validKeyInArray!0 (select (arr!46606 a!2901) j!112)))))

(declare-fun b!1412617 () Bool)

(declare-fun res!949607 () Bool)

(assert (=> b!1412617 (=> (not res!949607) (not e!799407))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1412617 (= res!949607 (and (= (size!47156 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47156 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47156 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412618 () Bool)

(declare-fun e!799412 () Bool)

(declare-datatypes ((SeekEntryResult!10917 0))(
  ( (MissingZero!10917 (index!46048 (_ BitVec 32))) (Found!10917 (index!46049 (_ BitVec 32))) (Intermediate!10917 (undefined!11729 Bool) (index!46050 (_ BitVec 32)) (x!127636 (_ BitVec 32))) (Undefined!10917) (MissingVacant!10917 (index!46051 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96538 (_ BitVec 32)) SeekEntryResult!10917)

(assert (=> b!1412618 (= e!799412 (= (seekEntryOrOpen!0 (select (arr!46606 a!2901) j!112) a!2901 mask!2840) (Found!10917 j!112)))))

(declare-fun e!799408 () Bool)

(declare-fun b!1412619 () Bool)

(declare-fun lt!622464 () SeekEntryResult!10917)

(declare-fun lt!622461 () array!96538)

(declare-fun lt!622458 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96538 (_ BitVec 32)) SeekEntryResult!10917)

(assert (=> b!1412619 (= e!799408 (= (seekEntryOrOpen!0 lt!622458 lt!622461 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127636 lt!622464) (index!46050 lt!622464) (index!46050 lt!622464) (select (arr!46606 a!2901) j!112) lt!622461 mask!2840)))))

(declare-fun b!1412620 () Bool)

(declare-fun res!949614 () Bool)

(assert (=> b!1412620 (=> (not res!949614) (not e!799407))))

(declare-datatypes ((List!33125 0))(
  ( (Nil!33122) (Cons!33121 (h!34396 (_ BitVec 64)) (t!47819 List!33125)) )
))
(declare-fun arrayNoDuplicates!0 (array!96538 (_ BitVec 32) List!33125) Bool)

(assert (=> b!1412620 (= res!949614 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33122))))

(declare-fun b!1412621 () Bool)

(declare-fun e!799410 () Bool)

(assert (=> b!1412621 (= e!799410 true)))

(assert (=> b!1412621 e!799408))

(declare-fun res!949613 () Bool)

(assert (=> b!1412621 (=> (not res!949613) (not e!799408))))

(declare-fun lt!622462 () SeekEntryResult!10917)

(assert (=> b!1412621 (= res!949613 (and (not (undefined!11729 lt!622464)) (= (index!46050 lt!622464) i!1037) (bvslt (x!127636 lt!622464) (x!127636 lt!622462)) (= (select (store (arr!46606 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46050 lt!622464)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47808 0))(
  ( (Unit!47809) )
))
(declare-fun lt!622463 () Unit!47808)

(declare-fun lt!622460 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96538 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47808)

(assert (=> b!1412621 (= lt!622463 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622460 (x!127636 lt!622462) (index!46050 lt!622462) (x!127636 lt!622464) (index!46050 lt!622464) (undefined!11729 lt!622464) mask!2840))))

(declare-fun b!1412622 () Bool)

(declare-fun res!949610 () Bool)

(assert (=> b!1412622 (=> (not res!949610) (not e!799407))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96538 (_ BitVec 32)) Bool)

(assert (=> b!1412622 (= res!949610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!949609 () Bool)

(assert (=> start!121600 (=> (not res!949609) (not e!799407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121600 (= res!949609 (validMask!0 mask!2840))))

(assert (=> start!121600 e!799407))

(assert (=> start!121600 true))

(declare-fun array_inv!35634 (array!96538) Bool)

(assert (=> start!121600 (array_inv!35634 a!2901)))

(declare-fun b!1412623 () Bool)

(declare-fun e!799411 () Bool)

(assert (=> b!1412623 (= e!799411 e!799410)))

(declare-fun res!949611 () Bool)

(assert (=> b!1412623 (=> res!949611 e!799410)))

(assert (=> b!1412623 (= res!949611 (or (= lt!622462 lt!622464) (not (is-Intermediate!10917 lt!622464))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96538 (_ BitVec 32)) SeekEntryResult!10917)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412623 (= lt!622464 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622458 mask!2840) lt!622458 lt!622461 mask!2840))))

(assert (=> b!1412623 (= lt!622458 (select (store (arr!46606 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412623 (= lt!622461 (array!96539 (store (arr!46606 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47156 a!2901)))))

(declare-fun b!1412624 () Bool)

(declare-fun res!949612 () Bool)

(assert (=> b!1412624 (=> (not res!949612) (not e!799407))))

(assert (=> b!1412624 (= res!949612 (validKeyInArray!0 (select (arr!46606 a!2901) i!1037)))))

(declare-fun b!1412625 () Bool)

(assert (=> b!1412625 (= e!799407 (not e!799411))))

(declare-fun res!949608 () Bool)

(assert (=> b!1412625 (=> res!949608 e!799411)))

(assert (=> b!1412625 (= res!949608 (or (not (is-Intermediate!10917 lt!622462)) (undefined!11729 lt!622462)))))

(assert (=> b!1412625 e!799412))

(declare-fun res!949615 () Bool)

(assert (=> b!1412625 (=> (not res!949615) (not e!799412))))

(assert (=> b!1412625 (= res!949615 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622459 () Unit!47808)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96538 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47808)

(assert (=> b!1412625 (= lt!622459 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1412625 (= lt!622462 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622460 (select (arr!46606 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1412625 (= lt!622460 (toIndex!0 (select (arr!46606 a!2901) j!112) mask!2840))))

(assert (= (and start!121600 res!949609) b!1412617))

(assert (= (and b!1412617 res!949607) b!1412624))

(assert (= (and b!1412624 res!949612) b!1412616))

(assert (= (and b!1412616 res!949606) b!1412622))

(assert (= (and b!1412622 res!949610) b!1412620))

(assert (= (and b!1412620 res!949614) b!1412625))

(assert (= (and b!1412625 res!949615) b!1412618))

(assert (= (and b!1412625 (not res!949608)) b!1412623))

(assert (= (and b!1412623 (not res!949611)) b!1412621))

(assert (= (and b!1412621 res!949613) b!1412619))

(declare-fun m!1302711 () Bool)

(assert (=> b!1412619 m!1302711))

(declare-fun m!1302713 () Bool)

(assert (=> b!1412619 m!1302713))

(assert (=> b!1412619 m!1302713))

(declare-fun m!1302715 () Bool)

(assert (=> b!1412619 m!1302715))

(assert (=> b!1412616 m!1302713))

(assert (=> b!1412616 m!1302713))

(declare-fun m!1302717 () Bool)

(assert (=> b!1412616 m!1302717))

(declare-fun m!1302719 () Bool)

(assert (=> b!1412624 m!1302719))

(assert (=> b!1412624 m!1302719))

(declare-fun m!1302721 () Bool)

(assert (=> b!1412624 m!1302721))

(declare-fun m!1302723 () Bool)

(assert (=> b!1412620 m!1302723))

(declare-fun m!1302725 () Bool)

(assert (=> b!1412622 m!1302725))

(assert (=> b!1412618 m!1302713))

(assert (=> b!1412618 m!1302713))

(declare-fun m!1302727 () Bool)

(assert (=> b!1412618 m!1302727))

(declare-fun m!1302729 () Bool)

(assert (=> start!121600 m!1302729))

(declare-fun m!1302731 () Bool)

(assert (=> start!121600 m!1302731))

(declare-fun m!1302733 () Bool)

(assert (=> b!1412623 m!1302733))

(assert (=> b!1412623 m!1302733))

(declare-fun m!1302735 () Bool)

(assert (=> b!1412623 m!1302735))

(declare-fun m!1302737 () Bool)

(assert (=> b!1412623 m!1302737))

(declare-fun m!1302739 () Bool)

(assert (=> b!1412623 m!1302739))

(assert (=> b!1412625 m!1302713))

(declare-fun m!1302741 () Bool)

(assert (=> b!1412625 m!1302741))

(assert (=> b!1412625 m!1302713))

(declare-fun m!1302743 () Bool)

(assert (=> b!1412625 m!1302743))

(assert (=> b!1412625 m!1302713))

(declare-fun m!1302745 () Bool)

(assert (=> b!1412625 m!1302745))

(declare-fun m!1302747 () Bool)

(assert (=> b!1412625 m!1302747))

(assert (=> b!1412621 m!1302737))

(declare-fun m!1302749 () Bool)

(assert (=> b!1412621 m!1302749))

(declare-fun m!1302751 () Bool)

(assert (=> b!1412621 m!1302751))

(push 1)

