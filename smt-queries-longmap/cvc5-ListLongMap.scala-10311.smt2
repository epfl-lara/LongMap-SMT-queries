; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121188 () Bool)

(assert start!121188)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96342 0))(
  ( (array!96343 (arr!46514 (Array (_ BitVec 32) (_ BitVec 64))) (size!47064 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96342)

(declare-fun b!1409102 () Bool)

(declare-fun e!797428 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10825 0))(
  ( (MissingZero!10825 (index!45677 (_ BitVec 32))) (Found!10825 (index!45678 (_ BitVec 32))) (Intermediate!10825 (undefined!11637 Bool) (index!45679 (_ BitVec 32)) (x!127274 (_ BitVec 32))) (Undefined!10825) (MissingVacant!10825 (index!45680 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96342 (_ BitVec 32)) SeekEntryResult!10825)

(assert (=> b!1409102 (= e!797428 (= (seekEntryOrOpen!0 (select (arr!46514 a!2901) j!112) a!2901 mask!2840) (Found!10825 j!112)))))

(declare-fun b!1409103 () Bool)

(declare-fun res!946829 () Bool)

(declare-fun e!797426 () Bool)

(assert (=> b!1409103 (=> (not res!946829) (not e!797426))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96342 (_ BitVec 32)) Bool)

(assert (=> b!1409103 (= res!946829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409104 () Bool)

(declare-fun res!946827 () Bool)

(assert (=> b!1409104 (=> (not res!946827) (not e!797426))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409104 (= res!946827 (validKeyInArray!0 (select (arr!46514 a!2901) i!1037)))))

(declare-fun b!1409106 () Bool)

(declare-fun res!946826 () Bool)

(assert (=> b!1409106 (=> (not res!946826) (not e!797426))))

(declare-datatypes ((List!33033 0))(
  ( (Nil!33030) (Cons!33029 (h!34292 (_ BitVec 64)) (t!47727 List!33033)) )
))
(declare-fun arrayNoDuplicates!0 (array!96342 (_ BitVec 32) List!33033) Bool)

(assert (=> b!1409106 (= res!946826 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33030))))

(declare-fun b!1409107 () Bool)

(declare-fun res!946830 () Bool)

(assert (=> b!1409107 (=> (not res!946830) (not e!797426))))

(assert (=> b!1409107 (= res!946830 (validKeyInArray!0 (select (arr!46514 a!2901) j!112)))))

(declare-fun b!1409108 () Bool)

(declare-fun res!946825 () Bool)

(assert (=> b!1409108 (=> (not res!946825) (not e!797426))))

(assert (=> b!1409108 (= res!946825 (and (= (size!47064 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47064 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47064 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409109 () Bool)

(declare-fun e!797427 () Bool)

(assert (=> b!1409109 (= e!797427 true)))

(declare-fun lt!620597 () SeekEntryResult!10825)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96342 (_ BitVec 32)) SeekEntryResult!10825)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409109 (= lt!620597 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46514 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46514 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96343 (store (arr!46514 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47064 a!2901)) mask!2840))))

(declare-fun b!1409105 () Bool)

(assert (=> b!1409105 (= e!797426 (not e!797427))))

(declare-fun res!946824 () Bool)

(assert (=> b!1409105 (=> res!946824 e!797427)))

(declare-fun lt!620598 () SeekEntryResult!10825)

(assert (=> b!1409105 (= res!946824 (or (not (is-Intermediate!10825 lt!620598)) (undefined!11637 lt!620598)))))

(assert (=> b!1409105 e!797428))

(declare-fun res!946828 () Bool)

(assert (=> b!1409105 (=> (not res!946828) (not e!797428))))

(assert (=> b!1409105 (= res!946828 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47624 0))(
  ( (Unit!47625) )
))
(declare-fun lt!620596 () Unit!47624)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96342 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47624)

(assert (=> b!1409105 (= lt!620596 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1409105 (= lt!620598 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46514 a!2901) j!112) mask!2840) (select (arr!46514 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!946831 () Bool)

(assert (=> start!121188 (=> (not res!946831) (not e!797426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121188 (= res!946831 (validMask!0 mask!2840))))

(assert (=> start!121188 e!797426))

(assert (=> start!121188 true))

(declare-fun array_inv!35542 (array!96342) Bool)

(assert (=> start!121188 (array_inv!35542 a!2901)))

(assert (= (and start!121188 res!946831) b!1409108))

(assert (= (and b!1409108 res!946825) b!1409104))

(assert (= (and b!1409104 res!946827) b!1409107))

(assert (= (and b!1409107 res!946830) b!1409103))

(assert (= (and b!1409103 res!946829) b!1409106))

(assert (= (and b!1409106 res!946826) b!1409105))

(assert (= (and b!1409105 res!946828) b!1409102))

(assert (= (and b!1409105 (not res!946824)) b!1409109))

(declare-fun m!1298679 () Bool)

(assert (=> b!1409107 m!1298679))

(assert (=> b!1409107 m!1298679))

(declare-fun m!1298681 () Bool)

(assert (=> b!1409107 m!1298681))

(declare-fun m!1298683 () Bool)

(assert (=> b!1409106 m!1298683))

(assert (=> b!1409102 m!1298679))

(assert (=> b!1409102 m!1298679))

(declare-fun m!1298685 () Bool)

(assert (=> b!1409102 m!1298685))

(declare-fun m!1298687 () Bool)

(assert (=> start!121188 m!1298687))

(declare-fun m!1298689 () Bool)

(assert (=> start!121188 m!1298689))

(declare-fun m!1298691 () Bool)

(assert (=> b!1409103 m!1298691))

(declare-fun m!1298693 () Bool)

(assert (=> b!1409109 m!1298693))

(declare-fun m!1298695 () Bool)

(assert (=> b!1409109 m!1298695))

(assert (=> b!1409109 m!1298695))

(declare-fun m!1298697 () Bool)

(assert (=> b!1409109 m!1298697))

(assert (=> b!1409109 m!1298697))

(assert (=> b!1409109 m!1298695))

(declare-fun m!1298699 () Bool)

(assert (=> b!1409109 m!1298699))

(assert (=> b!1409105 m!1298679))

(declare-fun m!1298701 () Bool)

(assert (=> b!1409105 m!1298701))

(assert (=> b!1409105 m!1298679))

(declare-fun m!1298703 () Bool)

(assert (=> b!1409105 m!1298703))

(assert (=> b!1409105 m!1298701))

(assert (=> b!1409105 m!1298679))

(declare-fun m!1298705 () Bool)

(assert (=> b!1409105 m!1298705))

(declare-fun m!1298707 () Bool)

(assert (=> b!1409105 m!1298707))

(declare-fun m!1298709 () Bool)

(assert (=> b!1409104 m!1298709))

(assert (=> b!1409104 m!1298709))

(declare-fun m!1298711 () Bool)

(assert (=> b!1409104 m!1298711))

(push 1)

(assert (not b!1409104))

(assert (not b!1409105))

(assert (not b!1409107))

(assert (not b!1409102))

(assert (not start!121188))

(assert (not b!1409109))

(assert (not b!1409106))

(assert (not b!1409103))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

