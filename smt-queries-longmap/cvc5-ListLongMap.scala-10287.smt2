; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120882 () Bool)

(assert start!120882)

(declare-fun b!1406528 () Bool)

(declare-fun res!944748 () Bool)

(declare-fun e!796085 () Bool)

(assert (=> b!1406528 (=> (not res!944748) (not e!796085))))

(declare-datatypes ((array!96189 0))(
  ( (array!96190 (arr!46442 (Array (_ BitVec 32) (_ BitVec 64))) (size!46992 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96189)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406528 (= res!944748 (validKeyInArray!0 (select (arr!46442 a!2901) i!1037)))))

(declare-fun b!1406529 () Bool)

(declare-fun res!944745 () Bool)

(assert (=> b!1406529 (=> (not res!944745) (not e!796085))))

(declare-datatypes ((List!32961 0))(
  ( (Nil!32958) (Cons!32957 (h!34211 (_ BitVec 64)) (t!47655 List!32961)) )
))
(declare-fun arrayNoDuplicates!0 (array!96189 (_ BitVec 32) List!32961) Bool)

(assert (=> b!1406529 (= res!944745 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32958))))

(declare-fun b!1406530 () Bool)

(declare-fun e!796088 () Bool)

(assert (=> b!1406530 (= e!796088 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10753 0))(
  ( (MissingZero!10753 (index!45389 (_ BitVec 32))) (Found!10753 (index!45390 (_ BitVec 32))) (Intermediate!10753 (undefined!11565 Bool) (index!45391 (_ BitVec 32)) (x!126992 (_ BitVec 32))) (Undefined!10753) (MissingVacant!10753 (index!45392 (_ BitVec 32))) )
))
(declare-fun lt!619419 () SeekEntryResult!10753)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96189 (_ BitVec 32)) SeekEntryResult!10753)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406530 (= lt!619419 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46442 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46442 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96190 (store (arr!46442 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46992 a!2901)) mask!2840))))

(declare-fun b!1406531 () Bool)

(declare-fun res!944746 () Bool)

(assert (=> b!1406531 (=> (not res!944746) (not e!796085))))

(assert (=> b!1406531 (= res!944746 (and (= (size!46992 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46992 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46992 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406532 () Bool)

(declare-fun res!944750 () Bool)

(assert (=> b!1406532 (=> (not res!944750) (not e!796085))))

(assert (=> b!1406532 (= res!944750 (validKeyInArray!0 (select (arr!46442 a!2901) j!112)))))

(declare-fun b!1406534 () Bool)

(declare-fun res!944752 () Bool)

(assert (=> b!1406534 (=> (not res!944752) (not e!796085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96189 (_ BitVec 32)) Bool)

(assert (=> b!1406534 (= res!944752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!796087 () Bool)

(declare-fun b!1406535 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96189 (_ BitVec 32)) SeekEntryResult!10753)

(assert (=> b!1406535 (= e!796087 (= (seekEntryOrOpen!0 (select (arr!46442 a!2901) j!112) a!2901 mask!2840) (Found!10753 j!112)))))

(declare-fun b!1406533 () Bool)

(assert (=> b!1406533 (= e!796085 (not e!796088))))

(declare-fun res!944749 () Bool)

(assert (=> b!1406533 (=> res!944749 e!796088)))

(declare-fun lt!619417 () SeekEntryResult!10753)

(assert (=> b!1406533 (= res!944749 (or (not (is-Intermediate!10753 lt!619417)) (undefined!11565 lt!619417)))))

(assert (=> b!1406533 e!796087))

(declare-fun res!944747 () Bool)

(assert (=> b!1406533 (=> (not res!944747) (not e!796087))))

(assert (=> b!1406533 (= res!944747 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47480 0))(
  ( (Unit!47481) )
))
(declare-fun lt!619418 () Unit!47480)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96189 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47480)

(assert (=> b!1406533 (= lt!619418 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406533 (= lt!619417 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46442 a!2901) j!112) mask!2840) (select (arr!46442 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!944751 () Bool)

(assert (=> start!120882 (=> (not res!944751) (not e!796085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120882 (= res!944751 (validMask!0 mask!2840))))

(assert (=> start!120882 e!796085))

(assert (=> start!120882 true))

(declare-fun array_inv!35470 (array!96189) Bool)

(assert (=> start!120882 (array_inv!35470 a!2901)))

(assert (= (and start!120882 res!944751) b!1406531))

(assert (= (and b!1406531 res!944746) b!1406528))

(assert (= (and b!1406528 res!944748) b!1406532))

(assert (= (and b!1406532 res!944750) b!1406534))

(assert (= (and b!1406534 res!944752) b!1406529))

(assert (= (and b!1406529 res!944745) b!1406533))

(assert (= (and b!1406533 res!944747) b!1406535))

(assert (= (and b!1406533 (not res!944749)) b!1406530))

(declare-fun m!1295709 () Bool)

(assert (=> b!1406533 m!1295709))

(declare-fun m!1295711 () Bool)

(assert (=> b!1406533 m!1295711))

(assert (=> b!1406533 m!1295709))

(declare-fun m!1295713 () Bool)

(assert (=> b!1406533 m!1295713))

(assert (=> b!1406533 m!1295711))

(assert (=> b!1406533 m!1295709))

(declare-fun m!1295715 () Bool)

(assert (=> b!1406533 m!1295715))

(declare-fun m!1295717 () Bool)

(assert (=> b!1406533 m!1295717))

(declare-fun m!1295719 () Bool)

(assert (=> b!1406529 m!1295719))

(declare-fun m!1295721 () Bool)

(assert (=> b!1406534 m!1295721))

(assert (=> b!1406532 m!1295709))

(assert (=> b!1406532 m!1295709))

(declare-fun m!1295723 () Bool)

(assert (=> b!1406532 m!1295723))

(declare-fun m!1295725 () Bool)

(assert (=> b!1406530 m!1295725))

(declare-fun m!1295727 () Bool)

(assert (=> b!1406530 m!1295727))

(assert (=> b!1406530 m!1295727))

(declare-fun m!1295729 () Bool)

(assert (=> b!1406530 m!1295729))

(assert (=> b!1406530 m!1295729))

(assert (=> b!1406530 m!1295727))

(declare-fun m!1295731 () Bool)

(assert (=> b!1406530 m!1295731))

(declare-fun m!1295733 () Bool)

(assert (=> start!120882 m!1295733))

(declare-fun m!1295735 () Bool)

(assert (=> start!120882 m!1295735))

(declare-fun m!1295737 () Bool)

(assert (=> b!1406528 m!1295737))

(assert (=> b!1406528 m!1295737))

(declare-fun m!1295739 () Bool)

(assert (=> b!1406528 m!1295739))

(assert (=> b!1406535 m!1295709))

(assert (=> b!1406535 m!1295709))

(declare-fun m!1295741 () Bool)

(assert (=> b!1406535 m!1295741))

(push 1)

(assert (not b!1406534))

(assert (not b!1406533))

(assert (not start!120882))

(assert (not b!1406529))

(assert (not b!1406530))

(assert (not b!1406535))

(assert (not b!1406528))

(assert (not b!1406532))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

