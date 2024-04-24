; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121826 () Bool)

(assert start!121826)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96686 0))(
  ( (array!96687 (arr!46678 (Array (_ BitVec 32) (_ BitVec 64))) (size!47229 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96686)

(declare-fun e!800488 () Bool)

(declare-fun b!1414326 () Bool)

(declare-datatypes ((SeekEntryResult!10892 0))(
  ( (MissingZero!10892 (index!45948 (_ BitVec 32))) (Found!10892 (index!45949 (_ BitVec 32))) (Intermediate!10892 (undefined!11704 Bool) (index!45950 (_ BitVec 32)) (x!127686 (_ BitVec 32))) (Undefined!10892) (MissingVacant!10892 (index!45951 (_ BitVec 32))) )
))
(declare-fun lt!623257 () SeekEntryResult!10892)

(declare-fun lt!623259 () array!96686)

(declare-fun lt!623255 () (_ BitVec 64))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96686 (_ BitVec 32)) SeekEntryResult!10892)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96686 (_ BitVec 32)) SeekEntryResult!10892)

(assert (=> b!1414326 (= e!800488 (= (seekEntryOrOpen!0 lt!623255 lt!623259 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127686 lt!623257) (index!45950 lt!623257) (index!45950 lt!623257) (select (arr!46678 a!2901) j!112) lt!623259 mask!2840)))))

(declare-fun b!1414327 () Bool)

(declare-fun res!950636 () Bool)

(declare-fun e!800492 () Bool)

(assert (=> b!1414327 (=> (not res!950636) (not e!800492))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1414327 (= res!950636 (validKeyInArray!0 (select (arr!46678 a!2901) i!1037)))))

(declare-fun b!1414328 () Bool)

(declare-fun res!950638 () Bool)

(assert (=> b!1414328 (=> (not res!950638) (not e!800492))))

(assert (=> b!1414328 (= res!950638 (validKeyInArray!0 (select (arr!46678 a!2901) j!112)))))

(declare-fun b!1414330 () Bool)

(declare-fun e!800490 () Bool)

(assert (=> b!1414330 (= e!800492 (not e!800490))))

(declare-fun res!950634 () Bool)

(assert (=> b!1414330 (=> res!950634 e!800490)))

(declare-fun lt!623260 () SeekEntryResult!10892)

(get-info :version)

(assert (=> b!1414330 (= res!950634 (or (not ((_ is Intermediate!10892) lt!623260)) (undefined!11704 lt!623260)))))

(declare-fun e!800491 () Bool)

(assert (=> b!1414330 e!800491))

(declare-fun res!950633 () Bool)

(assert (=> b!1414330 (=> (not res!950633) (not e!800491))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96686 (_ BitVec 32)) Bool)

(assert (=> b!1414330 (= res!950633 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47785 0))(
  ( (Unit!47786) )
))
(declare-fun lt!623256 () Unit!47785)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96686 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47785)

