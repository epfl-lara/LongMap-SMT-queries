; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120534 () Bool)

(assert start!120534)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95896 0))(
  ( (array!95897 (arr!46299 (Array (_ BitVec 32) (_ BitVec 64))) (size!46851 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95896)

(declare-fun b!1403493 () Bool)

(declare-fun e!794668 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10642 0))(
  ( (MissingZero!10642 (index!44945 (_ BitVec 32))) (Found!10642 (index!44946 (_ BitVec 32))) (Intermediate!10642 (undefined!11454 Bool) (index!44947 (_ BitVec 32)) (x!126546 (_ BitVec 32))) (Undefined!10642) (MissingVacant!10642 (index!44948 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95896 (_ BitVec 32)) SeekEntryResult!10642)

(assert (=> b!1403493 (= e!794668 (= (seekEntryOrOpen!0 (select (arr!46299 a!2901) j!112) a!2901 mask!2840) (Found!10642 j!112)))))

(declare-fun res!942056 () Bool)

(declare-fun e!794669 () Bool)

(assert (=> start!120534 (=> (not res!942056) (not e!794669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120534 (= res!942056 (validMask!0 mask!2840))))

(assert (=> start!120534 e!794669))

(assert (=> start!120534 true))

(declare-fun array_inv!35532 (array!95896) Bool)

(assert (=> start!120534 (array_inv!35532 a!2901)))

(declare-fun b!1403494 () Bool)

(declare-fun res!942059 () Bool)

(assert (=> b!1403494 (=> (not res!942059) (not e!794669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95896 (_ BitVec 32)) Bool)

(assert (=> b!1403494 (= res!942059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403495 () Bool)

(declare-fun res!942057 () Bool)

(assert (=> b!1403495 (=> (not res!942057) (not e!794669))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403495 (= res!942057 (and (= (size!46851 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46851 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46851 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403496 () Bool)

(assert (=> b!1403496 (= e!794669 (not true))))

(assert (=> b!1403496 e!794668))

(declare-fun res!942060 () Bool)

(assert (=> b!1403496 (=> (not res!942060) (not e!794668))))

(assert (=> b!1403496 (= res!942060 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47131 0))(
  ( (Unit!47132) )
))
(declare-fun lt!618257 () Unit!47131)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95896 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47131)

(assert (=> b!1403496 (= lt!618257 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618256 () SeekEntryResult!10642)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95896 (_ BitVec 32)) SeekEntryResult!10642)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403496 (= lt!618256 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46299 a!2901) j!112) mask!2840) (select (arr!46299 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403497 () Bool)

(declare-fun res!942055 () Bool)

(assert (=> b!1403497 (=> (not res!942055) (not e!794669))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403497 (= res!942055 (validKeyInArray!0 (select (arr!46299 a!2901) j!112)))))

(declare-fun b!1403498 () Bool)

(declare-fun res!942061 () Bool)

(assert (=> b!1403498 (=> (not res!942061) (not e!794669))))

(assert (=> b!1403498 (= res!942061 (validKeyInArray!0 (select (arr!46299 a!2901) i!1037)))))

(declare-fun b!1403499 () Bool)

(declare-fun res!942058 () Bool)

(assert (=> b!1403499 (=> (not res!942058) (not e!794669))))

(declare-datatypes ((List!32896 0))(
  ( (Nil!32893) (Cons!32892 (h!34140 (_ BitVec 64)) (t!47582 List!32896)) )
))
(declare-fun arrayNoDuplicates!0 (array!95896 (_ BitVec 32) List!32896) Bool)

(assert (=> b!1403499 (= res!942058 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32893))))

(assert (= (and start!120534 res!942056) b!1403495))

(assert (= (and b!1403495 res!942057) b!1403498))

(assert (= (and b!1403498 res!942061) b!1403497))

(assert (= (and b!1403497 res!942055) b!1403494))

(assert (= (and b!1403494 res!942059) b!1403499))

(assert (= (and b!1403499 res!942058) b!1403496))

(assert (= (and b!1403496 res!942060) b!1403493))

(declare-fun m!1291727 () Bool)

(assert (=> start!120534 m!1291727))

(declare-fun m!1291729 () Bool)

(assert (=> start!120534 m!1291729))

(declare-fun m!1291731 () Bool)

(assert (=> b!1403493 m!1291731))

(assert (=> b!1403493 m!1291731))

(declare-fun m!1291733 () Bool)

(assert (=> b!1403493 m!1291733))

(declare-fun m!1291735 () Bool)

(assert (=> b!1403494 m!1291735))

(declare-fun m!1291737 () Bool)

(assert (=> b!1403498 m!1291737))

(assert (=> b!1403498 m!1291737))

(declare-fun m!1291739 () Bool)

(assert (=> b!1403498 m!1291739))

(declare-fun m!1291741 () Bool)

(assert (=> b!1403499 m!1291741))

(assert (=> b!1403496 m!1291731))

(declare-fun m!1291743 () Bool)

(assert (=> b!1403496 m!1291743))

(assert (=> b!1403496 m!1291731))

(declare-fun m!1291745 () Bool)

(assert (=> b!1403496 m!1291745))

(assert (=> b!1403496 m!1291743))

(assert (=> b!1403496 m!1291731))

(declare-fun m!1291747 () Bool)

(assert (=> b!1403496 m!1291747))

(declare-fun m!1291749 () Bool)

(assert (=> b!1403496 m!1291749))

(assert (=> b!1403497 m!1291731))

(assert (=> b!1403497 m!1291731))

(declare-fun m!1291751 () Bool)

(assert (=> b!1403497 m!1291751))

(push 1)

(assert (not b!1403493))

(assert (not b!1403494))

(assert (not b!1403499))

(assert (not start!120534))

(assert (not b!1403497))

(assert (not b!1403496))

(assert (not b!1403498))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

