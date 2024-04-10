; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119640 () Bool)

(assert start!119640)

(declare-fun b!1393619 () Bool)

(declare-fun e!789110 () Bool)

(declare-fun e!789109 () Bool)

(assert (=> b!1393619 (= e!789110 (not e!789109))))

(declare-fun res!933027 () Bool)

(assert (=> b!1393619 (=> res!933027 e!789109)))

(declare-datatypes ((SeekEntryResult!10336 0))(
  ( (MissingZero!10336 (index!43715 (_ BitVec 32))) (Found!10336 (index!43716 (_ BitVec 32))) (Intermediate!10336 (undefined!11148 Bool) (index!43717 (_ BitVec 32)) (x!125396 (_ BitVec 32))) (Undefined!10336) (MissingVacant!10336 (index!43718 (_ BitVec 32))) )
))
(declare-fun lt!612059 () SeekEntryResult!10336)

(assert (=> b!1393619 (= res!933027 (or (not (is-Intermediate!10336 lt!612059)) (undefined!11148 lt!612059)))))

(declare-fun e!789107 () Bool)

(assert (=> b!1393619 e!789107))

(declare-fun res!933034 () Bool)

(assert (=> b!1393619 (=> (not res!933034) (not e!789107))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95322 0))(
  ( (array!95323 (arr!46019 (Array (_ BitVec 32) (_ BitVec 64))) (size!46569 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95322)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95322 (_ BitVec 32)) Bool)

(assert (=> b!1393619 (= res!933034 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46676 0))(
  ( (Unit!46677) )
))
(declare-fun lt!612060 () Unit!46676)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95322 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46676)

(assert (=> b!1393619 (= lt!612060 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95322 (_ BitVec 32)) SeekEntryResult!10336)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393619 (= lt!612059 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46019 a!2901) j!112) mask!2840) (select (arr!46019 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393620 () Bool)

(declare-fun res!933033 () Bool)

(assert (=> b!1393620 (=> (not res!933033) (not e!789110))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393620 (= res!933033 (validKeyInArray!0 (select (arr!46019 a!2901) i!1037)))))

(declare-fun res!933032 () Bool)

(assert (=> start!119640 (=> (not res!933032) (not e!789110))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119640 (= res!933032 (validMask!0 mask!2840))))

(assert (=> start!119640 e!789110))

(assert (=> start!119640 true))

(declare-fun array_inv!35047 (array!95322) Bool)

(assert (=> start!119640 (array_inv!35047 a!2901)))

(declare-fun b!1393621 () Bool)

(declare-fun res!933031 () Bool)

(assert (=> b!1393621 (=> (not res!933031) (not e!789110))))

(assert (=> b!1393621 (= res!933031 (validKeyInArray!0 (select (arr!46019 a!2901) j!112)))))

(declare-fun b!1393622 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95322 (_ BitVec 32)) SeekEntryResult!10336)

(assert (=> b!1393622 (= e!789107 (= (seekEntryOrOpen!0 (select (arr!46019 a!2901) j!112) a!2901 mask!2840) (Found!10336 j!112)))))

(declare-fun b!1393623 () Bool)

(declare-fun res!933028 () Bool)

(assert (=> b!1393623 (=> (not res!933028) (not e!789110))))

(assert (=> b!1393623 (= res!933028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393624 () Bool)

(declare-fun res!933029 () Bool)

(assert (=> b!1393624 (=> (not res!933029) (not e!789110))))

(assert (=> b!1393624 (= res!933029 (and (= (size!46569 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46569 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46569 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393625 () Bool)

(assert (=> b!1393625 (= e!789109 true)))

(declare-fun lt!612058 () SeekEntryResult!10336)

(assert (=> b!1393625 (= lt!612058 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46019 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46019 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95323 (store (arr!46019 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46569 a!2901)) mask!2840))))

(declare-fun b!1393626 () Bool)

(declare-fun res!933030 () Bool)

(assert (=> b!1393626 (=> (not res!933030) (not e!789110))))

(declare-datatypes ((List!32538 0))(
  ( (Nil!32535) (Cons!32534 (h!33767 (_ BitVec 64)) (t!47232 List!32538)) )
))
(declare-fun arrayNoDuplicates!0 (array!95322 (_ BitVec 32) List!32538) Bool)

(assert (=> b!1393626 (= res!933030 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32535))))

(assert (= (and start!119640 res!933032) b!1393624))

(assert (= (and b!1393624 res!933029) b!1393620))

(assert (= (and b!1393620 res!933033) b!1393621))

(assert (= (and b!1393621 res!933031) b!1393623))

(assert (= (and b!1393623 res!933028) b!1393626))

(assert (= (and b!1393626 res!933030) b!1393619))

(assert (= (and b!1393619 res!933034) b!1393622))

(assert (= (and b!1393619 (not res!933027)) b!1393625))

(declare-fun m!1279605 () Bool)

(assert (=> b!1393626 m!1279605))

(declare-fun m!1279607 () Bool)

(assert (=> b!1393622 m!1279607))

(assert (=> b!1393622 m!1279607))

(declare-fun m!1279609 () Bool)

(assert (=> b!1393622 m!1279609))

(declare-fun m!1279611 () Bool)

(assert (=> b!1393620 m!1279611))

(assert (=> b!1393620 m!1279611))

(declare-fun m!1279613 () Bool)

(assert (=> b!1393620 m!1279613))

(assert (=> b!1393621 m!1279607))

(assert (=> b!1393621 m!1279607))

(declare-fun m!1279615 () Bool)

(assert (=> b!1393621 m!1279615))

(assert (=> b!1393619 m!1279607))

(declare-fun m!1279617 () Bool)

(assert (=> b!1393619 m!1279617))

(assert (=> b!1393619 m!1279607))

(declare-fun m!1279619 () Bool)

(assert (=> b!1393619 m!1279619))

(assert (=> b!1393619 m!1279617))

(assert (=> b!1393619 m!1279607))

(declare-fun m!1279621 () Bool)

(assert (=> b!1393619 m!1279621))

(declare-fun m!1279623 () Bool)

(assert (=> b!1393619 m!1279623))

(declare-fun m!1279625 () Bool)

(assert (=> b!1393623 m!1279625))

(declare-fun m!1279627 () Bool)

(assert (=> b!1393625 m!1279627))

(declare-fun m!1279629 () Bool)

(assert (=> b!1393625 m!1279629))

(assert (=> b!1393625 m!1279629))

(declare-fun m!1279631 () Bool)

(assert (=> b!1393625 m!1279631))

(assert (=> b!1393625 m!1279631))

(assert (=> b!1393625 m!1279629))

(declare-fun m!1279633 () Bool)

(assert (=> b!1393625 m!1279633))

(declare-fun m!1279635 () Bool)

(assert (=> start!119640 m!1279635))

(declare-fun m!1279637 () Bool)

(assert (=> start!119640 m!1279637))

(push 1)

(assert (not b!1393621))

(assert (not b!1393623))

(assert (not b!1393625))

(assert (not start!119640))

(assert (not b!1393619))

(assert (not b!1393622))

(assert (not b!1393626))

(assert (not b!1393620))

(check-sat)

