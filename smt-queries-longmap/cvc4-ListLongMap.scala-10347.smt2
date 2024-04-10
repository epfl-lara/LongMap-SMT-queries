; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121636 () Bool)

(assert start!121636)

(declare-fun res!950147 () Bool)

(declare-fun e!799732 () Bool)

(assert (=> start!121636 (=> (not res!950147) (not e!799732))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121636 (= res!950147 (validMask!0 mask!2840))))

(assert (=> start!121636 e!799732))

(assert (=> start!121636 true))

(declare-datatypes ((array!96574 0))(
  ( (array!96575 (arr!46624 (Array (_ BitVec 32) (_ BitVec 64))) (size!47174 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96574)

(declare-fun array_inv!35652 (array!96574) Bool)

(assert (=> start!121636 (array_inv!35652 a!2901)))

(declare-fun b!1413156 () Bool)

(declare-fun lt!622839 () array!96574)

(declare-fun e!799736 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10935 0))(
  ( (MissingZero!10935 (index!46120 (_ BitVec 32))) (Found!10935 (index!46121 (_ BitVec 32))) (Intermediate!10935 (undefined!11747 Bool) (index!46122 (_ BitVec 32)) (x!127702 (_ BitVec 32))) (Undefined!10935) (MissingVacant!10935 (index!46123 (_ BitVec 32))) )
))
(declare-fun lt!622838 () SeekEntryResult!10935)

(declare-fun lt!622837 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96574 (_ BitVec 32)) SeekEntryResult!10935)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96574 (_ BitVec 32)) SeekEntryResult!10935)

(assert (=> b!1413156 (= e!799736 (= (seekEntryOrOpen!0 lt!622837 lt!622839 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127702 lt!622838) (index!46122 lt!622838) (index!46122 lt!622838) (select (arr!46624 a!2901) j!112) lt!622839 mask!2840)))))

(declare-fun b!1413157 () Bool)

(declare-fun e!799734 () Bool)

(assert (=> b!1413157 (= e!799734 true)))

(assert (=> b!1413157 e!799736))

(declare-fun res!950150 () Bool)

