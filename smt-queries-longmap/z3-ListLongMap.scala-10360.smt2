; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122162 () Bool)

(assert start!122162)

(declare-datatypes ((SeekEntryResult!10928 0))(
  ( (MissingZero!10928 (index!46104 (_ BitVec 32))) (Found!10928 (index!46105 (_ BitVec 32))) (Intermediate!10928 (undefined!11740 Bool) (index!46106 (_ BitVec 32)) (x!127866 (_ BitVec 32))) (Undefined!10928) (MissingVacant!10928 (index!46107 (_ BitVec 32))) )
))
(declare-fun lt!624636 () SeekEntryResult!10928)

(declare-datatypes ((array!96770 0))(
  ( (array!96771 (arr!46714 (Array (_ BitVec 32) (_ BitVec 64))) (size!47265 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96770)

(declare-fun b!1416714 () Bool)

(declare-fun lt!624640 () SeekEntryResult!10928)

(declare-fun lt!624635 () (_ BitVec 32))

(declare-fun e!801915 () Bool)

(assert (=> b!1416714 (= e!801915 (or (bvslt (x!127866 lt!624636) #b00000000000000000000000000000000) (bvsgt (x!127866 lt!624636) #b01111111111111111111111111111110) (bvslt (x!127866 lt!624640) #b00000000000000000000000000000000) (bvsgt (x!127866 lt!624640) #b01111111111111111111111111111110) (bvslt lt!624635 #b00000000000000000000000000000000) (bvsge lt!624635 (size!47265 a!2901)) (bvslt (index!46106 lt!624636) #b00000000000000000000000000000000) (bvsge (index!46106 lt!624636) (size!47265 a!2901)) (bvslt (index!46106 lt!624640) #b00000000000000000000000000000000) (bvsge (index!46106 lt!624640) (size!47265 a!2901)) (not (= lt!624636 (Intermediate!10928 false (index!46106 lt!624636) (x!127866 lt!624636)))) (= lt!624640 (Intermediate!10928 false (index!46106 lt!624640) (x!127866 lt!624640)))))))

(declare-fun e!801916 () Bool)

(assert (=> b!1416714 e!801916))

(declare-fun res!952076 () Bool)

(assert (=> b!1416714 (=> (not res!952076) (not e!801916))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1416714 (= res!952076 (and (not (undefined!11740 lt!624640)) (= (index!46106 lt!624640) i!1037) (bvslt (x!127866 lt!624640) (x!127866 lt!624636)) (= (select (store (arr!46714 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46106 lt!624640)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47857 0))(
  ( (Unit!47858) )
))
(declare-fun lt!624639 () Unit!47857)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96770 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47857)

(assert (=> b!1416714 (= lt!624639 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624635 (x!127866 lt!624636) (index!46106 lt!624636) (x!127866 lt!624640) (index!46106 lt!624640) (undefined!11740 lt!624640) mask!2840))))

(declare-fun b!1416715 () Bool)

(declare-fun e!801917 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96770 (_ BitVec 32)) SeekEntryResult!10928)

(assert (=> b!1416715 (= e!801917 (= (seekEntryOrOpen!0 (select (arr!46714 a!2901) j!112) a!2901 mask!2840) (Found!10928 j!112)))))

(declare-fun b!1416716 () Bool)

(declare-fun e!801918 () Bool)

(declare-fun e!801919 () Bool)

(assert (=> b!1416716 (= e!801918 (not e!801919))))

(declare-fun res!952079 () Bool)

(assert (=> b!1416716 (=> res!952079 e!801919)))

(get-info :version)

(assert (=> b!1416716 (= res!952079 (or (not ((_ is Intermediate!10928) lt!624636)) (undefined!11740 lt!624636)))))

(assert (=> b!1416716 e!801917))

(declare-fun res!952080 () Bool)

(assert (=> b!1416716 (=> (not res!952080) (not e!801917))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96770 (_ BitVec 32)) Bool)

(assert (=> b!1416716 (= res!952080 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!624641 () Unit!47857)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96770 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47857)

(assert (=> b!1416716 (= lt!624641 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96770 (_ BitVec 32)) SeekEntryResult!10928)

(assert (=> b!1416716 (= lt!624636 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624635 (select (arr!46714 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416716 (= lt!624635 (toIndex!0 (select (arr!46714 a!2901) j!112) mask!2840))))

(declare-fun b!1416717 () Bool)

(declare-fun lt!624638 () array!96770)

(declare-fun lt!624637 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96770 (_ BitVec 32)) SeekEntryResult!10928)

(assert (=> b!1416717 (= e!801916 (= (seekEntryOrOpen!0 lt!624637 lt!624638 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127866 lt!624640) (index!46106 lt!624640) (index!46106 lt!624640) (select (arr!46714 a!2901) j!112) lt!624638 mask!2840)))))

(declare-fun b!1416718 () Bool)

(declare-fun res!952077 () Bool)

(assert (=> b!1416718 (=> (not res!952077) (not e!801918))))

(assert (=> b!1416718 (= res!952077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416719 () Bool)

(declare-fun res!952073 () Bool)

(assert (=> b!1416719 (=> (not res!952073) (not e!801918))))

(declare-datatypes ((List!33220 0))(
  ( (Nil!33217) (Cons!33216 (h!34511 (_ BitVec 64)) (t!47906 List!33220)) )
))
(declare-fun arrayNoDuplicates!0 (array!96770 (_ BitVec 32) List!33220) Bool)

(assert (=> b!1416719 (= res!952073 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33217))))

(declare-fun b!1416720 () Bool)

(declare-fun res!952072 () Bool)

(assert (=> b!1416720 (=> (not res!952072) (not e!801918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416720 (= res!952072 (validKeyInArray!0 (select (arr!46714 a!2901) j!112)))))

(declare-fun b!1416722 () Bool)

(declare-fun res!952078 () Bool)

(assert (=> b!1416722 (=> (not res!952078) (not e!801918))))

(assert (=> b!1416722 (= res!952078 (validKeyInArray!0 (select (arr!46714 a!2901) i!1037)))))

(declare-fun b!1416723 () Bool)

(assert (=> b!1416723 (= e!801919 e!801915)))

(declare-fun res!952081 () Bool)

(assert (=> b!1416723 (=> res!952081 e!801915)))

(assert (=> b!1416723 (= res!952081 (or (= lt!624636 lt!624640) (not ((_ is Intermediate!10928) lt!624640))))))

(assert (=> b!1416723 (= lt!624640 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624637 mask!2840) lt!624637 lt!624638 mask!2840))))

(assert (=> b!1416723 (= lt!624637 (select (store (arr!46714 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1416723 (= lt!624638 (array!96771 (store (arr!46714 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47265 a!2901)))))

(declare-fun res!952075 () Bool)

(assert (=> start!122162 (=> (not res!952075) (not e!801918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122162 (= res!952075 (validMask!0 mask!2840))))

(assert (=> start!122162 e!801918))

(assert (=> start!122162 true))

(declare-fun array_inv!35995 (array!96770) Bool)

(assert (=> start!122162 (array_inv!35995 a!2901)))

(declare-fun b!1416721 () Bool)

(declare-fun res!952074 () Bool)

(assert (=> b!1416721 (=> (not res!952074) (not e!801918))))

(assert (=> b!1416721 (= res!952074 (and (= (size!47265 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47265 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47265 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!122162 res!952075) b!1416721))

(assert (= (and b!1416721 res!952074) b!1416722))

(assert (= (and b!1416722 res!952078) b!1416720))

(assert (= (and b!1416720 res!952072) b!1416718))

(assert (= (and b!1416718 res!952077) b!1416719))

(assert (= (and b!1416719 res!952073) b!1416716))

(assert (= (and b!1416716 res!952080) b!1416715))

(assert (= (and b!1416716 (not res!952079)) b!1416723))

(assert (= (and b!1416723 (not res!952081)) b!1416714))

(assert (= (and b!1416714 res!952076) b!1416717))

(declare-fun m!1307281 () Bool)

(assert (=> b!1416719 m!1307281))

(declare-fun m!1307283 () Bool)

(assert (=> b!1416718 m!1307283))

(declare-fun m!1307285 () Bool)

(assert (=> b!1416722 m!1307285))

(assert (=> b!1416722 m!1307285))

(declare-fun m!1307287 () Bool)

(assert (=> b!1416722 m!1307287))

(declare-fun m!1307289 () Bool)

(assert (=> b!1416723 m!1307289))

(assert (=> b!1416723 m!1307289))

(declare-fun m!1307291 () Bool)

(assert (=> b!1416723 m!1307291))

(declare-fun m!1307293 () Bool)

(assert (=> b!1416723 m!1307293))

(declare-fun m!1307295 () Bool)

(assert (=> b!1416723 m!1307295))

(declare-fun m!1307297 () Bool)

(assert (=> b!1416716 m!1307297))

(declare-fun m!1307299 () Bool)

(assert (=> b!1416716 m!1307299))

(assert (=> b!1416716 m!1307297))

(declare-fun m!1307301 () Bool)

(assert (=> b!1416716 m!1307301))

(declare-fun m!1307303 () Bool)

(assert (=> b!1416716 m!1307303))

(assert (=> b!1416716 m!1307297))

(declare-fun m!1307305 () Bool)

(assert (=> b!1416716 m!1307305))

(assert (=> b!1416715 m!1307297))

(assert (=> b!1416715 m!1307297))

(declare-fun m!1307307 () Bool)

(assert (=> b!1416715 m!1307307))

(declare-fun m!1307309 () Bool)

(assert (=> b!1416717 m!1307309))

(assert (=> b!1416717 m!1307297))

(assert (=> b!1416717 m!1307297))

(declare-fun m!1307311 () Bool)

(assert (=> b!1416717 m!1307311))

(declare-fun m!1307313 () Bool)

(assert (=> start!122162 m!1307313))

(declare-fun m!1307315 () Bool)

(assert (=> start!122162 m!1307315))

(assert (=> b!1416720 m!1307297))

(assert (=> b!1416720 m!1307297))

(declare-fun m!1307317 () Bool)

(assert (=> b!1416720 m!1307317))

(assert (=> b!1416714 m!1307293))

(declare-fun m!1307319 () Bool)

(assert (=> b!1416714 m!1307319))

(declare-fun m!1307321 () Bool)

(assert (=> b!1416714 m!1307321))

(check-sat (not b!1416715) (not b!1416716) (not b!1416718) (not b!1416723) (not start!122162) (not b!1416717) (not b!1416720) (not b!1416722) (not b!1416714) (not b!1416719))
(check-sat)
