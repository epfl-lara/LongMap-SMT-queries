; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121186 () Bool)

(assert start!121186)

(declare-fun b!1409078 () Bool)

(declare-fun res!946801 () Bool)

(declare-fun e!797417 () Bool)

(assert (=> b!1409078 (=> (not res!946801) (not e!797417))))

(declare-datatypes ((array!96340 0))(
  ( (array!96341 (arr!46513 (Array (_ BitVec 32) (_ BitVec 64))) (size!47063 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96340)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409078 (= res!946801 (validKeyInArray!0 (select (arr!46513 a!2901) j!112)))))

(declare-fun res!946806 () Bool)

(assert (=> start!121186 (=> (not res!946806) (not e!797417))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121186 (= res!946806 (validMask!0 mask!2840))))

(assert (=> start!121186 e!797417))

(assert (=> start!121186 true))

(declare-fun array_inv!35541 (array!96340) Bool)

(assert (=> start!121186 (array_inv!35541 a!2901)))

(declare-fun b!1409079 () Bool)

(declare-fun e!797414 () Bool)

(assert (=> b!1409079 (= e!797414 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10824 0))(
  ( (MissingZero!10824 (index!45673 (_ BitVec 32))) (Found!10824 (index!45674 (_ BitVec 32))) (Intermediate!10824 (undefined!11636 Bool) (index!45675 (_ BitVec 32)) (x!127265 (_ BitVec 32))) (Undefined!10824) (MissingVacant!10824 (index!45676 (_ BitVec 32))) )
))
(declare-fun lt!620589 () SeekEntryResult!10824)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96340 (_ BitVec 32)) SeekEntryResult!10824)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409079 (= lt!620589 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96341 (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47063 a!2901)) mask!2840))))

(declare-fun b!1409080 () Bool)

(declare-fun res!946803 () Bool)

(assert (=> b!1409080 (=> (not res!946803) (not e!797417))))

(declare-datatypes ((List!33032 0))(
  ( (Nil!33029) (Cons!33028 (h!34291 (_ BitVec 64)) (t!47726 List!33032)) )
))
(declare-fun arrayNoDuplicates!0 (array!96340 (_ BitVec 32) List!33032) Bool)

(assert (=> b!1409080 (= res!946803 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33029))))

(declare-fun b!1409081 () Bool)

(declare-fun res!946807 () Bool)

(assert (=> b!1409081 (=> (not res!946807) (not e!797417))))

(assert (=> b!1409081 (= res!946807 (validKeyInArray!0 (select (arr!46513 a!2901) i!1037)))))

(declare-fun b!1409082 () Bool)

(declare-fun e!797415 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96340 (_ BitVec 32)) SeekEntryResult!10824)

(assert (=> b!1409082 (= e!797415 (= (seekEntryOrOpen!0 (select (arr!46513 a!2901) j!112) a!2901 mask!2840) (Found!10824 j!112)))))

(declare-fun b!1409083 () Bool)

(assert (=> b!1409083 (= e!797417 (not e!797414))))

(declare-fun res!946802 () Bool)

(assert (=> b!1409083 (=> res!946802 e!797414)))

(declare-fun lt!620587 () SeekEntryResult!10824)

(assert (=> b!1409083 (= res!946802 (or (not (is-Intermediate!10824 lt!620587)) (undefined!11636 lt!620587)))))

(assert (=> b!1409083 e!797415))

(declare-fun res!946804 () Bool)

(assert (=> b!1409083 (=> (not res!946804) (not e!797415))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96340 (_ BitVec 32)) Bool)

(assert (=> b!1409083 (= res!946804 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47622 0))(
  ( (Unit!47623) )
))
(declare-fun lt!620588 () Unit!47622)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96340 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47622)

(assert (=> b!1409083 (= lt!620588 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1409083 (= lt!620587 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46513 a!2901) j!112) mask!2840) (select (arr!46513 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409084 () Bool)

(declare-fun res!946805 () Bool)

(assert (=> b!1409084 (=> (not res!946805) (not e!797417))))

(assert (=> b!1409084 (= res!946805 (and (= (size!47063 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47063 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47063 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409085 () Bool)

(declare-fun res!946800 () Bool)

(assert (=> b!1409085 (=> (not res!946800) (not e!797417))))

(assert (=> b!1409085 (= res!946800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121186 res!946806) b!1409084))

(assert (= (and b!1409084 res!946805) b!1409081))

(assert (= (and b!1409081 res!946807) b!1409078))

(assert (= (and b!1409078 res!946801) b!1409085))

(assert (= (and b!1409085 res!946800) b!1409080))

(assert (= (and b!1409080 res!946803) b!1409083))

(assert (= (and b!1409083 res!946804) b!1409082))

(assert (= (and b!1409083 (not res!946802)) b!1409079))

(declare-fun m!1298645 () Bool)

(assert (=> b!1409080 m!1298645))

(declare-fun m!1298647 () Bool)

(assert (=> b!1409082 m!1298647))

(assert (=> b!1409082 m!1298647))

(declare-fun m!1298649 () Bool)

(assert (=> b!1409082 m!1298649))

(assert (=> b!1409083 m!1298647))

(declare-fun m!1298651 () Bool)

(assert (=> b!1409083 m!1298651))

(assert (=> b!1409083 m!1298647))

(declare-fun m!1298653 () Bool)

(assert (=> b!1409083 m!1298653))

(assert (=> b!1409083 m!1298651))

(assert (=> b!1409083 m!1298647))

(declare-fun m!1298655 () Bool)

(assert (=> b!1409083 m!1298655))

(declare-fun m!1298657 () Bool)

(assert (=> b!1409083 m!1298657))

(declare-fun m!1298659 () Bool)

(assert (=> b!1409081 m!1298659))

(assert (=> b!1409081 m!1298659))

(declare-fun m!1298661 () Bool)

(assert (=> b!1409081 m!1298661))

(declare-fun m!1298663 () Bool)

(assert (=> b!1409085 m!1298663))

(declare-fun m!1298665 () Bool)

(assert (=> b!1409079 m!1298665))

(declare-fun m!1298667 () Bool)

(assert (=> b!1409079 m!1298667))

(assert (=> b!1409079 m!1298667))

(declare-fun m!1298669 () Bool)

(assert (=> b!1409079 m!1298669))

(assert (=> b!1409079 m!1298669))

(assert (=> b!1409079 m!1298667))

(declare-fun m!1298671 () Bool)

(assert (=> b!1409079 m!1298671))

(assert (=> b!1409078 m!1298647))

(assert (=> b!1409078 m!1298647))

(declare-fun m!1298673 () Bool)

(assert (=> b!1409078 m!1298673))

(declare-fun m!1298675 () Bool)

(assert (=> start!121186 m!1298675))

(declare-fun m!1298677 () Bool)

(assert (=> start!121186 m!1298677))

(push 1)

(assert (not b!1409080))

(assert (not start!121186))

(assert (not b!1409078))

(assert (not b!1409082))

(assert (not b!1409083))

(assert (not b!1409085))

(assert (not b!1409079))

(assert (not b!1409081))

(check-sat)

(pop 1)

(push 1)

(check-sat)

