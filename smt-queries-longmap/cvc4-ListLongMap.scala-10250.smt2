; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120556 () Bool)

(assert start!120556)

(declare-fun b!1403763 () Bool)

(declare-fun e!794788 () Bool)

(assert (=> b!1403763 (= e!794788 (not true))))

(declare-fun e!794789 () Bool)

(assert (=> b!1403763 e!794789))

(declare-fun res!942279 () Bool)

(assert (=> b!1403763 (=> (not res!942279) (not e!794789))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95965 0))(
  ( (array!95966 (arr!46333 (Array (_ BitVec 32) (_ BitVec 64))) (size!46883 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95965)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95965 (_ BitVec 32)) Bool)

(assert (=> b!1403763 (= res!942279 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47304 0))(
  ( (Unit!47305) )
))
(declare-fun lt!618501 () Unit!47304)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95965 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47304)

(assert (=> b!1403763 (= lt!618501 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10650 0))(
  ( (MissingZero!10650 (index!44977 (_ BitVec 32))) (Found!10650 (index!44978 (_ BitVec 32))) (Intermediate!10650 (undefined!11462 Bool) (index!44979 (_ BitVec 32)) (x!126581 (_ BitVec 32))) (Undefined!10650) (MissingVacant!10650 (index!44980 (_ BitVec 32))) )
))
(declare-fun lt!618500 () SeekEntryResult!10650)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95965 (_ BitVec 32)) SeekEntryResult!10650)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403763 (= lt!618500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46333 a!2901) j!112) mask!2840) (select (arr!46333 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!942280 () Bool)

(assert (=> start!120556 (=> (not res!942280) (not e!794788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120556 (= res!942280 (validMask!0 mask!2840))))

(assert (=> start!120556 e!794788))

(assert (=> start!120556 true))

(declare-fun array_inv!35361 (array!95965) Bool)

(assert (=> start!120556 (array_inv!35361 a!2901)))

(declare-fun b!1403764 () Bool)

(declare-fun res!942275 () Bool)

(assert (=> b!1403764 (=> (not res!942275) (not e!794788))))

(assert (=> b!1403764 (= res!942275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403765 () Bool)

(declare-fun res!942278 () Bool)

(assert (=> b!1403765 (=> (not res!942278) (not e!794788))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403765 (= res!942278 (validKeyInArray!0 (select (arr!46333 a!2901) j!112)))))

(declare-fun b!1403766 () Bool)

(declare-fun res!942276 () Bool)

(assert (=> b!1403766 (=> (not res!942276) (not e!794788))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403766 (= res!942276 (and (= (size!46883 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46883 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46883 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403767 () Bool)

(declare-fun res!942274 () Bool)

(assert (=> b!1403767 (=> (not res!942274) (not e!794788))))

(assert (=> b!1403767 (= res!942274 (validKeyInArray!0 (select (arr!46333 a!2901) i!1037)))))

(declare-fun b!1403768 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95965 (_ BitVec 32)) SeekEntryResult!10650)

(assert (=> b!1403768 (= e!794789 (= (seekEntryOrOpen!0 (select (arr!46333 a!2901) j!112) a!2901 mask!2840) (Found!10650 j!112)))))

(declare-fun b!1403769 () Bool)

(declare-fun res!942277 () Bool)

(assert (=> b!1403769 (=> (not res!942277) (not e!794788))))

(declare-datatypes ((List!32852 0))(
  ( (Nil!32849) (Cons!32848 (h!34096 (_ BitVec 64)) (t!47546 List!32852)) )
))
(declare-fun arrayNoDuplicates!0 (array!95965 (_ BitVec 32) List!32852) Bool)

(assert (=> b!1403769 (= res!942277 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32849))))

(assert (= (and start!120556 res!942280) b!1403766))

(assert (= (and b!1403766 res!942276) b!1403767))

(assert (= (and b!1403767 res!942274) b!1403765))

(assert (= (and b!1403765 res!942278) b!1403764))

(assert (= (and b!1403764 res!942275) b!1403769))

(assert (= (and b!1403769 res!942277) b!1403763))

(assert (= (and b!1403763 res!942279) b!1403768))

(declare-fun m!1292497 () Bool)

(assert (=> b!1403765 m!1292497))

(assert (=> b!1403765 m!1292497))

(declare-fun m!1292499 () Bool)

(assert (=> b!1403765 m!1292499))

(assert (=> b!1403768 m!1292497))

(assert (=> b!1403768 m!1292497))

(declare-fun m!1292501 () Bool)

(assert (=> b!1403768 m!1292501))

(declare-fun m!1292503 () Bool)

(assert (=> start!120556 m!1292503))

(declare-fun m!1292505 () Bool)

(assert (=> start!120556 m!1292505))

(declare-fun m!1292507 () Bool)

(assert (=> b!1403764 m!1292507))

(assert (=> b!1403763 m!1292497))

(declare-fun m!1292509 () Bool)

(assert (=> b!1403763 m!1292509))

(assert (=> b!1403763 m!1292497))

(declare-fun m!1292511 () Bool)

(assert (=> b!1403763 m!1292511))

(assert (=> b!1403763 m!1292509))

(assert (=> b!1403763 m!1292497))

(declare-fun m!1292513 () Bool)

(assert (=> b!1403763 m!1292513))

(declare-fun m!1292515 () Bool)

(assert (=> b!1403763 m!1292515))

(declare-fun m!1292517 () Bool)

(assert (=> b!1403767 m!1292517))

(assert (=> b!1403767 m!1292517))

(declare-fun m!1292519 () Bool)

(assert (=> b!1403767 m!1292519))

(declare-fun m!1292521 () Bool)

(assert (=> b!1403769 m!1292521))

(push 1)

(assert (not b!1403765))

(assert (not b!1403769))

(assert (not b!1403767))

(assert (not start!120556))

(assert (not b!1403764))

(assert (not b!1403768))

(assert (not b!1403763))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