(assert (=> b!1414330 (= lt!623256 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!623258 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96686 (_ BitVec 32)) SeekEntryResult!10892)

(assert (=> b!1414330 (= lt!623260 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623258 (select (arr!46678 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414330 (= lt!623258 (toIndex!0 (select (arr!46678 a!2901) j!112) mask!2840))))

(declare-fun b!1414331 () Bool)

(declare-fun res!950639 () Bool)

(assert (=> b!1414331 (=> (not res!950639) (not e!800492))))

(assert (=> b!1414331 (= res!950639 (and (= (size!47229 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47229 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47229 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1414332 () Bool)

(declare-fun res!950635 () Bool)

(assert (=> b!1414332 (=> (not res!950635) (not e!800492))))

(declare-datatypes ((List!33184 0))(
  ( (Nil!33181) (Cons!33180 (h!34463 (_ BitVec 64)) (t!47870 List!33184)) )
))
(declare-fun arrayNoDuplicates!0 (array!96686 (_ BitVec 32) List!33184) Bool)

(assert (=> b!1414332 (= res!950635 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33181))))

(declare-fun b!1414333 () Bool)

(declare-fun e!800487 () Bool)

(assert (=> b!1414333 (= e!800490 e!800487)))

(declare-fun res!950640 () Bool)

(assert (=> b!1414333 (=> res!950640 e!800487)))

(assert (=> b!1414333 (= res!950640 (or (= lt!623260 lt!623257) (not ((_ is Intermediate!10892) lt!623257))))))

(assert (=> b!1414333 (= lt!623257 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623255 mask!2840) lt!623255 lt!623259 mask!2840))))

(assert (=> b!1414333 (= lt!623255 (select (store (arr!46678 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1414333 (= lt!623259 (array!96687 (store (arr!46678 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47229 a!2901)))))

(declare-fun b!1414334 () Bool)

(declare-fun res!950637 () Bool)

(assert (=> b!1414334 (=> (not res!950637) (not e!800492))))

(assert (=> b!1414334 (= res!950637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1414335 () Bool)

(assert (=> b!1414335 (= e!800487 true)))

(assert (=> b!1414335 e!800488))

(declare-fun res!950641 () Bool)

(assert (=> b!1414335 (=> (not res!950641) (not e!800488))))

(assert (=> b!1414335 (= res!950641 (and (not (undefined!11704 lt!623257)) (= (index!45950 lt!623257) i!1037) (bvslt (x!127686 lt!623257) (x!127686 lt!623260)) (= (select (store (arr!46678 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45950 lt!623257)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!623261 () Unit!47785)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96686 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47785)

(assert (=> b!1414335 (= lt!623261 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623258 (x!127686 lt!623260) (index!45950 lt!623260) (x!127686 lt!623257) (index!45950 lt!623257) (undefined!11704 lt!623257) mask!2840))))

(declare-fun b!1414329 () Bool)

(assert (=> b!1414329 (= e!800491 (= (seekEntryOrOpen!0 (select (arr!46678 a!2901) j!112) a!2901 mask!2840) (Found!10892 j!112)))))

(declare-fun res!950632 () Bool)

(assert (=> start!121826 (=> (not res!950632) (not e!800492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121826 (= res!950632 (validMask!0 mask!2840))))

(assert (=> start!121826 e!800492))

(assert (=> start!121826 true))

(declare-fun array_inv!35959 (array!96686) Bool)

(assert (=> start!121826 (array_inv!35959 a!2901)))

(assert (= (and start!121826 res!950632) b!1414331))

(assert (= (and b!1414331 res!950639) b!1414327))

(assert (= (and b!1414327 res!950636) b!1414328))

(assert (= (and b!1414328 res!950638) b!1414334))

(assert (= (and b!1414334 res!950637) b!1414332))

(assert (= (and b!1414332 res!950635) b!1414330))

(assert (= (and b!1414330 res!950633) b!1414329))

(assert (= (and b!1414330 (not res!950634)) b!1414333))

(assert (= (and b!1414333 (not res!950640)) b!1414335))

(assert (= (and b!1414335 res!950641) b!1414326))

(declare-fun m!1304881 () Bool)

(assert (=> b!1414328 m!1304881))

(assert (=> b!1414328 m!1304881))

(declare-fun m!1304883 () Bool)

(assert (=> b!1414328 m!1304883))

(assert (=> b!1414330 m!1304881))

(declare-fun m!1304885 () Bool)

(assert (=> b!1414330 m!1304885))

(assert (=> b!1414330 m!1304881))

(declare-fun m!1304887 () Bool)

(assert (=> b!1414330 m!1304887))

(declare-fun m!1304889 () Bool)

(assert (=> b!1414330 m!1304889))

(assert (=> b!1414330 m!1304881))

(declare-fun m!1304891 () Bool)

(assert (=> b!1414330 m!1304891))

(declare-fun m!1304893 () Bool)

(assert (=> b!1414334 m!1304893))

(declare-fun m!1304895 () Bool)

(assert (=> b!1414335 m!1304895))

(declare-fun m!1304897 () Bool)

(assert (=> b!1414335 m!1304897))

(declare-fun m!1304899 () Bool)

(assert (=> b!1414335 m!1304899))

(assert (=> b!1414329 m!1304881))

(assert (=> b!1414329 m!1304881))

(declare-fun m!1304901 () Bool)

(assert (=> b!1414329 m!1304901))

(declare-fun m!1304903 () Bool)

(assert (=> b!1414333 m!1304903))

(assert (=> b!1414333 m!1304903))

(declare-fun m!1304905 () Bool)

(assert (=> b!1414333 m!1304905))

(assert (=> b!1414333 m!1304895))

(declare-fun m!1304907 () Bool)

(assert (=> b!1414333 m!1304907))

(declare-fun m!1304909 () Bool)

(assert (=> b!1414327 m!1304909))

(assert (=> b!1414327 m!1304909))

(declare-fun m!1304911 () Bool)

(assert (=> b!1414327 m!1304911))

(declare-fun m!1304913 () Bool)

(assert (=> b!1414326 m!1304913))

(assert (=> b!1414326 m!1304881))

(assert (=> b!1414326 m!1304881))

(declare-fun m!1304915 () Bool)

(assert (=> b!1414326 m!1304915))

(declare-fun m!1304917 () Bool)

(assert (=> b!1414332 m!1304917))

(declare-fun m!1304919 () Bool)

(assert (=> start!121826 m!1304919))

(declare-fun m!1304921 () Bool)

(assert (=> start!121826 m!1304921))

(check-sat (not b!1414329) (not b!1414335) (not b!1414330) (not b!1414333) (not b!1414334) (not start!121826) (not b!1414327) (not b!1414332) (not b!1414328) (not b!1414326))
(check-sat)
