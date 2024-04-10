; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120502 () Bool)

(assert start!120502)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95911 0))(
  ( (array!95912 (arr!46306 (Array (_ BitVec 32) (_ BitVec 64))) (size!46856 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95911)

(declare-fun e!794500 () Bool)

(declare-fun b!1403150 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10623 0))(
  ( (MissingZero!10623 (index!44869 (_ BitVec 32))) (Found!10623 (index!44870 (_ BitVec 32))) (Intermediate!10623 (undefined!11435 Bool) (index!44871 (_ BitVec 32)) (x!126482 (_ BitVec 32))) (Undefined!10623) (MissingVacant!10623 (index!44872 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95911 (_ BitVec 32)) SeekEntryResult!10623)

(assert (=> b!1403150 (= e!794500 (= (seekEntryOrOpen!0 (select (arr!46306 a!2901) j!112) a!2901 mask!2840) (Found!10623 j!112)))))

(declare-fun b!1403151 () Bool)

(declare-fun e!794501 () Bool)

(assert (=> b!1403151 (= e!794501 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!618293 () SeekEntryResult!10623)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95911 (_ BitVec 32)) SeekEntryResult!10623)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403151 (= lt!618293 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46306 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46306 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95912 (store (arr!46306 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46856 a!2901)) mask!2840))))

(declare-fun b!1403152 () Bool)

(declare-fun e!794499 () Bool)

(assert (=> b!1403152 (= e!794499 (not e!794501))))

(declare-fun res!941664 () Bool)

(assert (=> b!1403152 (=> res!941664 e!794501)))

(declare-fun lt!618294 () SeekEntryResult!10623)

(assert (=> b!1403152 (= res!941664 (or (not (is-Intermediate!10623 lt!618294)) (undefined!11435 lt!618294)))))

(assert (=> b!1403152 e!794500))

(declare-fun res!941663 () Bool)

(assert (=> b!1403152 (=> (not res!941663) (not e!794500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95911 (_ BitVec 32)) Bool)

(assert (=> b!1403152 (= res!941663 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47250 0))(
  ( (Unit!47251) )
))
(declare-fun lt!618292 () Unit!47250)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95911 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47250)

(assert (=> b!1403152 (= lt!618292 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1403152 (= lt!618294 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46306 a!2901) j!112) mask!2840) (select (arr!46306 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403153 () Bool)

(declare-fun res!941667 () Bool)

(assert (=> b!1403153 (=> (not res!941667) (not e!794499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403153 (= res!941667 (validKeyInArray!0 (select (arr!46306 a!2901) i!1037)))))

(declare-fun b!1403154 () Bool)

(declare-fun res!941666 () Bool)

(assert (=> b!1403154 (=> (not res!941666) (not e!794499))))

(assert (=> b!1403154 (= res!941666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403155 () Bool)

(declare-fun res!941668 () Bool)

(assert (=> b!1403155 (=> (not res!941668) (not e!794499))))

(assert (=> b!1403155 (= res!941668 (validKeyInArray!0 (select (arr!46306 a!2901) j!112)))))

(declare-fun b!1403156 () Bool)

(declare-fun res!941665 () Bool)

(assert (=> b!1403156 (=> (not res!941665) (not e!794499))))

(assert (=> b!1403156 (= res!941665 (and (= (size!46856 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46856 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46856 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!941661 () Bool)

(assert (=> start!120502 (=> (not res!941661) (not e!794499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120502 (= res!941661 (validMask!0 mask!2840))))

(assert (=> start!120502 e!794499))

(assert (=> start!120502 true))

(declare-fun array_inv!35334 (array!95911) Bool)

(assert (=> start!120502 (array_inv!35334 a!2901)))

(declare-fun b!1403157 () Bool)

(declare-fun res!941662 () Bool)

(assert (=> b!1403157 (=> (not res!941662) (not e!794499))))

(declare-datatypes ((List!32825 0))(
  ( (Nil!32822) (Cons!32821 (h!34069 (_ BitVec 64)) (t!47519 List!32825)) )
))
(declare-fun arrayNoDuplicates!0 (array!95911 (_ BitVec 32) List!32825) Bool)

(assert (=> b!1403157 (= res!941662 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32822))))

(assert (= (and start!120502 res!941661) b!1403156))

(assert (= (and b!1403156 res!941665) b!1403153))

(assert (= (and b!1403153 res!941667) b!1403155))

(assert (= (and b!1403155 res!941668) b!1403154))

(assert (= (and b!1403154 res!941666) b!1403157))

(assert (= (and b!1403157 res!941662) b!1403152))

(assert (= (and b!1403152 res!941663) b!1403150))

(assert (= (and b!1403152 (not res!941664)) b!1403151))

(declare-fun m!1291667 () Bool)

(assert (=> b!1403151 m!1291667))

(declare-fun m!1291669 () Bool)

(assert (=> b!1403151 m!1291669))

(assert (=> b!1403151 m!1291669))

(declare-fun m!1291671 () Bool)

(assert (=> b!1403151 m!1291671))

(assert (=> b!1403151 m!1291671))

(assert (=> b!1403151 m!1291669))

(declare-fun m!1291673 () Bool)

(assert (=> b!1403151 m!1291673))

(declare-fun m!1291675 () Bool)

(assert (=> b!1403155 m!1291675))

(assert (=> b!1403155 m!1291675))

(declare-fun m!1291677 () Bool)

(assert (=> b!1403155 m!1291677))

(declare-fun m!1291679 () Bool)

(assert (=> b!1403157 m!1291679))

(declare-fun m!1291681 () Bool)

(assert (=> b!1403154 m!1291681))

(assert (=> b!1403152 m!1291675))

(declare-fun m!1291683 () Bool)

(assert (=> b!1403152 m!1291683))

(assert (=> b!1403152 m!1291675))

(declare-fun m!1291685 () Bool)

(assert (=> b!1403152 m!1291685))

(assert (=> b!1403152 m!1291683))

(assert (=> b!1403152 m!1291675))

(declare-fun m!1291687 () Bool)

(assert (=> b!1403152 m!1291687))

(declare-fun m!1291689 () Bool)

(assert (=> b!1403152 m!1291689))

(assert (=> b!1403150 m!1291675))

(assert (=> b!1403150 m!1291675))

(declare-fun m!1291691 () Bool)

(assert (=> b!1403150 m!1291691))

(declare-fun m!1291693 () Bool)

(assert (=> b!1403153 m!1291693))

(assert (=> b!1403153 m!1291693))

(declare-fun m!1291695 () Bool)

(assert (=> b!1403153 m!1291695))

(declare-fun m!1291697 () Bool)

(assert (=> start!120502 m!1291697))

(declare-fun m!1291699 () Bool)

(assert (=> start!120502 m!1291699))

(push 1)

(assert (not b!1403157))

(assert (not b!1403154))

(assert (not b!1403151))

(assert (not b!1403155))

(assert (not b!1403153))

(assert (not b!1403150))

(assert (not start!120502))

(assert (not b!1403152))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

