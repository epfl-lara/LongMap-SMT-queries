; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121026 () Bool)

(assert start!121026)

(declare-fun b!1407140 () Bool)

(declare-fun res!944673 () Bool)

(declare-fun e!796560 () Bool)

(assert (=> b!1407140 (=> (not res!944673) (not e!796560))))

(declare-datatypes ((array!96255 0))(
  ( (array!96256 (arr!46473 (Array (_ BitVec 32) (_ BitVec 64))) (size!47024 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96255)

(declare-datatypes ((List!32979 0))(
  ( (Nil!32976) (Cons!32975 (h!34237 (_ BitVec 64)) (t!47665 List!32979)) )
))
(declare-fun arrayNoDuplicates!0 (array!96255 (_ BitVec 32) List!32979) Bool)

(assert (=> b!1407140 (= res!944673 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32976))))

(declare-fun b!1407142 () Bool)

(declare-fun e!796562 () Bool)

(assert (=> b!1407142 (= e!796562 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10687 0))(
  ( (MissingZero!10687 (index!45125 (_ BitVec 32))) (Found!10687 (index!45126 (_ BitVec 32))) (Intermediate!10687 (undefined!11499 Bool) (index!45127 (_ BitVec 32)) (x!126881 (_ BitVec 32))) (Undefined!10687) (MissingVacant!10687 (index!45128 (_ BitVec 32))) )
))
(declare-fun lt!619619 () SeekEntryResult!10687)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96255 (_ BitVec 32)) SeekEntryResult!10687)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407142 (= lt!619619 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46473 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46473 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96256 (store (arr!46473 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47024 a!2901)) mask!2840))))

(declare-fun b!1407143 () Bool)

(declare-fun res!944677 () Bool)

(assert (=> b!1407143 (=> (not res!944677) (not e!796560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96255 (_ BitVec 32)) Bool)

(assert (=> b!1407143 (= res!944677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407144 () Bool)

(declare-fun res!944674 () Bool)

(assert (=> b!1407144 (=> (not res!944674) (not e!796560))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407144 (= res!944674 (validKeyInArray!0 (select (arr!46473 a!2901) j!112)))))

(declare-fun b!1407145 () Bool)

(assert (=> b!1407145 (= e!796560 (not e!796562))))

(declare-fun res!944675 () Bool)

(assert (=> b!1407145 (=> res!944675 e!796562)))

(declare-fun lt!619617 () SeekEntryResult!10687)

(assert (=> b!1407145 (= res!944675 (or (not (is-Intermediate!10687 lt!619617)) (undefined!11499 lt!619617)))))

(declare-fun e!796559 () Bool)

(assert (=> b!1407145 e!796559))

(declare-fun res!944679 () Bool)

(assert (=> b!1407145 (=> (not res!944679) (not e!796559))))

(assert (=> b!1407145 (= res!944679 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47375 0))(
  ( (Unit!47376) )
))
(declare-fun lt!619618 () Unit!47375)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96255 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47375)

(assert (=> b!1407145 (= lt!619618 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1407145 (= lt!619617 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46473 a!2901) j!112) mask!2840) (select (arr!46473 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407146 () Bool)

(declare-fun res!944678 () Bool)

(assert (=> b!1407146 (=> (not res!944678) (not e!796560))))

(assert (=> b!1407146 (= res!944678 (validKeyInArray!0 (select (arr!46473 a!2901) i!1037)))))

(declare-fun b!1407147 () Bool)

(declare-fun res!944676 () Bool)

(assert (=> b!1407147 (=> (not res!944676) (not e!796560))))

(assert (=> b!1407147 (= res!944676 (and (= (size!47024 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47024 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47024 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!944680 () Bool)

(assert (=> start!121026 (=> (not res!944680) (not e!796560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121026 (= res!944680 (validMask!0 mask!2840))))

(assert (=> start!121026 e!796560))

(assert (=> start!121026 true))

(declare-fun array_inv!35754 (array!96255) Bool)

(assert (=> start!121026 (array_inv!35754 a!2901)))

(declare-fun b!1407141 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96255 (_ BitVec 32)) SeekEntryResult!10687)

(assert (=> b!1407141 (= e!796559 (= (seekEntryOrOpen!0 (select (arr!46473 a!2901) j!112) a!2901 mask!2840) (Found!10687 j!112)))))

(assert (= (and start!121026 res!944680) b!1407147))

(assert (= (and b!1407147 res!944676) b!1407146))

(assert (= (and b!1407146 res!944678) b!1407144))

(assert (= (and b!1407144 res!944674) b!1407143))

(assert (= (and b!1407143 res!944677) b!1407140))

(assert (= (and b!1407140 res!944673) b!1407145))

(assert (= (and b!1407145 res!944679) b!1407141))

(assert (= (and b!1407145 (not res!944675)) b!1407142))

(declare-fun m!1296333 () Bool)

(assert (=> b!1407145 m!1296333))

(declare-fun m!1296335 () Bool)

(assert (=> b!1407145 m!1296335))

(assert (=> b!1407145 m!1296333))

(declare-fun m!1296337 () Bool)

(assert (=> b!1407145 m!1296337))

(assert (=> b!1407145 m!1296335))

(assert (=> b!1407145 m!1296333))

(declare-fun m!1296339 () Bool)

(assert (=> b!1407145 m!1296339))

(declare-fun m!1296341 () Bool)

(assert (=> b!1407145 m!1296341))

(declare-fun m!1296343 () Bool)

(assert (=> start!121026 m!1296343))

(declare-fun m!1296345 () Bool)

(assert (=> start!121026 m!1296345))

(declare-fun m!1296347 () Bool)

(assert (=> b!1407140 m!1296347))

(declare-fun m!1296349 () Bool)

(assert (=> b!1407143 m!1296349))

(assert (=> b!1407141 m!1296333))

(assert (=> b!1407141 m!1296333))

(declare-fun m!1296351 () Bool)

(assert (=> b!1407141 m!1296351))

(declare-fun m!1296353 () Bool)

(assert (=> b!1407142 m!1296353))

(declare-fun m!1296355 () Bool)

(assert (=> b!1407142 m!1296355))

(assert (=> b!1407142 m!1296355))

(declare-fun m!1296357 () Bool)

(assert (=> b!1407142 m!1296357))

(assert (=> b!1407142 m!1296357))

(assert (=> b!1407142 m!1296355))

(declare-fun m!1296359 () Bool)

(assert (=> b!1407142 m!1296359))

(declare-fun m!1296361 () Bool)

(assert (=> b!1407146 m!1296361))

(assert (=> b!1407146 m!1296361))

(declare-fun m!1296363 () Bool)

(assert (=> b!1407146 m!1296363))

(assert (=> b!1407144 m!1296333))

(assert (=> b!1407144 m!1296333))

(declare-fun m!1296365 () Bool)

(assert (=> b!1407144 m!1296365))

(push 1)

(assert (not b!1407146))

(assert (not b!1407142))

(assert (not b!1407141))

(assert (not b!1407145))

(assert (not b!1407140))

(assert (not b!1407143))

(assert (not start!121026))

(assert (not b!1407144))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

