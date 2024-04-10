; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120816 () Bool)

(assert start!120816)

(declare-fun b!1405736 () Bool)

(declare-fun e!795689 () Bool)

(declare-fun e!795692 () Bool)

(assert (=> b!1405736 (= e!795689 (not e!795692))))

(declare-fun res!943957 () Bool)

(assert (=> b!1405736 (=> res!943957 e!795692)))

(declare-datatypes ((SeekEntryResult!10720 0))(
  ( (MissingZero!10720 (index!45257 (_ BitVec 32))) (Found!10720 (index!45258 (_ BitVec 32))) (Intermediate!10720 (undefined!11532 Bool) (index!45259 (_ BitVec 32)) (x!126871 (_ BitVec 32))) (Undefined!10720) (MissingVacant!10720 (index!45260 (_ BitVec 32))) )
))
(declare-fun lt!619120 () SeekEntryResult!10720)

(assert (=> b!1405736 (= res!943957 (or (not (is-Intermediate!10720 lt!619120)) (undefined!11532 lt!619120)))))

(declare-fun e!795690 () Bool)

(assert (=> b!1405736 e!795690))

(declare-fun res!943956 () Bool)

(assert (=> b!1405736 (=> (not res!943956) (not e!795690))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96123 0))(
  ( (array!96124 (arr!46409 (Array (_ BitVec 32) (_ BitVec 64))) (size!46959 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96123)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96123 (_ BitVec 32)) Bool)

(assert (=> b!1405736 (= res!943956 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47414 0))(
  ( (Unit!47415) )
))
(declare-fun lt!619122 () Unit!47414)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96123 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47414)

(assert (=> b!1405736 (= lt!619122 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96123 (_ BitVec 32)) SeekEntryResult!10720)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405736 (= lt!619120 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46409 a!2901) j!112) mask!2840) (select (arr!46409 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!943955 () Bool)

(assert (=> start!120816 (=> (not res!943955) (not e!795689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120816 (= res!943955 (validMask!0 mask!2840))))

(assert (=> start!120816 e!795689))

(assert (=> start!120816 true))

(declare-fun array_inv!35437 (array!96123) Bool)

(assert (=> start!120816 (array_inv!35437 a!2901)))

(declare-fun b!1405737 () Bool)

(declare-fun res!943960 () Bool)

(assert (=> b!1405737 (=> (not res!943960) (not e!795689))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405737 (= res!943960 (validKeyInArray!0 (select (arr!46409 a!2901) j!112)))))

(declare-fun b!1405738 () Bool)

(declare-fun res!943953 () Bool)

(assert (=> b!1405738 (=> (not res!943953) (not e!795689))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405738 (= res!943953 (and (= (size!46959 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46959 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46959 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405739 () Bool)

(declare-fun res!943959 () Bool)

(assert (=> b!1405739 (=> (not res!943959) (not e!795689))))

(assert (=> b!1405739 (= res!943959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405740 () Bool)

(declare-fun res!943958 () Bool)

(assert (=> b!1405740 (=> (not res!943958) (not e!795689))))

(assert (=> b!1405740 (= res!943958 (validKeyInArray!0 (select (arr!46409 a!2901) i!1037)))))

(declare-fun b!1405741 () Bool)

(declare-fun res!943954 () Bool)

(assert (=> b!1405741 (=> (not res!943954) (not e!795689))))

(declare-datatypes ((List!32928 0))(
  ( (Nil!32925) (Cons!32924 (h!34178 (_ BitVec 64)) (t!47622 List!32928)) )
))
(declare-fun arrayNoDuplicates!0 (array!96123 (_ BitVec 32) List!32928) Bool)

(assert (=> b!1405741 (= res!943954 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32925))))

(declare-fun b!1405742 () Bool)

(assert (=> b!1405742 (= e!795692 true)))

(declare-fun lt!619121 () (_ BitVec 32))

(assert (=> b!1405742 (= lt!619121 (toIndex!0 (select (store (arr!46409 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1405743 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96123 (_ BitVec 32)) SeekEntryResult!10720)

(assert (=> b!1405743 (= e!795690 (= (seekEntryOrOpen!0 (select (arr!46409 a!2901) j!112) a!2901 mask!2840) (Found!10720 j!112)))))

(assert (= (and start!120816 res!943955) b!1405738))

(assert (= (and b!1405738 res!943953) b!1405740))

(assert (= (and b!1405740 res!943958) b!1405737))

(assert (= (and b!1405737 res!943960) b!1405739))

(assert (= (and b!1405739 res!943959) b!1405741))

(assert (= (and b!1405741 res!943954) b!1405736))

(assert (= (and b!1405736 res!943956) b!1405743))

(assert (= (and b!1405736 (not res!943957)) b!1405742))

(declare-fun m!1294593 () Bool)

(assert (=> b!1405737 m!1294593))

(assert (=> b!1405737 m!1294593))

(declare-fun m!1294595 () Bool)

(assert (=> b!1405737 m!1294595))

(declare-fun m!1294597 () Bool)

(assert (=> b!1405741 m!1294597))

(declare-fun m!1294599 () Bool)

(assert (=> b!1405742 m!1294599))

(declare-fun m!1294601 () Bool)

(assert (=> b!1405742 m!1294601))

(assert (=> b!1405742 m!1294601))

(declare-fun m!1294603 () Bool)

(assert (=> b!1405742 m!1294603))

(declare-fun m!1294605 () Bool)

(assert (=> start!120816 m!1294605))

(declare-fun m!1294607 () Bool)

(assert (=> start!120816 m!1294607))

(assert (=> b!1405743 m!1294593))

(assert (=> b!1405743 m!1294593))

(declare-fun m!1294609 () Bool)

(assert (=> b!1405743 m!1294609))

(assert (=> b!1405736 m!1294593))

(declare-fun m!1294611 () Bool)

(assert (=> b!1405736 m!1294611))

(assert (=> b!1405736 m!1294593))

(declare-fun m!1294613 () Bool)

(assert (=> b!1405736 m!1294613))

(assert (=> b!1405736 m!1294611))

(assert (=> b!1405736 m!1294593))

(declare-fun m!1294615 () Bool)

(assert (=> b!1405736 m!1294615))

(declare-fun m!1294617 () Bool)

(assert (=> b!1405736 m!1294617))

(declare-fun m!1294619 () Bool)

(assert (=> b!1405740 m!1294619))

(assert (=> b!1405740 m!1294619))

(declare-fun m!1294621 () Bool)

(assert (=> b!1405740 m!1294621))

(declare-fun m!1294623 () Bool)

(assert (=> b!1405739 m!1294623))

(push 1)

(assert (not b!1405743))

(assert (not b!1405740))

(assert (not b!1405742))

(assert (not b!1405739))

(assert (not b!1405736))

(assert (not b!1405741))

(assert (not b!1405737))

(assert (not start!120816))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

