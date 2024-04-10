; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122110 () Bool)

(assert start!122110)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96745 0))(
  ( (array!96746 (arr!46702 (Array (_ BitVec 32) (_ BitVec 64))) (size!47252 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96745)

(declare-fun e!801969 () Bool)

(declare-fun b!1416998 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11013 0))(
  ( (MissingZero!11013 (index!46444 (_ BitVec 32))) (Found!11013 (index!46445 (_ BitVec 32))) (Intermediate!11013 (undefined!11825 Bool) (index!46446 (_ BitVec 32)) (x!128042 (_ BitVec 32))) (Undefined!11013) (MissingVacant!11013 (index!46447 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96745 (_ BitVec 32)) SeekEntryResult!11013)

(assert (=> b!1416998 (= e!801969 (= (seekEntryOrOpen!0 (select (arr!46702 a!2901) j!112) a!2901 mask!2840) (Found!11013 j!112)))))

(declare-fun b!1416999 () Bool)

(declare-fun res!952877 () Bool)

(declare-fun e!801968 () Bool)

(assert (=> b!1416999 (=> (not res!952877) (not e!801968))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1416999 (= res!952877 (and (= (size!47252 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47252 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47252 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1417000 () Bool)

(declare-fun res!952875 () Bool)

(assert (=> b!1417000 (=> (not res!952875) (not e!801968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96745 (_ BitVec 32)) Bool)

(assert (=> b!1417000 (= res!952875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417001 () Bool)

(declare-fun res!952879 () Bool)

(assert (=> b!1417001 (=> (not res!952879) (not e!801968))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417001 (= res!952879 (validKeyInArray!0 (select (arr!46702 a!2901) i!1037)))))

(declare-fun res!952880 () Bool)

(assert (=> start!122110 (=> (not res!952880) (not e!801968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122110 (= res!952880 (validMask!0 mask!2840))))

(assert (=> start!122110 e!801968))

(assert (=> start!122110 true))

(declare-fun array_inv!35730 (array!96745) Bool)

(assert (=> start!122110 (array_inv!35730 a!2901)))

(declare-fun b!1417002 () Bool)

(declare-fun res!952881 () Bool)

(assert (=> b!1417002 (=> (not res!952881) (not e!801968))))

(assert (=> b!1417002 (= res!952881 (validKeyInArray!0 (select (arr!46702 a!2901) j!112)))))

(declare-fun b!1417003 () Bool)

(declare-fun e!801970 () Bool)

(assert (=> b!1417003 (= e!801970 true)))

(declare-fun lt!625195 () SeekEntryResult!11013)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96745 (_ BitVec 32)) SeekEntryResult!11013)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417003 (= lt!625195 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46702 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46702 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96746 (store (arr!46702 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47252 a!2901)) mask!2840))))

(declare-fun b!1417004 () Bool)

(assert (=> b!1417004 (= e!801968 (not e!801970))))

(declare-fun res!952882 () Bool)

(assert (=> b!1417004 (=> res!952882 e!801970)))

(declare-fun lt!625197 () SeekEntryResult!11013)

(assert (=> b!1417004 (= res!952882 (or (not (is-Intermediate!11013 lt!625197)) (undefined!11825 lt!625197)))))

(assert (=> b!1417004 e!801969))

(declare-fun res!952876 () Bool)

(assert (=> b!1417004 (=> (not res!952876) (not e!801969))))

(assert (=> b!1417004 (= res!952876 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!48000 0))(
  ( (Unit!48001) )
))
(declare-fun lt!625196 () Unit!48000)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96745 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48000)

(assert (=> b!1417004 (= lt!625196 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1417004 (= lt!625197 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46702 a!2901) j!112) mask!2840) (select (arr!46702 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417005 () Bool)

(declare-fun res!952878 () Bool)

(assert (=> b!1417005 (=> (not res!952878) (not e!801968))))

(declare-datatypes ((List!33221 0))(
  ( (Nil!33218) (Cons!33217 (h!34507 (_ BitVec 64)) (t!47915 List!33221)) )
))
(declare-fun arrayNoDuplicates!0 (array!96745 (_ BitVec 32) List!33221) Bool)

(assert (=> b!1417005 (= res!952878 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33218))))

(assert (= (and start!122110 res!952880) b!1416999))

(assert (= (and b!1416999 res!952877) b!1417001))

(assert (= (and b!1417001 res!952879) b!1417002))

(assert (= (and b!1417002 res!952881) b!1417000))

(assert (= (and b!1417000 res!952875) b!1417005))

(assert (= (and b!1417005 res!952878) b!1417004))

(assert (= (and b!1417004 res!952876) b!1416998))

(assert (= (and b!1417004 (not res!952882)) b!1417003))

(declare-fun m!1307747 () Bool)

(assert (=> b!1417004 m!1307747))

(declare-fun m!1307749 () Bool)

(assert (=> b!1417004 m!1307749))

(assert (=> b!1417004 m!1307747))

(declare-fun m!1307751 () Bool)

(assert (=> b!1417004 m!1307751))

(assert (=> b!1417004 m!1307749))

(assert (=> b!1417004 m!1307747))

(declare-fun m!1307753 () Bool)

(assert (=> b!1417004 m!1307753))

(declare-fun m!1307755 () Bool)

(assert (=> b!1417004 m!1307755))

(declare-fun m!1307757 () Bool)

(assert (=> b!1417005 m!1307757))

(assert (=> b!1416998 m!1307747))

(assert (=> b!1416998 m!1307747))

(declare-fun m!1307759 () Bool)

(assert (=> b!1416998 m!1307759))

(declare-fun m!1307761 () Bool)

(assert (=> start!122110 m!1307761))

(declare-fun m!1307763 () Bool)

(assert (=> start!122110 m!1307763))

(declare-fun m!1307765 () Bool)

(assert (=> b!1417001 m!1307765))

(assert (=> b!1417001 m!1307765))

(declare-fun m!1307767 () Bool)

(assert (=> b!1417001 m!1307767))

(declare-fun m!1307769 () Bool)

(assert (=> b!1417000 m!1307769))

(assert (=> b!1417002 m!1307747))

(assert (=> b!1417002 m!1307747))

(declare-fun m!1307771 () Bool)

(assert (=> b!1417002 m!1307771))

(declare-fun m!1307773 () Bool)

(assert (=> b!1417003 m!1307773))

(declare-fun m!1307775 () Bool)

(assert (=> b!1417003 m!1307775))

(assert (=> b!1417003 m!1307775))

(declare-fun m!1307777 () Bool)

(assert (=> b!1417003 m!1307777))

(assert (=> b!1417003 m!1307777))

(assert (=> b!1417003 m!1307775))

(declare-fun m!1307779 () Bool)

(assert (=> b!1417003 m!1307779))

(push 1)

(assert (not b!1417000))

(assert (not b!1417002))

(assert (not b!1417001))

(assert (not b!1417005))

(assert (not b!1417003))

(assert (not start!122110))

(assert (not b!1416998))

(assert (not b!1417004))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

