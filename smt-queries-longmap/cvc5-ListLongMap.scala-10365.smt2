; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122004 () Bool)

(assert start!122004)

(declare-fun res!952102 () Bool)

(declare-fun e!801463 () Bool)

(assert (=> start!122004 (=> (not res!952102) (not e!801463))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122004 (= res!952102 (validMask!0 mask!2840))))

(assert (=> start!122004 e!801463))

(assert (=> start!122004 true))

(declare-datatypes ((array!96690 0))(
  ( (array!96691 (arr!46676 (Array (_ BitVec 32) (_ BitVec 64))) (size!47226 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96690)

(declare-fun array_inv!35704 (array!96690) Bool)

(assert (=> start!122004 (array_inv!35704 a!2901)))

(declare-fun b!1416051 () Bool)

(declare-fun res!952093 () Bool)

(assert (=> b!1416051 (=> (not res!952093) (not e!801463))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416051 (= res!952093 (validKeyInArray!0 (select (arr!46676 a!2901) j!112)))))

(declare-fun b!1416052 () Bool)

(declare-fun res!952098 () Bool)

(assert (=> b!1416052 (=> (not res!952098) (not e!801463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96690 (_ BitVec 32)) Bool)

(assert (=> b!1416052 (= res!952098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416053 () Bool)

(declare-fun e!801464 () Bool)

(declare-fun e!801467 () Bool)

(assert (=> b!1416053 (= e!801464 e!801467)))

(declare-fun res!952095 () Bool)

(assert (=> b!1416053 (=> res!952095 e!801467)))

(declare-fun lt!624609 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10987 0))(
  ( (MissingZero!10987 (index!46340 (_ BitVec 32))) (Found!10987 (index!46341 (_ BitVec 32))) (Intermediate!10987 (undefined!11799 Bool) (index!46342 (_ BitVec 32)) (x!127946 (_ BitVec 32))) (Undefined!10987) (MissingVacant!10987 (index!46343 (_ BitVec 32))) )
))
(declare-fun lt!624610 () SeekEntryResult!10987)

(declare-fun lt!624603 () SeekEntryResult!10987)

(assert (=> b!1416053 (= res!952095 (or (bvslt (x!127946 lt!624603) #b00000000000000000000000000000000) (bvsgt (x!127946 lt!624603) #b01111111111111111111111111111110) (bvslt (x!127946 lt!624610) #b00000000000000000000000000000000) (bvsgt (x!127946 lt!624610) #b01111111111111111111111111111110) (bvslt lt!624609 #b00000000000000000000000000000000) (bvsge lt!624609 (size!47226 a!2901)) (bvslt (index!46342 lt!624603) #b00000000000000000000000000000000) (bvsge (index!46342 lt!624603) (size!47226 a!2901)) (bvslt (index!46342 lt!624610) #b00000000000000000000000000000000) (bvsge (index!46342 lt!624610) (size!47226 a!2901)) (not (= lt!624603 (Intermediate!10987 false (index!46342 lt!624603) (x!127946 lt!624603)))) (not (= lt!624610 (Intermediate!10987 false (index!46342 lt!624610) (x!127946 lt!624610))))))))

(declare-fun lt!624605 () array!96690)

(declare-fun lt!624604 () SeekEntryResult!10987)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96690 (_ BitVec 32)) SeekEntryResult!10987)

(assert (=> b!1416053 (= lt!624604 (seekKeyOrZeroReturnVacant!0 (x!127946 lt!624610) (index!46342 lt!624610) (index!46342 lt!624610) (select (arr!46676 a!2901) j!112) lt!624605 mask!2840))))

(declare-fun lt!624612 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96690 (_ BitVec 32)) SeekEntryResult!10987)

(assert (=> b!1416053 (= lt!624604 (seekEntryOrOpen!0 lt!624612 lt!624605 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1416053 (and (not (undefined!11799 lt!624610)) (= (index!46342 lt!624610) i!1037) (bvslt (x!127946 lt!624610) (x!127946 lt!624603)) (= (select (store (arr!46676 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46342 lt!624610)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47948 0))(
  ( (Unit!47949) )
))
(declare-fun lt!624606 () Unit!47948)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96690 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47948)

(assert (=> b!1416053 (= lt!624606 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624609 (x!127946 lt!624603) (index!46342 lt!624603) (x!127946 lt!624610) (index!46342 lt!624610) (undefined!11799 lt!624610) mask!2840))))

(declare-fun b!1416054 () Bool)

(declare-fun res!952096 () Bool)

(assert (=> b!1416054 (=> (not res!952096) (not e!801463))))

(declare-datatypes ((List!33195 0))(
  ( (Nil!33192) (Cons!33191 (h!34478 (_ BitVec 64)) (t!47889 List!33195)) )
))
(declare-fun arrayNoDuplicates!0 (array!96690 (_ BitVec 32) List!33195) Bool)

(assert (=> b!1416054 (= res!952096 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33192))))

(declare-fun b!1416055 () Bool)

(assert (=> b!1416055 (= e!801467 true)))

(declare-fun lt!624611 () SeekEntryResult!10987)

(assert (=> b!1416055 (= lt!624611 lt!624604)))

(declare-fun lt!624608 () Unit!47948)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!96690 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47948)

(assert (=> b!1416055 (= lt!624608 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624609 (x!127946 lt!624603) (index!46342 lt!624603) (x!127946 lt!624610) (index!46342 lt!624610) mask!2840))))

(declare-fun b!1416056 () Bool)

(declare-fun res!952094 () Bool)

(assert (=> b!1416056 (=> (not res!952094) (not e!801463))))

(assert (=> b!1416056 (= res!952094 (validKeyInArray!0 (select (arr!46676 a!2901) i!1037)))))

(declare-fun b!1416057 () Bool)

(declare-fun e!801465 () Bool)

(assert (=> b!1416057 (= e!801463 (not e!801465))))

(declare-fun res!952097 () Bool)

(assert (=> b!1416057 (=> res!952097 e!801465)))

(assert (=> b!1416057 (= res!952097 (or (not (is-Intermediate!10987 lt!624603)) (undefined!11799 lt!624603)))))

(assert (=> b!1416057 (= lt!624611 (Found!10987 j!112))))

(assert (=> b!1416057 (= lt!624611 (seekEntryOrOpen!0 (select (arr!46676 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1416057 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!624607 () Unit!47948)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96690 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47948)

(assert (=> b!1416057 (= lt!624607 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96690 (_ BitVec 32)) SeekEntryResult!10987)

(assert (=> b!1416057 (= lt!624603 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624609 (select (arr!46676 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416057 (= lt!624609 (toIndex!0 (select (arr!46676 a!2901) j!112) mask!2840))))

(declare-fun b!1416058 () Bool)

(assert (=> b!1416058 (= e!801465 e!801464)))

(declare-fun res!952100 () Bool)

(assert (=> b!1416058 (=> res!952100 e!801464)))

(assert (=> b!1416058 (= res!952100 (or (= lt!624603 lt!624610) (not (is-Intermediate!10987 lt!624610))))))

(assert (=> b!1416058 (= lt!624610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624612 mask!2840) lt!624612 lt!624605 mask!2840))))

(assert (=> b!1416058 (= lt!624612 (select (store (arr!46676 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1416058 (= lt!624605 (array!96691 (store (arr!46676 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47226 a!2901)))))

(declare-fun b!1416059 () Bool)

(declare-fun res!952099 () Bool)

(assert (=> b!1416059 (=> (not res!952099) (not e!801463))))

(assert (=> b!1416059 (= res!952099 (and (= (size!47226 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47226 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47226 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416060 () Bool)

(declare-fun res!952101 () Bool)

(assert (=> b!1416060 (=> res!952101 e!801467)))

(assert (=> b!1416060 (= res!952101 (not (= lt!624610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624609 lt!624612 lt!624605 mask!2840))))))

(assert (= (and start!122004 res!952102) b!1416059))

(assert (= (and b!1416059 res!952099) b!1416056))

(assert (= (and b!1416056 res!952094) b!1416051))

(assert (= (and b!1416051 res!952093) b!1416052))

(assert (= (and b!1416052 res!952098) b!1416054))

(assert (= (and b!1416054 res!952096) b!1416057))

(assert (= (and b!1416057 (not res!952097)) b!1416058))

(assert (= (and b!1416058 (not res!952100)) b!1416053))

(assert (= (and b!1416053 (not res!952095)) b!1416060))

(assert (= (and b!1416060 (not res!952101)) b!1416055))

(declare-fun m!1306569 () Bool)

(assert (=> b!1416057 m!1306569))

(declare-fun m!1306571 () Bool)

(assert (=> b!1416057 m!1306571))

(assert (=> b!1416057 m!1306569))

(declare-fun m!1306573 () Bool)

(assert (=> b!1416057 m!1306573))

(assert (=> b!1416057 m!1306569))

(declare-fun m!1306575 () Bool)

(assert (=> b!1416057 m!1306575))

(assert (=> b!1416057 m!1306569))

(declare-fun m!1306577 () Bool)

(assert (=> b!1416057 m!1306577))

(declare-fun m!1306579 () Bool)

(assert (=> b!1416057 m!1306579))

(declare-fun m!1306581 () Bool)

(assert (=> b!1416060 m!1306581))

(declare-fun m!1306583 () Bool)

(assert (=> start!122004 m!1306583))

(declare-fun m!1306585 () Bool)

(assert (=> start!122004 m!1306585))

(declare-fun m!1306587 () Bool)

(assert (=> b!1416055 m!1306587))

(declare-fun m!1306589 () Bool)

(assert (=> b!1416052 m!1306589))

(declare-fun m!1306591 () Bool)

(assert (=> b!1416056 m!1306591))

(assert (=> b!1416056 m!1306591))

(declare-fun m!1306593 () Bool)

(assert (=> b!1416056 m!1306593))

(declare-fun m!1306595 () Bool)

(assert (=> b!1416054 m!1306595))

(declare-fun m!1306597 () Bool)

(assert (=> b!1416058 m!1306597))

(assert (=> b!1416058 m!1306597))

(declare-fun m!1306599 () Bool)

(assert (=> b!1416058 m!1306599))

(declare-fun m!1306601 () Bool)

(assert (=> b!1416058 m!1306601))

(declare-fun m!1306603 () Bool)

(assert (=> b!1416058 m!1306603))

(declare-fun m!1306605 () Bool)

(assert (=> b!1416053 m!1306605))

(assert (=> b!1416053 m!1306569))

(declare-fun m!1306607 () Bool)

(assert (=> b!1416053 m!1306607))

(declare-fun m!1306609 () Bool)

(assert (=> b!1416053 m!1306609))

(assert (=> b!1416053 m!1306569))

(declare-fun m!1306611 () Bool)

(assert (=> b!1416053 m!1306611))

(assert (=> b!1416053 m!1306601))

(assert (=> b!1416051 m!1306569))

(assert (=> b!1416051 m!1306569))

(declare-fun m!1306613 () Bool)

(assert (=> b!1416051 m!1306613))

(push 1)

