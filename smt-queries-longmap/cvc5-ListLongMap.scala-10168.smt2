; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120072 () Bool)

(assert start!120072)

(declare-fun b!1397018 () Bool)

(declare-fun res!935416 () Bool)

(declare-fun e!790997 () Bool)

(assert (=> b!1397018 (=> (not res!935416) (not e!790997))))

(declare-datatypes ((array!95574 0))(
  ( (array!95575 (arr!46140 (Array (_ BitVec 32) (_ BitVec 64))) (size!46691 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95574)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397018 (= res!935416 (validKeyInArray!0 (select (arr!46140 a!2901) j!112)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1397020 () Bool)

(declare-fun e!791000 () Bool)

(declare-datatypes ((SeekEntryResult!10360 0))(
  ( (MissingZero!10360 (index!43811 (_ BitVec 32))) (Found!10360 (index!43812 (_ BitVec 32))) (Intermediate!10360 (undefined!11172 Bool) (index!43813 (_ BitVec 32)) (x!125627 (_ BitVec 32))) (Undefined!10360) (MissingVacant!10360 (index!43814 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95574 (_ BitVec 32)) SeekEntryResult!10360)

(assert (=> b!1397020 (= e!791000 (= (seekEntryOrOpen!0 (select (arr!46140 a!2901) j!112) a!2901 mask!2840) (Found!10360 j!112)))))

(declare-fun b!1397021 () Bool)

(declare-fun e!790998 () Bool)

(assert (=> b!1397021 (= e!790998 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!613570 () SeekEntryResult!10360)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95574 (_ BitVec 32)) SeekEntryResult!10360)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397021 (= lt!613570 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46140 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46140 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95575 (store (arr!46140 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46691 a!2901)) mask!2840))))

(declare-fun b!1397022 () Bool)

(declare-fun res!935414 () Bool)

(assert (=> b!1397022 (=> (not res!935414) (not e!790997))))

(assert (=> b!1397022 (= res!935414 (validKeyInArray!0 (select (arr!46140 a!2901) i!1037)))))

(declare-fun b!1397023 () Bool)

(assert (=> b!1397023 (= e!790997 (not e!790998))))

(declare-fun res!935417 () Bool)

(assert (=> b!1397023 (=> res!935417 e!790998)))

(declare-fun lt!613571 () SeekEntryResult!10360)

(assert (=> b!1397023 (= res!935417 (or (not (is-Intermediate!10360 lt!613571)) (undefined!11172 lt!613571)))))

(assert (=> b!1397023 e!791000))

(declare-fun res!935413 () Bool)

(assert (=> b!1397023 (=> (not res!935413) (not e!791000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95574 (_ BitVec 32)) Bool)

(assert (=> b!1397023 (= res!935413 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46751 0))(
  ( (Unit!46752) )
))
(declare-fun lt!613569 () Unit!46751)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95574 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46751)

(assert (=> b!1397023 (= lt!613569 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397023 (= lt!613571 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46140 a!2901) j!112) mask!2840) (select (arr!46140 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1397019 () Bool)

(declare-fun res!935412 () Bool)

(assert (=> b!1397019 (=> (not res!935412) (not e!790997))))

(declare-datatypes ((List!32646 0))(
  ( (Nil!32643) (Cons!32642 (h!33889 (_ BitVec 64)) (t!47332 List!32646)) )
))
(declare-fun arrayNoDuplicates!0 (array!95574 (_ BitVec 32) List!32646) Bool)

(assert (=> b!1397019 (= res!935412 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32643))))

(declare-fun res!935415 () Bool)

(assert (=> start!120072 (=> (not res!935415) (not e!790997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120072 (= res!935415 (validMask!0 mask!2840))))

(assert (=> start!120072 e!790997))

(assert (=> start!120072 true))

(declare-fun array_inv!35421 (array!95574) Bool)

(assert (=> start!120072 (array_inv!35421 a!2901)))

(declare-fun b!1397024 () Bool)

(declare-fun res!935418 () Bool)

(assert (=> b!1397024 (=> (not res!935418) (not e!790997))))

(assert (=> b!1397024 (= res!935418 (and (= (size!46691 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46691 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46691 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397025 () Bool)

(declare-fun res!935419 () Bool)

(assert (=> b!1397025 (=> (not res!935419) (not e!790997))))

(assert (=> b!1397025 (= res!935419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120072 res!935415) b!1397024))

(assert (= (and b!1397024 res!935418) b!1397022))

(assert (= (and b!1397022 res!935414) b!1397018))

(assert (= (and b!1397018 res!935416) b!1397025))

(assert (= (and b!1397025 res!935419) b!1397019))

(assert (= (and b!1397019 res!935412) b!1397023))

(assert (= (and b!1397023 res!935413) b!1397020))

(assert (= (and b!1397023 (not res!935417)) b!1397021))

(declare-fun m!1283691 () Bool)

(assert (=> b!1397018 m!1283691))

(assert (=> b!1397018 m!1283691))

(declare-fun m!1283693 () Bool)

(assert (=> b!1397018 m!1283693))

(declare-fun m!1283695 () Bool)

(assert (=> start!120072 m!1283695))

(declare-fun m!1283697 () Bool)

(assert (=> start!120072 m!1283697))

(assert (=> b!1397023 m!1283691))

(declare-fun m!1283699 () Bool)

(assert (=> b!1397023 m!1283699))

(assert (=> b!1397023 m!1283691))

(declare-fun m!1283701 () Bool)

(assert (=> b!1397023 m!1283701))

(assert (=> b!1397023 m!1283699))

(assert (=> b!1397023 m!1283691))

(declare-fun m!1283703 () Bool)

(assert (=> b!1397023 m!1283703))

(declare-fun m!1283705 () Bool)

(assert (=> b!1397023 m!1283705))

(declare-fun m!1283707 () Bool)

(assert (=> b!1397021 m!1283707))

(declare-fun m!1283709 () Bool)

(assert (=> b!1397021 m!1283709))

(assert (=> b!1397021 m!1283709))

(declare-fun m!1283711 () Bool)

(assert (=> b!1397021 m!1283711))

(assert (=> b!1397021 m!1283711))

(assert (=> b!1397021 m!1283709))

(declare-fun m!1283713 () Bool)

(assert (=> b!1397021 m!1283713))

(declare-fun m!1283715 () Bool)

(assert (=> b!1397025 m!1283715))

(declare-fun m!1283717 () Bool)

(assert (=> b!1397022 m!1283717))

(assert (=> b!1397022 m!1283717))

(declare-fun m!1283719 () Bool)

(assert (=> b!1397022 m!1283719))

(assert (=> b!1397020 m!1283691))

(assert (=> b!1397020 m!1283691))

(declare-fun m!1283721 () Bool)

(assert (=> b!1397020 m!1283721))

(declare-fun m!1283723 () Bool)

(assert (=> b!1397019 m!1283723))

(push 1)

(assert (not b!1397025))

(assert (not b!1397023))

(assert (not start!120072))

(assert (not b!1397022))

(assert (not b!1397019))

(assert (not b!1397018))

(assert (not b!1397020))

(assert (not b!1397021))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

