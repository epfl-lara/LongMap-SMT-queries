; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121424 () Bool)

(assert start!121424)

(declare-fun b!1410755 () Bool)

(declare-fun res!947983 () Bool)

(declare-fun e!798348 () Bool)

(assert (=> b!1410755 (=> (not res!947983) (not e!798348))))

(declare-datatypes ((array!96425 0))(
  ( (array!96426 (arr!46551 (Array (_ BitVec 32) (_ BitVec 64))) (size!47101 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96425)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96425 (_ BitVec 32)) Bool)

(assert (=> b!1410755 (= res!947983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!947982 () Bool)

(assert (=> start!121424 (=> (not res!947982) (not e!798348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121424 (= res!947982 (validMask!0 mask!2840))))

(assert (=> start!121424 e!798348))

(assert (=> start!121424 true))

(declare-fun array_inv!35579 (array!96425) Bool)

(assert (=> start!121424 (array_inv!35579 a!2901)))

(declare-fun b!1410756 () Bool)

(declare-fun res!947989 () Bool)

(assert (=> b!1410756 (=> (not res!947989) (not e!798348))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1410756 (= res!947989 (and (= (size!47101 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47101 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47101 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1410757 () Bool)

(declare-fun res!947985 () Bool)

(assert (=> b!1410757 (=> (not res!947985) (not e!798348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410757 (= res!947985 (validKeyInArray!0 (select (arr!46551 a!2901) i!1037)))))

(declare-fun b!1410758 () Bool)

(declare-fun res!947987 () Bool)

(assert (=> b!1410758 (=> (not res!947987) (not e!798348))))

(declare-datatypes ((List!33070 0))(
  ( (Nil!33067) (Cons!33066 (h!34338 (_ BitVec 64)) (t!47764 List!33070)) )
))
(declare-fun arrayNoDuplicates!0 (array!96425 (_ BitVec 32) List!33070) Bool)

(assert (=> b!1410758 (= res!947987 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33067))))

(declare-fun lt!621324 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10862 0))(
  ( (MissingZero!10862 (index!45825 (_ BitVec 32))) (Found!10862 (index!45826 (_ BitVec 32))) (Intermediate!10862 (undefined!11674 Bool) (index!45827 (_ BitVec 32)) (x!127425 (_ BitVec 32))) (Undefined!10862) (MissingVacant!10862 (index!45828 (_ BitVec 32))) )
))
(declare-fun lt!621323 () SeekEntryResult!10862)

(declare-fun e!798350 () Bool)

(declare-fun lt!621322 () SeekEntryResult!10862)

(declare-fun b!1410759 () Bool)

(get-info :version)

(assert (=> b!1410759 (= e!798350 (or (= lt!621323 lt!621322) (not ((_ is Intermediate!10862) lt!621322)) (bvslt (x!127425 lt!621323) #b00000000000000000000000000000000) (bvsgt (x!127425 lt!621323) #b01111111111111111111111111111110) (bvslt lt!621324 #b00000000000000000000000000000000) (bvsge lt!621324 (size!47101 a!2901)) (bvslt (index!45827 lt!621323) #b00000000000000000000000000000000) (bvsge (index!45827 lt!621323) (size!47101 a!2901)) (not (= lt!621323 (Intermediate!10862 false (index!45827 lt!621323) (x!127425 lt!621323)))) (= lt!621322 (Intermediate!10862 (undefined!11674 lt!621322) (index!45827 lt!621322) (x!127425 lt!621322)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96425 (_ BitVec 32)) SeekEntryResult!10862)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410759 (= lt!621322 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46551 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46551 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96426 (store (arr!46551 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47101 a!2901)) mask!2840))))

(declare-fun b!1410760 () Bool)

(declare-fun res!947986 () Bool)

(assert (=> b!1410760 (=> (not res!947986) (not e!798348))))

(assert (=> b!1410760 (= res!947986 (validKeyInArray!0 (select (arr!46551 a!2901) j!112)))))

(declare-fun b!1410761 () Bool)

(declare-fun e!798349 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96425 (_ BitVec 32)) SeekEntryResult!10862)

(assert (=> b!1410761 (= e!798349 (= (seekEntryOrOpen!0 (select (arr!46551 a!2901) j!112) a!2901 mask!2840) (Found!10862 j!112)))))

(declare-fun b!1410762 () Bool)

(assert (=> b!1410762 (= e!798348 (not e!798350))))

(declare-fun res!947988 () Bool)

(assert (=> b!1410762 (=> res!947988 e!798350)))

(assert (=> b!1410762 (= res!947988 (or (not ((_ is Intermediate!10862) lt!621323)) (undefined!11674 lt!621323)))))

(assert (=> b!1410762 e!798349))

(declare-fun res!947984 () Bool)

(assert (=> b!1410762 (=> (not res!947984) (not e!798349))))

(assert (=> b!1410762 (= res!947984 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47698 0))(
  ( (Unit!47699) )
))
(declare-fun lt!621321 () Unit!47698)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96425 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47698)

(assert (=> b!1410762 (= lt!621321 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1410762 (= lt!621323 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621324 (select (arr!46551 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1410762 (= lt!621324 (toIndex!0 (select (arr!46551 a!2901) j!112) mask!2840))))

(assert (= (and start!121424 res!947982) b!1410756))

(assert (= (and b!1410756 res!947989) b!1410757))

(assert (= (and b!1410757 res!947985) b!1410760))

(assert (= (and b!1410760 res!947986) b!1410755))

(assert (= (and b!1410755 res!947983) b!1410758))

(assert (= (and b!1410758 res!947987) b!1410762))

(assert (= (and b!1410762 res!947984) b!1410761))

(assert (= (and b!1410762 (not res!947988)) b!1410759))

(declare-fun m!1300399 () Bool)

(assert (=> b!1410758 m!1300399))

(declare-fun m!1300401 () Bool)

(assert (=> start!121424 m!1300401))

(declare-fun m!1300403 () Bool)

(assert (=> start!121424 m!1300403))

(declare-fun m!1300405 () Bool)

(assert (=> b!1410759 m!1300405))

(declare-fun m!1300407 () Bool)

(assert (=> b!1410759 m!1300407))

(assert (=> b!1410759 m!1300407))

(declare-fun m!1300409 () Bool)

(assert (=> b!1410759 m!1300409))

(assert (=> b!1410759 m!1300409))

(assert (=> b!1410759 m!1300407))

(declare-fun m!1300411 () Bool)

(assert (=> b!1410759 m!1300411))

(declare-fun m!1300413 () Bool)

(assert (=> b!1410760 m!1300413))

(assert (=> b!1410760 m!1300413))

(declare-fun m!1300415 () Bool)

(assert (=> b!1410760 m!1300415))

(assert (=> b!1410762 m!1300413))

(declare-fun m!1300417 () Bool)

(assert (=> b!1410762 m!1300417))

(assert (=> b!1410762 m!1300413))

(assert (=> b!1410762 m!1300413))

(declare-fun m!1300419 () Bool)

(assert (=> b!1410762 m!1300419))

(declare-fun m!1300421 () Bool)

(assert (=> b!1410762 m!1300421))

(declare-fun m!1300423 () Bool)

(assert (=> b!1410762 m!1300423))

(declare-fun m!1300425 () Bool)

(assert (=> b!1410755 m!1300425))

(declare-fun m!1300427 () Bool)

(assert (=> b!1410757 m!1300427))

(assert (=> b!1410757 m!1300427))

(declare-fun m!1300429 () Bool)

(assert (=> b!1410757 m!1300429))

(assert (=> b!1410761 m!1300413))

(assert (=> b!1410761 m!1300413))

(declare-fun m!1300431 () Bool)

(assert (=> b!1410761 m!1300431))

(check-sat (not b!1410758) (not b!1410760) (not b!1410755) (not b!1410757) (not start!121424) (not b!1410761) (not b!1410762) (not b!1410759))
(check-sat)
