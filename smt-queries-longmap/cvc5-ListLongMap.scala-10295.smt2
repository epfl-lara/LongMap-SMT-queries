; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121092 () Bool)

(assert start!121092)

(declare-fun b!1407872 () Bool)

(declare-fun res!945645 () Bool)

(declare-fun e!796838 () Bool)

(assert (=> b!1407872 (=> (not res!945645) (not e!796838))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96199 0))(
  ( (array!96200 (arr!46443 (Array (_ BitVec 32) (_ BitVec 64))) (size!46995 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96199)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1407872 (= res!945645 (and (= (size!46995 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46995 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46995 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407873 () Bool)

(declare-fun e!796837 () Bool)

(assert (=> b!1407873 (= e!796837 true)))

(declare-datatypes ((SeekEntryResult!10780 0))(
  ( (MissingZero!10780 (index!45497 (_ BitVec 32))) (Found!10780 (index!45498 (_ BitVec 32))) (Intermediate!10780 (undefined!11592 Bool) (index!45499 (_ BitVec 32)) (x!127098 (_ BitVec 32))) (Undefined!10780) (MissingVacant!10780 (index!45500 (_ BitVec 32))) )
))
(declare-fun lt!619812 () SeekEntryResult!10780)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96199 (_ BitVec 32)) SeekEntryResult!10780)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407873 (= lt!619812 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46443 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46443 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96200 (store (arr!46443 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46995 a!2901)) mask!2840))))

(declare-fun b!1407874 () Bool)

(declare-fun res!945650 () Bool)

(assert (=> b!1407874 (=> (not res!945650) (not e!796838))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407874 (= res!945650 (validKeyInArray!0 (select (arr!46443 a!2901) j!112)))))

(declare-fun b!1407875 () Bool)

(declare-fun e!796836 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96199 (_ BitVec 32)) SeekEntryResult!10780)

(assert (=> b!1407875 (= e!796836 (= (seekEntryOrOpen!0 (select (arr!46443 a!2901) j!112) a!2901 mask!2840) (Found!10780 j!112)))))

(declare-fun res!945648 () Bool)

(assert (=> start!121092 (=> (not res!945648) (not e!796838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121092 (= res!945648 (validMask!0 mask!2840))))

(assert (=> start!121092 e!796838))

(assert (=> start!121092 true))

(declare-fun array_inv!35676 (array!96199) Bool)

(assert (=> start!121092 (array_inv!35676 a!2901)))

(declare-fun b!1407876 () Bool)

(declare-fun res!945652 () Bool)

(assert (=> b!1407876 (=> (not res!945652) (not e!796838))))

(declare-datatypes ((List!33040 0))(
  ( (Nil!33037) (Cons!33036 (h!34299 (_ BitVec 64)) (t!47726 List!33040)) )
))
(declare-fun arrayNoDuplicates!0 (array!96199 (_ BitVec 32) List!33040) Bool)

(assert (=> b!1407876 (= res!945652 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33037))))

(declare-fun b!1407877 () Bool)

(declare-fun res!945649 () Bool)

(assert (=> b!1407877 (=> (not res!945649) (not e!796838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96199 (_ BitVec 32)) Bool)

(assert (=> b!1407877 (= res!945649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407878 () Bool)

(declare-fun res!945651 () Bool)

(assert (=> b!1407878 (=> (not res!945651) (not e!796838))))

(assert (=> b!1407878 (= res!945651 (validKeyInArray!0 (select (arr!46443 a!2901) i!1037)))))

(declare-fun b!1407879 () Bool)

(assert (=> b!1407879 (= e!796838 (not e!796837))))

(declare-fun res!945647 () Bool)

(assert (=> b!1407879 (=> res!945647 e!796837)))

(declare-fun lt!619813 () SeekEntryResult!10780)

(assert (=> b!1407879 (= res!945647 (or (not (is-Intermediate!10780 lt!619813)) (undefined!11592 lt!619813)))))

(assert (=> b!1407879 e!796836))

(declare-fun res!945646 () Bool)

(assert (=> b!1407879 (=> (not res!945646) (not e!796836))))

(assert (=> b!1407879 (= res!945646 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47377 0))(
  ( (Unit!47378) )
))
(declare-fun lt!619814 () Unit!47377)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96199 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47377)

(assert (=> b!1407879 (= lt!619814 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1407879 (= lt!619813 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46443 a!2901) j!112) mask!2840) (select (arr!46443 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!121092 res!945648) b!1407872))

(assert (= (and b!1407872 res!945645) b!1407878))

(assert (= (and b!1407878 res!945651) b!1407874))

(assert (= (and b!1407874 res!945650) b!1407877))

(assert (= (and b!1407877 res!945649) b!1407876))

(assert (= (and b!1407876 res!945652) b!1407879))

(assert (= (and b!1407879 res!945646) b!1407875))

(assert (= (and b!1407879 (not res!945647)) b!1407873))

(declare-fun m!1296519 () Bool)

(assert (=> b!1407876 m!1296519))

(declare-fun m!1296521 () Bool)

(assert (=> b!1407879 m!1296521))

(declare-fun m!1296523 () Bool)

(assert (=> b!1407879 m!1296523))

(assert (=> b!1407879 m!1296521))

(declare-fun m!1296525 () Bool)

(assert (=> b!1407879 m!1296525))

(assert (=> b!1407879 m!1296523))

(assert (=> b!1407879 m!1296521))

(declare-fun m!1296527 () Bool)

(assert (=> b!1407879 m!1296527))

(declare-fun m!1296529 () Bool)

(assert (=> b!1407879 m!1296529))

(declare-fun m!1296531 () Bool)

(assert (=> start!121092 m!1296531))

(declare-fun m!1296533 () Bool)

(assert (=> start!121092 m!1296533))

(declare-fun m!1296535 () Bool)

(assert (=> b!1407873 m!1296535))

(declare-fun m!1296537 () Bool)

(assert (=> b!1407873 m!1296537))

(assert (=> b!1407873 m!1296537))

(declare-fun m!1296539 () Bool)

(assert (=> b!1407873 m!1296539))

(assert (=> b!1407873 m!1296539))

(assert (=> b!1407873 m!1296537))

(declare-fun m!1296541 () Bool)

(assert (=> b!1407873 m!1296541))

(assert (=> b!1407874 m!1296521))

(assert (=> b!1407874 m!1296521))

(declare-fun m!1296543 () Bool)

(assert (=> b!1407874 m!1296543))

(declare-fun m!1296545 () Bool)

(assert (=> b!1407877 m!1296545))

(declare-fun m!1296547 () Bool)

(assert (=> b!1407878 m!1296547))

(assert (=> b!1407878 m!1296547))

(declare-fun m!1296549 () Bool)

(assert (=> b!1407878 m!1296549))

(assert (=> b!1407875 m!1296521))

(assert (=> b!1407875 m!1296521))

(declare-fun m!1296551 () Bool)

(assert (=> b!1407875 m!1296551))

(push 1)

(assert (not b!1407873))

(assert (not b!1407876))

(assert (not b!1407875))

(assert (not b!1407879))

(assert (not b!1407874))

(assert (not start!121092))

(assert (not b!1407877))

(assert (not b!1407878))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

