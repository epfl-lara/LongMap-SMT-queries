; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120726 () Bool)

(assert start!120726)

(declare-fun b!1404714 () Bool)

(declare-fun res!942542 () Bool)

(declare-fun e!795446 () Bool)

(assert (=> b!1404714 (=> (not res!942542) (not e!795446))))

(declare-datatypes ((array!96057 0))(
  ( (array!96058 (arr!46377 (Array (_ BitVec 32) (_ BitVec 64))) (size!46928 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96057)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404714 (= res!942542 (validKeyInArray!0 (select (arr!46377 a!2901) i!1037)))))

(declare-fun b!1404715 () Bool)

(declare-fun res!942543 () Bool)

(assert (=> b!1404715 (=> (not res!942543) (not e!795446))))

(declare-datatypes ((List!32883 0))(
  ( (Nil!32880) (Cons!32879 (h!34135 (_ BitVec 64)) (t!47569 List!32883)) )
))
(declare-fun arrayNoDuplicates!0 (array!96057 (_ BitVec 32) List!32883) Bool)

(assert (=> b!1404715 (= res!942543 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32880))))

(declare-fun b!1404716 () Bool)

(declare-fun res!942546 () Bool)

(assert (=> b!1404716 (=> (not res!942546) (not e!795446))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1404716 (= res!942546 (and (= (size!46928 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46928 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46928 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404717 () Bool)

(declare-fun res!942545 () Bool)

(assert (=> b!1404717 (=> (not res!942545) (not e!795446))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96057 (_ BitVec 32)) Bool)

(assert (=> b!1404717 (= res!942545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!942541 () Bool)

(assert (=> start!120726 (=> (not res!942541) (not e!795446))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120726 (= res!942541 (validMask!0 mask!2840))))

(assert (=> start!120726 e!795446))

(assert (=> start!120726 true))

(declare-fun array_inv!35658 (array!96057) Bool)

(assert (=> start!120726 (array_inv!35658 a!2901)))

(declare-fun e!795444 () Bool)

(declare-fun b!1404718 () Bool)

(declare-datatypes ((SeekEntryResult!10597 0))(
  ( (MissingZero!10597 (index!44765 (_ BitVec 32))) (Found!10597 (index!44766 (_ BitVec 32))) (Intermediate!10597 (undefined!11409 Bool) (index!44767 (_ BitVec 32)) (x!126523 (_ BitVec 32))) (Undefined!10597) (MissingVacant!10597 (index!44768 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96057 (_ BitVec 32)) SeekEntryResult!10597)

(assert (=> b!1404718 (= e!795444 (= (seekEntryOrOpen!0 (select (arr!46377 a!2901) j!112) a!2901 mask!2840) (Found!10597 j!112)))))

(declare-fun b!1404719 () Bool)

(declare-fun res!942544 () Bool)

(assert (=> b!1404719 (=> (not res!942544) (not e!795446))))

(assert (=> b!1404719 (= res!942544 (validKeyInArray!0 (select (arr!46377 a!2901) j!112)))))

(declare-fun b!1404720 () Bool)

(assert (=> b!1404720 (= e!795446 (not true))))

(assert (=> b!1404720 e!795444))

(declare-fun res!942547 () Bool)

(assert (=> b!1404720 (=> (not res!942547) (not e!795444))))

(assert (=> b!1404720 (= res!942547 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47225 0))(
  ( (Unit!47226) )
))
(declare-fun lt!618845 () Unit!47225)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96057 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47225)

(assert (=> b!1404720 (= lt!618845 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618844 () SeekEntryResult!10597)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96057 (_ BitVec 32)) SeekEntryResult!10597)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404720 (= lt!618844 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46377 a!2901) j!112) mask!2840) (select (arr!46377 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120726 res!942541) b!1404716))

(assert (= (and b!1404716 res!942546) b!1404714))

(assert (= (and b!1404714 res!942542) b!1404719))

(assert (= (and b!1404719 res!942544) b!1404717))

(assert (= (and b!1404717 res!942545) b!1404715))

(assert (= (and b!1404715 res!942543) b!1404720))

(assert (= (and b!1404720 res!942547) b!1404718))

(declare-fun m!1293635 () Bool)

(assert (=> b!1404718 m!1293635))

(assert (=> b!1404718 m!1293635))

(declare-fun m!1293637 () Bool)

(assert (=> b!1404718 m!1293637))

(declare-fun m!1293639 () Bool)

(assert (=> b!1404715 m!1293639))

(declare-fun m!1293641 () Bool)

(assert (=> start!120726 m!1293641))

(declare-fun m!1293643 () Bool)

(assert (=> start!120726 m!1293643))

(declare-fun m!1293645 () Bool)

(assert (=> b!1404714 m!1293645))

(assert (=> b!1404714 m!1293645))

(declare-fun m!1293647 () Bool)

(assert (=> b!1404714 m!1293647))

(assert (=> b!1404720 m!1293635))

(declare-fun m!1293649 () Bool)

(assert (=> b!1404720 m!1293649))

(assert (=> b!1404720 m!1293635))

(declare-fun m!1293651 () Bool)

(assert (=> b!1404720 m!1293651))

(assert (=> b!1404720 m!1293649))

(assert (=> b!1404720 m!1293635))

(declare-fun m!1293653 () Bool)

(assert (=> b!1404720 m!1293653))

(declare-fun m!1293655 () Bool)

(assert (=> b!1404720 m!1293655))

(declare-fun m!1293657 () Bool)

(assert (=> b!1404717 m!1293657))

(assert (=> b!1404719 m!1293635))

(assert (=> b!1404719 m!1293635))

(declare-fun m!1293659 () Bool)

(assert (=> b!1404719 m!1293659))

(push 1)

(assert (not b!1404717))

(assert (not b!1404715))

(assert (not b!1404720))

(assert (not b!1404718))

(assert (not start!120726))

(assert (not b!1404714))

(assert (not b!1404719))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

