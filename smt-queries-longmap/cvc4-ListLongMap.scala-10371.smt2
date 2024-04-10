; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122098 () Bool)

(assert start!122098)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96733 0))(
  ( (array!96734 (arr!46696 (Array (_ BitVec 32) (_ BitVec 64))) (size!47246 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96733)

(declare-fun e!801896 () Bool)

(declare-fun b!1416854 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11007 0))(
  ( (MissingZero!11007 (index!46420 (_ BitVec 32))) (Found!11007 (index!46421 (_ BitVec 32))) (Intermediate!11007 (undefined!11819 Bool) (index!46422 (_ BitVec 32)) (x!128020 (_ BitVec 32))) (Undefined!11007) (MissingVacant!11007 (index!46423 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96733 (_ BitVec 32)) SeekEntryResult!11007)

(assert (=> b!1416854 (= e!801896 (= (seekEntryOrOpen!0 (select (arr!46696 a!2901) j!112) a!2901 mask!2840) (Found!11007 j!112)))))

(declare-fun b!1416855 () Bool)

(declare-fun res!952731 () Bool)

(declare-fun e!801898 () Bool)

(assert (=> b!1416855 (=> (not res!952731) (not e!801898))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416855 (= res!952731 (validKeyInArray!0 (select (arr!46696 a!2901) i!1037)))))

(declare-fun b!1416857 () Bool)

(declare-fun e!801897 () Bool)

(assert (=> b!1416857 (= e!801897 true)))

(declare-fun lt!625141 () SeekEntryResult!11007)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96733 (_ BitVec 32)) SeekEntryResult!11007)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416857 (= lt!625141 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46696 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46696 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96734 (store (arr!46696 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47246 a!2901)) mask!2840))))

(declare-fun res!952734 () Bool)

(assert (=> start!122098 (=> (not res!952734) (not e!801898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122098 (= res!952734 (validMask!0 mask!2840))))

(assert (=> start!122098 e!801898))

(assert (=> start!122098 true))

(declare-fun array_inv!35724 (array!96733) Bool)

(assert (=> start!122098 (array_inv!35724 a!2901)))

(declare-fun b!1416856 () Bool)

(declare-fun res!952733 () Bool)

(assert (=> b!1416856 (=> (not res!952733) (not e!801898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96733 (_ BitVec 32)) Bool)

(assert (=> b!1416856 (= res!952733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416858 () Bool)

(declare-fun res!952732 () Bool)

(assert (=> b!1416858 (=> (not res!952732) (not e!801898))))

(assert (=> b!1416858 (= res!952732 (validKeyInArray!0 (select (arr!46696 a!2901) j!112)))))

(declare-fun b!1416859 () Bool)

(assert (=> b!1416859 (= e!801898 (not e!801897))))

(declare-fun res!952736 () Bool)

(assert (=> b!1416859 (=> res!952736 e!801897)))

(declare-fun lt!625143 () SeekEntryResult!11007)

(assert (=> b!1416859 (= res!952736 (or (not (is-Intermediate!11007 lt!625143)) (undefined!11819 lt!625143)))))

(assert (=> b!1416859 e!801896))

(declare-fun res!952738 () Bool)

(assert (=> b!1416859 (=> (not res!952738) (not e!801896))))

(assert (=> b!1416859 (= res!952738 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47988 0))(
  ( (Unit!47989) )
))
(declare-fun lt!625142 () Unit!47988)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47988)

(assert (=> b!1416859 (= lt!625142 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1416859 (= lt!625143 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46696 a!2901) j!112) mask!2840) (select (arr!46696 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1416860 () Bool)

(declare-fun res!952735 () Bool)

(assert (=> b!1416860 (=> (not res!952735) (not e!801898))))

(assert (=> b!1416860 (= res!952735 (and (= (size!47246 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47246 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47246 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416861 () Bool)

(declare-fun res!952737 () Bool)

(assert (=> b!1416861 (=> (not res!952737) (not e!801898))))

(declare-datatypes ((List!33215 0))(
  ( (Nil!33212) (Cons!33211 (h!34501 (_ BitVec 64)) (t!47909 List!33215)) )
))
(declare-fun arrayNoDuplicates!0 (array!96733 (_ BitVec 32) List!33215) Bool)

(assert (=> b!1416861 (= res!952737 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33212))))

(assert (= (and start!122098 res!952734) b!1416860))

(assert (= (and b!1416860 res!952735) b!1416855))

(assert (= (and b!1416855 res!952731) b!1416858))

(assert (= (and b!1416858 res!952732) b!1416856))

(assert (= (and b!1416856 res!952733) b!1416861))

(assert (= (and b!1416861 res!952737) b!1416859))

(assert (= (and b!1416859 res!952738) b!1416854))

(assert (= (and b!1416859 (not res!952736)) b!1416857))

(declare-fun m!1307543 () Bool)

(assert (=> b!1416857 m!1307543))

(declare-fun m!1307545 () Bool)

(assert (=> b!1416857 m!1307545))

(assert (=> b!1416857 m!1307545))

(declare-fun m!1307547 () Bool)

(assert (=> b!1416857 m!1307547))

(assert (=> b!1416857 m!1307547))

(assert (=> b!1416857 m!1307545))

(declare-fun m!1307549 () Bool)

(assert (=> b!1416857 m!1307549))

(declare-fun m!1307551 () Bool)

(assert (=> b!1416854 m!1307551))

(assert (=> b!1416854 m!1307551))

(declare-fun m!1307553 () Bool)

(assert (=> b!1416854 m!1307553))

(declare-fun m!1307555 () Bool)

(assert (=> b!1416855 m!1307555))

(assert (=> b!1416855 m!1307555))

(declare-fun m!1307557 () Bool)

(assert (=> b!1416855 m!1307557))

(assert (=> b!1416858 m!1307551))

(assert (=> b!1416858 m!1307551))

(declare-fun m!1307559 () Bool)

(assert (=> b!1416858 m!1307559))

(declare-fun m!1307561 () Bool)

(assert (=> b!1416856 m!1307561))

(declare-fun m!1307563 () Bool)

(assert (=> start!122098 m!1307563))

(declare-fun m!1307565 () Bool)

(assert (=> start!122098 m!1307565))

(declare-fun m!1307567 () Bool)

(assert (=> b!1416861 m!1307567))

(assert (=> b!1416859 m!1307551))

(declare-fun m!1307569 () Bool)

(assert (=> b!1416859 m!1307569))

(assert (=> b!1416859 m!1307551))

(declare-fun m!1307571 () Bool)

(assert (=> b!1416859 m!1307571))

(assert (=> b!1416859 m!1307569))

(assert (=> b!1416859 m!1307551))

(declare-fun m!1307573 () Bool)

(assert (=> b!1416859 m!1307573))

(declare-fun m!1307575 () Bool)

(assert (=> b!1416859 m!1307575))

(push 1)

(assert (not b!1416858))

(assert (not start!122098))

(assert (not b!1416859))

(assert (not b!1416854))

(assert (not b!1416856))

(assert (not b!1416855))

(assert (not b!1416857))

(assert (not b!1416861))

(check-sat)

(pop 1)

(push 1)

(check-sat)

