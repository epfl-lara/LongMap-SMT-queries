; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121620 () Bool)

(assert start!121620)

(declare-fun b!1412916 () Bool)

(declare-fun res!949912 () Bool)

(declare-fun e!799590 () Bool)

(assert (=> b!1412916 (=> (not res!949912) (not e!799590))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96558 0))(
  ( (array!96559 (arr!46616 (Array (_ BitVec 32) (_ BitVec 64))) (size!47166 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96558)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1412916 (= res!949912 (and (= (size!47166 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47166 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47166 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412917 () Bool)

(declare-fun e!799591 () Bool)

(assert (=> b!1412917 (= e!799591 true)))

(declare-fun e!799592 () Bool)

(assert (=> b!1412917 e!799592))

(declare-fun res!949909 () Bool)

(assert (=> b!1412917 (=> (not res!949909) (not e!799592))))

(declare-datatypes ((SeekEntryResult!10927 0))(
  ( (MissingZero!10927 (index!46088 (_ BitVec 32))) (Found!10927 (index!46089 (_ BitVec 32))) (Intermediate!10927 (undefined!11739 Bool) (index!46090 (_ BitVec 32)) (x!127678 (_ BitVec 32))) (Undefined!10927) (MissingVacant!10927 (index!46091 (_ BitVec 32))) )
))
(declare-fun lt!622673 () SeekEntryResult!10927)

(declare-fun lt!622672 () SeekEntryResult!10927)

(assert (=> b!1412917 (= res!949909 (and (not (undefined!11739 lt!622673)) (= (index!46090 lt!622673) i!1037) (bvslt (x!127678 lt!622673) (x!127678 lt!622672)) (= (select (store (arr!46616 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46090 lt!622673)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622670 () (_ BitVec 32))

(declare-datatypes ((Unit!47828 0))(
  ( (Unit!47829) )
))
(declare-fun lt!622674 () Unit!47828)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96558 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47828)

(assert (=> b!1412917 (= lt!622674 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622670 (x!127678 lt!622672) (index!46090 lt!622672) (x!127678 lt!622673) (index!46090 lt!622673) (undefined!11739 lt!622673) mask!2840))))

(declare-fun b!1412918 () Bool)

(declare-fun res!949915 () Bool)

(assert (=> b!1412918 (=> (not res!949915) (not e!799590))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412918 (= res!949915 (validKeyInArray!0 (select (arr!46616 a!2901) j!112)))))

(declare-fun res!949906 () Bool)

(assert (=> start!121620 (=> (not res!949906) (not e!799590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121620 (= res!949906 (validMask!0 mask!2840))))

(assert (=> start!121620 e!799590))

(assert (=> start!121620 true))

(declare-fun array_inv!35644 (array!96558) Bool)

(assert (=> start!121620 (array_inv!35644 a!2901)))

(declare-fun lt!622669 () (_ BitVec 64))

(declare-fun lt!622668 () array!96558)

(declare-fun b!1412919 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96558 (_ BitVec 32)) SeekEntryResult!10927)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96558 (_ BitVec 32)) SeekEntryResult!10927)

(assert (=> b!1412919 (= e!799592 (= (seekEntryOrOpen!0 lt!622669 lt!622668 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127678 lt!622673) (index!46090 lt!622673) (index!46090 lt!622673) (select (arr!46616 a!2901) j!112) lt!622668 mask!2840)))))

(declare-fun b!1412920 () Bool)

(declare-fun e!799588 () Bool)

(assert (=> b!1412920 (= e!799590 (not e!799588))))

(declare-fun res!949914 () Bool)

(assert (=> b!1412920 (=> res!949914 e!799588)))

(assert (=> b!1412920 (= res!949914 (or (not (is-Intermediate!10927 lt!622672)) (undefined!11739 lt!622672)))))

(declare-fun e!799587 () Bool)

(assert (=> b!1412920 e!799587))

(declare-fun res!949910 () Bool)

(assert (=> b!1412920 (=> (not res!949910) (not e!799587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96558 (_ BitVec 32)) Bool)

(assert (=> b!1412920 (= res!949910 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622671 () Unit!47828)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96558 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47828)

(assert (=> b!1412920 (= lt!622671 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96558 (_ BitVec 32)) SeekEntryResult!10927)

(assert (=> b!1412920 (= lt!622672 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622670 (select (arr!46616 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412920 (= lt!622670 (toIndex!0 (select (arr!46616 a!2901) j!112) mask!2840))))

(declare-fun b!1412921 () Bool)

(assert (=> b!1412921 (= e!799588 e!799591)))

(declare-fun res!949913 () Bool)

(assert (=> b!1412921 (=> res!949913 e!799591)))

(assert (=> b!1412921 (= res!949913 (or (= lt!622672 lt!622673) (not (is-Intermediate!10927 lt!622673))))))

(assert (=> b!1412921 (= lt!622673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622669 mask!2840) lt!622669 lt!622668 mask!2840))))

(assert (=> b!1412921 (= lt!622669 (select (store (arr!46616 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412921 (= lt!622668 (array!96559 (store (arr!46616 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47166 a!2901)))))

(declare-fun b!1412922 () Bool)

(declare-fun res!949907 () Bool)

(assert (=> b!1412922 (=> (not res!949907) (not e!799590))))

(declare-datatypes ((List!33135 0))(
  ( (Nil!33132) (Cons!33131 (h!34406 (_ BitVec 64)) (t!47829 List!33135)) )
))
(declare-fun arrayNoDuplicates!0 (array!96558 (_ BitVec 32) List!33135) Bool)

(assert (=> b!1412922 (= res!949907 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33132))))

(declare-fun b!1412923 () Bool)

(assert (=> b!1412923 (= e!799587 (= (seekEntryOrOpen!0 (select (arr!46616 a!2901) j!112) a!2901 mask!2840) (Found!10927 j!112)))))

(declare-fun b!1412924 () Bool)

(declare-fun res!949911 () Bool)

(assert (=> b!1412924 (=> (not res!949911) (not e!799590))))

(assert (=> b!1412924 (= res!949911 (validKeyInArray!0 (select (arr!46616 a!2901) i!1037)))))

(declare-fun b!1412925 () Bool)

(declare-fun res!949908 () Bool)

(assert (=> b!1412925 (=> (not res!949908) (not e!799590))))

(assert (=> b!1412925 (= res!949908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121620 res!949906) b!1412916))

(assert (= (and b!1412916 res!949912) b!1412924))

(assert (= (and b!1412924 res!949911) b!1412918))

(assert (= (and b!1412918 res!949915) b!1412925))

(assert (= (and b!1412925 res!949908) b!1412922))

(assert (= (and b!1412922 res!949907) b!1412920))

(assert (= (and b!1412920 res!949910) b!1412923))

(assert (= (and b!1412920 (not res!949914)) b!1412921))

(assert (= (and b!1412921 (not res!949913)) b!1412917))

(assert (= (and b!1412917 res!949909) b!1412919))

(declare-fun m!1303131 () Bool)

(assert (=> b!1412922 m!1303131))

(declare-fun m!1303133 () Bool)

(assert (=> b!1412920 m!1303133))

(declare-fun m!1303135 () Bool)

(assert (=> b!1412920 m!1303135))

(assert (=> b!1412920 m!1303133))

(declare-fun m!1303137 () Bool)

(assert (=> b!1412920 m!1303137))

(declare-fun m!1303139 () Bool)

(assert (=> b!1412920 m!1303139))

(assert (=> b!1412920 m!1303133))

(declare-fun m!1303141 () Bool)

(assert (=> b!1412920 m!1303141))

(declare-fun m!1303143 () Bool)

(assert (=> start!121620 m!1303143))

(declare-fun m!1303145 () Bool)

(assert (=> start!121620 m!1303145))

(declare-fun m!1303147 () Bool)

(assert (=> b!1412925 m!1303147))

(declare-fun m!1303149 () Bool)

(assert (=> b!1412919 m!1303149))

(assert (=> b!1412919 m!1303133))

(assert (=> b!1412919 m!1303133))

(declare-fun m!1303151 () Bool)

(assert (=> b!1412919 m!1303151))

(assert (=> b!1412923 m!1303133))

(assert (=> b!1412923 m!1303133))

(declare-fun m!1303153 () Bool)

(assert (=> b!1412923 m!1303153))

(declare-fun m!1303155 () Bool)

(assert (=> b!1412917 m!1303155))

(declare-fun m!1303157 () Bool)

(assert (=> b!1412917 m!1303157))

(declare-fun m!1303159 () Bool)

(assert (=> b!1412917 m!1303159))

(assert (=> b!1412918 m!1303133))

(assert (=> b!1412918 m!1303133))

(declare-fun m!1303161 () Bool)

(assert (=> b!1412918 m!1303161))

(declare-fun m!1303163 () Bool)

(assert (=> b!1412921 m!1303163))

(assert (=> b!1412921 m!1303163))

(declare-fun m!1303165 () Bool)

(assert (=> b!1412921 m!1303165))

(assert (=> b!1412921 m!1303155))

(declare-fun m!1303167 () Bool)

(assert (=> b!1412921 m!1303167))

(declare-fun m!1303169 () Bool)

(assert (=> b!1412924 m!1303169))

(assert (=> b!1412924 m!1303169))

(declare-fun m!1303171 () Bool)

(assert (=> b!1412924 m!1303171))

(push 1)

