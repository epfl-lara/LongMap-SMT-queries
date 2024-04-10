; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119982 () Bool)

(assert start!119982)

(declare-fun b!1396717 () Bool)

(declare-fun e!790733 () Bool)

(assert (=> b!1396717 (= e!790733 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!613645 () (_ BitVec 64))

(declare-fun lt!613642 () (_ BitVec 32))

(declare-datatypes ((array!95511 0))(
  ( (array!95512 (arr!46109 (Array (_ BitVec 32) (_ BitVec 64))) (size!46659 (_ BitVec 32))) )
))
(declare-fun lt!613641 () array!95511)

(declare-datatypes ((SeekEntryResult!10426 0))(
  ( (MissingZero!10426 (index!44075 (_ BitVec 32))) (Found!10426 (index!44076 (_ BitVec 32))) (Intermediate!10426 (undefined!11238 Bool) (index!44077 (_ BitVec 32)) (x!125744 (_ BitVec 32))) (Undefined!10426) (MissingVacant!10426 (index!44078 (_ BitVec 32))) )
))
(declare-fun lt!613643 () SeekEntryResult!10426)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95511 (_ BitVec 32)) SeekEntryResult!10426)

(assert (=> b!1396717 (= lt!613643 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613642 lt!613645 lt!613641 mask!2840))))

(declare-fun res!935630 () Bool)

(declare-fun e!790730 () Bool)