(assert (=> b!1413157 (=> (not res!950150) (not e!799736))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!622840 () SeekEntryResult!10935)

(assert (=> b!1413157 (= res!950150 (and (not (undefined!11747 lt!622838)) (= (index!46122 lt!622838) i!1037) (bvslt (x!127702 lt!622838) (x!127702 lt!622840)) (= (select (store (arr!46624 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46122 lt!622838)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47844 0))(
  ( (Unit!47845) )
))
(declare-fun lt!622836 () Unit!47844)

(declare-fun lt!622841 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96574 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47844)

(assert (=> b!1413157 (= lt!622836 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622841 (x!127702 lt!622840) (index!46122 lt!622840) (x!127702 lt!622838) (index!46122 lt!622838) (undefined!11747 lt!622838) mask!2840))))

(declare-fun b!1413158 () Bool)

(declare-fun res!950154 () Bool)

(assert (=> b!1413158 (=> (not res!950154) (not e!799732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413158 (= res!950154 (validKeyInArray!0 (select (arr!46624 a!2901) j!112)))))

(declare-fun b!1413159 () Bool)

(declare-fun res!950149 () Bool)

(assert (=> b!1413159 (=> (not res!950149) (not e!799732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96574 (_ BitVec 32)) Bool)

(assert (=> b!1413159 (= res!950149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413160 () Bool)

(declare-fun res!950146 () Bool)

(assert (=> b!1413160 (=> (not res!950146) (not e!799732))))

(declare-datatypes ((List!33143 0))(
  ( (Nil!33140) (Cons!33139 (h!34414 (_ BitVec 64)) (t!47837 List!33143)) )
))
(declare-fun arrayNoDuplicates!0 (array!96574 (_ BitVec 32) List!33143) Bool)

(assert (=> b!1413160 (= res!950146 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33140))))

(declare-fun b!1413161 () Bool)

(declare-fun e!799735 () Bool)

(assert (=> b!1413161 (= e!799732 (not e!799735))))

(declare-fun res!950148 () Bool)

(assert (=> b!1413161 (=> res!950148 e!799735)))

(assert (=> b!1413161 (= res!950148 (or (not (is-Intermediate!10935 lt!622840)) (undefined!11747 lt!622840)))))

(declare-fun e!799731 () Bool)

(assert (=> b!1413161 e!799731))

(declare-fun res!950151 () Bool)

(assert (=> b!1413161 (=> (not res!950151) (not e!799731))))

(assert (=> b!1413161 (= res!950151 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622842 () Unit!47844)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96574 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47844)

(assert (=> b!1413161 (= lt!622842 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96574 (_ BitVec 32)) SeekEntryResult!10935)

(assert (=> b!1413161 (= lt!622840 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622841 (select (arr!46624 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413161 (= lt!622841 (toIndex!0 (select (arr!46624 a!2901) j!112) mask!2840))))

(declare-fun b!1413162 () Bool)

(declare-fun res!950155 () Bool)

(assert (=> b!1413162 (=> (not res!950155) (not e!799732))))

(assert (=> b!1413162 (= res!950155 (validKeyInArray!0 (select (arr!46624 a!2901) i!1037)))))

(declare-fun b!1413163 () Bool)

(declare-fun res!950153 () Bool)

(assert (=> b!1413163 (=> (not res!950153) (not e!799732))))

(assert (=> b!1413163 (= res!950153 (and (= (size!47174 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47174 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47174 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413164 () Bool)

(assert (=> b!1413164 (= e!799731 (= (seekEntryOrOpen!0 (select (arr!46624 a!2901) j!112) a!2901 mask!2840) (Found!10935 j!112)))))

(declare-fun b!1413165 () Bool)

(assert (=> b!1413165 (= e!799735 e!799734)))

(declare-fun res!950152 () Bool)

(assert (=> b!1413165 (=> res!950152 e!799734)))

(assert (=> b!1413165 (= res!950152 (or (= lt!622840 lt!622838) (not (is-Intermediate!10935 lt!622838))))))

(assert (=> b!1413165 (= lt!622838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622837 mask!2840) lt!622837 lt!622839 mask!2840))))

(assert (=> b!1413165 (= lt!622837 (select (store (arr!46624 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413165 (= lt!622839 (array!96575 (store (arr!46624 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47174 a!2901)))))

(assert (= (and start!121636 res!950147) b!1413163))

(assert (= (and b!1413163 res!950153) b!1413162))

(assert (= (and b!1413162 res!950155) b!1413158))

(assert (= (and b!1413158 res!950154) b!1413159))

(assert (= (and b!1413159 res!950149) b!1413160))

(assert (= (and b!1413160 res!950146) b!1413161))

(assert (= (and b!1413161 res!950151) b!1413164))

(assert (= (and b!1413161 (not res!950148)) b!1413165))

(assert (= (and b!1413165 (not res!950152)) b!1413157))

(assert (= (and b!1413157 res!950150) b!1413156))

(declare-fun m!1303467 () Bool)

(assert (=> b!1413157 m!1303467))

(declare-fun m!1303469 () Bool)

(assert (=> b!1413157 m!1303469))

(declare-fun m!1303471 () Bool)

(assert (=> b!1413157 m!1303471))

(declare-fun m!1303473 () Bool)

(assert (=> start!121636 m!1303473))

(declare-fun m!1303475 () Bool)

(assert (=> start!121636 m!1303475))

(declare-fun m!1303477 () Bool)

(assert (=> b!1413165 m!1303477))

(assert (=> b!1413165 m!1303477))

(declare-fun m!1303479 () Bool)

(assert (=> b!1413165 m!1303479))

(assert (=> b!1413165 m!1303467))

(declare-fun m!1303481 () Bool)

(assert (=> b!1413165 m!1303481))

(declare-fun m!1303483 () Bool)

(assert (=> b!1413160 m!1303483))

(declare-fun m!1303485 () Bool)

(assert (=> b!1413159 m!1303485))

(declare-fun m!1303487 () Bool)

(assert (=> b!1413158 m!1303487))

(assert (=> b!1413158 m!1303487))

(declare-fun m!1303489 () Bool)

(assert (=> b!1413158 m!1303489))

(declare-fun m!1303491 () Bool)

(assert (=> b!1413156 m!1303491))

(assert (=> b!1413156 m!1303487))

(assert (=> b!1413156 m!1303487))

(declare-fun m!1303493 () Bool)

(assert (=> b!1413156 m!1303493))

(assert (=> b!1413161 m!1303487))

(declare-fun m!1303495 () Bool)

(assert (=> b!1413161 m!1303495))

(assert (=> b!1413161 m!1303487))

(declare-fun m!1303497 () Bool)

(assert (=> b!1413161 m!1303497))

(declare-fun m!1303499 () Bool)

(assert (=> b!1413161 m!1303499))

(assert (=> b!1413161 m!1303487))

(declare-fun m!1303501 () Bool)

(assert (=> b!1413161 m!1303501))

(declare-fun m!1303503 () Bool)

(assert (=> b!1413162 m!1303503))

(assert (=> b!1413162 m!1303503))

(declare-fun m!1303505 () Bool)

(assert (=> b!1413162 m!1303505))

(assert (=> b!1413164 m!1303487))

(assert (=> b!1413164 m!1303487))

(declare-fun m!1303507 () Bool)

(assert (=> b!1413164 m!1303507))

(push 1)

