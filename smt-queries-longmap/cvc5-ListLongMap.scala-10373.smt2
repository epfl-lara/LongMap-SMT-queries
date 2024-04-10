; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122106 () Bool)

(assert start!122106)

(declare-fun b!1416950 () Bool)

(declare-fun res!952833 () Bool)

(declare-fun e!801946 () Bool)

(assert (=> b!1416950 (=> (not res!952833) (not e!801946))))

(declare-datatypes ((array!96741 0))(
  ( (array!96742 (arr!46700 (Array (_ BitVec 32) (_ BitVec 64))) (size!47250 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96741)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96741 (_ BitVec 32)) Bool)

(assert (=> b!1416950 (= res!952833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416951 () Bool)

(declare-fun res!952831 () Bool)

(assert (=> b!1416951 (=> (not res!952831) (not e!801946))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416951 (= res!952831 (validKeyInArray!0 (select (arr!46700 a!2901) j!112)))))

(declare-fun b!1416952 () Bool)

(declare-fun e!801945 () Bool)

(assert (=> b!1416952 (= e!801946 (not e!801945))))

(declare-fun res!952832 () Bool)

(assert (=> b!1416952 (=> res!952832 e!801945)))

(declare-datatypes ((SeekEntryResult!11011 0))(
  ( (MissingZero!11011 (index!46436 (_ BitVec 32))) (Found!11011 (index!46437 (_ BitVec 32))) (Intermediate!11011 (undefined!11823 Bool) (index!46438 (_ BitVec 32)) (x!128040 (_ BitVec 32))) (Undefined!11011) (MissingVacant!11011 (index!46439 (_ BitVec 32))) )
))
(declare-fun lt!625177 () SeekEntryResult!11011)

(assert (=> b!1416952 (= res!952832 (or (not (is-Intermediate!11011 lt!625177)) (undefined!11823 lt!625177)))))

(declare-fun e!801947 () Bool)

(assert (=> b!1416952 e!801947))

(declare-fun res!952829 () Bool)

(assert (=> b!1416952 (=> (not res!952829) (not e!801947))))

(assert (=> b!1416952 (= res!952829 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47996 0))(
  ( (Unit!47997) )
))
(declare-fun lt!625178 () Unit!47996)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96741 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47996)

(assert (=> b!1416952 (= lt!625178 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96741 (_ BitVec 32)) SeekEntryResult!11011)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416952 (= lt!625177 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46700 a!2901) j!112) mask!2840) (select (arr!46700 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1416953 () Bool)

(declare-fun res!952828 () Bool)

(assert (=> b!1416953 (=> (not res!952828) (not e!801946))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1416953 (= res!952828 (validKeyInArray!0 (select (arr!46700 a!2901) i!1037)))))

(declare-fun b!1416954 () Bool)

(assert (=> b!1416954 (= e!801945 true)))

(declare-fun lt!625179 () SeekEntryResult!11011)

(assert (=> b!1416954 (= lt!625179 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46700 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46700 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96742 (store (arr!46700 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47250 a!2901)) mask!2840))))

(declare-fun b!1416956 () Bool)

(declare-fun res!952830 () Bool)

(assert (=> b!1416956 (=> (not res!952830) (not e!801946))))

(declare-datatypes ((List!33219 0))(
  ( (Nil!33216) (Cons!33215 (h!34505 (_ BitVec 64)) (t!47913 List!33219)) )
))
(declare-fun arrayNoDuplicates!0 (array!96741 (_ BitVec 32) List!33219) Bool)

(assert (=> b!1416956 (= res!952830 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33216))))

(declare-fun b!1416957 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96741 (_ BitVec 32)) SeekEntryResult!11011)

(assert (=> b!1416957 (= e!801947 (= (seekEntryOrOpen!0 (select (arr!46700 a!2901) j!112) a!2901 mask!2840) (Found!11011 j!112)))))

(declare-fun b!1416955 () Bool)

(declare-fun res!952827 () Bool)

(assert (=> b!1416955 (=> (not res!952827) (not e!801946))))

(assert (=> b!1416955 (= res!952827 (and (= (size!47250 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47250 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47250 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!952834 () Bool)

(assert (=> start!122106 (=> (not res!952834) (not e!801946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122106 (= res!952834 (validMask!0 mask!2840))))

(assert (=> start!122106 e!801946))

(assert (=> start!122106 true))

(declare-fun array_inv!35728 (array!96741) Bool)

(assert (=> start!122106 (array_inv!35728 a!2901)))

(assert (= (and start!122106 res!952834) b!1416955))

(assert (= (and b!1416955 res!952827) b!1416953))

(assert (= (and b!1416953 res!952828) b!1416951))

(assert (= (and b!1416951 res!952831) b!1416950))

(assert (= (and b!1416950 res!952833) b!1416956))

(assert (= (and b!1416956 res!952830) b!1416952))

(assert (= (and b!1416952 res!952829) b!1416957))

(assert (= (and b!1416952 (not res!952832)) b!1416954))

(declare-fun m!1307679 () Bool)

(assert (=> b!1416954 m!1307679))

(declare-fun m!1307681 () Bool)

(assert (=> b!1416954 m!1307681))

(assert (=> b!1416954 m!1307681))

(declare-fun m!1307683 () Bool)

(assert (=> b!1416954 m!1307683))

(assert (=> b!1416954 m!1307683))

(assert (=> b!1416954 m!1307681))

(declare-fun m!1307685 () Bool)

(assert (=> b!1416954 m!1307685))

(declare-fun m!1307687 () Bool)

(assert (=> b!1416950 m!1307687))

(declare-fun m!1307689 () Bool)

(assert (=> b!1416951 m!1307689))

(assert (=> b!1416951 m!1307689))

(declare-fun m!1307691 () Bool)

(assert (=> b!1416951 m!1307691))

(declare-fun m!1307693 () Bool)

(assert (=> b!1416953 m!1307693))

(assert (=> b!1416953 m!1307693))

(declare-fun m!1307695 () Bool)

(assert (=> b!1416953 m!1307695))

(assert (=> b!1416952 m!1307689))

(declare-fun m!1307697 () Bool)

(assert (=> b!1416952 m!1307697))

(assert (=> b!1416952 m!1307689))

(declare-fun m!1307699 () Bool)

(assert (=> b!1416952 m!1307699))

(assert (=> b!1416952 m!1307697))

(assert (=> b!1416952 m!1307689))

(declare-fun m!1307701 () Bool)

(assert (=> b!1416952 m!1307701))

(declare-fun m!1307703 () Bool)

(assert (=> b!1416952 m!1307703))

(declare-fun m!1307705 () Bool)

(assert (=> b!1416956 m!1307705))

(assert (=> b!1416957 m!1307689))

(assert (=> b!1416957 m!1307689))

(declare-fun m!1307707 () Bool)

(assert (=> b!1416957 m!1307707))

(declare-fun m!1307709 () Bool)

(assert (=> start!122106 m!1307709))

(declare-fun m!1307711 () Bool)

(assert (=> start!122106 m!1307711))

(push 1)

(assert (not start!122106))

(assert (not b!1416951))

(assert (not b!1416956))

(assert (not b!1416950))

(assert (not b!1416953))

(assert (not b!1416957))

(assert (not b!1416954))

(assert (not b!1416952))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

