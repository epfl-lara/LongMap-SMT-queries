; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121332 () Bool)

(assert start!121332)

(declare-fun b!1409714 () Bool)

(declare-fun e!797900 () Bool)

(assert (=> b!1409714 (= e!797900 true)))

(declare-datatypes ((SeekEntryResult!10759 0))(
  ( (MissingZero!10759 (index!45413 (_ BitVec 32))) (Found!10759 (index!45414 (_ BitVec 32))) (Intermediate!10759 (undefined!11571 Bool) (index!45415 (_ BitVec 32)) (x!127163 (_ BitVec 32))) (Undefined!10759) (MissingVacant!10759 (index!45416 (_ BitVec 32))) )
))
(declare-fun lt!620797 () SeekEntryResult!10759)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96408 0))(
  ( (array!96409 (arr!46545 (Array (_ BitVec 32) (_ BitVec 64))) (size!47096 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96408)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96408 (_ BitVec 32)) SeekEntryResult!10759)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409714 (= lt!620797 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96409 (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47096 a!2901)) mask!2840))))

(declare-fun res!946753 () Bool)

(declare-fun e!797903 () Bool)

(assert (=> start!121332 (=> (not res!946753) (not e!797903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121332 (= res!946753 (validMask!0 mask!2840))))

(assert (=> start!121332 e!797903))

(assert (=> start!121332 true))

(declare-fun array_inv!35826 (array!96408) Bool)

(assert (=> start!121332 (array_inv!35826 a!2901)))

(declare-fun b!1409715 () Bool)

(declare-fun res!946757 () Bool)

(assert (=> b!1409715 (=> (not res!946757) (not e!797903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409715 (= res!946757 (validKeyInArray!0 (select (arr!46545 a!2901) j!112)))))

(declare-fun b!1409716 () Bool)

(assert (=> b!1409716 (= e!797903 (not e!797900))))

(declare-fun res!946755 () Bool)

(assert (=> b!1409716 (=> res!946755 e!797900)))

(declare-fun lt!620798 () SeekEntryResult!10759)

(assert (=> b!1409716 (= res!946755 (or (not (is-Intermediate!10759 lt!620798)) (undefined!11571 lt!620798)))))

(declare-fun e!797902 () Bool)

(assert (=> b!1409716 e!797902))

(declare-fun res!946754 () Bool)

(assert (=> b!1409716 (=> (not res!946754) (not e!797902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96408 (_ BitVec 32)) Bool)

(assert (=> b!1409716 (= res!946754 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47519 0))(
  ( (Unit!47520) )
))
(declare-fun lt!620796 () Unit!47519)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96408 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47519)

(assert (=> b!1409716 (= lt!620796 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1409716 (= lt!620798 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46545 a!2901) j!112) mask!2840) (select (arr!46545 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409717 () Bool)

(declare-fun res!946759 () Bool)

(assert (=> b!1409717 (=> (not res!946759) (not e!797903))))

(declare-datatypes ((List!33051 0))(
  ( (Nil!33048) (Cons!33047 (h!34318 (_ BitVec 64)) (t!47737 List!33051)) )
))
(declare-fun arrayNoDuplicates!0 (array!96408 (_ BitVec 32) List!33051) Bool)

(assert (=> b!1409717 (= res!946759 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33048))))

(declare-fun b!1409718 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96408 (_ BitVec 32)) SeekEntryResult!10759)

(assert (=> b!1409718 (= e!797902 (= (seekEntryOrOpen!0 (select (arr!46545 a!2901) j!112) a!2901 mask!2840) (Found!10759 j!112)))))

(declare-fun b!1409719 () Bool)

(declare-fun res!946758 () Bool)

(assert (=> b!1409719 (=> (not res!946758) (not e!797903))))

(assert (=> b!1409719 (= res!946758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409720 () Bool)

(declare-fun res!946752 () Bool)

(assert (=> b!1409720 (=> (not res!946752) (not e!797903))))

(assert (=> b!1409720 (= res!946752 (validKeyInArray!0 (select (arr!46545 a!2901) i!1037)))))

(declare-fun b!1409721 () Bool)

(declare-fun res!946756 () Bool)

(assert (=> b!1409721 (=> (not res!946756) (not e!797903))))

(assert (=> b!1409721 (= res!946756 (and (= (size!47096 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47096 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47096 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121332 res!946753) b!1409721))

(assert (= (and b!1409721 res!946756) b!1409720))

(assert (= (and b!1409720 res!946752) b!1409715))

(assert (= (and b!1409715 res!946757) b!1409719))

(assert (= (and b!1409719 res!946758) b!1409717))

(assert (= (and b!1409717 res!946759) b!1409716))

(assert (= (and b!1409716 res!946754) b!1409718))

(assert (= (and b!1409716 (not res!946755)) b!1409714))

(declare-fun m!1299303 () Bool)

(assert (=> start!121332 m!1299303))

(declare-fun m!1299305 () Bool)

(assert (=> start!121332 m!1299305))

(declare-fun m!1299307 () Bool)

(assert (=> b!1409714 m!1299307))

(declare-fun m!1299309 () Bool)

(assert (=> b!1409714 m!1299309))

(assert (=> b!1409714 m!1299309))

(declare-fun m!1299311 () Bool)

(assert (=> b!1409714 m!1299311))

(assert (=> b!1409714 m!1299311))

(assert (=> b!1409714 m!1299309))

(declare-fun m!1299313 () Bool)

(assert (=> b!1409714 m!1299313))

(declare-fun m!1299315 () Bool)

(assert (=> b!1409719 m!1299315))

(declare-fun m!1299317 () Bool)

(assert (=> b!1409716 m!1299317))

(declare-fun m!1299319 () Bool)

(assert (=> b!1409716 m!1299319))

(assert (=> b!1409716 m!1299317))

(declare-fun m!1299321 () Bool)

(assert (=> b!1409716 m!1299321))

(assert (=> b!1409716 m!1299319))

(assert (=> b!1409716 m!1299317))

(declare-fun m!1299323 () Bool)

(assert (=> b!1409716 m!1299323))

(declare-fun m!1299325 () Bool)

(assert (=> b!1409716 m!1299325))

(assert (=> b!1409715 m!1299317))

(assert (=> b!1409715 m!1299317))

(declare-fun m!1299327 () Bool)

(assert (=> b!1409715 m!1299327))

(declare-fun m!1299329 () Bool)

(assert (=> b!1409717 m!1299329))

(assert (=> b!1409718 m!1299317))

(assert (=> b!1409718 m!1299317))

(declare-fun m!1299331 () Bool)

(assert (=> b!1409718 m!1299331))

(declare-fun m!1299333 () Bool)

(assert (=> b!1409720 m!1299333))

(assert (=> b!1409720 m!1299333))

(declare-fun m!1299335 () Bool)

(assert (=> b!1409720 m!1299335))

(push 1)

(assert (not b!1409717))

(assert (not b!1409718))

(assert (not b!1409720))

(assert (not start!121332))

(assert (not b!1409716))

(assert (not b!1409715))

(assert (not b!1409719))

(assert (not b!1409714))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

