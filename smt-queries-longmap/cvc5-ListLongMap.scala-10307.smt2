; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121356 () Bool)

(assert start!121356)

(declare-fun b!1410002 () Bool)

(declare-fun res!947046 () Bool)

(declare-fun e!798047 () Bool)

(assert (=> b!1410002 (=> (not res!947046) (not e!798047))))

(declare-datatypes ((array!96432 0))(
  ( (array!96433 (arr!46557 (Array (_ BitVec 32) (_ BitVec 64))) (size!47108 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96432)

(declare-datatypes ((List!33063 0))(
  ( (Nil!33060) (Cons!33059 (h!34330 (_ BitVec 64)) (t!47749 List!33063)) )
))
(declare-fun arrayNoDuplicates!0 (array!96432 (_ BitVec 32) List!33063) Bool)

(assert (=> b!1410002 (= res!947046 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33060))))

(declare-fun e!798045 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1410003 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10771 0))(
  ( (MissingZero!10771 (index!45461 (_ BitVec 32))) (Found!10771 (index!45462 (_ BitVec 32))) (Intermediate!10771 (undefined!11583 Bool) (index!45463 (_ BitVec 32)) (x!127207 (_ BitVec 32))) (Undefined!10771) (MissingVacant!10771 (index!45464 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96432 (_ BitVec 32)) SeekEntryResult!10771)

(assert (=> b!1410003 (= e!798045 (= (seekEntryOrOpen!0 (select (arr!46557 a!2901) j!112) a!2901 mask!2840) (Found!10771 j!112)))))

(declare-fun res!947040 () Bool)

(assert (=> start!121356 (=> (not res!947040) (not e!798047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121356 (= res!947040 (validMask!0 mask!2840))))

(assert (=> start!121356 e!798047))

(assert (=> start!121356 true))

(declare-fun array_inv!35838 (array!96432) Bool)

(assert (=> start!121356 (array_inv!35838 a!2901)))

(declare-fun b!1410004 () Bool)

(declare-fun res!947041 () Bool)

(assert (=> b!1410004 (=> (not res!947041) (not e!798047))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410004 (= res!947041 (validKeyInArray!0 (select (arr!46557 a!2901) j!112)))))

(declare-fun b!1410005 () Bool)

(declare-fun e!798044 () Bool)

(assert (=> b!1410005 (= e!798044 true)))

(declare-fun lt!620905 () SeekEntryResult!10771)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96432 (_ BitVec 32)) SeekEntryResult!10771)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410005 (= lt!620905 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46557 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46557 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96433 (store (arr!46557 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47108 a!2901)) mask!2840))))

(declare-fun b!1410006 () Bool)

(assert (=> b!1410006 (= e!798047 (not e!798044))))

(declare-fun res!947045 () Bool)

(assert (=> b!1410006 (=> res!947045 e!798044)))

(declare-fun lt!620906 () SeekEntryResult!10771)

(assert (=> b!1410006 (= res!947045 (or (not (is-Intermediate!10771 lt!620906)) (undefined!11583 lt!620906)))))

(assert (=> b!1410006 e!798045))

(declare-fun res!947043 () Bool)

(assert (=> b!1410006 (=> (not res!947043) (not e!798045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96432 (_ BitVec 32)) Bool)

(assert (=> b!1410006 (= res!947043 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47543 0))(
  ( (Unit!47544) )
))
(declare-fun lt!620904 () Unit!47543)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96432 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47543)

(assert (=> b!1410006 (= lt!620904 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1410006 (= lt!620906 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46557 a!2901) j!112) mask!2840) (select (arr!46557 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410007 () Bool)

(declare-fun res!947042 () Bool)

(assert (=> b!1410007 (=> (not res!947042) (not e!798047))))

(assert (=> b!1410007 (= res!947042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410008 () Bool)

(declare-fun res!947047 () Bool)

(assert (=> b!1410008 (=> (not res!947047) (not e!798047))))

(assert (=> b!1410008 (= res!947047 (validKeyInArray!0 (select (arr!46557 a!2901) i!1037)))))

(declare-fun b!1410009 () Bool)

(declare-fun res!947044 () Bool)

(assert (=> b!1410009 (=> (not res!947044) (not e!798047))))

(assert (=> b!1410009 (= res!947044 (and (= (size!47108 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47108 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47108 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121356 res!947040) b!1410009))

(assert (= (and b!1410009 res!947044) b!1410008))

(assert (= (and b!1410008 res!947047) b!1410004))

(assert (= (and b!1410004 res!947041) b!1410007))

(assert (= (and b!1410007 res!947042) b!1410002))

(assert (= (and b!1410002 res!947046) b!1410006))

(assert (= (and b!1410006 res!947043) b!1410003))

(assert (= (and b!1410006 (not res!947045)) b!1410005))

(declare-fun m!1299711 () Bool)

(assert (=> start!121356 m!1299711))

(declare-fun m!1299713 () Bool)

(assert (=> start!121356 m!1299713))

(declare-fun m!1299715 () Bool)

(assert (=> b!1410008 m!1299715))

(assert (=> b!1410008 m!1299715))

(declare-fun m!1299717 () Bool)

(assert (=> b!1410008 m!1299717))

(declare-fun m!1299719 () Bool)

(assert (=> b!1410005 m!1299719))

(declare-fun m!1299721 () Bool)

(assert (=> b!1410005 m!1299721))

(assert (=> b!1410005 m!1299721))

(declare-fun m!1299723 () Bool)

(assert (=> b!1410005 m!1299723))

(assert (=> b!1410005 m!1299723))

(assert (=> b!1410005 m!1299721))

(declare-fun m!1299725 () Bool)

(assert (=> b!1410005 m!1299725))

(declare-fun m!1299727 () Bool)

(assert (=> b!1410004 m!1299727))

(assert (=> b!1410004 m!1299727))

(declare-fun m!1299729 () Bool)

(assert (=> b!1410004 m!1299729))

(declare-fun m!1299731 () Bool)

(assert (=> b!1410007 m!1299731))

(assert (=> b!1410006 m!1299727))

(declare-fun m!1299733 () Bool)

(assert (=> b!1410006 m!1299733))

(assert (=> b!1410006 m!1299727))

(declare-fun m!1299735 () Bool)

(assert (=> b!1410006 m!1299735))

(assert (=> b!1410006 m!1299733))

(assert (=> b!1410006 m!1299727))

(declare-fun m!1299737 () Bool)

(assert (=> b!1410006 m!1299737))

(declare-fun m!1299739 () Bool)

(assert (=> b!1410006 m!1299739))

(assert (=> b!1410003 m!1299727))

(assert (=> b!1410003 m!1299727))

(declare-fun m!1299741 () Bool)

(assert (=> b!1410003 m!1299741))

(declare-fun m!1299743 () Bool)

(assert (=> b!1410002 m!1299743))

(push 1)

(assert (not b!1410002))

(assert (not start!121356))

(assert (not b!1410006))

(assert (not b!1410003))

(assert (not b!1410005))

(assert (not b!1410008))

(assert (not b!1410004))

(assert (not b!1410007))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