(assert (=> start!119982 (=> (not res!935630) (not e!790730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119982 (= res!935630 (validMask!0 mask!2840))))

(assert (=> start!119982 e!790730))

(assert (=> start!119982 true))

(declare-fun a!2901 () array!95511)

(declare-fun array_inv!35137 (array!95511) Bool)

(assert (=> start!119982 (array_inv!35137 a!2901)))

(declare-fun b!1396718 () Bool)

(declare-fun res!935636 () Bool)

(assert (=> b!1396718 (=> (not res!935636) (not e!790730))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1396718 (= res!935636 (and (= (size!46659 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46659 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46659 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396719 () Bool)

(declare-fun res!935633 () Bool)

(assert (=> b!1396719 (=> (not res!935633) (not e!790730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95511 (_ BitVec 32)) Bool)

(assert (=> b!1396719 (= res!935633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396720 () Bool)

(declare-fun res!935634 () Bool)

(assert (=> b!1396720 (=> (not res!935634) (not e!790730))))

(declare-datatypes ((List!32628 0))(
  ( (Nil!32625) (Cons!32624 (h!33866 (_ BitVec 64)) (t!47322 List!32628)) )
))
(declare-fun arrayNoDuplicates!0 (array!95511 (_ BitVec 32) List!32628) Bool)

(assert (=> b!1396720 (= res!935634 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32625))))

(declare-fun b!1396721 () Bool)

(declare-fun res!935635 () Bool)

(assert (=> b!1396721 (=> (not res!935635) (not e!790730))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396721 (= res!935635 (validKeyInArray!0 (select (arr!46109 a!2901) i!1037)))))

(declare-fun b!1396722 () Bool)

(declare-fun e!790729 () Bool)

(assert (=> b!1396722 (= e!790730 (not e!790729))))

(declare-fun res!935637 () Bool)

(assert (=> b!1396722 (=> res!935637 e!790729)))

(declare-fun lt!613647 () SeekEntryResult!10426)

(assert (=> b!1396722 (= res!935637 (or (not (is-Intermediate!10426 lt!613647)) (undefined!11238 lt!613647)))))

(declare-fun e!790732 () Bool)

(assert (=> b!1396722 e!790732))

(declare-fun res!935632 () Bool)

(assert (=> b!1396722 (=> (not res!935632) (not e!790732))))

(assert (=> b!1396722 (= res!935632 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46856 0))(
  ( (Unit!46857) )
))
(declare-fun lt!613646 () Unit!46856)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95511 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46856)

(assert (=> b!1396722 (= lt!613646 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1396722 (= lt!613647 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613642 (select (arr!46109 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396722 (= lt!613642 (toIndex!0 (select (arr!46109 a!2901) j!112) mask!2840))))

(declare-fun b!1396723 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95511 (_ BitVec 32)) SeekEntryResult!10426)

(assert (=> b!1396723 (= e!790732 (= (seekEntryOrOpen!0 (select (arr!46109 a!2901) j!112) a!2901 mask!2840) (Found!10426 j!112)))))

(declare-fun b!1396724 () Bool)

(assert (=> b!1396724 (= e!790729 e!790733)))

(declare-fun res!935631 () Bool)

(assert (=> b!1396724 (=> res!935631 e!790733)))

(declare-fun lt!613644 () SeekEntryResult!10426)

(assert (=> b!1396724 (= res!935631 (or (= lt!613647 lt!613644) (not (is-Intermediate!10426 lt!613644)) (bvslt (x!125744 lt!613647) #b00000000000000000000000000000000) (bvsgt (x!125744 lt!613647) #b01111111111111111111111111111110) (bvslt lt!613642 #b00000000000000000000000000000000) (bvsge lt!613642 (size!46659 a!2901)) (bvslt (index!44077 lt!613647) #b00000000000000000000000000000000) (bvsge (index!44077 lt!613647) (size!46659 a!2901)) (not (= lt!613647 (Intermediate!10426 false (index!44077 lt!613647) (x!125744 lt!613647)))) (not (= lt!613644 (Intermediate!10426 (undefined!11238 lt!613644) (index!44077 lt!613644) (x!125744 lt!613644))))))))

(assert (=> b!1396724 (= lt!613644 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613645 mask!2840) lt!613645 lt!613641 mask!2840))))

(assert (=> b!1396724 (= lt!613645 (select (store (arr!46109 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396724 (= lt!613641 (array!95512 (store (arr!46109 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46659 a!2901)))))

(declare-fun b!1396725 () Bool)

(declare-fun res!935638 () Bool)

(assert (=> b!1396725 (=> (not res!935638) (not e!790730))))

(assert (=> b!1396725 (= res!935638 (validKeyInArray!0 (select (arr!46109 a!2901) j!112)))))

(assert (= (and start!119982 res!935630) b!1396718))

(assert (= (and b!1396718 res!935636) b!1396721))

(assert (= (and b!1396721 res!935635) b!1396725))

(assert (= (and b!1396725 res!935638) b!1396719))

(assert (= (and b!1396719 res!935633) b!1396720))

(assert (= (and b!1396720 res!935634) b!1396722))

(assert (= (and b!1396722 res!935632) b!1396723))

(assert (= (and b!1396722 (not res!935637)) b!1396724))

(assert (= (and b!1396724 (not res!935631)) b!1396717))

(declare-fun m!1283247 () Bool)

(assert (=> b!1396723 m!1283247))

(assert (=> b!1396723 m!1283247))

(declare-fun m!1283249 () Bool)

(assert (=> b!1396723 m!1283249))

(declare-fun m!1283251 () Bool)

(assert (=> b!1396721 m!1283251))

(assert (=> b!1396721 m!1283251))

(declare-fun m!1283253 () Bool)

(assert (=> b!1396721 m!1283253))

(assert (=> b!1396722 m!1283247))

(declare-fun m!1283255 () Bool)

(assert (=> b!1396722 m!1283255))

(assert (=> b!1396722 m!1283247))

(declare-fun m!1283257 () Bool)

(assert (=> b!1396722 m!1283257))

(assert (=> b!1396722 m!1283247))

(declare-fun m!1283259 () Bool)

(assert (=> b!1396722 m!1283259))

(declare-fun m!1283261 () Bool)

(assert (=> b!1396722 m!1283261))

(assert (=> b!1396725 m!1283247))

(assert (=> b!1396725 m!1283247))

(declare-fun m!1283263 () Bool)

(assert (=> b!1396725 m!1283263))

(declare-fun m!1283265 () Bool)

(assert (=> b!1396717 m!1283265))

(declare-fun m!1283267 () Bool)

(assert (=> b!1396720 m!1283267))

(declare-fun m!1283269 () Bool)

(assert (=> b!1396719 m!1283269))

(declare-fun m!1283271 () Bool)

(assert (=> start!119982 m!1283271))

(declare-fun m!1283273 () Bool)

(assert (=> start!119982 m!1283273))

(declare-fun m!1283275 () Bool)

(assert (=> b!1396724 m!1283275))

(assert (=> b!1396724 m!1283275))

(declare-fun m!1283277 () Bool)

(assert (=> b!1396724 m!1283277))

(declare-fun m!1283279 () Bool)

(assert (=> b!1396724 m!1283279))

(declare-fun m!1283281 () Bool)

(assert (=> b!1396724 m!1283281))

(push 1)

