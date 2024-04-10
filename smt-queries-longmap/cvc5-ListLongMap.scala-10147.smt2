; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119646 () Bool)

(assert start!119646)

(declare-fun b!1393691 () Bool)

(declare-fun res!933099 () Bool)

(declare-fun e!789144 () Bool)

(assert (=> b!1393691 (=> (not res!933099) (not e!789144))))

(declare-datatypes ((array!95328 0))(
  ( (array!95329 (arr!46022 (Array (_ BitVec 32) (_ BitVec 64))) (size!46572 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95328)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393691 (= res!933099 (validKeyInArray!0 (select (arr!46022 a!2901) j!112)))))

(declare-fun b!1393692 () Bool)

(declare-fun res!933105 () Bool)

(assert (=> b!1393692 (=> (not res!933105) (not e!789144))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1393692 (= res!933105 (validKeyInArray!0 (select (arr!46022 a!2901) i!1037)))))

(declare-fun b!1393693 () Bool)

(declare-fun e!789143 () Bool)

(assert (=> b!1393693 (= e!789144 (not e!789143))))

(declare-fun res!933104 () Bool)

(assert (=> b!1393693 (=> res!933104 e!789143)))

(declare-datatypes ((SeekEntryResult!10339 0))(
  ( (MissingZero!10339 (index!43727 (_ BitVec 32))) (Found!10339 (index!43728 (_ BitVec 32))) (Intermediate!10339 (undefined!11151 Bool) (index!43729 (_ BitVec 32)) (x!125407 (_ BitVec 32))) (Undefined!10339) (MissingVacant!10339 (index!43730 (_ BitVec 32))) )
))
(declare-fun lt!612087 () SeekEntryResult!10339)

(assert (=> b!1393693 (= res!933104 (or (not (is-Intermediate!10339 lt!612087)) (undefined!11151 lt!612087)))))

(declare-fun e!789145 () Bool)

(assert (=> b!1393693 e!789145))

(declare-fun res!933102 () Bool)

(assert (=> b!1393693 (=> (not res!933102) (not e!789145))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95328 (_ BitVec 32)) Bool)

(assert (=> b!1393693 (= res!933102 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46682 0))(
  ( (Unit!46683) )
))
(declare-fun lt!612086 () Unit!46682)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95328 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46682)

(assert (=> b!1393693 (= lt!612086 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95328 (_ BitVec 32)) SeekEntryResult!10339)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393693 (= lt!612087 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46022 a!2901) j!112) mask!2840) (select (arr!46022 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393694 () Bool)

(declare-fun res!933101 () Bool)

(assert (=> b!1393694 (=> (not res!933101) (not e!789144))))

(declare-datatypes ((List!32541 0))(
  ( (Nil!32538) (Cons!32537 (h!33770 (_ BitVec 64)) (t!47235 List!32541)) )
))
(declare-fun arrayNoDuplicates!0 (array!95328 (_ BitVec 32) List!32541) Bool)

(assert (=> b!1393694 (= res!933101 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32538))))

(declare-fun b!1393695 () Bool)

(declare-fun res!933106 () Bool)

(assert (=> b!1393695 (=> (not res!933106) (not e!789144))))

(assert (=> b!1393695 (= res!933106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!933103 () Bool)

(assert (=> start!119646 (=> (not res!933103) (not e!789144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119646 (= res!933103 (validMask!0 mask!2840))))

(assert (=> start!119646 e!789144))

(assert (=> start!119646 true))

(declare-fun array_inv!35050 (array!95328) Bool)

(assert (=> start!119646 (array_inv!35050 a!2901)))

(declare-fun b!1393696 () Bool)

(assert (=> b!1393696 (= e!789143 true)))

(declare-fun lt!612085 () SeekEntryResult!10339)

(assert (=> b!1393696 (= lt!612085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46022 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46022 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95329 (store (arr!46022 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46572 a!2901)) mask!2840))))

(declare-fun b!1393697 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95328 (_ BitVec 32)) SeekEntryResult!10339)

(assert (=> b!1393697 (= e!789145 (= (seekEntryOrOpen!0 (select (arr!46022 a!2901) j!112) a!2901 mask!2840) (Found!10339 j!112)))))

(declare-fun b!1393698 () Bool)

(declare-fun res!933100 () Bool)

(assert (=> b!1393698 (=> (not res!933100) (not e!789144))))

(assert (=> b!1393698 (= res!933100 (and (= (size!46572 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46572 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46572 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119646 res!933103) b!1393698))

(assert (= (and b!1393698 res!933100) b!1393692))

(assert (= (and b!1393692 res!933105) b!1393691))

(assert (= (and b!1393691 res!933099) b!1393695))

(assert (= (and b!1393695 res!933106) b!1393694))

(assert (= (and b!1393694 res!933101) b!1393693))

(assert (= (and b!1393693 res!933102) b!1393697))

(assert (= (and b!1393693 (not res!933104)) b!1393696))

(declare-fun m!1279707 () Bool)

(assert (=> b!1393693 m!1279707))

(declare-fun m!1279709 () Bool)

(assert (=> b!1393693 m!1279709))

(assert (=> b!1393693 m!1279707))

(declare-fun m!1279711 () Bool)

(assert (=> b!1393693 m!1279711))

(assert (=> b!1393693 m!1279709))

(assert (=> b!1393693 m!1279707))

(declare-fun m!1279713 () Bool)

(assert (=> b!1393693 m!1279713))

(declare-fun m!1279715 () Bool)

(assert (=> b!1393693 m!1279715))

(declare-fun m!1279717 () Bool)

(assert (=> b!1393696 m!1279717))

(declare-fun m!1279719 () Bool)

(assert (=> b!1393696 m!1279719))

(assert (=> b!1393696 m!1279719))

(declare-fun m!1279721 () Bool)

(assert (=> b!1393696 m!1279721))

(assert (=> b!1393696 m!1279721))

(assert (=> b!1393696 m!1279719))

(declare-fun m!1279723 () Bool)

(assert (=> b!1393696 m!1279723))

(assert (=> b!1393691 m!1279707))

(assert (=> b!1393691 m!1279707))

(declare-fun m!1279725 () Bool)

(assert (=> b!1393691 m!1279725))

(declare-fun m!1279727 () Bool)

(assert (=> start!119646 m!1279727))

(declare-fun m!1279729 () Bool)

(assert (=> start!119646 m!1279729))

(assert (=> b!1393697 m!1279707))

(assert (=> b!1393697 m!1279707))

(declare-fun m!1279731 () Bool)

(assert (=> b!1393697 m!1279731))

(declare-fun m!1279733 () Bool)

(assert (=> b!1393695 m!1279733))

(declare-fun m!1279735 () Bool)

(assert (=> b!1393694 m!1279735))

(declare-fun m!1279737 () Bool)

(assert (=> b!1393692 m!1279737))

(assert (=> b!1393692 m!1279737))

(declare-fun m!1279739 () Bool)

(assert (=> b!1393692 m!1279739))

(push 1)

(assert (not b!1393695))

(assert (not b!1393696))

(assert (not b!1393691))

(assert (not b!1393692))

(assert (not start!119646))

(assert (not b!1393697))

(assert (not b!1393693))

(assert (not b!1393694))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

